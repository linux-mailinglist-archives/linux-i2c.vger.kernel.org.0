Return-Path: <linux-i2c+bounces-8277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A69DF5C0
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Dec 2024 14:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2E1162F69
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Dec 2024 13:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486451CB505;
	Sun,  1 Dec 2024 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4GOAVMp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD31CB507;
	Sun,  1 Dec 2024 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733058816; cv=none; b=nHsdw3oZFJ5OwuIZerd64/Hg6XzL6gDxpcykx5BUWXRmaVq68t7lVeici84Elrkld9wHH4UwPpMhZHHIe0nGDDcxJAZb+lRMsxgJD517cjIuJyPYV+/1WcFO4SeynEedA9mTxiZESI9PJGJ3RKLWs9y4FoPhIvF30/puXwOqxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733058816; c=relaxed/simple;
	bh=TV3OWw6PnaSi79vN5C5jq4rek5728H681ST6MubeH+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQk/FjZPDiFhDTeO2h/T+bln4wlEpJfR1KgbBu+MbWtFtfff4UZRravs01KwtvA3DgF4TN/wnf4ltMuf+RuO0pdxOWJBQOiyLfKkL+G72r3aMeLjQKl6C+X9tgZQ33FuKmAwYI+b+pystaCp+tJtlY/sn9Wm2Bggw7OyPLRq4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4GOAVMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87022C4CECF;
	Sun,  1 Dec 2024 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733058815;
	bh=TV3OWw6PnaSi79vN5C5jq4rek5728H681ST6MubeH+I=;
	h=Date:From:To:Cc:Subject:From;
	b=e4GOAVMpLpHPiF/xBklqusrqgdl4ReS5Q/b+D/PgBhnviOyDXrN1T3qXzYM719JWb
	 YDwmy2KOV7o5/IhKf3JLM1pfD97YK4+6L4TNl06DQezGeGtNgY2/JXDikUTKthTOtg
	 RTrUAnBPs+SoE6s7XHzpIt5/XpNWaJcUDfLOzItNH0lXGhLw/hINxNXiqxpluKCbPc
	 iTUcIYikUFrAaGg7OZkV7sbXrxECvapHgHD3PloBMK5xdLXMxye42zzr+Oj9/zhYBH
	 zlYsBhnsDc0X2WHXgS524GNRpXYbiISj402pK7Rxq2Kk2tXgG2khhQWWIayDyj7iL4
	 QEuJcd1zp7kew==
Date: Sun, 1 Dec 2024 14:13:32 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-rc1-part3
Message-ID: <Z0xg_JliD3EJmNtt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1HKa28Cze5WOfw6w"
Content-Disposition: inline


--1HKa28Cze5WOfw6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

