Return-Path: <linux-i2c+bounces-8689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DBD9FA58C
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 13:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23FB9166370
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F18618C018;
	Sun, 22 Dec 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j2KQo1DT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11618B494
	for <linux-i2c@vger.kernel.org>; Sun, 22 Dec 2024 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734871491; cv=none; b=D4NfYJz2Sw3S9M/YYvuan+XUpTPzue/sdLFEsf4i6XsfLSdYbbZIyH29vknqVqSNlBfKwDNOQQYNZYYHysJQ+1SbKNSyL0BUktehwZYR2K28w6cghXtvk6F7/tEvlulgvPdkb0ibQglrO+L0Cnkn/xaKnLhT8cPDoji9uzgFTxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734871491; c=relaxed/simple;
	bh=HH7gJqCg9xpiTgkDU0PbNh9P31bMSGqjQzQmK0O5Yek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGHY+OGxoU+Pth+FUN8uIfaxnZM319Qdx/g75lkgcjp4tKPl8Jv1BuUJk4A3KtN0aDalcOFk8jMA9N7xhlVYUTqhYrCGHqLKfeKqfa7FzaeIfz1rvp+UNMYy7gfZwdG3pszF4vQdXuZDjtzsNlXjyDnl1JG4mGvLTsZ8f3TpoGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j2KQo1DT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HH7g
	JqCg9xpiTgkDU0PbNh9P31bMSGqjQzQmK0O5Yek=; b=j2KQo1DTqt1kjc0U/wSD
	A1Jn0aCI6iCWTZT8icLnA7xbTX3V+xUacGCyPFc5ITyILuW04mvU0o7g8xSvJ14A
	tXsZt5BU/+rhGheS+m+OSCv2n+Yo03NlKiw/2rVn+6rku1rFyePuLWSCKNmeezmq
	mm1gxd3odFwKrOdhQAFwHXhSy8Mho4rKwO1ZMET0kyWfXUblE65AzM/t+g065y/2
	vpWkbVi7EgKnq92BPIA9r9WFlgonuZggqajMWhKq3V5ziTNEGdNVoWG57sR8uiXH
	VojK76qNc56jw3h2RuUMZcVPmFvmrHuj4Gnn61dl+pKfd3ph5j4oNAfws2kCt1Jx
	wA==
Received: (qmail 1590584 invoked from network); 22 Dec 2024 13:44:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2024 13:44:38 +0100
X-UD-Smtp-Session: l3s3148p1@xHc1PtspkNwujnsY
Date: Sun, 22 Dec 2024 13:44:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <Z2gJtlb5Sc9esEba@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F9g9mdzG1L2gcjr0"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>


--F9g9mdzG1L2gcjr0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> On the RZ/G2L and RZ/G3S there is a restriction for forcing the SDA/SCL s=
tates:
>=20
> =E2=97=8F Write:
> 0: Changes the RIICnSCL/RIICnSDA pin output to a low level.
> 1: Changes the RIICnSCL/RIICnSDA pin in a high-impedance state.
> (High level output is achieved through an external pull-up resistor.)
>=20
> So using the generic algorithm may be platform dependent as it would
> only work on platforms which have external pull-up resistor on SDA/SCL
> pins. So to overcome this and make recovery possible on the platforms
> I choose the RIIC feature to output clock cycles as required.

I would be super-surprised if this is really a restriction and not a
very precise documentation. In other words, I am quite sure that there
is no difference between the bit forcing SCL high (via high-impedance)
and the internal RIIC handling when it needs SCL high. Most I2C busses
are open-drain anyhow.

Or is it confirmed by hardware engineers that RIIC is able to support
push/pull-busses but only this bit cannot?


--F9g9mdzG1L2gcjr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdoCbIACgkQFA3kzBSg
KbYatA/9G14Fc0aa9RqUTNNQpnhYPnOt/Bk6DY3q/mb7GpXt735np+HpegeITTj/
k75jG79ssVpJUJIUggMFeUSM+4MgyveluEr3mq0XDy0Fpr507i+PxXrFDGjKOoI2
Uo7+Nc4r4DkI8PJ0gU4nxsLLfVvnWgrPgdGBqOvWDuqpS7x08t4F4tuGFUoegYNR
RoKAQDUl9o0oQGhEbWz6vj43cwFoi6gvB7H3FwqmSBHlZRAm8JEEOVHKSZUB9q4Z
s9J4jbhxAsJ60oX4kt8VxSIxwDDDBBQqlPCoYS6waWyJTpkuztTf7EVIfkjHcfgW
aA3d2nlW6+j7vXEVKLdlEQ0Ed1/aiMxqGeEiTmx1/3SgQv7g5lB6Q5gpQLcWY1ik
WsAPPzzpCIbigb10TuoO+LVY9QVuQCLK3mKYWUSC5EEFyxgG+xjM8N5u3sntxewN
TxLVQZNzDtDY1rXhRRngnDpPVyGZkC0GfGnzdOzCYH9sMy1c7heGDYs5CEVW8gkm
+VEBuy5w95cym4sO0tBhqYC2cZ7YCC3z+pfE/k81qY1nfxksau3Juqjojt2xn/dr
8Ow66vmaM8Em5XW2+Y4Q1j2Z7qaFCEozt/r6/cHqntuOiAbW3dYH//V/MCgQiRWV
2UzLRn8S5+00bwA/OzFfkNVIRhiI3RNuovtUxiV2zWhVo8oXRYQ=
=W6+A
-----END PGP SIGNATURE-----

--F9g9mdzG1L2gcjr0--

