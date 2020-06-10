Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655701F4DCA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 08:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgFJGCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 02:02:45 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10474 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgFJGCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 02:02:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee077760000>; Tue, 09 Jun 2020 23:02:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jun 2020 23:02:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jun 2020 23:02:44 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 06:02:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Jun 2020 06:02:43 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.70]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee077830000>; Tue, 09 Jun 2020 23:02:43 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v1 00/18] Support for Tegra video capture from external sensor
Date:   Tue, 9 Jun 2020 23:02:22 -0700
Message-ID: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591768950; bh=FXhZfk63iIGnhOl7ObWf5a0rZNtaUwqXcQ95FoPZsQU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=o/oLmO/k+w1qnam9L4g1yDi4XMZro4JQyplhYPpSNViUombSnHD9yM+9ivDykplVT
         C6Om7NGufPOo4rRsGAPVr/0bMdjp/TGaKUuS91KDGWaOTCShHR5YT1mlSJ/YdT4ef2
         Os6Od+BXGQC+yQ8bkfBqaeVLHivEGwH8Jw7srs+MdrVAoBOmpJl5dUNCKEtN/DZvVn
         yjEhJYzLoljehxwCl1BkyrXA75z4LuLk3oyl/4HtN70DEv0itsFWa/UfGGaZrm4Fpp
         4+LOd/qbwfW6wIrH/Ji5ge9ch45AdmrGQ41WBMBQEoouAt5oBiRmWAuK+TSgX/jmiL
         mXoDBU3LSuzTA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds support for video capture from external camera sensor to
Tegra video driver.

Jetson TX1 has camera expansion connector and supports custom camera module
designed as per TX1 design specification.

This series also enables camera capture support for Jetson Nano which has
Raspberry PI camera header.

This series is tested with IMX219 camera sensor.

This series include,

VI I2C related fixes
- Camera sensor programming happens through VI I2C which is on host1x bus.
- These patches includes device tree and I2C driver fixes for VI I2C.

Tegra video driver updates
- TPG Vs Non-TPG based on Kconfig
- Support for external sensor video capture based on device graph from DT.
- Support for selection ioctl operations
- Tegra MIPI CSI pads calibration
- CSI T-CLK and T-HS settle time computation based on clock rates.

Host1x driver updates
- Adds API to allow creating mipi device for specific device node.
- Splits MIPI pads calibrate start and waiting for calibration to be done.

Device tree updates
- Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
- Enabled VI and CSI support in Jetson Nano DT.



Sowjanya Komatineni (18):
  dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
    power-domains
  arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
  i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
  i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
  i2c: tegra: Fix runtime resume to re-init VI I2C
  i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
  media: tegra-video: Fix channel format alignment
  media: tegra-video: Enable TPG based on kernel config
  media: tegra-video: Update format lookup to offset based
  dt-bindings: tegra: Document VI and CSI port nodes
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Add of_tegra_mipi_request() API
  gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate
  arm64: tegra: jetson-tx1: Add camera supplies
  arm64: tegra: Enable Tegra VI CSI support for Jetson Nano

 .../display/tegra/nvidia,tegra20-host1x.txt        |  87 +++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
 drivers/gpu/drm/tegra/dsi.c                        |   7 +-
 drivers/gpu/host1x/mipi.c                          |  33 +-
 drivers/i2c/busses/i2c-tegra.c                     |  41 +-
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   9 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  23 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   3 +
 16 files changed, 1253 insertions(+), 96 deletions(-)

-- 
2.7.4

