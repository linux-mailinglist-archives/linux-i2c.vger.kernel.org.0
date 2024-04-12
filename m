Return-Path: <linux-i2c+bounces-2917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E98A2CED
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 12:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C22DB21D7D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF1540C15;
	Fri, 12 Apr 2024 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lxvWfsdk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF1DDAD
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919428; cv=none; b=SfHzcHk5CuNsV5KFEOtjBfUXYtuS4Agp/SLevfgujoAx73WPlBkM9eFLGQFyjYWn9geJDYE5F/WI+7QWpEl6CNA90lclTQGR3Y+33hxwSsuH0SL6b3z5pPeX8GaS/xD/gdDA45eOsug4SPXW1OcJxgVYxScfMaBAIYO5sHoNYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919428; c=relaxed/simple;
	bh=tgFRk0DWcO17u3KCUmRTZKNxJiFiI0w/b6BHSfOzNo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtnFYIREW4SMKXEeESbG1A9KH3GjfRGZ2sWFakVPbsm1clB6hLYurulffNtViygEQ6GMmazvFz5pnAeYYdd6FFBi9NyQQpPDLA5kV6CJ2TaJAd11lKNSgvJ3y6LbfhD07hIxxVBI/PUYl1CObUMtWhAXrjRxW05BbgMkkJI39b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lxvWfsdk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tgFR
	k0DWcO17u3KCUmRTZKNxJiFiI0w/b6BHSfOzNo4=; b=lxvWfsdk3AXdRCqaFXMU
	uXA0l/7VqhRyAd15XWKAAqDtscA5nxKbRdvgj/BiPv8XHjFk9HtX3zeeu5Yr4rED
	RUXTcYtg4fG4MG33J0xSp3quHaILjJ0aelJ/vU+MLkTwcNthNM+zGrul9WKylY58
	m9loPUE1Q0bdY4wWupEOj3/4DI2KVlmCWlibIeOik4TDG1t4qjByE3JSi92Hhu9C
	KyUolO0l/2BBVzyVWieoYqYhNZNNFg15dCkExzJV3y7IP8e3QfGhWp60w5StYi1W
	rp5ZS7TpX2jmho8Gl8D18a6SHtIuvz0qIRFo+dkvuK+PqbYteQsrPNeGWUucf1ra
	kw==
Received: (qmail 1192405 invoked from network); 12 Apr 2024 12:57:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2024 12:57:02 +0200
X-UD-Smtp-Session: l3s3148p1@OzWpIeQV0NQtnPBj
Date: Fri, 12 Apr 2024 12:57:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
Message-ID: <ko7ylzqdf2sankiinwhudcfkllyud4msls5e5k5xt6kweygb6l@akbyok627cwm>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
 <egljtjmzcn25yqu4mkqahi2vcav6pd5vietiextxtocsjntcie@siyyjnjy43lc>
 <84b674d4-b80d-4bc8-85db-389e94747af0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ore3h5bq73eulqxw"
Content-Disposition: inline
In-Reply-To: <84b674d4-b80d-4bc8-85db-389e94747af0@gmail.com>


--ore3h5bq73eulqxw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No, this is a different code part here. The other one was

Oh. Sorry for the noise!


--ore3h5bq73eulqxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYZE30ACgkQFA3kzBSg
KbZJ7A/9Fhb3S+aQILrmMS34n/23UOkQLWVUfQ8CgA6DbzMezT4m+xqn4Zg6H7G3
V0HsWjZZXYwrAivGjfOi+KCxuMA8LbOx5XvOb9EKXQy5rKEWFkCeoIhanKA9Tdhq
caEkZCJMtiqqEsMQjmezFYF0hxe+/ilF+CLPF4P5A9tmPZWm4e5zsD7DRaY2nC0R
pHUwnBA98YHXbbRyszVgbMjQHUCsnFoZLo0iAkcyRnaMN2IST5WMgemUsEfUH/RH
YRt+MUAlmgLMsXVcolVAZeMwsG0Q8VfZmKutd9l6MpTstd3q6WaaH00E+415IYIg
hYynbIDSCMAAx/1eqDrzKfddWIIKs8/tpZgv+3VfVYbgSvqbz1xwYP5+mEA8um5R
yMpY/Gl4mrNfRAtfqip12efIE29bFAXvcPS8ln8vjrhTruupIGyCwNGbBQQdegky
IRjfyjg5InA7f4yPOqPtAnox4xQx7cxaNoxyOYcT1Xg7aPsVqUGeywlpI+TlpNjU
+946Q3x5tlSNPeIfWA1sv95hZfpJ6NfToHu0z2MhY96UttQQQp1TvelWNpMk6ceP
zqRWJQ+hMdaYSJidWNXfGVrUfKvOa8mamFWwqQY7UMhgfTHB1+AKGknAe6dDkpQX
vj5O9uCzgcJX6Q1ab7OE1gNozbZufs67iLhnZaLrvdbJlJfhifY=
=6kmb
-----END PGP SIGNATURE-----

--ore3h5bq73eulqxw--

