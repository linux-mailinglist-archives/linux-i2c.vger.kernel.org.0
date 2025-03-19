Return-Path: <linux-i2c+bounces-9897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00929A684A8
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 06:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0D1422F47
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 05:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9098120CCE6;
	Wed, 19 Mar 2025 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ALhTHa8h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469ED130A73
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742362892; cv=none; b=uub5kqPcq2CzoX/VWOMKEqyKpUt/MBhFfSRbD4KcgZFUvHR+Nj/KjJ86kkWaOmkqr5z5o9pEfeNwwYXj/volmNT7gLk8UBEd5epElNZN21yAOkJw0yj1tlzRoF6UojVNEMjKL9byCVyrSftwyuixr7kxObRPjJL1NOeSDYEONIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742362892; c=relaxed/simple;
	bh=zajX4u1rvXE4OGGWMMU4XmmhOmdpr20GoaCEs1zo6X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O47Ckv5wCWY7tbGkKsQwyC7Xr+zwB4f8hNZfLzLZKHNa4dyDpETdBYmYK2yi1V1An4+F1qNWXDlrM+T2/lWshbsFesOoT/bvBUwL5S46nQmSmbkIFEWM+6eOwGwJqJJjrp5WJYdFAY+HoAT6jNVyKSsmKTzDofxvOcu9JNHteIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ALhTHa8h; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zajX
	4u1rvXE4OGGWMMU4XmmhOmdpr20GoaCEs1zo6X0=; b=ALhTHa8h3DlTx3MdXu4y
	mo7lH4H/OWwS9SVJuADqLUbn9pGNHV+jB/bukwXe7sYMnBajNXxBACPI6KhPKdxd
	+ns9jqfsnurm4HnAPs7Zst2TfklJ0Ctqn4XnHfiDJt52YnqKEFgjkzee7DghtAcW
	xRsw/Uhp1KVRW7e8M0k52BjxQXu19JOkGhdg9OB1wTyjRCSHWNQZrF5SNjeNSaW0
	7gMKLSt/8Aw7FmnNM2AiIE0++5Ud3AMWQYvfqUCG35WkgvoddOiQSrob9H51A7In
	gXiZ+JL1dptXqj1fY6dRzdOfC3OTvIWtH+Pbi3Q3k/1ec0ZUbw0M8JGZErRM4gFK
	SA==
Received: (qmail 4162999 invoked from network); 19 Mar 2025 06:41:25 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 06:41:25 +0100
X-UD-Smtp-Session: l3s3148p1@QVLVeKswsN0ujnsn
Date: Wed, 19 Mar 2025 06:41:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
Message-ID: <Z9pZBDbI2MD7ybEL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
 <j2w45gphxir2hmzr6nhzyrlgj55lhsbkzczpf5bq72pzk26kwp@zncvv3hpfcoc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JiybpNjJpgWhiUFQ"
Content-Disposition: inline
In-Reply-To: <j2w45gphxir2hmzr6nhzyrlgj55lhsbkzczpf5bq72pzk26kwp@zncvv3hpfcoc>


--JiybpNjJpgWhiUFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The datasheet I have isn't very clear on this part. Also, I'd
> like to know if there's any product line that could be negatively
> impacted by this patch.

In my whole I2C life, I have neither seen a target supporting 10-bit
addressing nor a a system that uses 10-bit addressing. I am even tempted
to remove support from the kernel omce in a while. If the support is
broken in this driver, it can be removed. A working version (if
possible) can be added again by someone who needs it. I am taking bets
it will be "never". Besides, the driver never set I2C_FUNC_10BIT_ADDR,
so it really shouldn't have been used anywhere.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JiybpNjJpgWhiUFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfaWQEACgkQFA3kzBSg
KbagLw//Qlh431hsi7/QTKpLTCN0tg8WufkOB90sehndWCI7cFEHs5Rfn7SNShby
6s2q6sP3I3Cu1+LpVgSZThLXGKX382yIwXEzM9vdLtH5E0tjAfKeiGF57N+mq62G
y5JzmKCdtcEAgOrJewmF6p96eEu0oSS/IKHCVudyN9k0bfn/tGrM65+Mw8A3Xne4
FAqJh2sCnK2F5NkazGzdcPb/2R8TjBVGixlurlx97skXIjv4huRbUnCO7RZ39Hdi
br//bSPhhS00QUaUDJR9L2mBv6DK2Fg+8khAjVEKCb4fQpILJ5JALjsgKVaHGW3l
NhJCdZG1j53ilDYDLriyZiINheSmh5g1M74gjwAE0D232dd1zfefOjfu6558PySL
LfRyS7lBICEtM9Wt0fdUl5Sc3Va7Xi36xNLqLb/HzRunIGh6Vf3nLFFrRZ1zS3Bc
ct9+5+p41Xp4bYkajviE3TfJVyXt2KfPT9kh+l4lbtLcVAofH6gGyoytV7OUDn9L
TPpGbVl2pHUXSvmkgBl3qhJKOL/+kLxbnqUx7gp8RuCr18woTYyOBaJ93NvzC4K7
QHlu2O1dPNniojkodNw624fYzEGHr5DWLTy8/oQEdDTX5nkW19l2P0pizdbic+we
47JBZs5Vv44MEcriAgbRquN9KggyXM0jAxnBkM51RpRJF68IYpw=
=Zew5
-----END PGP SIGNATURE-----

--JiybpNjJpgWhiUFQ--

