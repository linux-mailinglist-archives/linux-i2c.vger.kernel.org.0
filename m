Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91453AE05F
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFTUoM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:44:12 -0400
Received: from www.zeus03.de ([194.117.254.33]:50812 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229897AbhFTUoM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=V8zT+oA8S8ao89zfoeso/AitmvO5
        iICjsDJyG/eFxG8=; b=Djr69Lr9xJTQgPMv9Qn5lxl3aUCKkggGiRxG+qhg6y1/
        E5RAhktsLu0Oce7ODFzI7PiLhTldA/TBHJ+l8b5S/cT5m7jpm45xYzbI2eaTlKC5
        2mFso/MSPT8kAZOUftMzPedpj04+S7IkyOtotVlmwOwEOGCxBZg871Jpxas1Q2w=
Received: (qmail 1498250 invoked from network); 20 Jun 2021 22:41:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2021 22:41:57 +0200
X-UD-Smtp-Session: l3s3148p1@sgB9ljjFuKAgAwDPXzseADJuEzJK6i8P
Date:   Sun, 20 Jun 2021 22:41:56 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: riic: Add RZ/G2L support
Message-ID: <YM+oFHzKOTRFtSGc@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
 <20210615085400.4251-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nxUJ5uK02M57mnTf"
Content-Disposition: inline
In-Reply-To: <20210615085400.4251-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nxUJ5uK02M57mnTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 09:54:00AM +0100, Biju Das wrote:
> RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> By default IP is in reset state, so need to perform release
> reset before accessing any register.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Applied to for-next, thanks!


--nxUJ5uK02M57mnTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqBQACgkQFA3kzBSg
KbbBlRAAlgaGyItHE11uJaN31H4qh8DzvKSodSPNfsQ0olx4zq3D92NbBbq3tYFp
3dfcIu02Qi42Zt5hxtrKITf6tnzslpsDsn9vvwJkXtZo0LBRJu7ZurugkhOB3woI
O7oTYLLzisBbgMEUfRm5FWCZiO3O5MsqpH0CTi14951O2TlVZmMMuhyHFJWlDe65
NBsx5VcHVHOwixKSBRz0VwsOT8r2vocpWqq/ghX/27PWjS8bKibdGF//pXIJYg36
EgJ4cAOnKh9adoYLl16TWIPPF13ixV/XgnZq1lbqfP5r4Oc5tyJEfwwUBhBQSNPb
yDj4wTPfOSKkBTwlOQqVRWRC3lt8mkXXvuUxlk9F9QwSCJ/xwNmSIhR8Q85sPCdQ
z662fKEUegqkJMaCBzfY8/D6G0Zf0fZvWKZmSS73ZUUbX0XPKcBy0HhnWggoepWu
LeQQRz/XvajEqegstP2YPexTrfATk7nywHbHTbsAWFjvhiXWiGX4hASAyicvOmlB
6LG53Py8cWb3Isi7W1Si4peccq/Ilt4IE6cBd91zfP4CBUNDSWuyFP9hsiLDymRK
wFlx3tjTMtCd2nWBMG4vfId9qauCNaIQeaghfTITJjs7l8iJ6DjLiK+TYXnAxd1m
OIJffQlCxzSF49+H+AtKRQ8z0whO2n54WjKNNYSCAsV7ddGhkwk=
=T4CI
-----END PGP SIGNATURE-----

--nxUJ5uK02M57mnTf--
