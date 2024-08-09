Return-Path: <linux-i2c+bounces-5256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D139A94D161
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 863721F234B0
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 13:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C3A1953AB;
	Fri,  9 Aug 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KlLb1G/d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA4194C75
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210545; cv=none; b=Juj7biLHohAKaUuH+PfgsagMr+Sd0gwTOSfT/Y61cCXoSLtTiZPy/+unOyKguhDKYMALNjAqmfu1DNJcwPkU5FiyWJ6rOQpvV7AKQXxj9LrmpFStAJ7hfx3Q1x25KbjlLyNN7SCGnna3CGIVtkjX9Le2DgS1Ib36gLEc7EFzgCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210545; c=relaxed/simple;
	bh=EBC7MeI1K5dcDrlovVZkAUqFvht/y52GH6cUeUWaSlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPjoCJrtVy9O4YAKFiuOej0ISgIUY0vqYSMjTLGC16bELugjnGBwHLsaAWRsWSRxfj0HgARct5XHEcWq9Q+9XJQ0b926kev4vQPoG3JQhdbsPWL86bowIl0gJoyuBQFcJFZduJLfbiP4LZwPCyAaBgZu1SmCM0Uvwqtnq0feB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KlLb1G/d; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EBC7
	MeI1K5dcDrlovVZkAUqFvht/y52GH6cUeUWaSlY=; b=KlLb1G/d7TIIK7WZQBPE
	9gC1fBbDBtLCk84At96HajLjkVjZmplOQPDghpGF9DGY25w847AY52C86XsbsIuf
	kYKTUcYf+tq/zC9o6To4tKxlPXRqZC+RqnFrYZzvO9xUZWYJ3z/DApj6opQnK2Me
	w4Vpdi/8ia8qXK1wnhO9BjcrZFjsooIzcyDTn8MPnHyF9Q72AoFg0ysqnRSgyKKT
	Spiv8PQapbrvml4kxSRtYZavyPHHrpteg416+JN/cjKtmwIiWF47/ZYz1yqzF4Ku
	LViKPsi2INW19qRJ40XCsmV/ru+ffWrY/ZSLHIXeXpPmjas7XWzbi4pZcb2qqfLF
	/A==
Received: (qmail 625080 invoked from network); 9 Aug 2024 15:35:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Aug 2024 15:35:41 +0200
X-UD-Smtp-Session: l3s3148p1@0+AmOEAfRIoujnvj
Date: Fri, 9 Aug 2024 15:35:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 05/11] i2c: riic: Add suspend/resume support
Message-ID: <ZrYbLDnvdJE1RYf6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	claudiu beznea <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-6-claudiu.beznea.uj@bp.renesas.com>
 <ZrTg-_Tzmu6whv_W@shikoro>
 <8359caf0-5219-47dc-b68b-41486757be92@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X4x3yYV3EHzm5Xi8"
Content-Disposition: inline
In-Reply-To: <8359caf0-5219-47dc-b68b-41486757be92@tuxon.dev>


--X4x3yYV3EHzm5Xi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I just checked it on next-20240809. It should be due to commit
> e1571b1fb4ff ("i2c: riic: reword according to newest specification")
> which introduced changes around riic_algo object, present also in the diff
> of this patch.

Ah, okay, this patch is the culprit. I wonder, though, because it is
already in 6.11-rc1 which was the base for my test. But you need to
resend anyhow...

> In case riic_init_hw() fails there is no recovering way for this driver,
> AFAICT, and thus there is no point in keeping the reset signal de-asserted.

Right. If it fails in resume(), then the driver will still not be removed.


--X4x3yYV3EHzm5Xi8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma2GywACgkQFA3kzBSg
KbZ0JQ//d/v2U22q45isu3+SVzCcfLPB2W/H3AOEYevA2fe05W8xxMQHRfiZKKAQ
4aJRcBbrjPJjql8FtPRj+s6gTMrq7NB6Vg4291dEs5C3UnyhOs/Dhz85rXKTqtSL
WSvza+cio+Lc9lmJBnkcvplW67jN7t1Z0t/bWiM3Gm0WCDYx5gXj8E0Dd04Sp0mj
vi4LQsGNXBFYgnrBB2Xi6aiHl7IBlYzBbTMkfEkY4J8h3SYbMr35n7QTr09+Xa6Y
xKGKF5BNRIl8H1m7GAIQSUxRd1xGUPbrmCW7BRLrJ+WktgzOzFeN9TY0O4UzB+j/
hYhwNbmdezO3KBUQKy4wPzN0clvpPBZWA8GVoPuJ6t3ltgO6wZwuCUUwym+VnSPf
warCBrmk6Ri1qVWk37+1wJ3TcB4BGQekTXGy83X8khysY/G94cBx3Fk0AsCcgOBl
JJNwLETr8+sdmkmIkl0SgdnFdYAwIGMWT77sYIr/6x6KR2jzgxufZfEj5QVd8iRG
R52dxFve8X80RSvMvbvfoTpCRqxGSTsFjsNN2GUy0o1oDLyuu5uxObvet4slSBQ6
mW9tHFhztPcTFEUJZy6RRUK+4zuNyk+p/U2bMcYmS+NTUZTW3JxtyGY84HFoiMgr
espbtXyLVkZaugUVkwu1peL8h4vqiz69z3W8C+QOKDUEPGJADKk=
=iWw/
-----END PGP SIGNATURE-----

--X4x3yYV3EHzm5Xi8--

