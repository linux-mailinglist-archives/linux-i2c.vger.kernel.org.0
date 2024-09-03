Return-Path: <linux-i2c+bounces-6024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF455969B3A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 13:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E53B1C2377D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E981A0BF4;
	Tue,  3 Sep 2024 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ek16CE83"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA01A0BEA
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361792; cv=none; b=gIR/Gtrx9qQ/Vs6H/8dvhK8ShKAJqUZ3bAc4WTuhhtpLjceSwEzziWk3SzoAmCG0R40AiYPydMp9LlwvJL5S4SBaJIRmkMsLXyoJDF/SQnUG1LqETdOC1HtmCb3HT6/uOtHQi0Eb90QZxiq1sM5T+iXrSZ1Ugr6PCPAY67l441k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361792; c=relaxed/simple;
	bh=k7AasZ9+4ufjjAtbonHwDqV/t4MGqkT4vj/W5lN1e7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlyrC5//tVcOHyuc5Q2sQcZO0ozx0iRf83DE+XvCCDoWucpBeeou4UaMUCCJRpQtCCrubRT2P+MDXIPfpD71f+a8loCy8uejs6uLCYhh33KPFeTF36r0aJGUHj9/L6aiN6h7RLr7pGPVg1mmBSHcH7ShEVGdtJexbtuuGiuebeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ek16CE83; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k7Aa
	sZ9+4ufjjAtbonHwDqV/t4MGqkT4vj/W5lN1e7s=; b=Ek16CE83HeEZ9Qvd9KeI
	gCm7MYsky+Fw6iJgIaYrXrT+1RKAUcsAnQVGkAnIxPTy2HzEC5/CN1T/vKlzF/0w
	DP/8UimkZtBo6YHPYq1aR1wn6l50TU0E59uQUj7WZJhOlLrxr+1k4T1w8nQBCNh+
	bkqjHKcmHKDCnTz94HzIHRPxF2pVsJIUzi9RW1+Yf1osOpcgU80IXVhUclBLb3kP
	SM63yvHQx1xer/oXhXZq7ydacHSLc30YMCgIg3e0T8c18t/qMSlLGOIaDGa++143
	vaEG13MbioEI111c60blM3ZdSmHqlpRemZxhd1DIwRRTZpZaxjYweBv93s1QOnpS
	+A==
Received: (qmail 228697 invoked from network); 3 Sep 2024 13:09:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Sep 2024 13:09:48 +0200
X-UD-Smtp-Session: l3s3148p1@qhGAGDUhGswgAwDPXwdRANgvu6DX4+2c
Date: Tue, 3 Sep 2024 13:09:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] driver core: class: warn if a compatibility class is
 registered
Message-ID: <ZtbufJ54ceUdQGIa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
 <7bc5fa50-59f6-4455-8f77-1c89f1e17d0b@gmail.com>
 <2024090242-smother-preview-a1d2@gregkh>
 <ZtbRLOUO48PzOKmC@shikoro>
 <ZtbRpMbX6g6vLUzO@shikoro>
 <2024090338-landfall-geek-58df@gregkh>
 <ZtboaI4b_aTfRWNk@shikoro>
 <2024090307-islamic-charity-33d0@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e8PlYFnMp6mFBxUP"
Content-Disposition: inline
In-Reply-To: <2024090307-islamic-charity-33d0@gregkh>


--e8PlYFnMp6mFBxUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> "Never break userspace in a way that anyone notices" is the real rule we
> have :)

Noted!

> > Seriously, Heiner initially sent a patch simply removing the code in
> > question [1]. May I interpret your above statement as "Acked-by"?
> >=20
> > [1] https://lore.kernel.org/r/80c4a898-5867-4162-ac85-bdf7c7c68746@gmai=
l.com
>=20
> Ack now sent there, thanks!

Thank you!


--e8PlYFnMp6mFBxUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbW7nsACgkQFA3kzBSg
KbbLhg/+Mi42XVG/JLaoMnLIGKy/DoP82xYbHRlc34KPU+y0+4AWzOMbSRTODLo9
uETc5vRWJZlOYVNFAaz6sMJAlqI9xIIA26uCY4xEBC4B/LttrBXnCs3U4aQfJ69g
uzoIcAWcSf4L74FoRpoa6qiIWdupLObNju3g8XvJPcUvCbQpti1hwzoz8Kg9qVyz
qvG/bV1Ccw5AXDv0VIFFnZHYzIYcCUzGwdKPQRgXM0gpGochTkH7zi4XiMJQ4YxM
BAlZGggaDOIXTZ01d6g0jg1huRdnJ3zdAMEDSd6bsqeUZ6MgfM9FO96pHOQQyeUc
uQs0RZ4QIqTHA+jdyMYl7vmRlGFNq/6nmPp6O4zW1NyQkpem2W+5ZmEwg4v6Dq1g
TRjaHbblhN5bVMugMFw4yKL8AT+iJB5XoPvrhS/PZzG8+hu81b6qcCNAi7nroPg3
M5RtpBehzjLnJ9UqC0oi8W/srCjHotX9oFGYLLE4v37luqt+ZxWCW4Pspv05mjgn
niOmAiWOUE42bQkSkH3y+6jeENnj2XzHuby4eWr+v/DSr9fRqcNZYGPg/b3C8Yj1
9qt2ryEzxhtBopSqlraY2DQjTK8+kuo3g0bX1E1bkaAo+OK7eGTcQ0t31bt0GgvQ
Wrs40vbAhTsKsezwaTgO9+FJJNN9GAR5n2hPBWQQahlVI9klA7s=
=F5Cp
-----END PGP SIGNATURE-----

--e8PlYFnMp6mFBxUP--

