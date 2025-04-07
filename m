Return-Path: <linux-i2c+bounces-10125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D1A7D3EA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 08:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F40C3A727B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 06:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8076188A0E;
	Mon,  7 Apr 2025 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cgkVlcvb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1733CA
	for <linux-i2c@vger.kernel.org>; Mon,  7 Apr 2025 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744006776; cv=none; b=Inh50c9uBjzlFA5nyVW9jhtXKWcC99yMWLfCocbOuFHnuJSKNLZAqc1e8cmqj3vBQD9rCwiEb/bKnnEjPZ2z/BgZHexzIhOtJH/Vx0e/rv39EmwdHxPgAd94cb93hxcmAUF8iRqI8hcFbyrD8M/oBllxD3QYS0f8pbmmLpVX6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744006776; c=relaxed/simple;
	bh=aZrxvGH4ccxNuXCfuuZ8z9Ks1viZpDEf7KPIHrND2os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhPbBxqprHuUAvExzAb/vOpjnTeVlKlPhLyCJymIebmNWy6Pw/UF1Vl9nIrSxNhedNj+rx+J14sI0wwzj6XigViPlTED4aGO1ugxjXrqBu4q3NLnqqz4K/LS4J9Ro1X7nOLKuP5T0CEZm+Nma3Hz0ecrTEitmYPp4tS6gE6yYv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cgkVlcvb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aZrx
	vGH4ccxNuXCfuuZ8z9Ks1viZpDEf7KPIHrND2os=; b=cgkVlcvbK5+BWNAzXC8X
	C88yPBjZnF5roYFsHk9RixfNrZN6wFpNEGCmpeMwgppIzDP0+9k2ke5tdS4jt3HR
	32jobx6sSdtK2wY5OFQYSVUv4qKoip/YQjBxEUIMqIPIE6XYpYUb6PswmCs23BCy
	3G4ruTQBvrjbUlK0EPTgw8A2Ez1gSOjP+CEPep1/hXO9/Zy0rGyM++rmbJnz51qc
	e+JKIzRHW+av9wuaG2dcORXKRFgGBIWAzHhetdW2KQ7/m3/wj+rHctFTAHvUCp7Y
	R0xez5LJ6E3SOijnvw3HYCOoHkgQvzWDIAvr1ZD6XzVrenum/9cH1mPJoMtkrKI1
	Pw==
Received: (qmail 3678418 invoked from network); 7 Apr 2025 08:12:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2025 08:12:51 +0200
X-UD-Smtp-Session: l3s3148p1@hoNBICoygJsgAQnoAGhPADT4hf5MsYxB
Date: Mon, 7 Apr 2025 08:12:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	corbet@lwn.net, patrick.rudolph@9elements.com, bhelgaas@google.com,
	ninad@linux.ibm.com, festevam@denx.de, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mills.Liu@infineon.com, Ashish.Yadav@infineon.com,
	Ian.Fang@infineon.com
Subject: Re: Update driver xdpe152c4.c
Message-ID: <Z_Ns419SpW_z2Xnr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	corbet@lwn.net, patrick.rudolph@9elements.com, bhelgaas@google.com,
	ninad@linux.ibm.com, festevam@denx.de, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mills.Liu@infineon.com, Ashish.Yadav@infineon.com,
	Ian.Fang@infineon.com
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <eeef6c60-8de2-4a4d-8bc5-2c321d759672@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LTwaBTz8BBfd5ng"
Content-Disposition: inline
In-Reply-To: <eeef6c60-8de2-4a4d-8bc5-2c321d759672@quicinc.com>


--+LTwaBTz8BBfd5ng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> https://www.kernel.org/doc/html/v4.10/process/submitting-drivers.html
> https://www.kernel.org/doc/html/v4.10/process/howto.html

Basically correct, but v4.10 is quite old. May I recommend the latest
documentation?

https://www.kernel.org/doc/html/latest/process/submitting-patches.html
https://www.kernel.org/doc/html/latest/process/howto.html


--+LTwaBTz8BBfd5ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfzbN8ACgkQFA3kzBSg
KbadTRAAooo7Q6SqKhGR9GARjT5SFszwoCf9aMD6FeR68ATXKAulKrdnWtxp1Ckg
a+61LjWjkkEYYvHO9z8RB+vPuJeN4HLaIvAUdTld6XotwHVXQx3KdXf2xSbgMvyp
coVzwpXr8m8+PCo68ThG87IoTPqHvr4d+z83V2ZCgkVQHEsBBmRAJytdCEv7pg2T
DOJcoNrKni1hDcGQGQMKwzF5oGoE8fjtfh86Ozikyo2yojcjvcOp5XnpeuhERp0j
GfXvH8JSH+X22Y2WcsXuPWVfiOS6cJqUxVHIpSDRPg5ZtCzrVEwRaEroh6J4efwx
TmtTVjWMRWbaVNhFVzy4fyngnJe/q19fOWfyi953LjtDUEWliylvE3dWgAivZg52
UEUsBtAnxgK///3gNbOhaok/UTSAcs6Br2oCWM5Szh1HwN1ry5I3zuUU54GoMyTd
Og63NChr1bF+B0k1aZHS4GOG9c+jH6XEORZT/M5HCVC2Nj+0XY4sohpuVClofJTo
rs/AzyaTBAa7qWQCNc7/JztRJmedyoTNqEHiK8B3WS05FeyAYCteT58Jiuf27YHV
ohh34JRDioCAYsB9jTd7vwTnvVFyE2FxFFylUBlp4TEmmO0eZ07eUBt5S7RBDXlR
87aDOL6VgXz9qY8/p5miinzFKn1KAgoijPlGUgCRyDO2F93p3W0=
=Qohw
-----END PGP SIGNATURE-----

--+LTwaBTz8BBfd5ng--

