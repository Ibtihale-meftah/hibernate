-- 1. Création de la base de données
DROP DATABASE IF EXISTS GC2000;
CREATE DATABASE GC2000;
USE GC2000;

-- 2. Création de la table des clients
CREATE TABLE clients (
                         client_id INT AUTO_INCREMENT PRIMARY KEY,
                         nom VARCHAR(100) NOT NULL,
                         prenom VARCHAR(100) NOT NULL,
                         email VARCHAR(150) UNIQUE NOT NULL,
                         ville VARCHAR(100),
                         date_inscription DATE
);
--3. Création de la table des commandes
CREATE TABLE commandes (
                           commande_id INT AUTO_INCREMENT PRIMARY KEY,
                           client_id INT NOT NULL,
                           date_commande DATE NOT NULL,
                           montant DECIMAL(10,2) NOT NULL,
                           statut ENUM('en cours', 'expédiée', 'livrée', 'annulée') DEFAULT 'en cours',
                           FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);
-- 4. Insertion de données dans la table clients
INSERT INTO clients (nom, prenom, email, ville, date_inscription)
VALUES
    ('El Amrani', 'Youssef', 'youssef.elamrani@example.com', 'Casablanca', '2025-11
01'),
    ('Bennani', 'Fatima', 'fatima.bennani@example.com', 'Rabat', '2025-11-03'),
    ('Alaoui', 'Omar', 'omar.alaoui@example.com', 'Fès', '2025-11-07'),
    ('Chakir', 'Hajar', 'hajar.chakir@example.com', 'Marrakech', '2025-11-10'),
    ('Taleb', 'Nadia', 'nadia.taleb@example.com', 'Agadir', '2025-11-12');

-- 5. Insertion de données dans la table commandes
INSERT INTO commandes (client_id, date_commande, montant, statut)
VALUES
    (1, '2025-12-01', 950.00, 'livrée'),
    (1, '2025-12-10', 320.00, 'expédiée'),
    (2, '2025-12-05', 1100.50, 'en cours'),
    (3, '2025-12-04', 450.00, 'annulée'),
    (4, '2025-12-06', 780.00, 'livrée'),
    (5, '2025-12-08', 640.75, 'en cours');
