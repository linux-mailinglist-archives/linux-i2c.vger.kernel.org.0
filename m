Return-Path: <linux-i2c+bounces-9909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ABDA68917
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 11:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5E7165F2D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C931E1DE6;
	Wed, 19 Mar 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Nje/Mz57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D21F4CBE
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378923; cv=none; b=IJpaXFU9hobystiyvquRCQ639HvT/+ibFLaOiiW431WZGFoz5JhGfCg0VZh0tyTdK2WEeHNSFDhhI0yeHM2h148e4n7lhGgIHSHLg2+E+2t5c2wFdkvvp5Hdi8Ev+5ac/zuxst4OanbWh47M8zbo0KtPisyKQImcnh/i9I3QwmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378923; c=relaxed/simple;
	bh=veaHXAaVK+oY9gT0MUfr/PljSI8tnZbHPFMFTo3nA4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsapupcTXGqP7BFg3rrNjog7JfABC6B8lXbkDsi0+omlVdz9Pe6YhKIabbMWLJe9XfSx/vZkVxGErCVtZk4RM3ymEvHEkhVMw9nW+JlsZHVemUxd58PIB6sArCLxM50pLY+1S6LASDGfTgAZEqlcqKlXaW9wBpwR/FBCQlX0X2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Nje/Mz57; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FTJs
	ZptodTGwQjLMd8a7sNkAuoEDn2dyuZqbvnvXjFM=; b=Nje/Mz57Gfb2xeLBm42z
	Li5qS5vv5sPCtHSXLNIYye9/0P3qc5Cy1UqA5LydSotDUFbEu8GIcIRn7fni3JWw
	xg7dQ6huQ0WcaRtgBEVadn5gcs3jPWBWxT0mjkuPy55r4+u+qxKQTsbOmgPqHaRW
	7uB1UvoL9g5DprKGycwFUzVbMjTSGXGwsE8OAb+X2yn+IxYzzFrQlzd/9uHpo70E
	UaWVXMJDwRzF1Qkyhp52nlbt9ZSQf2/URjTWcJR372HkAaLQ37HNyjxrHG4a2213
	KmU2DGZObstTjOyM3OnSceNOmY3Mb02RnT9Y9hpgVQDk+0BmG9vdRG5pF8f8Fhdv
	IQ==
Received: (qmail 63456 invoked from network); 19 Mar 2025 11:08:36 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 11:08:36 +0100
X-UD-Smtp-Session: l3s3148p1@Kb9hNK8wUIsgAwDPXyTHAJp038nK7dx+
Date: Wed, 19 Mar 2025 11:08:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
Message-ID: <Z9qXpH7G3vXdXCkq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
 <j2w45gphxir2hmzr6nhzyrlgj55lhsbkzczpf5bq72pzk26kwp@zncvv3hpfcoc>
 <Z9pZBDbI2MD7ybEL@shikoro>
 <beqo7xnbo3obxxkop6rq3awzsdcjb7sioeapqj3naekqes2bk4@3ojtbocdejca>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1G/KBj15gF2QYsx"
Content-Disposition: inline
In-Reply-To: <beqo7xnbo3obxxkop6rq3awzsdcjb7sioeapqj3naekqes2bk4@3ojtbocdejca>


--e1G/KBj15gF2QYsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> mmhhh... I have to work with my memory and dig into my
> documentations, but I think I've seen some STM sensors supporting
> also 10 bit addresses.

I'd be super-super-interested if you can remember which devices had
that!

All the best,

   Wolfram


--e1G/KBj15gF2QYsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfal6AACgkQFA3kzBSg
KbauwQ/6Ah8jxpiaxdqp0mhziaptbOa0qstR221r26mIgrlYfH66OssKuIy00oJp
DKUJHHJC6xgHyEHMRviaXB9U+W4fuXIDvFul5FL6VNLFPWmYmcYoxvVvdYtmDUHU
FHlgwOSIjG6UTxab2AyI2PDd1j3iZaN8l3vD7IycSVUoZIHlmNRukTel8hJqyNVn
zv484wc+Aio0aa0XDfNNosrKChTFVPV1kuglt9anD5LAjNcJcVWtVlbDDK5Y3GzJ
b2KVn7i9vLDPZ/5i03BzBHXNVMf69s0xWQXKjZt9dCybvOXs4YIDUzvHeC7ueFgC
qq2G/kbxujrYMaxKuiW1elGYPQMPsrRFzUer7HV8m6TIMuI2ISGtmngYLIOzog+U
q17DMuvKCd3LnacJ715izAFlAE763q9mA6XdqfIN8dzvk7hmw+B/CVBpfbQchqLs
vL+3m5VRaEdsxtFRYKipHSpJo94iy+ZxEljJuVFO73ckfFAt3BlT4kWWb4l8Wz+n
JftpYDrDykcSSFE9DKaajPWtx5WpnAbfq1BwWLummDiu55B1GQ87vncxHFHEBmkf
+WHFudGGlddDICVeaImZKW5+3PA4/2KX6ayGPGtSSV8lz3NSKagLQK/j2eqehili
ek4xh2ic4AwAHBy97czPfBDe5ypRuqwATalMJyL1Dd7eeafIKHc=
=/o8X
-----END PGP SIGNATURE-----

--e1G/KBj15gF2QYsx--

