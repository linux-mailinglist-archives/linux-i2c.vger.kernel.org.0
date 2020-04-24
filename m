Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC201B7A4D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 17:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgDXPlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 11:41:36 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:53303 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726872AbgDXPf2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 11:35:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 9CAB9FDA;
        Fri, 24 Apr 2020 11:35:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=SjPxpBg04ATGSZdAKkAXPSZsAf
        VM7yh1JfLe0zEl7+g=; b=hXx0pIW5H8BKgxYN5+QEQdnnjQ5VQEwDdfb6ZhEByP
        GKZ9hwUMYt7pqdLXhch+mA9jgB3Adrv/HyDlNuCgUq72qQvz8yz5XwwETqvWdyyN
        ZVuUbiWmlarvOILFIQ1RBq3DR57O1YRXxzZQlfkMrvagjeLUCFofh6XLHYxMIgot
        4jMLccyBWEZKoCWsxN7TxlqbS7bB/Rd5YdaLVTAqXb6JCkYIASpzKlpG/5ftDlGW
        hTlYYnrFzeDV0SG66oXCEfVXtTJ3SolcTuy+qHUPL7KXgcH9FAos87+Cma0q3dBs
        paxKMjqcVpxJ7HVpdBLjvTALLY/llROoP7KpzTtR5wNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SjPxpBg04ATGSZdAK
        kAXPSZsAfVM7yh1JfLe0zEl7+g=; b=Mlb9b22bSR7Hde/F/dOJZYLIEqC89YPy3
        dxlDHjk7qb0FbxPg4LmdM+oiYQEXossulDcC154qk3ECA7hMlWXRUBr/MTuOlsQJ
        fR1cRUKfBRpkXuK8XIWmU8pbzu9mAQHrYuIQ2Cr5j5QrUU/HsZiEZdsECd3J8as0
        pl6OQ4CySam4FBpmwnjdw2x0N0O16W1jYT+tjwo3KWW3qZmX/u4DWaSInv+S3PsY
        wMuB+HcolHeWv+OHBerU6xxC21MwzGD9VfhshMW99kjCWVol/dpNXIYum6jy614p
        4sxf/+nFaIOxthKOW779h+4Mo+Rh5S88eT2OH+65zyxuw750tpPqg==
X-ME-Sender: <xms:OgejXng3eLL_lDWBqPLpVmVs2cTZr39H-QT5GgRdtVGtdm3jJ9jmDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinheprh
    grshhpsggvrhhrhihpihdrtghomhenucfkphepledtrdekledrieekrdejieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
    gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OgejXipiVaI7spi09qsLQMin7WBpub62cpnO2n3mrOkGglQ5ioWJmA>
    <xmx:OgejXmsX_wOFi4OGojKhqp6TWt2fCp_nJCpTOn2an_XIUoVRNOMQ-w>
    <xmx:OgejXqd71MPEuP8txaD7HtZ3liViey1zYrLn74ra2OcSfegPQ12_UQ>
    <xmx:PQejXqJX5YvWCjTyhOqakzdwR0PWNv5-nqyFbsuYDZpJzIieOPEdpCpBkmQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id F1F24328006C;
        Fri, 24 Apr 2020 11:35:21 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>, devicetree@vger.kernel.org,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipeline
Date:   Fri, 24 Apr 2020 17:33:41 +0200
Message-Id: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi everyone,

Here's a (pretty long) series to introduce support in the VC4 DRM driver
for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4).

The main differences are that there's two HDMI controllers and that there's
more pixelvalve now. Those pixelvalve come with a mux in the HVS that still
have only 3 FIFOs. Both of those differences are breaking a bunch of
expectations in the driver, so we first need a good bunch of cleanup and
reworks to introduce support for the new controllers.

Similarly, the HDMI controller has all its registers shuffled and split in
multiple controllers now, so we need a bunch of changes to support this as
well.

Only the HDMI support is enabled for now (even though the DPI output has
been tested too). There's a couple of rough edges still that should be
addressed in the next versions:
  - After a modeset, it's likely that the pixels will be shifted by one.
  - Dual output doesn't work
  - The transposer (and thus writeback) doesn't work either and conflicts
    with the output mux too.

Let me know if you have any comments
Maxime

Cc: bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>

