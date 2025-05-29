-- CreateTable
CREATE TABLE `Usuarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `rol` VARCHAR(191) NOT NULL,
    `estado` BOOLEAN NOT NULL,
    `fecha_creacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `fecha_actualizacion` DATETIME(3) NOT NULL,
    `fecha_inactivacion` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clientes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,
    `documentoIdentificacion` VARCHAR(191) NOT NULL,
    `tipoPersona` ENUM('Natural', 'Juridica') NOT NULL,
    `telefono` VARCHAR(191) NOT NULL,
    `correo` VARCHAR(191) NOT NULL,
    `direccion` VARCHAR(191) NOT NULL,
    `estado` BOOLEAN NOT NULL,
    `creadoPorId` INTEGER NOT NULL,
    `fechaCreacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `fechaActualizacion` DATETIME(3) NOT NULL,
    `fechaInactivacion` DATETIME(3) NULL,

    UNIQUE INDEX `clientes_documentoIdentificacion_key`(`documentoIdentificacion`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `empleados` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,
    `documentoIdentificacion` VARCHAR(191) NOT NULL,
    `tipoPersona` ENUM('Natural', 'Juridica') NOT NULL,
    `tipoContratacion` ENUM('Permanente', 'PorHoras') NOT NULL,
    `telefono` VARCHAR(191) NOT NULL,
    `correo` VARCHAR(191) NOT NULL,
    `direccion` VARCHAR(191) NOT NULL,
    `estado` BOOLEAN NOT NULL,
    `creadoPorId` INTEGER NOT NULL,
    `fechaCreacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `fechaActualizacion` DATETIME(3) NOT NULL,
    `fechaInactivacion` DATETIME(3) NULL,

    UNIQUE INDEX `empleados_documentoIdentificacion_key`(`documentoIdentificacion`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cotizaciones` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `clienteId` INTEGER NOT NULL,
    `estado` ENUM('EnProceso', 'Finalizada') NOT NULL,
    `fechaInicioTentativa` DATETIME(3) NOT NULL,
    `fechaFinTentativa` DATETIME(3) NOT NULL,
    `costoAdicionales` DOUBLE NOT NULL,
    `creadoPorId` INTEGER NOT NULL,
    `fechaCreacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `asignaciones` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cotizacionId` INTEGER NOT NULL,
    `empleadoId` INTEGER NOT NULL,
    `areaAsignada` VARCHAR(191) NOT NULL,
    `tituloActividad` VARCHAR(191) NOT NULL,
    `fechaHoraInicio` DATETIME(3) NOT NULL,
    `fechaHoraFin` DATETIME(3) NOT NULL,
    `costoPorHora` DOUBLE NOT NULL,
    `incrementoExtraPorcentaje` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subtareas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `asignacionId` INTEGER NOT NULL,
    `tituloSubtarea` VARCHAR(191) NOT NULL,
    `descripcion` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `clientes` ADD CONSTRAINT `clientes_creadoPorId_fkey` FOREIGN KEY (`creadoPorId`) REFERENCES `Usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `empleados` ADD CONSTRAINT `empleados_creadoPorId_fkey` FOREIGN KEY (`creadoPorId`) REFERENCES `Usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cotizaciones` ADD CONSTRAINT `cotizaciones_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `clientes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cotizaciones` ADD CONSTRAINT `cotizaciones_creadoPorId_fkey` FOREIGN KEY (`creadoPorId`) REFERENCES `Usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `asignaciones` ADD CONSTRAINT `asignaciones_cotizacionId_fkey` FOREIGN KEY (`cotizacionId`) REFERENCES `cotizaciones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `asignaciones` ADD CONSTRAINT `asignaciones_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `empleados`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subtareas` ADD CONSTRAINT `subtareas_asignacionId_fkey` FOREIGN KEY (`asignacionId`) REFERENCES `asignaciones`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;


INSERT INTO usuarios (
    id, email, password, rol, estado,
    fecha_creacion, fecha_actualizacion, fecha_inactivacion
) VALUES (
             1,
             'admin@admin.com',
             'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',
             'admin',
             1,
             '2025-05-26 23:47:03.307',
             '2025-05-26 23:47:11.002',
             NULL
         );
