Return-Path: <linux-i2c+bounces-11549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 140DEAE3012
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 15:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3916D3AFBB7
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Jun 2025 13:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091C31C84D3;
	Sun, 22 Jun 2025 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph263ev0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886279F5;
	Sun, 22 Jun 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750598437; cv=none; b=oM680pVurBu4vIAo+NGJoNBw5MdB25SBvOmDjK5x7Sq2BJB044+N675S0ejlfFUsW8Twe1oHFRwdJ+id7HSaeKfre7kGWQoGiM6oy1d/pc7hk+OIwGq9zQnp+eu0V0WmA2M5BAo6pESxUqKcyTH0ggH0j+jdQyqHb1CbXbnwnEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750598437; c=relaxed/simple;
	bh=Cn1n7b6pShVyFBv3SDRXx21S0jh5xAzkcYyVKt0Jndk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKdZacu+tDMqG1Y3NZWQNriTNvZLvawGwmsF+zkoLysNwWjEgx2AaJik+lQl+uJQ/FvpXnbT/c0UqfnQxy8FeDM8cU+GlzSZROMqLsXndmIMfl65mXFJt1GfFNeVsHAfP3lcbYa745yOvS+WS8Kp91OCFPBInmO6qQGyw+13+uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph263ev0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2CEC4CEE3;
	Sun, 22 Jun 2025 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750598437;
	bh=Cn1n7b6pShVyFBv3SDRXx21S0jh5xAzkcYyVKt0Jndk=;
	h=Date:From:To:Cc:Subject:From;
	b=ph263ev0NRT7TZyjwIdML8FlqZ2u78Tnjy4sNE9GmT1sSdvSCHUU/ctyNjpW59b1h
	 rsxOSsys2WAPOI2EBKB82G2k67QhCYQ1eUMc/H/wQ0pulV2X6wYbTV8tzuhjpHozuy
	 4pVieGojkBko6QhNKc4am+SLHTOU3bwfDvFW6aM9e9c45RUgcX4QPvNvMpkGKG/nAU
	 VQs8RuUE4RKaHGo54H4hQL8gQp9uy9qIwYnNlREonA8Y30zWOQuf+jxo1M0c6xsQzu
	 DhQ158rKvzBOgtocr50qhI/8gg69p43M/kfR7f0tEPpJFKpYVH/zPVE5J889tS5yyu
	 /0uw9bYt+kuCw==
Date: Sun, 22 Jun 2025 15:20:28 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc3
Message-ID: <aFgDHBHwY5ElWILx@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pCZzTLcJSLnQEWsb"
Content-Disposition: inline


--pCZzTLcJSLnQEWsb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc3

for you to fetch changes up to a6c23dac756b9541b33aa3bcd30f464df2879209:

  i2c: k1: check for transfer error (2025-06-21 22:17:02 +0200)

----------------------------------------------------------------
i2c-for-6.16-rc3

- subsystem: convert drivers to use recent callbacks of struct i2c_algorithm
  A typical after-rc1 cleanup, which I couldn't send in time for rc2
- tegra: fix YAML conversion of device tree bindings
- k1: re-add a check which got lost during upstreaming

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties

Alex Elder (1):
      i2c: k1: check for transfer error

Wolfram Sang (2):
      i2c: use inclusive callbacks in struct i2c_algorithm
      Merge tag 'i2c-host-fixes-6.16-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties

