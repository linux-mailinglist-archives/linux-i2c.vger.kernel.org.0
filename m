Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B607123100
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 16:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfLQP7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 10:59:37 -0500
Received: from sauhun.de ([88.99.104.3]:54186 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbfLQP7h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 10:59:37 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 683062C2D6D;
        Tue, 17 Dec 2019 16:59:35 +0100 (CET)
Date:   Tue, 17 Dec 2019 16:59:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: sh_mobile: Document r8a77961 support
Message-ID: <20191217155934.GD14061@ninjato>
References: <20191205134025.6256-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline
In-Reply-To: <20191205134025.6256-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2019 at 02:40:25PM +0100, Geert Uytterhoeven wrote:
> Document support for the IIC controller in the Renesas R-Car M3-W+
> (R8A77961) SoC.
>=20
> No driver update is needed.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl34+2YACgkQFA3kzBSg
KbZHzg//fgctwWGyfANapHr1Fh5xtKfLAfb/ThCEPorrRCfl+6N35YZhrLBExfs6
+WJ3382DzJ8xQp5lvQgtOAvtzI5AgCpTuTTTY0LNUGyD5sHlOE+DDvSOICd/T5Up
iPMUrJGXp0Zn5GxM9G0DynlXqg82xclYlW6FGSCnH6t0hgQ2gs+8o6ipOMb+vQGA
U5qEkINF/IlrHkEJyX1+O4RAxNjg5r7HoUy5idkJdDeGvO5qqiwxxMurb7PFuM4S
2rxT6uklsO6tUTYlsKGHzUYA9J/GckqeCnrROTLQD+6eV15OTLKm5JQihUpFPnte
e6zBrCtgLgIa3vJcgRUoZnB2ePezf0dcBKffy6+V7GBkSiAO17YMB3UrgVLrOVnt
iV06RXnPgl1XOcZU/ZvDAEu0LcPhR+Pni3/mHPExA82xgksbxu8l5H2HPX7DkuyW
UK8sCOKB9T95KSGSkmG4w2NOD+m5lnvlagQXtbokdP0r8X7MUanDgJynnBktZnCR
Z/4xtJS1eEn2htIbX5nkYgXv3oryLRl8Z/uSbBqw2/JX8ZuvSmpuA08lLARRDG7K
YA38h+8PMe+1jhsf6lQmqMEJ/BJi6cqoFYfM4spQ50TUcj+/6K3yq0x2F1GwT7ZG
5n9HjVUuDejK4ovdbvKm/Lb2zr19Ehr+75+qjq4SQ4c3qjsX0jc=
=PVXq
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