so it happened not only to Andi but also to me that a series nearly fell
through the cracks. This pull request contains a new feature which has
been ready for some weeks but I forgot that we agreed that I2C is its
path upstream :(

So, given the amount of review by experienced people and the fact that
the series only adds "opt-in" stuff (so less likely to cause
regressions), I hope it is still possible to get it into 6.13. It has
been in -next for a few days and build bots are happy now.

Thanks and regards,

   Wolfram


The following changes since commit aaf20f870da056752f6386693cc0d8e25421ef35:

  Merge tag 'rpmsg-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux (2024-11-26 18:36:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc1-part3

for you to fetch changes up to caf4bdb558cbc9893524b0a15e6423ee6305cb0c:

  MAINTAINERS: fix typo in I2C OF COMPONENT PROBER (2024-11-29 12:56:05 +0100)

----------------------------------------------------------------
i2c-for-6.13-rc1-part3

core: add of based component probing

Some devices are designed and manufactured with some components having
multiple drop-in replacement options. These components are often
connected to the mainboard via ribbon cables, having the same signals
and pin assignments across all options. These may include the display
panel and touchscreen on laptops and tablets, and the trackpad on
laptops. Sometimes which component option is used in a particular device
can be detected by some firmware provided identifier, other times that
information is not available, and the kernel has to try to probe each
device.

Instead of a delicate dance between drivers and device tree quirks, this
change introduces a simple I2C component probe function. For a given
class of devices on the same I2C bus, it will go through all of them,
doing a simple I2C read transfer and see which one of them responds. It
will then enable the device that responds.

----------------------------------------------------------------
Chen-Yu Tsai (8):
      of: dynamic: Add of_changeset_update_prop_string
      of: base: Add for_each_child_of_node_with_prefix()
      i2c: Introduce OF component probe function
      i2c: of-prober: Add simple helpers for regulator support
      i2c: of-prober: Add GPIO support to simple helpers
      platform/chrome: Introduce device tree hardware prober
      arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
      of: base: Document prefix argument for of_get_next_child_with_prefix()

Liam Zuiderhoek (1):
      i2c: Fix whitespace style issue

Lukas Bulwahn (1):
      MAINTAINERS: fix typo in I2C OF COMPONENT PROBER


with much appreciated quality assurance from
----------------------------------------------------------------
Andrey Skvortsov (1):
      (Test) i2c: of-prober: Add GPIO support to simple helpers

Andy Shevchenko (3):
      (Rev.) i2c: of-prober: Add GPIO support to simple helpers
      (Rev.) i2c: of-prober: Add simple helpers for regulator support
      (Rev.) i2c: Introduce OF component probe function

AngeloGioacchino Del Regno (7):
      (Rev.) arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
      (Rev.) platform/chrome: Introduce device tree hardware prober
      (Rev.) i2c: of-prober: Add GPIO support to simple helpers
      (Rev.) i2c: of-prober: Add simple helpers for regulator support
      (Rev.) i2c: Introduce OF component probe function
      (Rev.) of: base: Add for_each_child_of_node_with_prefix()
      (Rev.) of: dynamic: Add of_changeset_update_prop_string

Douglas Anderson (5):
      (Rev.) arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
      (Rev.) platform/chrome: Introduce device tree hardware prober
      (Rev.) i2c: of-prober: Add GPIO support to simple helpers
      (Rev.) i2c: of-prober: Add simple helpers for regulator support
      (Rev.) i2c: Introduce OF component probe function

Rob Herring (Arm) (2):
      (Rev.) of: base: Add for_each_child_of_node_with_prefix()
      (Rev.) of: dynamic: Add of_changeset_update_prop_string

 MAINTAINERS                                       |   8 +
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi |  14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |   4 +-
 drivers/i2c/Makefile                              |   1 +
 drivers/i2c/i2c-core-of-prober.c                  | 415 ++++++++++++++++++++++
 drivers/i2c/i2c-core-smbus.c                      |   2 +-
 drivers/of/base.c                                 |  36 ++
 drivers/of/dynamic.c                              |  44 +++
 drivers/platform/chrome/Kconfig                   |  11 +
 drivers/platform/chrome/Makefile                  |   1 +
 drivers/platform/chrome/chromeos_of_hw_prober.c   | 154 ++++++++
 include/linux/i2c-of-prober.h                     | 140 ++++++++
 include/linux/of.h                                |  13 +
 13 files changed, 840 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

--1HKa28Cze5WOfw6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdMYPcACgkQFA3kzBSg
Kbbgfg/8CtGUoKvcg4Rj/TSty9ajgcq7S7OoCpZQ4QGWGRf44iK3TbGPsdpBTCkt
pf4Hr+7DEAXdN12BzlTfbDx/QijclgrzMtll8nIKwqywsiZDpNQ6vWmqbrVegTOK
HOUPVhLZx3HXHxpLUScT0zQtKoHou03U3MoxRcwvBIablxgzlYRH9wM4wAdwjrui
Tpd6ny67NPtPpkS3kKNUk6nVYOZGawfGtvupCRAqV6Hn0WwD+ubUI4QZa8XvXKpf
KpOjnsHg12ozyWyM9GNOe0lEPqauO/OPO1kYrPIkyMrMAOF+J42bPqZtpOS5wVpQ
YsGwdRHvHBCWE/hUnf4tWz3dUIezyKSh9Qi2kvBVeVp9dHNtnobspNi4MlfyAh7u
sZf/J9PCx2rP8oxAvH5Db/piH3gLUkBrgQ7LOAxdUjMlLOKh876Cyyk6VnqUEUkr
OmIPkeSQPJMsr1x285P9/EVpzJNahMWfAFah21BNmndafJRhNf85jYl1semXC2i7
PHGw3UZ5RpyqA14vW3CdNxT0midcaJ85L+OMhgsh2ozeyXhyWyiGVlndXP++y0uJ
zeIlt/Miw0UTzNzMcFg3Qtjt9Mn2dB6YB/2m6P3MYlcElEJYPP/ycdU9alu1kfYQ
pSaSCPBxPliUaBSB3eMcmufg8SmQvwiFSuGQukWf4jkSZJF1mMI=
=lMyG
-----END PGP SIGNATURE-----

--1HKa28Cze5WOfw6w--

