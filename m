Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF09C210ADC
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 14:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbgGAMQg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 08:16:36 -0400
Received: from www.zeus03.de ([194.117.254.33]:59976 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730237AbgGAMQg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 08:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jWhT3nVfHxPYeRxg3Fa7jQFBFVis
        CbNVJ8JFZkBIZHE=; b=y9ymZJBHCTwOAcPmuycbl+aeVVa2JkKPxtCLAScXch7I
        eRZiy0GbTP59aQ1VtBgiy5W9iN5r1y48unkOyVoQ7ukH4peU1t6rb2QBDyA8o9N4
        z/ApzOOq3L+FZrqV2NGfUm+8oRWvN7PoPJXEONMVavDTQss09vKoBgNO54ga6So=
Received: (qmail 539308 invoked from network); 1 Jul 2020 14:16:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 14:16:34 +0200
X-UD-Smtp-Session: l3s3148p1@SWNFQ2Cpft0gAwDPXwRGALjtBlSZf+V/
Date:   Wed, 1 Jul 2020 14:16:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701121633.GI2261@ninjato>
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline
In-Reply-To: <20200701092731.GD2261@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> BTW I think the DTS additions don't look too bad? It is a grey area,
> though...
>=20
>  &i2c3  {
>         pinctrl-0 =3D <&i2c3_pins>;
>         pinctrl-names =3D "i2c-pwr";
> +
> +       enable-host-notify;

I got another idea. What about a boolean binding "smbus"?

This describes the bus as SMBus (and not I2C bus), so the additional
SMBus restrictions/requirements apply. HostNotify is required for SMBus,
so address 0x08 can't be used. Alert is optional, but still it uses a
reserved address. SMBus timeouts maybe can be handled through this as
well (there is the HWMON specific "smbus-timeout-disable" so far).

So, we have one simple binding for HostNotify and Alert which really
describes the HW.


--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78fpwACgkQFA3kzBSg
Kbb0bg//c0DVUtplrSy9Pt+dcv7MYBHTMdQ8/5NWZka5vV6cBAA61eLnmk3PKdi1
hfX1I3VQged9YTjnqrC1NB1Y3udzXrNA9JKCRj1QzAzthZzfVeH5r3T/BiMrW6oC
o9u/JYCJC5+eZvxU8FvQMKGO4O+t3kC/sUIBwncnwJOfTKPf7GvIO4A+Anwz2mru
oPP012NKdwfnFDx4a6csg4gl6OU3VcATSDJXZQbDo26ejJZg7gp/1nzRuNZvFLVe
qaXAFA/hDwSGRfeUDmdfF2MuRh1Ih97KFsTP8B84wcH3XykiMJ7oMF5OgyLH5Mcv
Q2cb8qdziRurbRnqFnivsU/IVqoQityXt+MqfmTOf32J6oZxtWooHU1Ev9J4zadM
gDDA9/y/QSiXsuzYnbqnb9ep/YiqZQb+McLlDGx/YoqPWtzBb0uBKHn4nooEkni7
9IEJ+k3VrppPu/pPmgGlyCYdA2U7TM9RvRDFHlF7iW1MMyXSdtog9dYvgLxadD0K
HrKr1E7Dmow7TRQ79oISxNWxF0gOHMvD5Dez4gGZ+0bHsRhPeop3fbQrW78zUuMN
jFskbH8bzURfbjNn/+6TYfG2fkR9hg0klfd5ZYw2JOsnZifwA8CncRgd78CbMo/h
JINzSDYGRT+rn1JGIcdNVUu+Ek6HbruN/OsBI2Z2DHnzgM8O4+I=
=uWeR
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
