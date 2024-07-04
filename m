Return-Path: <linux-i2c+bounces-4621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1C926E24
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 05:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F37282A0C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 03:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AE21946B;
	Thu,  4 Jul 2024 03:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c4a2YTFV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FD182B2
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720064597; cv=none; b=F5ZO5tLLNv83u0B+cfi5YjqAwzLv4wHvaRrwDEAYAsSXpRDrlZIF78P7jtBDXZx7LuIMHJjgg1oOTeJSkAmyLDAL7yoJqhXEzghydWElJs3PUt6AS/ym2l4FWgxE2o3IGUIUoCOWGfL7vPXd7cPOEBZtEB9M9oLwGBK4QI10Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720064597; c=relaxed/simple;
	bh=wwylZkOHxQEdXH7KyMeYbGoqWedrZgsd3Z1RJBOGcZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvZojw8JMYJmwiTm3LWrcLlib57e+utash9LtVvq0dgiDoeN80OdDHOa6DnzsKS5cXv3jnxLBsn+X0DRh8zECo9n4FHQmXgOqELCYM+Vx+Q9Vi2+SypXwrwDwB7PrlAAwalC1NSZv3rOewiAjMtWQs5DP0cyvHG+D2DKC/QwKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c4a2YTFV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wwyl
	ZkOHxQEdXH7KyMeYbGoqWedrZgsd3Z1RJBOGcZo=; b=c4a2YTFVTMUiHr9dQzAa
	h4Ej+1wF/cuGWSocN72PKTi9xTwo8k/ZZshOOV5hwd4vDudDqi2quFliH4Trqpkj
	+OuWOhV4MZE4kE+EQZNChBWlVWX2bvk7W1wrGLtAB3oHj6bIRbk8hFe/GDrrajNf
	8atZ5JyEsttATlY0wssRmdAqHkHl8wTc11fhwsmqtcUuoHmSH+GhHq6FN4m+gF0/
	iVFHwXTKO+0HP1knyjDvEgQykLNqQaPNKEWhWSrMG3TruX8XJbMZVXKRMbIsCX5Y
	ck5CiDvnvtt97mQjSxcjOqmwLqystdh14x3BCRplnuzMo2SJ0v4ONk1qDfXy/5zN
	ZQ==
Received: (qmail 3007272 invoked from network); 4 Jul 2024 05:43:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2024 05:43:12 +0200
X-UD-Smtp-Session: l3s3148p1@z/0Iv2McdL8ujnsa
Date: Thu, 4 Jul 2024 05:43:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Michal Simek <michal.simek@amd.com>
Cc: marc.ferland@gmail.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH v2] i2c: xiic: improve error message when transfer fails
 to start
Message-ID: <ZoYaUPcOS1CRcKHC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michal Simek <michal.simek@amd.com>, marc.ferland@gmail.com,
	andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
References: <20240513160324.3761564-1-marc.ferland@sonatest.com>
 <88d22b96-2754-40ba-a8d2-dcf4880446d6@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bJM1vjSOILLYzbSL"
Content-Disposition: inline
In-Reply-To: <88d22b96-2754-40ba-a8d2-dcf4880446d6@amd.com>


--bJM1vjSOILLYzbSL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Acked-by: Michal Simek <michal.simek@amd.com>

Andi, can we pick this up?


--bJM1vjSOILLYzbSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaGGkwACgkQFA3kzBSg
KbY49g//Vad0qwFYvSKmAjT8FQxyNyXsH8WCLYYWYs9yTVhjq83wkXnFlDY3QSzV
yb9v+QZlqegYxKyqQWQwExmlNi1VYLna3LaOgsPqlqtNHudutvYlX0ZlaNsieQQj
CgBB4OvxnJcoufJltzClxXKmpiB2onwGcZmUZr39h/Fw4Q/Cp1OGgyzUkIP6LqXO
iRdpxf/lpN7YvLDV9t03Y8VJko+sF9EdH8MRfZ672/60TEtDKmWma+L293hEGaOR
yfF4VsOy91PIk9F8AKKZ69tHlbppt37+SY74iNT+FF9Uyy6zSS9llnaxKpAOgUdJ
GmrcCpID+PgcNwUaU1f9/FKF+TVfu6ZR/WuQcJ3ICxh+CC6faeNF5TLbLgYM0TN0
eTOpaF8s5wocQfrGS+65nHPHBN+sYary77zFxG1IekgCRNo0E5QIn0PzCcc11F75
n8kCyb3C6ya29f7YU9lGtzMhVSwyZDOC63KnSoQbdSkXAc1237iFjkk6jR6MbW/N
xq5oV65HEyAg03TsN1t1zJjmtnNrypdgafKILyuKmCmjqQfdvSGfIWxWKXSqAV0G
PbFmsJEjHwLelUnRNvAx52GhWYsyXfkkC3tHEhFWFlDEgwMNYwtXXx32P8rciQV1
FrRXW+ehUVn4Kil+2LjVQEeq48fyT8G6XecsU9lXJ22BSu5E3cc=
=QXOk
-----END PGP SIGNATURE-----

--bJM1vjSOILLYzbSL--

