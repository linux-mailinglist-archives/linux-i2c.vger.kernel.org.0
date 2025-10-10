Return-Path: <linux-i2c+bounces-13440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1CBCC1F8
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 10:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C4D401CCA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4742F25BF1B;
	Fri, 10 Oct 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjxPeAKQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017E525A623;
	Fri, 10 Oct 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084806; cv=none; b=ca9YvZ2ikcf/+wyRTM5LFIiYNUJ3XCml5yFjdVMaUo+F+UqDWw72tfqH7DZ4kUPMjDhNvWmAcz0cQANOlSsDJt3vKJK+UsQfKVF8uCPTzTnv/3/KAN1gft09nx5RVasxjHy/utjwZYxueojBajXB2cmvygq7o1F7PmR9/kF7ux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084806; c=relaxed/simple;
	bh=kZTjlORNPDtQ5iJrdukH1ySdKZgofEiyLr4PvIYuPTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ImKSa2Y7i99oBv0S44xZ8q3aFam7AtYFArfLQHxDeDoe/ftNc5GmTRKukRNDk4z05ZOZeEeBPOpECMVuMeVm0E1bB78mXds9q3WOgQIQh5deUA7tWGvzpG+GrK3HisQdAy1kY8RkQLn81wZmKSDM57x6iJHTp8qWYlTieQsO/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjxPeAKQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6B4C4CEF8;
	Fri, 10 Oct 2025 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760084805;
	bh=kZTjlORNPDtQ5iJrdukH1ySdKZgofEiyLr4PvIYuPTc=;
	h=Date:From:To:Cc:Subject:From;
	b=mjxPeAKQ3hnZHYMVpUG3e1h/Y97PfFULAk6ccuSDJlQuhIQlcgtdZ/0CzpTSnJh0m
	 TYxJK2yAiOLEzNe6XsdVXosbH1lMwLpd7uosh1CERGFFNQIsEqQpxdUB3V+LCVe7lC
	 3bYbThwDV5WmDiQXkJxQYdPjnEXvPQudayHVrI99M8V+fWdpICCd+gVwQirXgs5mAn
	 H8DPvEOmZdlMHxaXHlXwmQZq6hZsxnnXcE+l/4Ok7Sctb4z0PGp02F6U8+/7CZ7umv
	 Kb71HuoK/8+/HJCibQy8n4o/4Za5I5G5RkNlnxroNFwwGV3gqh2ZlRYA6tdIs7noOb
	 uHcf76FvhQM8Q==
Date: Fri, 10 Oct 2025 10:26:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.18-rc1-part2
Message-ID: <aOjDQhhcanB_Vgbh@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BLbc6UWlg+rUR8Vl"
Content-Disposition: inline


