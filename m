Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48321220350
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jul 2020 06:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgGOETW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 00:19:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11947 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgGOETW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 00:19:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e83900000>; Tue, 14 Jul 2020 21:18:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 21:19:22 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:21 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83c80002>; Tue, 14 Jul 2020 21:19:21 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 00/18] Support for Tegra video capture from external sensor
Date:   Tue, 14 Jul 2020 21:20:37 -0700
Message-ID: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786704; bh=H3uPLyelSg29Z/xvdKbwpYtnQFHubI57wAgazwqqfrw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=X0EOcpsFFWEHuf70WGXCxtoJAK/Jk6fD8r01WJJ4DrQxTYhyxRb0OY6KhDP4Cz44a
         439SZGN6UU3tNPQu84AL30GbgPxruZ/eZoZpnt81P+iX1w1Cisb2BYpPvHd6wa5IzS
         2/5VRmMr79THMyo9czoE+HAendIjzh8k/42HhV6fTILkfkf6+2LNbxyCZs8+pldAaZ
         Ab/yI8XAMWRgR/hCmonUTWbkGE/JE1zd08fw4TTcU0U3ARCvhQ+Dzpavnc+HewW+2C
         yNHG7uEUD6wNilH2sxkWW8o8EDu2ihCQ3J8VgehZCWtChO9+kSavqGCG9jNQFL4YDk
         ehyY4yhXsh84g==
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

[v3]:	Includes v2 feedback
	- Uses separate helper function for retrieving remote csi subdevice
	  and source subdevice.
	- Added check for presence of subdevice ops set/get_selection
	- dropped vb2_queue_release from driver and using
	  vb2_video_unregister_device instead of video_unregister_device.
	- video device register should happen in the last after all video
	  device related setup is done in the driver. This is being addressed
	  in below RFC patch. Once proper implementation of this is available
	  will update Tegra video driver to use split APIs and do all setup
	  prior to device register. Added this as TODO in the driver.
	  https://www.spinics.net/lists/linux-media/msg172761.html

	Note:
	Patch-0012 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/


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
  i2c: tegra: Remove NULL pointer check before
    clk_enable/disable/prepare/unprepare
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
  gpu: host1x: mipi: Use readl_relaxed_poll_timeout in tegra_mipi_wait
  gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
 drivers/gpu/drm/tegra/dsi.c                        |   9 +-
 drivers/gpu/host1x/mipi.c                          |  37 +-
 drivers/i2c/busses/i2c-tegra.c                     | 101 +--
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 247 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 793 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  25 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   4 +-
 14 files changed, 1242 insertions(+), 154 deletions(-)

-- 
2.7.4

