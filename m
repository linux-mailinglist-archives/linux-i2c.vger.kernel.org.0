Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683B345A03A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbhKWKbx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:31:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:46798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235327AbhKWKbx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:31:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3C1360F24;
        Tue, 23 Nov 2021 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663325;
        bh=aCyFsSv+caYDKha71mKtcOg3uvXod4Die69+RoIR32A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aR+RJldWPXGGZ4UH3byTcFFJXcOkHE6AYM/JPnMImOuKiWNcy+yRi9tkuLtmfCWNW
         bFOYRlDuvaqbghjxR/BqH2tt1n2fmYJ68oKaqunDUtY+wOCBTSuIWQ56sPGT332scu
         L+EJhboNB6RYDDXlvJt0NDPDto3gX0thGO/luEv3tooNM0eqhRIGoEZgjT+bcnoAX+
         /qJhVIe5L9lSRswAoBQ3mP+VeMVjBrVgLUD9I+8HKwDBu9488zmI62hZgZAo+aUvGP
         VTjMp9EJBCJIc8tym3o0h+Osv+opkBEOiIve42MiRJm4gbvbFw8ihRI2GbBYLuS7qv
         OdStCDtPzctTQ==
Date:   Tue, 23 Nov 2021 11:28:41 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     minyard@acm.org
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>
Subject: Re: [PATCH v2 2/2] i2c:imx: Add an extra read at the end of an I2C
 slave read
Message-ID: <YZzCWfvq5k2JaMka@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, minyard@acm.org,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>
References: <20211112133956.655179-1-minyard@acm.org>
 <20211112133956.655179-3-minyard@acm.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3xCL2hZWPLkobz1m"
Content-Disposition: inline
In-Reply-To: <20211112133956.655179-3-minyard@acm.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3xCL2hZWPLkobz1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2021 at 07:39:56AM -0600, minyard@acm.org wrote:
> From: Corey Minyard <minyard@acm.org>
>=20
> The I2C slave interface expects that the driver will read ahead one
> byte.  The IMX driver/device doesn't do this, but simulate it so that
> read operations get their index set correctly.

=46rom what I understand, the patch is correct but the description may be
wrong?

AFAIU the patch adds the slave event I2C_SLAVE_READ_PROCESSED to the
case when the last byte was transferred. We as the client got a NAK from
the controller. However, the byte WAS processed, so the event is ok and
not a dummy?


--3xCL2hZWPLkobz1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcwlUACgkQFA3kzBSg
KbZGgw/8DlcaJv9fIcLR3la/fnN4Rm2J73zeXFaF4MVb4+SgUHMw9QvOzoMR55oY
SjWmja7YASFK0xmIb92pPvVBce6l64BDhmaEPLQwmuvU+QbuOamKX0cYZLjcnHE0
NrMbUtSoG9nIfpO+bcfvLyFuh/y1Nx2eFHplYd2bMz7eO9fESD6jcvXviRQ0bxEB
Ex6rtXmMCtzx4FVHq7yQ4hfVAFO89U/7DKkBQ/kQPuDVKPsOgouFOMa1A9zlai/R
Mcmn+eVJlbP3WtJzx/yAtsWchlCg/XQJUe0bOjDX+rrrZECEEX8HCpXFWw9bginx
tEdKbY1/CCUoXfSeI7qlJi5+MoJkndiCLlisjkagmD40rY4d2L8DxAokC5g1Uqt8
M4BF3mO2l2guhgURuWIguAdpgt13lTXnwrcae2fwvqrtqcjyUMzk5znByjDrAe9P
hUhrXeGnkIYU0tCCl8Ciu/Slq739pJzh5dJjSH9Mpsg+zPZJzgjYPbNuN+VPHeWL
xgdxK1b3OEcQFrpqtsvcmuJmOpqI4KAGJj3ilAsDNoEgnjhlXhAW5ef/IAjtirqs
EkwBRuL+uijrI2FcBuwLTkNl1H4+9ayjVxkzOiD+uad4B6UeVl/w5xqWuDtg31x8
tusF9b34TliUkdiMl4kU4kwV9TmrDforEqbZks4BUmHmyFXoItg=
=n2jQ
-----END PGP SIGNATURE-----

--3xCL2hZWPLkobz1m--
