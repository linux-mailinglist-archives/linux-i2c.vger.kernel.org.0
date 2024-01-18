Return-Path: <linux-i2c+bounces-1372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885A83206F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 21:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4751C220B7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 20:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0992E63A;
	Thu, 18 Jan 2024 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4v1lwGh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2732E636;
	Thu, 18 Jan 2024 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609325; cv=none; b=gs/+WFyr9ePN4V+JwIz4utC3qDpd1FWKMW++uLtW6jN7i7FW6axK9pNzyrCh7apJBvhlmopPidetenxHHnro++aj1/DapeAWNYRJ+TMX9C+wh5uSc8ZZiF73mNRRbfuws6a6/z1040k37X9ns8q8733JcVKIg4jXNawqJoE4JI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609325; c=relaxed/simple;
	bh=O7gbn9GGwImqDrOkRe45uLjRJUvuJ7wNNXt9ocaKnzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8G1KvYCjQP53R84rP766R4WUuTmWcJDmKEkxvBVhRNsFe/VN9m0BNpirtVG7XBAIXrD2RdPckqg698zhyI4pHTBrBqklBOK6CROHaUjabKoC10thJN/Lc3d5T8IN9CdDCGqdbitLOWP3xlXM6rYOcEkMn+vpXaks0/9Bo10FVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4v1lwGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04C0C433C7;
	Thu, 18 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705609325;
	bh=O7gbn9GGwImqDrOkRe45uLjRJUvuJ7wNNXt9ocaKnzQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Y4v1lwGhXYbIWRfF2szJufLlxqVfLRCvXykcuIBad0cxgyh12L3v2bInZyWJ1JvsU
	 XBGN0wdfiuEUBBpUqA4J/BOpS58rBCOroiUwHlNg2CxErFcHUJT58MKueSMGxMLSEC
	 H9ZLLE3/mhIKiicXYP1zdh9HMIsJCFwhI/DJjpYvyR0vjdIJxw1Fi540zWL6gdZnz7
	 XbcCy4B7FeBFIox6swI+I0KmOoB5nJcuGnJTwJIm4d6ktXZGedRfVRILQXaxq+yDWR
	 5y382AtJgZ8IFlSVpOlO0KaaNXn664WsyP0VAP2uW9LroDI1VvblwCrn25neBg3aoM
	 i59AJLCHeMdeQ==
Date: Thu, 18 Jan 2024 21:22:02 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PULL REQUEST] i2c-for-6.8-rc1-rebased
Message-ID: <ZamIagjK_j3gGQkG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pDlfcXsUyVaEDRP7"
Content-Disposition: inline


--pDlfcXsUyVaEDRP7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is the rebased pull request which you requested. There will still
be a minor merge conflict because one of the CLASS_DDC removal patches
touches the intelfb-driver which is already deleted in your tree.

Please pull.

   Wolfram


The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1-rebased

for you to fetch changes up to 4503538d3066f6dd0a66ecc902b382912b97d8a1:

  MAINTAINERS: use proper email for my I2C work (2024-01-18 21:10:44 +0100)

----------------------------------------------------------------
This cycle, I2C removes the currently unused CLASS_DDC support
(controllers set the flag, but there is no client to use it). Also,
CLASS_SPD support gets simplified to prepare removal in the future.
Class based instantiation is not recommended these days anyhow.
Furthermore, I2C core now creates a debugfs directory per I2C adapter.
Current bus driver users were converted to use it. Then, there are also
quite some driver updates. Standing out are patches for the wmt-driver
which is refactored to support more variants. This is the rebased pull
request where a large series for the designware driver was dropped.
----------------------------------------------------------------
Alain Volmat (6):
      i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
      i2c: stm32f7: perform most of irq job in threaded handler
      i2c: stm32f7: simplify status messages in case of errors
      dt-bindings: i2c: document st,stm32mp25-i2c compatible
      i2c: stm32f7: perform I2C_ISR read once at beginning of event isr
      i2c: stm32f7: add support for stm32mp25 soc

Alexander Stein (1):
      i2c: imx: Make SDA actually optional for bus recovering

Bartosz Golaszewski (1):
      eeprom: at24: use of_match_ptr()

Christophe Leroy (1):
      i2c: cpm: Remove linux,i2c-index conversion from be32

Greg Kroah-Hartman (1):
      i2c: make i2c_bus_type const

Hans Hu (5):
      i2c: wmt: Reduce redundant: bus busy check
      i2c: wmt: Reduce redundant: wait event complete
      i2c: wmt: Reduce redundant: clock mode setting
      i2c: wmt: Reduce redundant: function parameter
      i2c: wmt: Reduce redundant: REG_CR setting

