Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB95922BA62
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 01:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgGWXsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 19:48:17 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7643 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgGWXsR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 19:48:17 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1a21b40000>; Thu, 23 Jul 2020 16:48:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 16:48:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 Jul 2020 16:48:17 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 23:48:16 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 23:48:16 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1a21c00000>; Thu, 23 Jul 2020 16:48:16 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v4 00/14] Support for Tegra video capture from external sensor
Date:   Thu, 23 Jul 2020 16:50:58 -0700
Message-ID: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595548084; bh=NcyOlwhxCrJ6+TI5P/DHk1w9IU5kwfVlNEWSx8UmFFI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=e/AJcIjv7kmaZyjsqpLRrNUa2PjgsCZV1XFzyciIWfXgN1J5icC7iCk9cPoXHEdBG
         MsC51ddzHGKs147oA5+GNb4yzY5IN5NTioXRyef1yjTEykLOgx82Y3AJYwgOIBihZ6
         a84/BZTV+BuAF6rpI9LEofFl0O/U9gRNOlFGWSEzkc2KFNodVZnsCAITfW6KKfcqnb
         2TKmyKc6pgetoAb/TNGDU707aoPfaNQW4w2YzUmrLXKqAB4/t5316PujnSIteoT1uZ
         E6BXcIXsl/NqlMECI8F9DEWo31unkmYF+eJ+QQyqKmyhUcvkxaMlIkih7WOyPhoFi3
         7QkMXLAqihxSA==
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
[v4]:	Includes below fix based on v3 feedback
	- Patches are based on latest linux-next.
	- With split of tegra_mipi_calibrate() and tegra_mipi_wait(), mipi
	  clock is not left enabled till calibration done. This series adds
	  a patch to fix this by keeping clock enabled till calibration is
	  done.

	Note:
	Patch-0010 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

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


Sowjanya Komatineni (14):
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
  gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 drivers/gpu/drm/tegra/dsi.c                        |   4 +-
 drivers/gpu/host1x/mipi.c                          |  19 +-
 drivers/i2c/busses/i2c-tegra.c                     | 101 +--
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 258 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 800 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  25 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   5 +-
 12 files changed, 1224 insertions(+), 143 deletions(-)

-- 
2.7.4

