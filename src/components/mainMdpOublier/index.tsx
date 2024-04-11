"use client"
import React, { useState, FormEvent } from 'react';

const PasswordRecoveryForm = () => {
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();



    try {
      const response = await fetch('http://localhost:3001/request-reset-password', {


        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email }),
      });
      if (!response.ok) throw new Error(' Quelque chose s\'est mal passé lors de l\'envoi de la demande.');

      // Message de succès ou de traitement
      setMessage('Si un compte avec cet email est trouvé, un email de réinitialisation a été envoyé.');
    } catch (error) {
      console.error('Fetch : Erreur lors de la demande de réinitialisation de mot de passe: ok', error);
      setMessage('Une erreur est survenue. Veuillez réessayer plus tard.');
    }
  };

  return (
    <div>
      <h2>Récupération de Mot de Passe</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>
        <button type="submit">Envoyer le Lien de Réinitialisation</button>
      </form>
      {message && <p>{message}</p>}
    </div>
  );
};

export default PasswordRecoveryForm;
