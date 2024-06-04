Return-Path: <linux-i2c+bounces-3778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A18FAC5D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 09:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0AA72830F0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 07:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF7A1420B0;
	Tue,  4 Jun 2024 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FUM9icE7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D51419B4
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487100; cv=none; b=vD/1xrFzKN7a/i4UGEz/EEPOt+z9AGUo6E5uFPrQzwTZn4G4WRzu3JxIn6s7fbcCxDnbxqX3uXcZ2mdzbfuwlzTRPL0bVzF7bkaW+Kfn6Cb08MOGqdKXrNle7RBs9j++KRUSEvv1JBZRapAcU5m/dDUrLVqmXi43wE5Fmues7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487100; c=relaxed/simple;
	bh=tJBEhB3YJOWcB0CXNOHejn+7YjmsEvW/39XD/31pdto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdmySrOqebiHp0ATyI66bvYykR19ucVR37XilKqW+yJvo16ut9YBjts/f19Ddx2K/fm2a+QbTBajGxIgKNDvXpAr7Ezy0kjRMWY50nyEZ0cfd1WSh0gGDYXXxN2i+CT57DOqs3rFp/K6rUpTXjVyKLqjamcuHqJhA81X87rPzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FUM9icE7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OcPX
	Gu74LaGeRZBSSAXOp0vI7KaRiJ6A9fQeGd7c6jk=; b=FUM9icE7POaT2Q3v9hbZ
	02l7MCaSwU9nJIARQPBTdvsdkxnM4m0Fy0Ny7tZ4UNkvrlond+PT0kjwBBEsjBpv
	PoLLPdPyknatGIZbm6+elDLBG46IQ4udd/GX+fRmTtO3BS3DVFpDMtn8GDQHiQU1
	31oPtU/YyUL0PNUPr4PQBAwUjHNldfzbi8gvzSW8CpeuIjWpp9cMhLXIib/Xj3OI
	KIbTvGzQ/zPZNSFGpi1iJDgyW7AlpN0kEBb0FT7G/pBtG6vNzHRVFRbMPequlpJM
	PaTimFRhnpd0hae912sWHaMSZR8QxVVPKe/er/jFI0LWw0NW9EYXnmc5kSEIntv4
	nw==
Received: (qmail 2207727 invoked from network); 4 Jun 2024 09:44:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 09:44:55 +0200
X-UD-Smtp-Session: l3s3148p1@WoA+oAsads0gAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 09:44:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
Message-ID: <v5amgsab6fwz5sp3faci2ly6hbhyqfikcde6guszbjhssfxq64@lqawvnnin3sl>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5lvvhmn6yrs6kjk"
Content-Disposition: inline
In-Reply-To: <20240604040237.1064024-7-linux@roeck-us.net>


--y5lvvhmn6yrs6kjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +#ifdef CONFIG_SENSORS_SPD5118_DETECT
>  	.detect		= spd5118_detect,
> +#endif
>  	.address_list	= normal_i2c,
>  };

So, I think we have too many Kconfig symbols already. What about using
!DMI here?


--y5lvvhmn6yrs6kjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZexfcACgkQFA3kzBSg
Kbb6uw/+J82rXUS8G+ViECXJ4AGTWUr1qhvMeXO8SjAiN9sT6JR+uooZKRcnNznp
z/oXOlSETCFc6IdyDTqKTOxcrmYtWg6z/Vu1ayNltTkpAvG5KDRuGo1akUM6WZrn
p+b3lon22H0vKvBuEkUS+WVzmglaVs6FUU2hZZxucBd4RgjSSkwbhtMETwX2D1yo
r5yb09mUK4GmNIUI+mpOYtdKwj1hjpXTsxzgPcYMFOHPwyk6ZVde6MqsBE/pqSbo
GVUTjmhkCbRIh0b5IPfv4yx/C/O+jelEn3nGVz4OjDLaGF4di2pqpyC3sNSLw29Q
pShZBbctxRNrAgKKxRxlCQwiQGpqdjZnQyj1fAuz37L+Tw8KRbnHeLho+9veh9kV
S1IfU5g12ckN+ENEY0jO7yINx+fyPS179Ve5tAFLR2+jxdyeOkzPrBKIihm7ReEo
WryqbTXs3eUYhIdtvefWnDZB1Rd8tZ3Y8kmzUpJqYLM8vjcxoCoRPc1KynupmFJt
yIxVb1zYhAWKXN9eaU2scbzpGVn9eLxmunxRMBkgPnxOU7XJ/hHp8VzbN5M3uD5s
pMBGNA+FhJf2EFo18uwU4YksckpEjrkn7GKpyLrpTD9MhVU7I8cW0SgNZ+nTPCIY
9KndUMSwE1eBNuKUSDbA/8w8eD9IDoFRUZm/Gu0gl+Xv231aoeE=
=46bl
-----END PGP SIGNATURE-----

--y5lvvhmn6yrs6kjk--