Changes from v1:
  - Rebased on top of 5.7-rc1
  - Run checkpatch
  - Added audio support
  - Fixed some HDMI timeouts
  - Swiched to clk_hw_register_gate_parent_data
  - Reorder Kconfig symbols in drivers/i2c/busses
  - Make the firmware clocks a child of the firmware node
  - Switch DVP clock driver to clk_hw interface
  - constify raspberrypi_clk_data in raspberrypi_clock_property
  - Don't mark firmware clocks as IGNORE_UNUSED
  - Change from reset_ms to reset_us in reset-simple, and add a bit more
    comments
  - Remove generic clk patch to test if a NULL pointer is returned
  - Removed misleading message in the is_prepared renaming patch commit
    message
  - Constify HDMI controller variants
  - Fix a bug in the allocation size of the clk data array
  - Added a mention in the DT binding conversion patches about the breakage
  - Merged a few fixes from kbuild
  - Fixed a few bisection and CEC build issues
  - Collected Acked-by and Reviewed-by
  - Change Dave email address to raspberrypi.com

Dave Stevenson (6):
  drm/vc4: Add support for the BCM2711 HVS5
  drm/vc4: plane: Improve LBM usage
  drm/vc4: hdmi: Use reg-names to retrieve the HDMI audio registers
  drm/vc4: hdmi: Reset audio infoframe on encoder_enable if previously streaming
  drm/vc4: hdmi: Set the b-frame marker to the match ALSA's default.
  drm/vc4: hdmi: Add audio-related callbacks

Florian Fainelli (1):
  dt-bindings: arm: bcm: Convert BCM2835 firmware binding to YAML

