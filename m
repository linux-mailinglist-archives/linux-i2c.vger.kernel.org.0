Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7B939439B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 15:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbhE1Nx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 09:53:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:57012 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235676AbhE1Nx0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 09:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=nU0ILsvL1e7YkX+Q6Ium0QVVH0WE
        +8p12XWu7kbQ4Z4=; b=CtOSCC26lJEJAI5FBtolb1D4QokvistWYY7olov2uqRN
        WrG2R5/92SCcjIGzhHq3FyU6IWx+XVFnhmsSj5ervVvXlOoD7XUqzaFFh2HALiRT
        bFLtQZTRSEo06Wn48SRTNHcPLxN1t1XJeSPDFcvHVxILH9nngaWZf48t5OKa/9U=
Received: (qmail 2391605 invoked from network); 28 May 2021 15:51:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 15:51:50 +0200
X-UD-Smtp-Session: l3s3148p1@cadsLWTDDOEgAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 15:51:48 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to
 json-schema
Message-ID: <YLD1dCO8O6uZppEV@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
 <20210505073327.GE1009@ninjato>
 <CAMuHMdX3jw_Cm4hrg4QLr5H45nydmdbJzd7Rd-HY-rncOoKxvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5GjH/ziWN9sQFeFH"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3jw_Cm4hrg4QLr5H45nydmdbJzd7Rd-HY-rncOoKxvQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5GjH/ziWN9sQFeFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> In addition, Wolfram tried transmitting something on R-Car H2 from
> the U-Boot prompt, and noticed the ICINT.ADTE bit is set afterwards,
> indicating success.

Note that I tested this basic test on E2 as well.

> As the Linux (or other OS?) i2c driver doesn't use automatic
> transmission, and it's very unlikely it ever will (anyone with a
> use case?), I'm inclined to simplify, and declare all IIC instances
> compatible with the generic version.
> If we ever want to implement support for automatic transmission,
> we can still differentiate by the SoC-specific compatible values,
> as they are present anyway, and may have to resort to checking
> e.g. instance base addresses anyway.
>=20
> Thoughts? Thanks!

I agree. So, if nobody speaks up in the next days, I will apply this
patch as is.

Thanks for your investigating!

   Wolfram


--5GjH/ziWN9sQFeFH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCw9XQACgkQFA3kzBSg
Kba/HhAAtJgl3fiOwtLIOh1PQZjPGi28Q8kpmhka3f4ADiMw/NE8NKiNPPQdyQvU
5Z4PTqnNUANvgRK5DDdNJmtTwDgnEm74kqmk+ONlu7BaoAbqsXJlcrxzRV0Rrdl4
qUgxJD6B/m9hKs7yN5a04I7knUvtjRcEQ+mIPfkapDZApPOCfUnY6/InqahteOEl
1HhNUgTVmAgLzKMm4VMyxXwM39EH2iyAti7l2Iab6lDiu6j/YrVK83ezN2B+EEgq
oOqRcM/uH8Veucoa3BSnzplw+fwJx9nGDJsTx90OinjUK7WIAxEW3+rPsYNM91OG
iIqL7cBjAh+ce9pGLUFnir5mu2wMOlRRqclkZ6r5GqAgkK1MxG50BNENXA8bxMx4
MCAv3EMpTxrc2lJnDNUFPXFIDiyrIF+9WxOy4JvZuvVQa1+Faka+9KoYzfsrrQD4
PhMs300u5bZm8nkXgu6SdUR3hSHO7eaXQCBHGvhqk6jpzCiWWhJcj0XTHSVRa35/
cnITW1vQGYAhsv5wf49XDNttxlPIkfWrDRNrph73okanfaAMqYBWovSqkpPFkCIP
btuleyL8nsC3xpz/qEFqOs6SmR3y23Ur4PKEqIOU5t/c4aIl4DjYx5tUs0c8p9+2
Q8oBRhwvXDn4TexaWIV6xtK3JWkZ8h10/LvxT2mM99ryU3ukV3k=
=OhYB
-----END PGP SIGNATURE-----

--5GjH/ziWN9sQFeFH--
