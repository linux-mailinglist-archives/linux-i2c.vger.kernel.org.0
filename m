Return-Path: <linux-i2c+bounces-9983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08034A6CD00
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 23:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8317C16EEAF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 22:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49A61E32C5;
	Sat, 22 Mar 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DO22zueR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96417BEB6;
	Sat, 22 Mar 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742683214; cv=none; b=DCDxnKdAYm9R+3+cicA1avT0KmZx8yV2SrV3lf4Cd9IewnW4iCYYZUld0Yr44rgt/bU+QfHYaKogPoPYLmodsvPd3GepOaLkkL21x5uFfvrZ4KkFxc30L92DtSad4GmgLRT7+NryoP2Qc+qLeas9XVgTAvniNR36RCxVDw9aoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742683214; c=relaxed/simple;
	bh=k0RMfzIK44lnIUZqkCOSsSj3l6l0m4YWwTIV4C2RYq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsMtbpvprk+2ancI3UxsFyGcqB96oEujO21N5QTFFC7t5N9TDfm/FEXJOUydhhhtrrBQ1TFvbdkmZnfv2ac+SpUdw/D+WS4x7DI20Qn6xIbR1ROKq8wbNWngiKZ1khXxvVO9lhzQhSjauQF+YAkJmkEW8JKoBmBktNkuQ4AJEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DO22zueR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B8DC4CEDD;
	Sat, 22 Mar 2025 22:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742683214;
	bh=k0RMfzIK44lnIUZqkCOSsSj3l6l0m4YWwTIV4C2RYq8=;
	h=Date:From:To:Cc:Subject:From;
	b=DO22zueRnS6QT9WBFkXGNpOEWC9ByDqcP9u9K5uJ6fs9GUGkeaZAw8m7C8TGWdM0E
	 fNg/VCIKEY9/bGg87a6RALdrl/xgYuXVQ89AuNmnI/qnpC7P/I9vV7s+A0kMveloBa
	 sw206w4cQBTFDufy/NOgd5ifkd3wbD70PqtSfOJAEaOYyKRI3J0AsodxSt/BLM+lcl
	 18uP+qLpRpW9p3z/QortACxi1JVxKbRgTpL3g6ufX08i33LqhJ9hXp/qSWQ01HsmQh
	 zYnus4O42nlGVfbfhpMcltpisidyYMqQLpxEmQ6r+wvf+GbzZVHLA1w/bmWJTF7yWM
	 I9cc5ov7BJ+CQ==
Date: Sat, 22 Mar 2025 23:40:09 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc8
Message-ID: <Z988SQUTmI1q7TlO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2hUaXQj6WLFQGRoV"
Content-Disposition: inline


--2hUaXQj6WLFQGRoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc8

for you to fetch changes up to 807d47a6dc054859eef90066516ae4f44fe22e6d:

  Merge tag 'i2c-host-fixes-6.14-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-03-21 16:18:59 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc8

amd-mp2 driver: fix double free of irq

----------------------------------------------------------------
Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.14-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

Yang Yingliang (1):
      i2c: amd-mp2: drop free_irq() of devm_request_irq() allocated irq

 drivers/i2c/busses/i2c-amd-mp2-pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--2hUaXQj6WLFQGRoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmffPEkACgkQFA3kzBSg
KbZwFA//TZ6NwH1KUwXmhhyjmORYTqmf29BNtB1jLpN0UjI85NDyNV4UOko4yUUd
mwQPaC0q7STrrQBhwwPbYe3uOeTWXxMh0Vg8yu8cdM6C0KxcFKtQHFwHmPLpRQAO
4Sx/JlBpP1zYIwgdm/nxEoygfRC8W7MrvvgFIltVJHn2IzQJfNXyfS1/gREzDoNk
KmgIQlTm1L2uFLWywIAG4txj4jr33cVT7FieCJ8V4UEEciT1QHs9747LEdYSjUkU
2napRttSgZX9gNu3TXNg8iqT7Eex79uLoWcJcrfCdJO/w+ol8Z4aZ0zlyOdHkEOz
8a/ICHwLTndx6VbXsVmmeZjrf8zi2StgN4kW1NmxTvhA13IXoost38DRZ/3/bnTr
BHKRhME+5VuHSUpep4DMWTQZBcR90tSIghQecRgO1OPGBj92L4aPLgj32w2rGWBk
jgwetpqRqJSzChaybVlq+lLeTFKaxrudSrlFWfvwKB4KLpbRsVFA0KZ9Uejj5/8r
3aC3XxakH8BF4eXNZ3Bks8mOlk6qrQ2IPw7xibx4vjl304LCeCx+VNzrSQOQ8Fv5
29DyibLu6bOOPa4xZrTkmEmCkmOP67FohO/qlpe9BTntdvrByWo8zK6IZv8iohPB
WV3ks/s7EKrGq5BmiACxJBbh7xkiJ89r6njdM7uMYxTVD4UNZ64=
=4AT/
-----END PGP SIGNATURE-----

--2hUaXQj6WLFQGRoV--

