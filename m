Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE7F4B1804
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbiBJWPX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:15:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344868AbiBJWPW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:15:22 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45295112C
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 14:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TeEIvbf4t4dvKy+mU9XO8P24iTuB
        qS16V/lCZEf4ysU=; b=U6SUgxwdbUZJkl51RWIkW5mzmdaL5BgVccySfErjPpUL
        JuwnXP1COf7LT2cBMO1zgYNHgPztMHkcfeyP6DesCsjJN9tbuonO4Baa6Pg3qu33
        EJCFICPcv1sMYF4xuOiIypGEX5xk7OcKrDkft0t5dVw7AddIUi9LIl4JhTuxJe8=
Received: (qmail 1362773 invoked from network); 10 Feb 2022 23:15:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2022 23:15:20 +0100
X-UD-Smtp-Session: l3s3148p1@tjYkSbHX7LsgAQnoAGmtADvKpjkX1tF1
Date:   Thu, 10 Feb 2022 23:15:19 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0
 support
Message-ID: <YgWOd8wlEV4sM1ou@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1643898531.git.geert+renesas@glider.be>
 <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UHC0jvkjthZMVrm+"
Content-Disposition: inline
In-Reply-To: <9558127ad3a49fc6e03a0f9cb9ff19917f4e52ab.1643898531.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UHC0jvkjthZMVrm+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 03:33:16PM +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car S4-8
> (R8A779F0) SoC, including a new family-specific compatible value for the
> R-Car Gen4 family.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--UHC0jvkjthZMVrm+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFjncACgkQFA3kzBSg
KbayeRAAqHK2yqszhhv1dEyt5+JXlTGmnjR/TGGTXDlcWfBvQ30sVYmDD9z4m7kK
eiuR+eeLAl6onGGANTRsvzU9xtASVINNTDiPeBjXRe95ClLpvAUI2+jE8ED/EBCW
d9cRg8tVFClt1bWqIZ6XYAgOGUPpG4Yd4ku9Jd8O4Hi7aSrtI4duScTgTWWsIKIj
3dw0u4Yd8Lc8R/DCjcukEpFp7BGI1+r/4Hj3b/IZik2uliZrCq9TAPP0/BY2DNPa
eWna5P/B6WpQu5Sn3Z93mmctiWSyBsF/CuT0majRZpY2zE3SwJpYQ9Qe/akkYXvt
y/hU4OvZz4mZdq9nfCFL9QNBuqqtWdI9oJLwsCz81nyM1mHFy3i8YreIqrO+0k9U
URVoID/8fY1h4fJAS4Z/HjdhuMbql1XX7Q8qYTtxlrLjzG/6r0C30OMr/GnblKZN
HITydeWcCN7ioo2g0x2gsHFjbgW7PEWkpBjrtizIMmxnB1uao6xe3utTGJe9oKU9
Z8KzzbS5PL1N3OVTdvZinPREwaUE6USLwLVc60Wt9bA3D+hj/6mqntAohFwCZUsK
w3m3uwFx1GdQqGJhIkNiCuV4r+ZeHUfZtIjOuoNCScHLeoIkeNozne0l1L310EjL
47AlDubNEw9K0Ko4lG77jfQkwhi90WQ2v1Jf8+Oit5fqMEWQqhY=
=hDtC
-----END PGP SIGNATURE-----

--UHC0jvkjthZMVrm+--