Heiner Kallweit (9):
      drm: remove I2C_CLASS_DDC support
      fbdev: remove I2C_CLASS_DDC support
      include/linux/i2c.h: remove I2C_CLASS_DDC support
      drm/amd/pm: Remove I2C_CLASS_SPD support
      i2c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      i2c: stub: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      media: netup_unidvb: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      staging: greybus: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
      i2c: mux: reg: Remove class-based device auto-detection support

Jean Delvare (1):
      i2c: smbus: Support up to 8 SPD EEPROMs

Marek Szyprowski (3):
      i2c: s3c24xx: fix read transfers in polling mode
      i2c: s3c24xx: fix transferring more than one message in polling mode
      i2c: s3c24xx: add support for atomic transfers

Paul Menzel (2):
      i2c: i801: Add lis3lv02d for Dell Precision 3540
      i2c: i801: Add lis3lv02d for Dell XPS 15 7590

Philipp Zabel (1):
      dt-bindings: at24: add ROHM BR24G04

Tim Lunn (1):
      i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126

Wolfram Sang (6):
      i2c: create debugfs entry per adapter
      i2c: gpio: move to per-adapter debugfs directory
      i2c: npcm7xx: move to per-adapter debugfs directory
      i2c: rcar: introduce Gen4 devices
      i2c: rcar: add FastMode+ support for Gen4
      MAINTAINERS: use proper email for my I2C work


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (13):
      (Rev.) i2c: stm32f7: simplify status messages in case of errors
      (Rev.) i2c: stm32f7: perform most of irq job in threaded handler
      (Rev.) i2c: i801: Add lis3lv02d for Dell XPS 15 7590
      (Rev.) i2c: i801: Add lis3lv02d for Dell Precision 3540
      (Rev.) i2c: cpm: Remove linux,i2c-index conversion from be32
      (Rev.) i2c: imx: Make SDA actually optional for bus recovering
      (Rev.) i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
      (Rev.) i2c: s3c24xx: add support for atomic transfers
      (Rev.) i2c: s3c24xx: fix transferring more than one message in polling mode
      (Rev.) i2c: s3c24xx: fix read transfers in polling mode
      (Rev.) i2c: rcar: add FastMode+ support for Gen4
      (Rev.) i2c: rcar: introduce Gen4 devices
      (Rev.) drm: remove I2C_CLASS_DDC support

