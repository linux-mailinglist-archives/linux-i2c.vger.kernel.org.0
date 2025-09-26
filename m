Return-Path: <linux-i2c+bounces-13199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCABA2E9D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 10:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB513AF09D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 08:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21398296BB4;
	Fri, 26 Sep 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iChBGkJG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FF28D829
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758874704; cv=none; b=c25O+J/V+EPci/Z8SpwjrYU/oZgJNh19snoJwKKDgrykiHKRVuyZ0yfzUR3XnOJlWvOaiaVm8KGvzeZiuHP5R+YhwCsScEJcN8WCpgwjAcyGPYO8x7LaBNfe68vPhOhuRXYREmrZGUN+vVvihpF/yFKvdXNVcGVgTrbNxm34pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758874704; c=relaxed/simple;
	bh=YaZchDCRgfylKud3pEbWtzlpdTQgWlvYrjoHVIScY60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAx3yyEXMF3sCNeD3P9D12nB2DtpKTW/8fquHWbWH9k5TsobiNU30/ISBqq3U+X9JCT5pTesCRdufkz23R5otIpz0YpyJKqu0xSUNBovn31j+jpIiYnK0HZZ5IPXIpI0+56gHzxNXYR26ZAiII7CoEeACqhGLhDYbSdX2AGHXgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iChBGkJG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YaZc
	hDCRgfylKud3pEbWtzlpdTQgWlvYrjoHVIScY60=; b=iChBGkJGY5qDLuXXp2On
	xeNmjPEIV34ZO+dTRwCkyRF8IZfMbPBdEC2C/qt84CMIQUg1sNwKwFf52P92cMsW
	DkIXSXOZ5MJPlma2U/R4uW3AxzXCiPmo0x1LLpGot9WGP1JVPgbZzZKD+MJZIQga
	QcZKNgRXHZZAvoX6jseSUngUL/TXbwvm61a/zyLuAmhUqdsoJrjPjtGKs+C5yXXj
	OaTV/7iawz8HnRetWWkZWkQayLijlLUJPTNaTjCC2Y8urjEMTrHiyVyP0LqEEXx7
	lAxylYMK4PTQWhJ0hgFM6/Ix9szF0ttLw3HkaoiaHooppVLLqVDTHzKvpuun4D+x
	Rg==
Received: (qmail 2179589 invoked from network); 26 Sep 2025 10:18:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 10:18:18 +0200
X-UD-Smtp-Session: l3s3148p1@ZCme7a8/yMIgAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 10:18:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for
 registers
Message-ID: <aNZMSsNL6M2GDM5U@shikoro>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-5-jelonek.jonas@gmail.com>
 <aNW0jiJQHcS-FKwr@shikoro>
 <476cd546-1bde-4ff0-a785-2e6fa21b79d4@gmail.com>
 <aNY3Ar8bernz4kCI@shikoro>
 <29683d52-8e5a-4217-a32b-c2248319f69a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RgFxCkAl9l3kDwPU"
Content-Disposition: inline
In-Reply-To: <29683d52-8e5a-4217-a32b-c2248319f69a@gmail.com>


--RgFxCkAl9l3kDwPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The lost patch doesn't apply cleanly anymore because my patch 3 was altered
> in a wrong way while Andi resolved a conflict, which occured because the
> now-lost patch wasn't in the fixes path. To be accurate, this probably needs
> another patch also for the stable path.

I see. Thank you for doing the work. I wanted to do a pull request
for-current this week anyhow, so that aligns.

Happy hacking!


--RgFxCkAl9l3kDwPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWTEYACgkQFA3kzBSg
KbbcNBAAtACTl+VSEg49vFEPuKXEB30k3Rg9XvyXpQy7ufW3NfVWi0tYsaBiBHdb
1alEfYkXgoR9cZ/ECBftF0n5o79ifSxuE/G31781IjTMa9GiwTmQfMFctV+BZlz7
k0wSNIKjLzIfL4AuwzAfg5eMAlhbGwWv/fOpTbuboFH6x3kYG9RI0GfVWzeSP1DP
KMlsz3LfgyOuRB4aZfVlYFxXy4cD2M0kWVpJ5Qq9ya4B9QFIaKo3JLlUKMnj3W4J
1SpQQsqX4NpBM2RO0iKtL7gCV8x2Ig2h+xM4P7uJO0dxmnde5Y2vOXFsKHXUZGGQ
D/P5JdJ49jwMLzOSNIkUDJe73/wnn484pTKodoVgypZ2IC3DnF3zWfMoXPSFqBAs
yxGUxCstgEC1wFy3mWw7vYkhvDeYDCYvNlnbeQcXjDRTRcHDIudWRHiJUrcsU7QX
hRGg6A+BPqnIZMlf4gP3olTcJiyMNGukwdga6lUxZ479iZJogVxJzhw59lloP2Xh
wZcB/RVFgDAgRBll/fF3hFlrj4nB7foXJNUSSvA9yuuybetueg9rhgspWm5c6fe8
kF2wStR2rGsg1HbygmD0Frt1ClUcpZi/ji/7FS44WEfH29E486pBZ0A6VpbyDjTJ
heuhAyUHUKhoX2U+WIUwoh52SLeicw4JROmtlQgh+0s3eS7+Z30=
=ajo9
-----END PGP SIGNATURE-----

--RgFxCkAl9l3kDwPU--

