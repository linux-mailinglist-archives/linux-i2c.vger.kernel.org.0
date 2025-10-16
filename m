Return-Path: <linux-i2c+bounces-13598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFBBE5183
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 20:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30F6585B8A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 18:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4864438B;
	Thu, 16 Oct 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/UfTuCd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7023B0;
	Thu, 16 Oct 2025 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640412; cv=none; b=IPxfK5vH24ccoIquKQUSKkwpkNCtvDSOHE6PVbWqZBPtXVKuPJEv4lSQy5QeW+UYx74N6+AE0KWyJMzQ0eh6yoRS1282r5R+OFWQzUHlEVbdMa3iH5vG5JD28v7HWIbxSHWiZw51n2q26aRkpz7oskTVqY/+2vaB+qPcrKK7BNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640412; c=relaxed/simple;
	bh=qDzzpz+D81109iN3gsUt14yKT7nLdRIlLTMOeTWGeuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzwXXvYra8Gkc/obxpY/25dQYiCSwZv3T5BFhsbkgazgc6zlFKqqpkMQ5WDWJDmvdNPUB4DxgLRcsmXgcGIGiOZJaByzw2mtJy+R3pU2rClfc+6gpMFcc61Ynb1POLC2vkWLEF5rj1h1Bbh1LQl4hrVSmQikgYxMXg8tvT4pKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/UfTuCd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B463C4CEF1;
	Thu, 16 Oct 2025 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760640411;
	bh=qDzzpz+D81109iN3gsUt14yKT7nLdRIlLTMOeTWGeuI=;
	h=Date:From:To:Cc:Subject:From;
	b=A/UfTuCdcovuBH70kpJvAZxpDmxHX8lzJp0yIkzFJbMnikwu9WdVHYVHYxqMvany5
	 fyW/v4YwAGF2EPciVBJX3LlEMNQWrbyMl/5kFakdYwgRh6r6hiI4aRhbff3KP+VkEu
	 iRvh+7D+6hFkj4S6Y1GfGby1DcU3q4X+KRX76TikX2V0uONbzjOG1pp6UXCcZAbYyQ
	 GXDuTN3WYpSK9DT0323BrlIjWKtYvcYuT20B2hvdC+U3r8D34pXVZh5n0H+/r9dzZg
	 OoKH9LOUNrPAHwtPc099kSYIvJsYTR5tuS7hcEFJzLwko6BNnm8C72FZ35n+4KBAwJ
	 3nn2yIDqx7FCQ==
Date: Thu, 16 Oct 2025 20:46:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.18-rc2
Message-ID: <aPE9mCH-Mkz_RvV8@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+cYNYDDuv4qMlxir"
Content-Disposition: inline


--+cYNYDDuv4qMlxir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc2

for you to fetch changes up to 867537094124b0736ca2a40193de94fc5dc0b8d3:

  dt-bindings: i2c: Convert apm,xgene-slimpro-i2c to DT schema (2025-10-14 13:59:20 +0200)

----------------------------------------------------------------
i2c-for-6.18-rc2

- subsystem: PM cleanup after all prerequisites are merged with rc1
- usbio: missing addition after all dependencies are in
- slimpro: DT binding schema conversion

----------------------------------------------------------------
Hans de Goede (1):
      i2c: usbio: Add ACPI device-id for MTL-CVF devices

Rob Herring (Arm) (1):
      dt-bindings: i2c: Convert apm,xgene-slimpro-i2c to DT schema

Sakari Ailus (1):
      i2c: Remove redundant pm_runtime_mark_last_busy() calls

 .../bindings/i2c/apm,xgene-slimpro-i2c.yaml        | 36 ++++++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-xgene-slimpro.txt  | 15 ---------
 drivers/i2c/busses/i2c-amd-mp2.h                   |  1 -
 drivers/i2c/busses/i2c-at91-core.c                 |  1 -
 drivers/i2c/busses/i2c-at91-master.c               |  1 -
 drivers/i2c/busses/i2c-cadence.c                   |  1 -
 drivers/i2c/busses/i2c-davinci.c                   |  2 --
 drivers/i2c/busses/i2c-designware-master.c         |  1 -
 drivers/i2c/busses/i2c-hix5hd2.c                   |  1 -
 drivers/i2c/busses/i2c-i801.c                      |  1 -
 drivers/i2c/busses/i2c-img-scb.c                   |  3 --
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  4 ---
 drivers/i2c/busses/i2c-imx.c                       |  3 --
 drivers/i2c/busses/i2c-mv64xxx.c                   |  1 -
 drivers/i2c/busses/i2c-nvidia-gpu.c                |  1 -
 drivers/i2c/busses/i2c-omap.c                      |  3 --
 drivers/i2c/busses/i2c-qcom-cci.c                  |  2 --
 drivers/i2c/busses/i2c-qcom-geni.c                 |  1 -
 drivers/i2c/busses/i2c-qup.c                       |  3 --
 drivers/i2c/busses/i2c-riic.c                      |  2 --
 drivers/i2c/busses/i2c-rzv2m.c                     |  1 -
 drivers/i2c/busses/i2c-sprd.c                      |  2 --
 drivers/i2c/busses/i2c-stm32f7.c                   |  5 ---
 drivers/i2c/busses/i2c-usbio.c                     |  1 +
 drivers/i2c/busses/i2c-xiic.c                      |  1 -
 25 files changed, 37 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apm,xgene-slimpro-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-xgene-slimpro.txt

--+cYNYDDuv4qMlxir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjxPZcACgkQFA3kzBSg
KbYQiw//d7zTGIw3zF+hGtBr5Nu+OXU1W4iz+oHZ1K4kDRnPqHq51QHejV3PnTnG
wVMwYGgvcU5hYF64iFS/tzvD7/PGJnKZO6mGEyjGiIVCwKVI6bO05b7xhq9WLG7B
H+Dw0o4XpxonUMRElvn4YAizzRYIxxfP87zrZeqqfQLktKvbwiac8d2u14p+7LYk
c89wmL18Z3bYIm3wQcvx3e+7T3SQ4219IQ6EzIw6Wn/HFwrGivYiPc0lARTHEbVG
vc1sORn562/9bflOZDvjCTsFdr7MsB+jr1VNIZG0LjwEPSrBahDNwZcM2K4vaaG4
+c4RqhTmbleVfVtD1nzV+WbD7EpZ4aYykWTmT4y86H19anF4pyGzVerJFT90uPwZ
/xKiyRKkwL1pGqfhDfk06w4s0lu1fbHvH2oV06AzxaHsdmchruNRaMFwmshTTmfW
fGgh0ev8fPtqdxcCtkqzGLnHMl0B4CINk0+JafYNeyHuZdq2tdOlZ++PjMlxfnIQ
vFK8qS5XdIVCV935O3wE8tF5uM62oDwxKBKubHezohf8yo3tvekFjHfzSAktLI9G
K22I4Yf1zIaaQExrg7omUEZEK1VKQPH+OALVtVB/1M7ftyn+2WfOyh8OwpZRZKrd
CnZqNrYXBej2dpT90okbTwQlLNeBN6ayDgOsIrjSHe1jhmhnN+8=
=Vm6g
-----END PGP SIGNATURE-----

--+cYNYDDuv4qMlxir--