--BLbc6UWlg+rUR8Vl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cbf33b8e0b360f667b17106c15d9e2aac77a76a1:

  Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf (2025-10-03 19:38:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-part2

for you to fetch changes up to eb4faf6343889fcd7edba3deeae49fc5a06531fd:

  dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema (2025-10-09 13:20:57 +0200)

----------------------------------------------------------------
i2c-for-6.18-rc1-part2

- Second part of rtl9300 updates since dependencies are in now
  - general cleanups, implemented block read/write support, added RTL9310 support
- DT schema conversion of hix5hd2 binding
- namespace cleanup for i2c-algo-pca
- minor simplification for mt65xx

----------------------------------------------------------------
Byungchul Park (1):
      i2c: rename wait_for_completion callback to wait_for_completion_cb

Harshal Gohel (1):
      i2c: rtl9300: Implement I2C block read and write

Jonas Jelonek (9):
      i2c: rtl9300: use regmap fields and API for registers
      dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
      i2c: rtl9300: rename internal sda_pin to sda_num
      i2c: rtl9300: move setting SCL frequency to config_io
      i2c: rtl9300: do not set read mode on every transfer
      i2c: rtl9300: separate xfer configuration and execution
      i2c: rtl9300: use scoped guard instead of explicit lock/unlock
      dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
      i2c: rtl9300: add support for RTL9310 I2C controller

Kael D'Alcamo (1):
      dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema

Wolfram Sang (2):
      Merge tag 'i2c-host-6.18-pt2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow
      i2c: mt65xx: convert set_speed function to void


with much appreciated quality assurance from
----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      (Rev.) i2c: mt65xx: convert set_speed function to void

Chris Packham (18):
      (Rev.) i2c: rtl9300: add support for RTL9310 I2C controller
      (Rev.) dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
      (Rev.) i2c: rtl9300: use scoped guard instead of explicit lock/unlock
      (Test) i2c: rtl9300: use scoped guard instead of explicit lock/unlock
      (Rev.) i2c: rtl9300: separate xfer configuration and execution
      (Test) i2c: rtl9300: separate xfer configuration and execution
      (Rev.) i2c: rtl9300: do not set read mode on every transfer
      (Test) i2c: rtl9300: do not set read mode on every transfer
      (Rev.) i2c: rtl9300: move setting SCL frequency to config_io
      (Test) i2c: rtl9300: move setting SCL frequency to config_io
      (Rev.) i2c: rtl9300: rename internal sda_pin to sda_num
      (Test) i2c: rtl9300: rename internal sda_pin to sda_num
      (Rev.) dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
      (Test) dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
      (Rev.) i2c: rtl9300: use regmap fields and API for registers
      (Test) i2c: rtl9300: use regmap fields and API for registers
      (Rev.) i2c: rtl9300: Implement I2C block read and write
      (Test) i2c: rtl9300: Implement I2C block read and write

Jonas Jelonek (2):
      (Rev.) i2c: rtl9300: Implement I2C block read and write
      (Test) i2c: rtl9300: Implement I2C block read and write

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema

Markus Stockhausen (9):
      (Test) i2c: rtl9300: add support for RTL9310 I2C controller
      (Test) dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
      (Test) i2c: rtl9300: use scoped guard instead of explicit lock/unlock
      (Test) i2c: rtl9300: separate xfer configuration and execution
      (Test) i2c: rtl9300: do not set read mode on every transfer
      (Test) i2c: rtl9300: move setting SCL frequency to config_io
      (Test) i2c: rtl9300: rename internal sda_pin to sda_num
      (Test) dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
      (Test) i2c: rtl9300: use regmap fields and API for registers

Rob Herring (Arm) (2):
      (Rev.) dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
      (Rev.) dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos

Sven Eckelmann (6):
      (Test) i2c: rtl9300: add support for RTL9310 I2C controller
      (Test) i2c: rtl9300: separate xfer configuration and execution
      (Test) i2c: rtl9300: do not set read mode on every transfer
      (Test) i2c: rtl9300: move setting SCL frequency to config_io
      (Test) i2c: rtl9300: rename internal sda_pin to sda_num
      (Test) i2c: rtl9300: use regmap fields and API for registers

 .../bindings/i2c/hisilicon,hix5hd2-i2c.yaml        |  51 +++
 .../devicetree/bindings/i2c/i2c-hix5hd2.txt        |  24 --
 .../bindings/i2c/realtek,rtl9301-i2c.yaml          |  45 +-
 drivers/i2c/algos/i2c-algo-pca.c                   |   2 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  11 +-
 drivers/i2c/busses/i2c-pca-isa.c                   |   2 +-
 drivers/i2c/busses/i2c-pca-platform.c              |   2 +-
 drivers/i2c/busses/i2c-rtl9300.c                   | 459 +++++++++++++--------
 include/linux/i2c-algo-pca.h                       |   2 +-
 9 files changed, 386 insertions(+), 212 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt

--BLbc6UWlg+rUR8Vl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjow0IACgkQFA3kzBSg
Kba1KBAArLzjrU9OprjmQgyHZ/X4/shMbV07v3G4RxBMDhklDX81QAEK5RlPSQyb
J0fH9IVxQ9sYS4FTsFSq4+CyLwkXLq3AEXIDY1RPzbSnNj7tbtCRykYxpZt4N7sL
mGiaDeCYoUOjw9X9rPhRbVGErjOccJZLU+3cMlZ5kc8NT4j5+SM1Lc8GLHZ2dsAU
2C5gfABjnRTQl+R0wshLBr2Zqus3CP/9K0Y7RXJ1bs8yiWXys/hlHHXMPT5MpeqQ
KCorkmPKAIq9+EByZGGCioHvzF3UXAp/whLYa1IwJz1j6+vgH2FAMs0c6zF1fIrb
0QY7vgH3OOzJ9TM1gEcxsmdgfB8VgOdJZNPYv6IE5y0DqneH0rSj17SNjsIHJVp7
/H5gI9yQ4jzOQvgdyZ0EZlLrP30KvH5AIZszN+9SIw/5MqcxUpWhipTZdNLqQFos
XKon9KUj7+jKW/b/87aJt96mteugp2aypn/W7PG4gU1qyu2PiDqxoDrtjYfeue9K
TEdC49VdhnXhR8KcO0ZLfkoyKqjKDfwClDkn3usgCBTTTGxxfxTdon7EUzX7iHYT
8yfGXj2500D0+PXu3Zkyg4u4CAJox+EVtgCGKypivS1O1quQiDgZVypGyQuNHOXB
wsmQZQAaMj1UkCZnmWc6q21J5+FG9L27yx+Eq4zouBJTs2dpgWk=
=W5K+
-----END PGP SIGNATURE-----

--BLbc6UWlg+rUR8Vl--

