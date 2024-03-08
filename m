Return-Path: <linux-i2c+bounces-2284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD387642C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB8728593B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA28856756;
	Fri,  8 Mar 2024 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGjfQWrz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71402110E;
	Fri,  8 Mar 2024 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709900390; cv=none; b=byWKHgH6R3ZToMNw6Hxp2jUOiVxcN9nT23snTZ6NX5e/KkE598xY0Qji5mxgRm4fP4G1wPB51qkOMGwi23ICMu66SZE8kQ/I3UUTasl8TPGI8bkgoumYgmiCDWMmtyvkNs5UUm6MRYi3I7AcFCQkHnoi/gl+2dh5naKgVqA5v4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709900390; c=relaxed/simple;
	bh=fv3L8QsrU1mI05kpYKhbzvkihZEhNEyJPFp9sm15VCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiSoqWLaeLbkKVCO+CRqbEgLwitCdSnsC4EK4hoY+NpaZ3qrpwofoLTw7j//U0Mjtw4Vsyfj1aBLVDkaKmacFv2yoPaCGTNkGrUI1+VHaYLDXCqh7tZh23BpNStR5p5T8yOLmOzqtT3XRNFs2wz0nyrv2/Lkj3dpnVn8sT+9JXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGjfQWrz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF46C433F1;
	Fri,  8 Mar 2024 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709900390;
	bh=fv3L8QsrU1mI05kpYKhbzvkihZEhNEyJPFp9sm15VCk=;
	h=Date:From:To:Cc:Subject:From;
	b=ZGjfQWrz09W4BdQUJu7yy65BhKNVmqkq/Ne2OR1+B4Yv3+xohgRlDXFc5OcuIIXTq
	 aneie/dVeTAl+U3NU08/4CSuyDm1DGdPaBIgdq0bm6+17FQjeZGSPonPWqXsb9LB9B
	 NmJl86GgQGc1xn9ttvNL6agwNhMoIbo17HtZ3x4pa7byb5WkqcLHdkadTbzhbZsjYF
	 BTOGaPI93S8hZzOBmGhB9hW6ZUrGfgRK0bQU8+T+epTKKA+Pw6zL/bkgamyKQuEeVm
	 UzrKjRdbwSlXqGc5OqD2iIsoZmX9gwecKqaqsefZCn2Ww0OSstVA1sct1zFjaKriQH
	 NkZlymw1xNO4Q==
Date: Fri, 8 Mar 2024 13:19:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] i2c-host changes for v6.9
Message-ID: <jdepgjva4pciwws5hep6xuf3ibokjy2oqwmak6tztnr5cprrfg@eb7t5nm3zyns>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

It has been quite an adrenaline filled last week.

Here is my first pull request for the next merge window.

I still have changes from Hans Hu for the Zhaoxin I2C controller,
but, as you know, this has some conflicts with a fix from
Christophe. Therefore, I need to send it separately.

If there is more time, there is a series from Theo that is ready
to go, and, if possible, I can also queue up a last-minute patch
from Mukesh.

From the next release I will also rebase the i2c-host on top of
the latest RC.

Thanks,
Andi

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.9

for you to fetch changes up to 06d0cb6c824c7df736e66060b8c63b0100259d3f:

  i2c: sprd: Convert to platform remove callback returning void (2024-03-08 08:02:47 +0100)

----------------------------------------------------------------
The i801 and designware drivers received most of the changes,
including refactorings and some additions.

Recovery changes for the iMX and iMX-LPI2C are now utilizing the
generic i2c support.

The Cadence driver now supports system suspend and resume.

The hisi, mpc, sh_mobile, and npcm drivers have undergone some
cleanups and improvements. Meanwhile, Uwe continues his work on
converting the "remove" callback to become a void function.

The pca954x mux driver now supports additional configurations,
such as isolating faulty channels and flushing stuck buses, among
others.

Support has been added for Renesas r8a779h0, i.MX95 LPI2C, and
Microchip sam9x7. Meanwhile, Geert lays the groundwork for the
upcoming rcar Gen4.

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx-lpi2c: add generic GPIO recovery for LPI2C

Devyn Liu (2):
      i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth - 1
      i2c: hisi: Add clearing tx aempty interrupt operation

Esben Haabendal (1):
      i2c: imx: move to generic GPIO recovery

Geert Uytterhoeven (3):
      i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to new frequency calculation
      dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
      i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4

Heiner Kallweit (7):
      i2c: i801: Replace magic value with constant in dmi_check_onboard_devices
      i2c: i801: Remove unused argument from tco functions
      i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
      i2c: i801: Add helper i801_check_and_clear_pec_error
      i2c: i801: Split i801_block_transaction
      i2c: i801: Add SMBUS_LEN_SENTINEL
      i2c: i801: Add helper i801_get_block_len

Jarkko Nikula (6):
      i2c: designware: Uniform initialization flow for polling mode
      i2c: designware: Do not enable interrupts shortly in polling mode
      i2c: designware: Use accessors to DW_IC_INTR_MASK register
      i2c: designware: Move interrupt handling functions before i2c_dw_xfer()
      i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
      i2c: designware: Implement generic polling mode code for Wangxun 10Gb NIC

Ji Sheng Teoh (1):
      i2c: cadence: Add system suspend and resume PM support

Patrick Rudolph (2):
      dt-bindings: i2c: pca954x: Add custom properties for MAX7357
      i2c: muxes: pca954x: Enable features on MAX7357

Peng Fan (1):
      dt-bindings: i2c: imx-lpi2c: add i.MX95 LPI2C

Rand Deeb (1):
      i2c: Remove redundant comparison in npcm_i2c_reg_slave

Uwe Kleine-König (1):
      i2c: sprd: Convert to platform remove callback returning void

Varshini Rajendran (1):
      dt-bindings: i2c: at91: Add sam9x7 compatible string

Wolfram Sang (3):
      dt-bindings: i2c: mpc: use proper binding for transfer timeouts
      i2c: mpc: use proper binding for transfer timeouts
      i2c: mpc: remove outdated macro

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |   4 +-
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |   1 +
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml           |   2 +-
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml   |  30 +++++
 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |   1 +
 drivers/i2c/busses/Kconfig                                   |   2 +-
 drivers/i2c/busses/i2c-cadence.c                             |  33 ++++++
 drivers/i2c/busses/i2c-designware-common.c                   |   2 +-
 drivers/i2c/busses/i2c-designware-core.h                     |  23 +++-
 drivers/i2c/busses/i2c-designware-master.c                   | 424 +++++++++++++++++++++++++++++++----------------------------------------
 drivers/i2c/busses/i2c-designware-pcidrv.c                   |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c                  |   2 +-
 drivers/i2c/busses/i2c-hisi.c                                |  13 ++-
 drivers/i2c/busses/i2c-i801.c                                | 224 +++++++++++++++++++------------------
 drivers/i2c/busses/i2c-imx-lpi2c.c                           |  27 +++++
 drivers/i2c/busses/i2c-imx.c                                 |  62 +----------
 drivers/i2c/busses/i2c-mpc.c                                 |  16 ++-
 drivers/i2c/busses/i2c-npcm7xx.c                             |   3 -
 drivers/i2c/busses/i2c-sh_mobile.c                           |  27 ++---
 drivers/i2c/busses/i2c-sprd.c                                |   6 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c                          |  43 +++++++-
 21 files changed, 501 insertions(+), 446 deletions(-)

