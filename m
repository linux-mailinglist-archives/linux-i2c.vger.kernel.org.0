Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798351FC3B0
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 03:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgFQBja (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 21:39:30 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18351 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgFQBj3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 21:39:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee9741f0001>; Tue, 16 Jun 2020 18:38:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 18:39:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 18:39:28 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jun
 2020 01:39:28 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 17 Jun 2020 01:39:28 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.171.186]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ee9744e0003>; Tue, 16 Jun 2020 18:39:27 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v2 00/18] Support for Tegra video capture from external sensor
Date:   Tue, 16 Jun 2020 18:41:16 -0700
Message-ID: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592357919; bh=gWJwcLfB8TP7ne2xW3jA7ozKDaLwQXfkMd5LOGS0z78=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=IfZLhQ5hB7cGuJ/USmZo7CRzbANYE85R3t0OG3oRA2hZjSD+q25+3S5tEo5rR5SBs
         HtasZpBxfa4dUE51F75iy41+kqsq0xW60S/eUm+AqMYMcWYENB8MIxiTYMNQKBxeSP
         EwPig+75NSu3HuPoJ3FJrLEXbHKA2eGfCHvHRJO0GwI/3hiXRyzn4no2CBpc4lI+1P
         sLiaaKlkyBKNXYAF6JIPw8+3pOO++Ek36ie5b4D7xQpaqCLTUzVITr4al90oHP98os
         l1pKcgNR/oHLuxqv8gn+9q8obRg6lg2NsS0xurw3aKm39+t8jgqZxWhCd0FQEHlzke
         ipbo0Qidv1kAg==
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


Delta between patch versions:

[v2]:	Includes below changes based on v1 feedback
	- dt-binding document and the driver update for device graph to use
	  separate ports for sink endpoint and source endpoint for csi.
	- Use data-lanes endpoint property for csi.
	- Update tegra_mipi_request() to take device node pointer argument
	  rather than adding extra API.
	- Remove checking for clk pointer before clk_disable.


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
  dt-bindings: tegra: Update VI and CSI bindings with port info
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Update tegra_mipi_request() to be node based
  gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate
  arm64: tegra: jetson-tx1: Add camera supplies
  arm64: tegra: Enable Tegra VI CSI support for Jetson Nano

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
 drivers/gpu/drm/tegra/dsi.c                        |   9 +-
 drivers/gpu/host1x/mipi.c                          |  30 +-
 drivers/i2c/busses/i2c-tegra.c                     |  39 +-
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  23 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   4 +-
 16 files changed, 1251 insertions(+), 100 deletions(-)

-- 
2.7.4