AngeloGioacchino Del Regno (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

Chanho Park (2):
      (Rev.) i2c: s3c24xx: add support for atomic transfers
      (Rev.) i2c: s3c24xx: fix read transfers in polling mode

Conor Dooley (1):
      (Rev.) dt-bindings: i2c: document st,stm32mp25-i2c compatible

Geert Uytterhoeven (2):
      (Rev.) i2c: rcar: add FastMode+ support for Gen4
      (Rev.) i2c: rcar: introduce Gen4 devices

Neil Armstrong (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

Oleksij Rempel (1):
      (Rev.) i2c: imx: Make SDA actually optional for bus recovering

Tali Perry (1):
      (Rev.) i2c: npcm7xx: move to per-adapter debugfs directory

Thomas Zimmermann (1):
      (Rev.) drm: remove I2C_CLASS_DDC support

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  28 ++
 MAINTAINERS                                        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   1 -
 drivers/gpu/drm/ast/ast_i2c.c                      |   1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   1 -
 drivers/gpu/drm/display/drm_dp_helper.c            |   1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   1 -
 drivers/gpu/drm/gma500/intel_gmbus.c               |   1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c         |   1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c                |   1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |   1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |   1 -
 drivers/gpu/drm/radeon/radeon_i2c.c                |   1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c             |   1 -
 drivers/i2c/busses/i2c-ali1535.c                   |   2 +-
 drivers/i2c/busses/i2c-ali1563.c                   |   2 +-
 drivers/i2c/busses/i2c-ali15x3.c                   |   2 +-
 drivers/i2c/busses/i2c-amd756.c                    |   2 +-
 drivers/i2c/busses/i2c-amd8111.c                   |   2 +-
 drivers/i2c/busses/i2c-cpm.c                       |   2 +-
 drivers/i2c/busses/i2c-elektor.c                   |   2 +-
 drivers/i2c/busses/i2c-gpio.c                      |  36 +--
 drivers/i2c/busses/i2c-i801.c                      |   2 +
 drivers/i2c/busses/i2c-ibm_iic.c                   |   2 +-
 drivers/i2c/busses/i2c-imx.c                       |   2 +-
 drivers/i2c/busses/i2c-iop3xx.c                    |   2 +-
 drivers/i2c/busses/i2c-isch.c                      |   2 +-
 drivers/i2c/busses/i2c-kempld.c                    |   3 +-
 drivers/i2c/busses/i2c-mlxcpld.c                   |   2 +-
 drivers/i2c/busses/i2c-nforce2.c                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c                   |  49 +--
 drivers/i2c/busses/i2c-pasemi-pci.c                |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/i2c/busses/i2c-rcar.c                      |  51 ++-
 drivers/i2c/busses/i2c-rk3x.c                      |   8 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |  61 ++--
 drivers/i2c/busses/i2c-scmi.c                      |   2 +-
 drivers/i2c/busses/i2c-sh7760.c                    |   2 +-
 drivers/i2c/busses/i2c-sibyte.c                    |   4 +-
 drivers/i2c/busses/i2c-sis5595.c                   |   2 +-
 drivers/i2c/busses/i2c-sis630.c                    |   2 +-
 drivers/i2c/busses/i2c-sis96x.c                    |   2 +-
 drivers/i2c/busses/i2c-stm32f7.c                   | 342 +++++++++++----------
 drivers/i2c/busses/i2c-via.c                       |   2 +-
 drivers/i2c/busses/i2c-viapro.c                    |   2 +-
 drivers/i2c/busses/i2c-wmt.c                       | 117 ++-----
 drivers/i2c/busses/scx200_acb.c                    |   2 +-
 drivers/i2c/i2c-core-base.c                        |  13 +-
 drivers/i2c/i2c-smbus.c                            |   8 +-
 drivers/i2c/i2c-stub.c                             |   2 +-
 drivers/i2c/muxes/i2c-mux-reg.c                    |   4 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |   2 +-
 drivers/misc/eeprom/at24.c                         |   5 +-
 drivers/staging/greybus/i2c.c                      |   2 +-
 drivers/video/fbdev/core/fb_ddc.c                  |   1 -
 drivers/video/fbdev/cyber2000fb.c                  |   1 -
 drivers/video/fbdev/i740fb.c                       |   1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c          |  15 +-
 drivers/video/fbdev/matrox/i2c-matroxfb.c          |  15 +-
 drivers/video/fbdev/s3fb.c                         |   1 -
 drivers/video/fbdev/tdfxfb.c                       |   1 -
 drivers/video/fbdev/tridentfb.c                    |   1 -
 drivers/video/fbdev/via/via_i2c.c                  |   1 -
 include/linux/i2c.h                                |   5 +-
 include/linux/platform_data/i2c-mux-reg.h          |   2 -
 sound/soc/rockchip/rk3399_gru_sound.c              |   2 +-
 79 files changed, 401 insertions(+), 455 deletions(-)

--pDlfcXsUyVaEDRP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWpiGkACgkQFA3kzBSg
KbZXaw//QlSiucH7euldLn3HSA+9DIxUQW5KjwwjzGl97AjmWHxO3jp/mHuptukP
GsNR8d2dQ9milpoBRMMnD0P7JpNIXk3AZtYtU1mFiNpk4fEdwkYJSa4GctGlGKNw
BBskzunk8AQxh+xmF9ryydAW272L8mEVynmPhIiUAm4Gbm/kmzZToCLjadb7DtzW
QuATiynJ1o73xc7V3VtsXVZIsR50x4iFAHudrNrAP4ZDkne6o5cAW6zWFeKkurxE
Ow+E4hNEDYD6H2hzfuALVDKkI+ZW5b3Lnbvs9q5ET2peH47Js3GYuMxztDlo+im7
74DapDMJmur6Delu27QejaKT0nIczANSTc3WTq6zwbjqAYOgBYSTz5V6GsUUAbqJ
JykN4LREq9GldCR5yIkn66Rv3ohvoJDRlfKogrjEQukPw9xaQmyFgvJKlbK37twS
apzLtkVu9K1/mOZPg7tXVbUBd8QM3KX+YyPcwMVjBrMGr0l+Kuy2y7dwrS5EElUu
pXi8LzDYWXLaBM8MJWtuf3Bre6+Hutp3OY5j4X98rM4jt70CM0MWYxlf5NT3rmmC
cLXR/iQeN1jS5SHPWRvKCWth4U6I/ngFJvWEKYPlorj8AUQ5FD6nZZ64CRnQDKtp
QTbYr0wC9px0hfFq24zlSSX/Uld8BfMOxREwszpb7/rqoSwJvDM=
=pSvi
-----END PGP SIGNATURE-----

--pDlfcXsUyVaEDRP7--

