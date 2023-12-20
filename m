Return-Path: <linux-i2c+bounces-917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF181A7BC
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 21:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4B9287287
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270D31DA4E;
	Wed, 20 Dec 2023 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bt0Dmxkd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F751DA4A
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 20:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D0AC433C8;
	Wed, 20 Dec 2023 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703105133;
	bh=GI1YA1llFTQA0mg0t80LvPRrVs9uyDCpB1VuWQyU46I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bt0Dmxkd0FWLpw1KjvLf+WTMvOMB0o+0LXySaKtitAAM2WyYnrVvRx4BNuPgNpU84
	 YV1KOhMYjeZsDkF+JU5ZaHxyRg3MHI/Vf6Zz/MiUJDWqna83eL43U9YLGcjuvxpXk8
	 0eAJMnTmqjvjw7iAfuviO1jmO8wEhp4cgnFyrn8yMKtz4wlJbPCwEqVYaXs6BfLyNl
	 zuouupkcp5UNIG8tXG9NfhIT0WcIxkKBq+96ZAraG9uAuY+VCZ/hyDWTDfN+byBiaw
	 dB+NaLHHS+AGVgUsxXYfGXYbIrXobFZV/e+fOvK8bQ9iC/Rd4hvuMkU/+66yomlTev
	 zzYy4CALY2lTA==
Date: Wed, 20 Dec 2023 21:45:27 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Peter Rosin <peda@axentia.se>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: reg: Remove class-based device auto-detection
 support
Message-ID: <ZYNSZ+OJ5wEJwoCz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Rosin <peda@axentia.se>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftt5NNks2aEbSEue"
Content-Disposition: inline
In-Reply-To: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>


--ftt5NNks2aEbSEue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 07:38:07AM +0100, Heiner Kallweit wrote:
> Legacy class-based device auto-detection shouldn't be used in new code.
> Therefore remove support in i2c-mux-reg as long as we don't have a
> user of this feature yet.
>=20
> Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321=
599@gmail.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!

I guess i2c-mux-gpio is more difficult because it has users already?


--ftt5NNks2aEbSEue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWDUmMACgkQFA3kzBSg
KbakOBAAi+eevosAAxUb1NdDXseFvmXAPDLdS23w9X+JRtM7oxfJLJNatueCfb7K
WTp32Lso/TNUouL3/m+nMuq6U8oxuCNI8PkyszvlbAssHE1MEFVaNcWI8MxwRGvC
9ioiN3bdH7g5kfkB2UatzPik45WdiDFWKzFB6B8XWjTtjWpQtg8/psbA4xRJ5ne5
c9rkFpCRoOjZxK6ARBH6ci93jcUypuzCXjpjowkNFqrWWnffqxUi1LUcqlYtjoj6
eNmtVy5CBHPQPRbVutCRD/EuKjH8KgjaHE2pJaqcnOd1ecAC3WnOjbV3SpHirK3I
SsSH8urjDgNXGeLzm5s7nfe/YOAl//BXpOaJF6ZL/n5QTR4B76QbTblnlVY9/0gx
sbOXJ0Ker9jp+d15gclHqDO+dNA5HGql2ttxkgr8XzsPg3iiiFxMEVtTS1QhCRI+
m1G+BOqJFgOxP7rmQCGJat3mYbYnp132WH7eRzguO7wiHhcbc4w7lM3mM/WG3QsJ
NkzjEqgOulss7H9rMlu4T4tg47S5lDZRLdQyWATR4RDY18GNGhf0wtn5ZuoSQ5un
Ou8vAMEfEqJWg0WYVaEl8Vya/NgsqCB49NbFos0XEoN86jNGr9TwRuVwua1pYr5I
e7YFbrurcR3sICBexfyMTkrDQCO9zs+XGz+6XtZPnaJnTu3BtPc=
=h9uZ
-----END PGP SIGNATURE-----

--ftt5NNks2aEbSEue--

