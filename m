Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE22F792846
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237303AbjIEQTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354778AbjIEOTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 10:19:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9BB1A8
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=d5oE
        VPZounkZyPqSJjsmtIRWD+j5ouluxyYTqoZnQ+s=; b=SfL2lb7f6vxDpXS15/8P
        4L1xAOIHOiTnlsNiamQ3rD1s0zUp+7ntho7wHhZqury92ytZS3Uap6WRrwr9jmW4
        g+k7q1okcnHEmagshZIAu2WiBWd8qqNcXdNxZ9GAd7uYLWcZ6zDtCWxfdYLnxxjM
        piJr8qLerL10kQhweg52r+9+ggZtk98QjEVzXpPSoGmC88bHARR0WGnUsNPlgFLl
        vHQ0VgrbSkFH+qs/GUSLORsrCihVD6mvu3eD0U5ur1Z/LTsad4AkX/2nLZUQTKEd
        bkf674LM7mZ22fc9kuKnjB78vDtljj8fWA+ph/B5TlTgelNSL6Mj/nhYkZKNK45r
        2Q==
Received: (qmail 2493423 invoked from network); 5 Sep 2023 16:18:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2023 16:18:53 +0200
X-UD-Smtp-Session: l3s3148p1@g4JWTp0Ejt1ehhrI
Date:   Tue, 5 Sep 2023 16:18:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Message-ID: <ZPc4ylzR4MJEMlbx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
 <20230905113624.5o2hfjojh3he7aex@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N/d25QGf6h+4Nz7R"
Content-Disposition: inline
In-Reply-To: <20230905113624.5o2hfjojh3he7aex@zenone.zhora.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N/d25QGf6h+4Nz7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 01:36:24PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> > @@ -1031,10 +1021,12 @@ static const struct of_device_id rcar_i2c_dt_id=
s[] =3D {
> >  	{ .compatible =3D "renesas,i2c-r8a7794", .data =3D (void *)I2C_RCAR_G=
EN2 },
> >  	{ .compatible =3D "renesas,i2c-r8a7795", .data =3D (void *)I2C_RCAR_G=
EN3 },
> >  	{ .compatible =3D "renesas,i2c-r8a7796", .data =3D (void *)I2C_RCAR_G=
EN3 },
> > +	/* S4 has no FM+ bit */
> > +	{ .compatible =3D "renesas,i2c-r8a779f0", .data =3D (void *)I2C_RCAR_=
GEN3 },
>=20
> is this I2C_RCAR_GEN3 or I2C_RCAR_GEN4?

Technically, it is Gen4. But its I2C controller behaves like Gen3. This
is why it has a seperate entry to avoid the generic Gen4 fallback...

> > -	{ .compatible =3D "renesas,rcar-gen4-i2c", .data =3D (void *)I2C_RCAR=
_GEN3 },
> > +	{ .compatible =3D "renesas,rcar-gen4-i2c", .data =3D (void *)I2C_RCAR=
_GEN4 },

=2E.. here.


--N/d25QGf6h+4Nz7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT3OMYACgkQFA3kzBSg
KbYaFg/9Fbrlwi3OToLBSRjgWHy76zRq9Q0XHUIwgaGhdHjUs+1rXuyWVaJhIsfb
k3KFquWYNODEEJbTDTe6i2K+ZAXMPVuSDru1/ocZ1ksSuKiZvA510UjRRlNRHS0j
W0jnvZJjt7FbLyERxZR51vu2LjqxW72MIb6LnAAjopk0606jhwkydMF5J68L1uZk
7fiGrNjPVzf09uKF7uqUQRPevp7m8b7h2P5lo9ng4qX+5o0ra8wzAcPxjt6bzhF4
MTL9YN41pMC86SwhNLSa5eVvvjh6nnYGgKgz3/lMRbfI1bfj10ZUoeKcdghmvdae
Ca9+cXBZ7Db8xapXZWQ2sLF3NogORRgdMc1LLfJhUDrGGkvw4D2FIY2fqgIwKzV6
LCiQqzYKaJyhB55NvskrjqYMA7azGHlpN122oPxFobseeRUljvdmpUFY6Uc9Th3a
4aiy/Nzq2rLeLCbaBekxr5QDO2sec0PPZOA/FzowMzSJ8RoH2qGhyK1YUs6yv7EC
YuN0Yg4b/NaGn05pu3tu2SWJwzH2mgKErQfmKUJWihJrFQNPreegVYxLK4bP3hOX
0EzGhr0nB5EsSQSfBJiy6uZSWaz9ciG+QP+NjtkBnDX86C9XGSD6gDI0EOTx951E
rQLa1OGkeKQ5bfqP6jJJpHnNOj9pMlmRBgZjWV8JUit6J+/nm8E=
=5g/h
-----END PGP SIGNATURE-----

--N/d25QGf6h+4Nz7R--
