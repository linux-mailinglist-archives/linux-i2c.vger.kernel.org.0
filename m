Return-Path: <linux-i2c+bounces-1191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F907826151
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 20:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC912833E6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51EFF4E3;
	Sat,  6 Jan 2024 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8fvWK9N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795EDE573;
	Sat,  6 Jan 2024 19:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40576C433C8;
	Sat,  6 Jan 2024 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704570220;
	bh=w5t5XpW/nngDNipPSOxkYPvdtLU8/GNDYhVbg+hIgNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8fvWK9NR475MDYiINoTMc6v6xDYsTKawJ3XCWpsgn7jNzjNDx+UHVEiu83KHE64b
	 bgP0a6evlG9qRJOWCejEvDgDdlxNtm9hm7ex91VNT70eIwxo1Ddu9Jf2qNv9TVCKgs
	 yqd4n6DG8uiyZNigzhD7CtA1udaKQTCEOUiwb4serbEOC87UHL8qRpeYrLyovd2++0
	 W389xYU9ca4OerTBMhu3X/S6a1O9cppQ6rQttPwfWn+3lgXfCxnOJyKYz/D5T0jLzs
	 NNWakhDilCCHq2wg24voc+oarYXPF0Gmq4JNlXTLPA3umXPNEkRH+Rpj8Hzi8VxH2D
	 metld6kM13Xsg==
Date: Sat, 6 Jan 2024 20:43:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Message-ID: <ZZmtaboEzKOf1YLg@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <ZYBgB3J51hfGQSVX@smile.fi.intel.com>
 <ZYFvEn0/xxIhGnlT@shikoro>
 <10f00229-4cc0-4511-a39e-14e2c58ba98a@linux.intel.com>
 <ZZl4X0743xNXgetz@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMASnTbTTFlVgQZX"
Content-Disposition: inline
In-Reply-To: <ZZl4X0743xNXgetz@smile.fi.intel.com>


--ZMASnTbTTFlVgQZX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We have time to nail down it after rc1 is out, don't we?

Well, I think I can wait a week into the mergewindow until I send out my
pull request. So, you guys have a bit of time to work on this
regression. Sounds good?


--ZMASnTbTTFlVgQZX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWZrWQACgkQFA3kzBSg
KbbBIA//W+G96hIiZV5gKsINCXjDYQZTNYMRGwbn2mwoUghnZdoN5cK3Oczzr+c9
E1DbrLPPhZ+a5Rgoe7Xkf9912ehMk9jdJPloM8zQh1rouUxlJi/JCvM2kaC6yKUm
drp/C1DLEvyZHPGCbwBpcfD9to7+jF5WcSpZRKp3UuuXvVR5UV1pxM+OvYjjw/4e
oBZvkWmifMReFALPZFU7gRS2bFzmxBmOydYMsGoxAZdDCvBdr/8eUow6yCEnsF3S
fP3xumJ2XKgWIvq32TXWtuaYov4P9/DVVGPFi9k1AhNPkyPfHywH+iBLzupj+kOv
QG/PKkZxaYmzEqlgFSeCh18MPjEirP0SNSNRcM4ogUEZMRaXmI4w5bVkleCabrn/
duw0X8yYAGOD9CF4brUN7RfmCnUd7ctcEsxpkJWo6S2PzqQjZ+Wm0JzhY5MDjqn6
/TaWfgKOyyWVabp6Wa0kjU9ybgtLDcpHxFlWM3Th1fKRXmMbI1co8oHKOoPxdj03
wKAdCEF0Mj16eWWCVWd0B3dcgmDDi57AMXAM4QY5VtztIf8cPImw2//iX1qrgyn7
jG0CfcGZcyoZFTaFc5kqsNdubPSr7Bd6dlFkUaIDcV9q21pkAtNOubIYris3Ex3J
MOxMwSacRMipxbP5D/bDTsdW9ZR7bWS7Wqa4nfeR+U2NvvfKP94=
=wEmi
-----END PGP SIGNATURE-----

--ZMASnTbTTFlVgQZX--