Maxime Ripard (84):
  i2c: brcmstb: Allow to compile it on BCM2835
  dt-bindings: clock: Add a binding for the RPi Firmware clocks
  firmware: rpi: Only create clocks device if we don't have a node for it
  clk: bcm: rpi: Allow the driver to be probed by DT
  clk: bcm: rpi: Statically init clk_init_data
  clk: bcm: rpi: Use clk_hw_register for pllb_arm
  clk: bcm: rpi: Remove global pllb_arm clock pointer
  clk: bcm: rpi: Make sure pllb_arm is removed
  clk: bcm: rpi: Remove pllb_arm_lookup global pointer
  clk: bcm: rpi: Switch to clk_hw_register_clkdev
  clk: bcm: rpi: Make sure the clkdev lookup is removed
  clk: bcm: rpi: Create a data structure for the clocks
  clk: bcm: rpi: Add clock id to data
  clk: bcm: rpi: Pass the clocks data to the firmware function
  clk: bcm: rpi: Rename is_prepared function
  clk: bcm: rpi: Split pllb clock hooks
  clk: bcm: rpi: Make the PLLB registration function return a clk_hw
  clk: bcm: rpi: Add DT provider for the clocks
  clk: bcm: rpi: Discover the firmware clocks
  ARM: dts: bcm2711: Add firmware clocks node
  reset: Move reset-simple header out of drivers/reset
  reset: simple: Add reset callback
  dt-bindings: clock: Add BCM2711 DVP binding
  clk: bcm: Add BCM2711 DVP driver
  ARM: dts: bcm2711: Add HDMI DVP
  dt-bindings: display: Convert VC4 bindings to schemas
  dt-bindings: display: vc4: dpi: Add missing clock-names property
  dt-bindings: display: vc4: dsi: Add missing clock properties
  dt-bindings: display: vc4: hdmi: Add missing clock-names property
  dt-bindings: display: vc4: Document BCM2711 VC5
  drm/vc4: drv: Add include guards
  drm/vc4: drv: Support BCM2711
  dt-bindings: display: Add support for the BCM2711 HVS
  drm/vc4: hvs: Boost the core clock during modeset
  drm/vc4: plane: Move planes creation to its own function
  drm/vc4: plane: Move additional planes creation to driver
  drm/vc4: plane: Register all the planes at once
  drm/vc4: plane: Create overlays for any CRTC
  drm/vc4: plane: Create more planes
  drm/vc4: crtc: Rename SoC data structures
  drm/vc4: crtc: Move crtc state to common header
  drm/vc4: crtc: Deal with different number of pixel per clock
  drm/vc4: crtc: Use a shared interrupt
  drm/vc4: crtc: Turn static const variable into a define
  drm/vc4: crtc: Move the cob allocation outside of bind
  drm/vc4: crtc: Rename HVS channel to output
  drm/vc4: crtc: Use local chan variable
  drm/vc4: crtc: Enable and disable the PV in atomic_enable / disable
  drm/vc4: crtc: Assign output to channel automatically
  drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
  drm/vc4: crtc: Add function to compute FIFO level bits
  drm/vc4: crtc: Rename HDMI encoder type to HDMI0
  drm/vc4: crtc: Add HDMI1 encoder type
  drm/vc4: crtc: Remove redundant call to drm_crtc_enable_color_mgmt
  drm/vc4: crtc: Disable color management for HVS5
  dt-bindings: display: vc4: pv: Add BCM2711 pixel valves
  drm/vc4: crtc: Add BCM2711 pixelvalves
  drm/vc4: hdmi: Use debugfs private field
  drm/vc4: hdmi: Move structure to header
  drm/vc4: hdmi: rework connectors and encoders
  drm/vc4: hdmi: Remove DDC argument to connector_init
  drm/vc4: hdmi: Rename hdmi to vc4_hdmi
  drm/vc4: hdmi: Move accessors to vc4_hdmi
  drm/vc4: hdmi: Use local vc4_hdmi directly
  drm/vc4: hdmi: Add container_of macros for encoders and connectors
  drm/vc4: hdmi: Pass vc4_hdmi to CEC code
  drm/vc4: hdmi: Remove vc4_dev hdmi pointer
  drm/vc4: hdmi: Remove vc4_hdmi_connector
  drm/vc4: hdmi: Introduce resource init and variant
  drm/vc4: hdmi: Implement a register layout abstraction
  drm/vc4: hdmi: Add reset callback
  drm/vc4: hdmi: Add PHY init and disable function
  drm/vc4: hdmi: Add PHY RNG enable / disable function
  drm/vc4: hdmi: Add a CSC setup callback
  drm/vc4: hdmi: Store the encoder type in the variant structure
  drm/vc4: hdmi: Deal with multiple debugfs files
  drm/vc4: hdmi: Move CEC init to its own function
  drm/vc4: hdmi: Add CEC support flag
  drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
  drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
  drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate
  drm/vc4: hdmi: Support the BCM2711 HDMI controllers
  dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI controllers bindings
  ARM: dts: bcm2711: Enable the display pipeline

 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt  |   14 +-
 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml |   59 +++-
 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml               |   47 ++-
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt                  |  174 +--------
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml            |  109 +++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml             |   72 +++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml            |   84 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml            |   80 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml             |   53 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml     |   45 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml             |   37 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml             |   42 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml             |   35 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml             |   44 ++-
 MAINTAINERS                                                                 |    2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts                                       |   51 ++-
 arch/arm/boot/dts/bcm2711.dtsi                                              |  130 +++++-
 drivers/clk/bcm/Kconfig                                                     |    1 +-
 drivers/clk/bcm/Makefile                                                    |    1 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c                                           |  127 ++++++-
 drivers/clk/bcm/clk-raspberrypi.c                                           |  280 +++++++++----
 drivers/firmware/raspberrypi.c                                              |   17 +-
 drivers/gpu/drm/vc4/Makefile                                                |    1 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                                              |  328 +++++++++------
 drivers/gpu/drm/vc4/vc4_drv.c                                               |    5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                                               |   58 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                                              | 1536 ++++++++++++++++++++++++++++++++++++++++++------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h                                              |  179 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                                          |  508 ++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                                         |  451 +++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hvs.c                                               |   25 +-
 drivers/gpu/drm/vc4/vc4_kms.c                                               |  181 +++++++-
 drivers/gpu/drm/vc4/vc4_plane.c                                             |  271 +++++++++----
 drivers/gpu/drm/vc4/vc4_regs.h                                              |  173 +++-----
 drivers/i2c/busses/Kconfig                                                  |    4 +-
 drivers/reset/reset-simple.c                                                |   27 +-
 drivers/reset/reset-simple.h                                                |   41 +--
 drivers/reset/reset-socfpga.c                                               |    3 +-
 drivers/reset/reset-sunxi.c                                                 |    3 +-
 drivers/reset/reset-uniphier-glue.c                                         |    3 +-
 include/linux/reset/reset-simple.h                                          |   47 ++-
 include/soc/bcm2835/raspberrypi-firmware.h                                  |    5 +-
 42 files changed, 4109 insertions(+), 1244 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
 create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
 delete mode 100644 drivers/reset/reset-simple.h
 create mode 100644 include/linux/reset/reset-simple.h

base-commit: cb3692197b5da2fb898335eec1640db14d92e52e
-- 
git-series 0.9.1
