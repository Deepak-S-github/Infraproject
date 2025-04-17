from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib

# -----------------------------
# Feature Extraction Function
# -----------------------------
def extract_features(url):
    return [
        len(url),                      # URL length
        url.count('.'),                 # Number of dots
        int('https' in url),            # Has HTTPS
        int('@' in url),                # Has '@'
        len(url.split('/'))             # Number of parts in the URL (as an additional feature)
    ]

# -----------------------------
# Model Loader & Predictor
# -----------------------------
def load_model():
    return joblib.load('ml_model/phishing_model.pkl')

def predict_url(model, features):
    prediction = model.predict([features])[0]
    probas = model.predict_proba([features])[0]
    score = round(probas[1] * 100, 2) if prediction == 1 else round(probas[0] * 100, 2)
    return bool(prediction), score

# -----------------------------
# Flask Setup
# -----------------------------
app = Flask(__name__)
CORS(app)  # Allows Flutter to access the backend
model = load_model()

@app.route('/')
def home():
    return jsonify({'message': 'PhishNet API is running 🚀'})

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    url = data.get('url')

    if not url:
        return jsonify({'error': 'No URL provided'}), 400

    features = extract_features(url)
    is_phishing, safety_score = predict_url(model, features)

    return jsonify({
        'url': url,
        'is_phishing': is_phishing,
        'safety_score': safety_score
    })
if __name__ == '__main__':
    # Host 0.0.0.0 allows other devices to access (Flutter app on phone)
    app.run(debug=True, host='0.0.0.0', port=5000)
