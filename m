Return-Path: <linux-i2c+bounces-12151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3CB1AA8F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 23:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4C2189CB04
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2FF22259E;
	Mon,  4 Aug 2025 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhVX7RrR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D96634;
	Mon,  4 Aug 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754344396; cv=none; b=JY19WJMP0P8uXWPh1I0suPRA1ZR6rn9bOGDgwaN03TBMLgw0O7LkDZCa2hf55MQ7IY1SlNdEV6nADaCD+1SZVUaoYN/e8vmRD1JLBGFBeXflbrVy3XipAzo1qhghxTsZ+8wZa/60jIYKrz4g8NjkpXuNTXQ8yh5OCnmdP319Cpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754344396; c=relaxed/simple;
	bh=DqQc52n1vg12mNdpcx30L6XUIeLteBpaJofEOQYBDuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPu7RjLu5hLP5rX8T+PkmQFoBb/PFhqlpGLnS8q8W5GrdObVk66+7XAMGssiMfxTh7Zgt8gwlflrEVLoDOY4w8Grp7OWhYZAfEoEnfiApzIUkeOhCLfnHk8+Eru5wJhaqqgqhpgSaMGsgpfOQxDIvmxBuEQ8JRUFQe6nbhzj8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhVX7RrR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BDDC4CEF7;
	Mon,  4 Aug 2025 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754344395;
	bh=DqQc52n1vg12mNdpcx30L6XUIeLteBpaJofEOQYBDuo=;
	h=Date:From:To:Cc:Subject:From;
	b=bhVX7RrR4SPuL3stL7G94KLhdYbnjBjosKFkrRDmPXlZMyj+uyMNccvFp5mLl4ZEi
	 yoYMFBFrikcdocVvwKvFGonZ0cN1PsEVjL4QW11xCkvBRQN1rD1u8iiUKsbweoNSyO
	 +kZy4QrmlveOwS67ZvnDZVNOBuKFKUm17Wb5Wobu9/JjVbD0ETvHwlWusy20KhPixA
	 LO5kbbefPW5TdyGRPxEwl9t/mcyTi6o+lzi6R0jyQsEt6GdEz0SyZYJNNYuCWrz5Eh
	 zBAi5TxbOGuYLldPN43My9DgcGsoUl8Bm9N7KqBrGwt+wOuYylcHYEAqQpWusvxa6y
	 3OVSY3FAK1xVg==
Date: Mon, 4 Aug 2025 23:53:12 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.17-rc1-part2
Message-ID: <aJEryLi_zEByKKd0@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jJLZI14B3zJ4wR5a"
Content-Disposition: inline


--jJLZI14B3zJ4wR5a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

a few more patches from I2C. Some are fixes which would be nice to have
in rc1 already, some patches have nearly been fallen through the cracks,
some just needed a bit more testing.

Please pull.

   Wolfram


The following changes since commit 186f3edfdd41f2ae87fc40a9ccba52a3bf930994:

  Merge tag 'pinctrl-v6.17-1' of git://git.kernel.org/pub/scm/linux/kernel/=
git/linusw/linux-pinctrl (2025-08-02 12:07:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.17-rc1-part2

for you to fetch changes up to 33ac5155891cab165c93b51b0e22e153eacc2ee7:

  i2c: muxes: mule: Fix an error handling path in mule_i2c_mux_probe() (202=
5-08-03 22:47:57 +0200)

----------------------------------------------------------------
i2c-for-6.17-rc1-part2

- acpi: enable 100kHz workaround for DLL0945
- apple: add support for Apple A7=E2=80=93A11, T2 chips; Kconfig update
- mux: mule: fix error handling path
- qcom-geni: fix controller frequency mapping
- stm32f7: add DMA-safe transfer support
- tegra: use controller reset if device reset is missing
- tegra: remove unnecessary dma_sync*() calls

----------------------------------------------------------------
Akhil R (2):
      i2c: tegra: Use internal reset when reset property is not available
      i2c: tegra: Remove dma_sync_*() calls

Christophe JAILLET (1):
      i2c: muxes: mule: Fix an error handling path in mule_i2c_mux_probe()

Cl=C3=A9ment Le Goffic (1):
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

Kathiravan Thirumoorthy (1):
      i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates

Nick Chan (1):
      dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compatibles

Sven Peter (1):
      i2c: apple: Drop default ARCH_APPLE in Kconfig

Wolfram Sang (1):
      Merge tag 'i2c-host-6.17-pt2' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/andi.shyti/linux into i2c/for-mergewindow

fangzhong.zhou (1):
      i2c: Force DLL0945 touchpad i2c freq to 100khz


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: tegra: Remove dma_sync_*() calls
      (Rev.) i2c: tegra: Use internal reset when reset property is not avai=
lable

Mukesh Kumar Savaliya (1):
      (Rev.) i2c: qcom-geni: fix I2C frequency table to achieve accurate bu=
s rates

Sven Peter (1):
      (Rev.) dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compati=
bles

Thierry Reding (1):
      (Rev.) i2c: tegra: Remove dma_sync_*() calls

 .../devicetree/bindings/i2c/apple,i2c.yaml         |  5 ++
 drivers/i2c/busses/Kconfig                         |  1 -
 drivers/i2c/busses/i2c-qcom-geni.c                 |  6 +-
 drivers/i2c/busses/i2c-stm32f7.c                   | 32 +++++++----
 drivers/i2c/busses/i2c-tegra.c                     | 64 +++++++++++++++---=
----
 drivers/i2c/i2c-core-acpi.c                        |  1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   |  3 +-
 7 files changed, 75 insertions(+), 37 deletions(-)

--jJLZI14B3zJ4wR5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiRK8gACgkQFA3kzBSg
KbZj4RAAsIwyTKszhDH16MLwwloFNtbwG3t1xzGk5NXTLWl9WqlT7q5WOJxWoPyU
vnpgiE7RKZcy1o4nqFzn+12sn+gZ3ZWcBAI1oKu4CK2/X6wQcGXsjOQ0Pm8EvjUj
+ptmeMrhdpGuaZa5WvA0xUa0QD5OdrMG9y4T0jCXUDELoSTbx6OepLWWLjShNWPO
7c3YyUE6r85GGCnnHfIZi2Uq2kgJPIQX0wCIUQ7JeSMnvZ/5AHLcvqVSJqhxXKH1
SRl1uar/w7ithy7yWsI7ZhdiHRH3zmTtzUidVbCcn0emEsbRkWtfidOEj4t37lua
RLsh5acJFbG9Wd2mZ+mROPHlrsEba9z0k3Xoz/o9+d0spnGpK5/Q26iKKfWGehzD
9W/3n/UTPX2Az0smibMmRVflYCZjZPjOKrCWfD1pEi4lKqtq4GWDwUWnY17A8Vf7
EuOSgeKDwsf7Xve5h/qx5VORtuK0HpK7x1lJu0E/KgvI/IAxXfo2VNOKdDP7SFEZ
/jwBRrSIyu9hJRdPpIi3cf+1Sv/lF9ptATBJDSV7avfDZ6DWw2XYTqv5oGHbxjGt
dRFSKLyj+2jhtXSQa3nZxxFsTEG6yNsjfhi2qhhllj9KQvPZhfoz7lL1sbo0WCXG
fvLr6OwMCKm1vwUjzsiJKoB5iOkST9NvkhYAY+9BJm985MLtS5s=
=PZVd
-----END PGP SIGNATURE-----

--jJLZI14B3zJ4wR5a--

