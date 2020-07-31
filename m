Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30342341C4
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 11:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbgGaJCz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 05:02:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16304 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731442AbgGaJCy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 05:02:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f23de310000>; Fri, 31 Jul 2020 02:02:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 02:02:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 02:02:54 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 09:02:54 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 09:02:54 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f23de3d0001>; Fri, 31 Jul 2020 02:02:54 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v6 00/10] Support for Tegra video capture from external sensor
Date:   Fri, 31 Jul 2020 02:02:39 -0700
Message-ID: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596186161; bh=ODEbrQxWU99pgy2R0nVoleMIPeQ0jojZYwaChWYECB0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=McGbKryJc9iZuCIZSnWay2yGJJhO3meeRhXav3g1fKqW6KWL6oH2flf3zUwCOuILZ
         mlVtaXjrVJX1Eba8FImEzbjdxOjp4a25WXWTy8ssmW0geLfYBSpg+h27mLJh3yyXod
         fX8JIWG81R8Hcn/r7GYSb/n4oH/qrti+3b4Dbf3qdwlr6WTeSNwqjd3Chcia0dCE6c
         xnNTWrJYILHvBEuZ1DDdqVjFHkFuRIP5sndH6E0kCiGENxi6FJtqiEGKOdDA4OmuOn
         3pABxfyaMdzORz55tFp/FBHtKZOD4qYn6ar0x3NssAYIw7i21yBqz7t/5qDeRBU0+Q
         3ui5+iKgvrpvQ==
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

This series is tested with IMX274 and IMX219 camera sensors.

This series include,

Tegra video driver updates
- TPG Vs Non-TPG based on Kconfig
- Support for external sensor video capture based on device graph from DT
- Support for selection ioctl operations
- Tegra MIPI CSI pads calibration
- CSI T-CLK and T-HS settle time computation based on clock rates
- dt-binding doc update

Host1x driver updates
- Keep MIPI clock enabled till calibration is done

Delta between patch versions:
[v6]:	Includes below changes based on v5 feedback
	- Patches are based on latest linux-next.
	- separated stream enable and disable implementations into
	  separate functions for tegra_channel_set_stream() and
	  tegra_csi_s_stream().
	- changed dev_err to dev_warn on MIPI calibration failure after
	  sensor streaming as its not critical error.

	Note:
	Patch-0006 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v5]:	Includes below minor change based on v4 feedback
	Patch-0012: renames APIs to use calibration instead of calibrate.

	Note:
	Patch-0010 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

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


Sowjanya Komatineni (10):
  media: tegra-video: Fix channel format alignment
  media: tegra-video: Enable TPG based on kernel config
  media: tegra-video: Update format lookup to offset based
  dt-bindings: tegra: Update VI and CSI bindings with port info
  media: tegra-video: Separate CSI stream enable and disable
    implementations
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 drivers/gpu/drm/tegra/dsi.c                        |   4 +-
 drivers/gpu/host1x/mipi.c                          |  19 +-
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/TODO             |   6 -
 drivers/staging/media/tegra-video/csi.c            | 305 +++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 834 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  25 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   5 +-
 12 files changed, 1237 insertions(+), 116 deletions(-)

-- 
2.7.4

