Return-Path: <linux-i2c+bounces-13476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B39BD79C8
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 08:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A754D4EC66A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 06:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD07626FA56;
	Tue, 14 Oct 2025 06:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JKFon79K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C42BB1D
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424457; cv=none; b=NpGatNJ85ilhZ7+shvlLa1GfsYL4m0P9SXgbemG354h9sdySzihBQ+uhzDy8Y+nbH0daVyu40MQkunRFnKVdq2lQMiNqjKubhRiSKkDS99OTeQKZcka9r4UgPBAJmI6NmzM+rCS2gkfe9rPoG/z0Y6IUPc9j5tkRl0L3HbtUfS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424457; c=relaxed/simple;
	bh=ZFRDfUpHgWcheTcqlADTg/C/QjCweoPMkKmsXsmLGSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQxsAofStPuYDeWEqgIozSoMzaX5qHfi6T2MwAwMFnlrftAyahgy22TABfjsnh6kGxHZmdGGc1pTxxQ8GNY/61Ay8ZHGV2DFvuoi5fEZtzeSsqJxCBFKTbe2tXrC7VAKmuH9BPd3RDXk86g0X9O1OTcyfUSY582wueNBtQNWHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JKFon79K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zJmg
	lXwCzB6o9CQsLpsHwsmRfpe1v4LDufLB7f7Z7pI=; b=JKFon79Km5XuuxXkxbmX
	piZAx5Jsyi7pNt/p1Dk0BIzQCH5e/73aYcPv8djqUQrmvyeauGKvMpGUYbNuxbi7
	QZ9+SibzeXPRi8duPoYcRoc+gkCATTA8DpOKc8zqxP2q8Jl/2qlknzh4ZXYksiUZ
	p5YXC5C98qflvdB2QhTT6rY8Ujk7u27R97szpFhEcLf872JUMcoNAtpfFLiRv9wC
	sAGyTHy5L7EQFZB2D413+u2FWQgpI//Z+iZrUncUSUKR8MsX3Kcu1JPOygfUEIgZ
	FQWRUL1QJjyC1jqWhAEZaJCc4eOZujrt+CD0A8R39VHqYSnxlAdHLZD7Ejmzkc7E
	KQ==
Received: (qmail 2849298 invoked from network); 14 Oct 2025 08:47:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 08:47:28 +0200
X-UD-Smtp-Session: l3s3148p1@HJvcwRhBUNEujnus
Date: Tue, 14 Oct 2025 08:47:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wojciech Siudy <wojciech.siudy@nokia.com>, linux-i2c@vger.kernel.org
Subject: Re: [Bug report]: "i2c: muxes: pca954x: Use reset controller only"
 makes I2C break
Message-ID: <aO3x_7RCNFmDINsB@ninjato>
References: <87a51um1y1.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EBwQBuj4HXTbxqHz"
Content-Disposition: inline
In-Reply-To: <87a51um1y1.wl-kuninori.morimoto.gx@renesas.com>


--EBwQBuj4HXTbxqHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> I noticed that this commit breaks Renesas ULCB board Sound which is using=
 I2C.
>=20
> 	690de2902dca98aec96de004428c020ca902f047 (HEAD)
> 	("i2c: muxes: pca954x: Use reset controller only")
>=20
> Before this patch, sound works correctly, but after this patch, sound can=
n't
> work.

This is on KingFisher, right? I have this board and will have a look at
it today. Thank you for the report!

All the best,

   Wolfram


--EBwQBuj4HXTbxqHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjt8fsACgkQFA3kzBSg
KbY7/g/8Ce+5aU30vC1ux/AAU2+wS+KCuDQL76XbUm3uagLyBTmppvktdThPPsiJ
POJUKPC9Zd9ytKueyxwwrL2NmXVBZ9MljMrjScjoXP2rIfptQxebUxoQVXkOlpTD
aw/h09nvFEEV8+YU4I6IbKpFX+VdFknQGp33+YkQWd2/ItwI8cx9KLO6P2pwc+Yh
aJokXz6Cx0fa6//VJVVJDNclUUjBMqb/UGPRuXmMQ997L8CPO9tIeGTO75sXUo8p
EWO6ex1BE9b68993nTHJpGc+ehJFNdslayo2PAZFQEbJ3dj1E+8EIkKQ8UF7EwpT
7hnDsE+Wir6L6XmB9BU3VCQUDPoPbnoVpuYi0slMqqt2R96Pxeo4BRoXTtH/v1Py
HIHCQup+DrgUu07D3Cks/D7dvGHw4MZ7vcpcWclx2uJhoEEaEiozpi+/T9HlLNmQ
Ey4SKwMlZabBfXOB14PgZ1zziKpX2tZ2hupfzajNJod4H+seQFIKNk+dQcDlewzp
sCW1djaTo4TPDTFoobehVSoBLIF6L3B1GT3l9P78BSN/feVnKdf4e/i0xOEOxJdP
WvaLW2Gc5xMBdMacSnH+wazbMcl7SxWYZSVG0itzR3c0AfmhOQbRRdgazoyG7S/b
ZLJCpa1ZJuPvz+jsJyuKQeR/casW6RFMBG3eaXjfvN2MDqYQesc=
=eF7M
-----END PGP SIGNATURE-----

--EBwQBuj4HXTbxqHz--

