Return-Path: <linux-i2c+bounces-9082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F13A1063F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 13:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4241888A74
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 12:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A7E236EB2;
	Tue, 14 Jan 2025 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GI4lcclg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42397236EAC
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856721; cv=none; b=oPu5qGhQR45ZIORMK0nuHO288GzQvVbGxv/EutDm72/KQDC26RNrgWUViMWWS80gjBtAF1REVKP+EI6PKpftwcr7w/efSWnPMUt7iVKXjIUIi7LJrClu0KyVhURC04ypUdo3oQjD0fRmzFx+9DHJqu6xvhsLWzidmkhks+5MuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856721; c=relaxed/simple;
	bh=E4laEqJ4ncVYJqTYlEl8vPwMYtFDWUhoxiRRTg5xXWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPEkKdVGrVbeg/elHOye3X/mqr6GHfzwa/KzCBhq+inWm+BRbUw0B4An9jvZJlpNodih3JrJsqvbmJ8qmDoF0OFVLRldLf/f4vSBH5oSBHBtG8BYrDFg5HgI5ZtkzxaUnvg/Xy6/BP2MxbeHOR0bUolYWDX1m39bG7ne9Du5SDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GI4lcclg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E4la
	EqJ4ncVYJqTYlEl8vPwMYtFDWUhoxiRRTg5xXWw=; b=GI4lcclghFW8Ey7qWJC3
	t9ol+5sKvWOynKAMxYev/jaMX9BOSVk4UCGeyXmNvsy8NHioGLTvfP9PgWNLk6Ge
	tnsuOlQOb3ix09WuZ+faz+QPPEculzW2jyIiMmeoUOli2HxTf1JfHdCyJ0YLzh8H
	5CRd3ZIKKqgl5926MUK1p4vKijHHmXYvydzJIg+GbrrM5PY5+nvl1iYfzUEWTsmK
	1QW0snvxDwGQN5tD9113Y/Ug+zTLnYNXXtJvABbLB+ZJnzCOv1E4QlQ62tBsu2qs
	SaurcE220cR53qa6Ud4H0PLyETFJnC/XdbT4xgl5B+a4jZA9m9lykPExyKG9iNMO
	dw==
Received: (qmail 198637 invoked from network); 14 Jan 2025 13:11:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 13:11:56 +0100
X-UD-Smtp-Session: l3s3148p1@rHmad6krf2ltKPCo
Date: Tue, 14 Jan 2025 13:11:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: core: Improve i2c_new_scanned_device
Message-ID: <Z4ZUjLg3i8Boo3Q1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f4110289-f7e9-471a-bb91-941c85bfb43e@gmail.com>
 <Z3-koEmVAGPCtV7z@shikoro>
 <e2c24c59-24c1-4694-bab3-c163d1579ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KxDn3Zb/tiINTrL8"
Content-Disposition: inline
In-Reply-To: <e2c24c59-24c1-4694-bab3-c163d1579ba6@gmail.com>


--KxDn3Zb/tiINTrL8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No functional change is intended. I have hw using i801, which calls
> i2c_register_spd() -> i2c_new_scanned_device(). With this patch
> tools like decode-dimms still work.

Thanks. Still, thinking more about it, I am not comfortable with this
patch. Kernel code where the intended exit of a function is not at the
end but somewhere in the middle often enough confused me in the past.

So, although it is not as concise as your suggestion, I would prefer to
leave the code as-is for clarity.


--KxDn3Zb/tiINTrL8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGVIwACgkQFA3kzBSg
KbZ1Uw/+Mn80VrH5ChBIpXIEVGiNpby9zNwJfcdCqYo9zselLKX2clbnQjHqbGFM
vYLxj+lcjkB5QoFYd9g19j4ZqvhDjTe0QWndnxAobKLYrWGjAt8mXeCQaFH8fXLB
TuyGlRYWitdOE7Coy/totvY4wDK3rBRzcFknFW6kSq2I1YbkJv6mV5obERRHAgZ3
7R+SCJTbrKNwFyYwP3uGB1OxSOjBhbvukRnhV51u/NSvd6fcMeQO1SMA77cyEshI
0cVgTjwzxtRI8/wJMY2qW2YCWXTKi58hfFzKCJ69VV90fUl9mKLGKtqxvu6YhwW+
wYvxOuKCjPa46TBkhqezclwmSIZ+QbCD5Hj8M3T0k4G4PRByBlIExXs2MEc+Up3f
ut8wThEg67DMpt+1x1YlbcLPKeQ/P6oIG+FyswEHSn3x8+MT938Ms9dtpyxj2biS
1DUcjUKNsSeflkA6+7dAxR00Z3rH8yAwJnPi+TcNRzA/sQYOAYmyfZc5BYQHz8ny
zV+mzEnBvuhbhO+Z43jwiNk5bHMkgnxf/brcGP6BSd5tP+ySIE+bwYkUfpWYm+1H
LKonTB+YfVaLo23vmgDD5tQoM1mDQO1YaJBQ4teTaab8SCwJycc0ao09ejN2hSiR
9HlSHEgCaI1DE5/ciNb6CVT749IeyRCe4Coj1Nyg0h3AWMsid2A=
=84gZ
-----END PGP SIGNATURE-----

--KxDn3Zb/tiINTrL8--