Troy Mitchell (1):
      (Rev.) i2c: k1: check for transfer error

 .../bindings/i2c/nvidia,tegra20-i2c.yaml           | 24 +++++++++++++++++++++-
 drivers/i2c/algos/i2c-algo-bit.c                   |  4 ++--
 drivers/i2c/algos/i2c-algo-pca.c                   |  4 ++--
 drivers/i2c/algos/i2c-algo-pcf.c                   |  4 ++--
 drivers/i2c/busses/i2c-amd-mp2-plat.c              |  2 +-
 drivers/i2c/busses/i2c-aspeed.c                    |  8 ++++----
 drivers/i2c/busses/i2c-at91-master.c               |  4 ++--
 drivers/i2c/busses/i2c-axxia.c                     |  2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  2 +-
 drivers/i2c/busses/i2c-cadence.c                   | 10 ++++-----
 drivers/i2c/busses/i2c-cgbc.c                      |  4 ++--
 drivers/i2c/busses/i2c-eg20t.c                     |  2 +-
 drivers/i2c/busses/i2c-emev2.c                     |  6 +++---
 drivers/i2c/busses/i2c-exynos5.c                   |  6 +++---
 drivers/i2c/busses/i2c-gxp.c                       |  6 +++---
 drivers/i2c/busses/i2c-img-scb.c                   |  2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c                 |  8 ++++----
 drivers/i2c/busses/i2c-imx.c                       |  8 ++++----
 drivers/i2c/busses/i2c-k1.c                        |  2 +-
 drivers/i2c/busses/i2c-keba.c                      |  2 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c             |  2 +-
 drivers/i2c/busses/i2c-meson.c                     |  4 ++--
 drivers/i2c/busses/i2c-microchip-corei2c.c         |  2 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  2 +-
 drivers/i2c/busses/i2c-mxs.c                       |  2 +-
 drivers/i2c/busses/i2c-nomadik.c                   |  4 ++--
 drivers/i2c/busses/i2c-npcm7xx.c                   |  6 +++---
 drivers/i2c/busses/i2c-omap.c                      |  6 +++---
 drivers/i2c/busses/i2c-pnx.c                       |  2 +-
 drivers/i2c/busses/i2c-pxa.c                       | 16 +++++++--------
 drivers/i2c/busses/i2c-qcom-cci.c                  |  4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c                 |  4 ++--
 drivers/i2c/busses/i2c-qup.c                       |  8 ++++----
 drivers/i2c/busses/i2c-rcar.c                      | 10 ++++-----
 drivers/i2c/busses/i2c-s3c2410.c                   |  6 +++---
 drivers/i2c/busses/i2c-sh7760.c                    |  4 ++--
 drivers/i2c/busses/i2c-sh_mobile.c                 |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c                   |  4 ++--
 drivers/i2c/busses/i2c-synquacer.c                 |  4 ++--
 drivers/i2c/busses/i2c-tegra.c                     |  6 +++---
 drivers/i2c/busses/i2c-xiic.c                      |  4 ++--
 drivers/i2c/busses/i2c-xlp9xx.c                    |  2 +-
 drivers/i2c/i2c-atr.c                              |  2 +-
 drivers/i2c/i2c-mux.c                              |  6 +++---
 drivers/i2c/muxes/i2c-demux-pinctrl.c              |  4 ++--
 45 files changed, 125 insertions(+), 103 deletions(-)

--pCZzTLcJSLnQEWsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhYAxwACgkQFA3kzBSg
KbbvMQ//ZaW8089u9TGQ9uqxHFipU7cRSqagTjj/SqE9pm4P6ddQhQ8S1DiisWwv
Lg5bNCbafAiYm0GcC3xU9sypzjRvwWVOGUO5HZwGdOLjfBWYZOs5g+AjWwI161on
EirbZXu/4ZtTc0DC0s0PycgB2BKYKcYQHeiBVpRdEtvBN27uJqgQXZKDziCUoWvx
rZvpoUz9HkkJ3wcATcqt1S3SettxRo36+qOuj8GKvRwnLZiJnUyf4LdKemdWheAC
ryFbWbeyFeR6joae0K9/rcyT3TPOSf3q2aE+KMnQ0REVafvGZOMqBmmwxTl5Ocs7
RZchENJJKVbjQBTOmDB+Oo7hot6FnEz3VWcajXH3C9tQHgZDHANj/ZnD/AtWualz
1UWRjJIjKstLHnM26uwrvka0esd8GuP3+Wmnt+dBuwuIIDdXKx4IRBvAq5SJGxYT
ELwTQzRdSpisKlhAGPMK7pAquwiYMEggoAtQ/rx9oWAoUbq5pTO1HL1SW6xS1rbv
OnL4tkzeEcD2E1OZ6ru6ZedEhxoe0+1a7RonFbciH9ENae/UhhuthOs0fW1uI0Vo
ZWyYyE2OE3G+/qYueQVkbUH4JRhBA3MVb3R9DmK90dLwFz/wwpIYbquRaZ0Y1SZI
/WY1HESzV6SsDXSGKvVgj5Uak1fZnq3YwATZqVTqgJdHtX+Ammg=
=dxDU
-----END PGP SIGNATURE-----

--pCZzTLcJSLnQEWsb--

