-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 08 juin 2023 à 10:37
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `event_immediat`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add event', 7, 'add_event'),
(26, 'Can change event', 7, 'change_event'),
(27, 'Can delete event', 7, 'delete_event'),
(28, 'Can view event', 7, 'view_event'),
(29, 'Can add user event', 8, 'add_userevent'),
(30, 'Can change user event', 8, 'change_userevent'),
(31, 'Can delete user event', 8, 'delete_userevent'),
(32, 'Can view user event', 8, 'view_userevent');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$dfOlqAyBBinudpFF4Dp3BH$CuzofGE+AHebwgJ+IzBS0jNt9OduImbbEQSy4tOdIQY=', '2023-06-08 10:34:51.279450', 1, 'Admin', 'Cloé', 'Crdr', 'cloecrdr@mail.com', 1, 1, '2023-06-02 14:08:35.303905'),
(2, 'pbkdf2_sha256$600000$IaIEfzgCcRDh6qfguqwsjR$VCukoObiQ+l2wQ5qure5wTltuE0UVJ5fKh5GW1fEkFw=', '2023-06-08 10:36:58.861075', 0, 'User', 'Jane', 'Doe', 'jdoe@mail.com', 0, 1, '2023-06-03 09:07:49.152986');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'LiveApp', 'event'),
(8, 'LiveApp', 'userevent'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-02 13:50:42.282417'),
(2, 'auth', '0001_initial', '2023-06-02 13:50:42.454146'),
(3, 'LiveApp', '0001_initial', '2023-06-02 13:50:42.511754'),
(4, 'admin', '0001_initial', '2023-06-02 13:50:42.546052'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-06-02 13:50:42.551526'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-02 13:50:42.557010'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-06-02 13:50:42.584242'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-06-02 13:50:42.598577'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-06-02 13:50:42.615372'),
(10, 'auth', '0004_alter_user_username_opts', '2023-06-02 13:50:42.620667'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-06-02 13:50:42.633699'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-06-02 13:50:42.635517'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-06-02 13:50:42.640981'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-06-02 13:50:42.656109'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-06-02 13:50:42.671000'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-06-02 13:50:42.689858'),
(17, 'auth', '0011_update_proxy_permissions', '2023-06-02 13:50:42.695213'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-06-02 13:50:42.711156'),
(19, 'sessions', '0001_initial', '2023-06-02 13:50:42.726797');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2pgz4i5gfsa5jj9p65dzze3uk032ke7k', '.eJxVjEEOwiAQRe_C2pCBFgSX7nsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERSpx-t4j04LqDdMd6a5JaXZc5yl2RB-1yaomf18P9OyjYy7cGlyF7HQcCY-k8jBad9xydtqxtVJRBMRgTR3QJsmbORIhA4MACJPH-AN3dOBk:1q6HFi:IhRL7GTOe-FHDOy6FW0IYItsKJ4NPl1FQtO85bu78ok', '2023-06-19 20:56:34.572478'),
('xkn3ivr6ymtromxx8r63qphfuelriln0', '.eJxVjDsOwjAQBe_iGln4gz-U9JzBWnt3cQDZUpxUiLtDpBTQvpl5L5FgXWpaB81pQnEWWhx-twzlQW0DeId267L0tsxTlpsidzrktSM9L7v7d1Bh1G-dTYmsNGnkaKwN5ai9gagMs4vsKSqi4B1QtOCts0EZy5kpFFT5BCjeH-aVOFA:1q7D0k:0ZAR584fhDBf0ovX9guyogXUYEi9y3QYyYVC73Dsz4I', '2023-06-22 10:36:58.863185');

-- --------------------------------------------------------

--
-- Structure de la table `LiveApp_event`
--

CREATE TABLE `LiveApp_event` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `place` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `organizer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `LiveApp_event`
--

INSERT INTO `LiveApp_event` (`id`, `title`, `description`, `date`, `place`, `image`, `organizer_id`) VALUES
(6, 'Concert privé', 'Découvrez un concert privé exclusif avec des artistes talentueux dans un cadre élégant. Profitez d\'une expérience musicale immersive et intime, entouré(e) d\'un public restreint de passionnés. Savourez des rafraîchissements et mets délicieux tout en partageant des moments inoubliables avec vos proches. Réservez dès maintenant pour cette expérience unique.', '2023-07-23', 'La Friche', 'event_images/event1.jpg', 1),
(10, 'Festival de musique en bord de mer', 'Plongez dans l\'ambiance enivrante du festival de musique en bord de mer de Marseille. Profitez de concerts en plein air, de groupes locaux et internationaux, le tout accompagné d\'une vue imprenable sur la Méditerranée. C\'est un événement musical à ne pas manquer !', '2023-07-15', 'Plages du Prado, Marseille', 'event_images/event2.jpg', 1),
(11, 'Gala de charité \"Lumière d\'Espoir\"', 'Joignez-vous à nous lors du prestigieux gala de charité \"Lumière d\'Espoir\" à Marseille. Une soirée élégante et inoubliable vous attend, avec un dîner gastronomique, des performances artistiques captivantes et des enchères caritatives. Ensemble, soutenons des causes nobles et répandons la lumière de l\'espoir.', '2023-11-25', 'Palais du Pharo, Marseille', 'event_images/event3.jpg', 1),
(12, 'Soirée de dégustation de vins', 'Découvrez les saveurs enivrantes des vins locaux lors d\'une soirée de dégustation à Marseille. Apprenez-en davantage sur les cépages régionaux, rencontrez des vignerons passionnés et savourez une sélection de vins exceptionnels dans une ambiance conviviale.', '2023-08-18', 'Cave à vins Le Panier, Marseille', 'event_images/event4.jpg', 1),
(13, 'Exposition d\'art contemporain', 'Découvrez les dernières tendances de l\'art contemporain lors de notre exposition captivante à Marseille. Explorez des installations artistiques innovantes, des sculptures fascinantes et des peintures vibrantes, le tout présenté par des artistes talentueux de renom.', '2023-09-05', 'Musée d\'Art Contemporain, Marseille', 'event_images/event5.jpg', 1),
(14, 'Marathon de Marseille', 'Description : Relevez le défi du marathon de Marseille et parcourez les rues pittoresques de la ville. Que vous soyez un coureur chevronné ou débutant, cette course vous permettra de découvrir les plus beaux sites de Marseille tout en relevant un défi sportif mémorable.', '2023-11-12', 'Vieux-Port, Marseille', 'event_images/event6.jpeg', 1),
(15, 'Marché artisanal de Marseille', 'Plongez dans l\'artisanat local et découvrez des trésors uniques lors de notre marché artisanal de Marseille. Parcourez les étals colorés remplis de bijoux, de poteries, de vêtements et bien plus encore. Trouvez des cadeaux originaux et soutenez les artisans locaux.', '2023-09-21', 'Cours Julien, Marseille', 'event_images/event4.jpg', 1),
(16, 'Soirée cinéma en plein air', 'Description : Profitez d\'une soirée cinéma magique en plein air à Marseille. Installez-vous confortablement sous les étoiles et regardez un film classique ou contemporain projeté sur grand écran. C\'est l\'occasion parfaite de passer une soirée détendue en famille ou entre amis.', '2023-07-08', 'Parc Borély, Marseille', '', 2),
(17, 'Spectacle de danse contemporaine', 'Laissez-vous emporter par la grâce et l\'expression de la danse contemporaine lors d\'un spectacle captivant à Marseille. Des danseurs talentueux vous offriront des performances époustouflantes et vous transporteront dans un univers artistique unique.', '2023-10-10', 'Opéra de Marseille, Marseille', '', 2),
(18, 'Grand buffet gourmet', 'Succombez à une expérience culinaire extraordinaire lors de notre événement \"Grand buffet gourmet\". Découvrez une sélection exquise de mets délicieux, préparés par des chefs talentueux. Rejoignez-nous pour une soirée gastronomique exclusive et savourez un festin inoubliable.', '2023-06-30', 'Place Castellane', 'event_images/event7.jpg', 2),
(19, 'Test event', 'Coucou', '2023-06-02', 'zer', '', 2);

-- --------------------------------------------------------

--
-- Structure de la table `LiveApp_userevent`
--

CREATE TABLE `LiveApp_userevent` (
  `id` bigint(20) NOT NULL,
  `registration_date` datetime(6) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `LiveApp_userevent`
--

INSERT INTO `LiveApp_userevent` (`id`, `registration_date`, `event_id`, `user_id`) VALUES
(6, '2023-06-03 09:21:14.264163', 15, 2),
(7, '2023-06-03 09:29:13.240514', 14, 2),
(12, '2023-06-04 06:59:55.007065', 18, 1),
(14, '2023-06-04 09:34:08.347269', 6, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `LiveApp_event`
--
ALTER TABLE `LiveApp_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LiveApp_event_organizer_id_509af41a_fk_auth_user_id` (`organizer_id`);

--
-- Index pour la table `LiveApp_userevent`
--
ALTER TABLE `LiveApp_userevent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LiveApp_userevent_event_id_cdfc2c1a_fk_LiveApp_event_id` (`event_id`),
  ADD KEY `LiveApp_userevent_user_id_d40eb7e4_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `LiveApp_event`
--
ALTER TABLE `LiveApp_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `LiveApp_userevent`
--
ALTER TABLE `LiveApp_userevent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `LiveApp_event`
--
ALTER TABLE `LiveApp_event`
  ADD CONSTRAINT `LiveApp_event_organizer_id_509af41a_fk_auth_user_id` FOREIGN KEY (`organizer_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `LiveApp_userevent`
--
ALTER TABLE `LiveApp_userevent`
  ADD CONSTRAINT `LiveApp_userevent_event_id_cdfc2c1a_fk_LiveApp_event_id` FOREIGN KEY (`event_id`) REFERENCES `LiveApp_event` (`id`),
  ADD CONSTRAINT `LiveApp_userevent_user_id_d40eb7e4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
