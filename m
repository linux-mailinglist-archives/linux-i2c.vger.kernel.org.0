Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72832F9219
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbhAQLpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:45:36 -0500
Received: from www.zeus03.de ([194.117.254.33]:56960 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728462AbhAQLom (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=g2JStMt2togUITmRS2fQ0q1p1eOf
        wFPzmkuuf72bPJk=; b=kL4jtkXr5G10/0fU+TLCBqZdXmhIEDAhGHyIwUO+NyRl
        7YKKF97xt9dgiZSsoExShK2UU8xt5tGr3x4VIaxKlBRsPV2K7hR+fYossk40WBqI
        Jxk1ubWFtePkUmib1EU3lV6RcmMy+DJkxoHgsFNmBUVnsQPC8cHAfpOQiuJ8yJQ=
Received: (qmail 307363 invoked from network); 17 Jan 2021 12:44:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2021 12:44:00 +0100
X-UD-Smtp-Session: l3s3148p1@reMZHxe5ppkgAwDPXy7qAHeYPdzlZkhM
Date:   Sun, 17 Jan 2021 12:44:00 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U)
 support
Message-ID: <20210117114400.GF1983@ninjato>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
 <20201223172505.34736-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVKmb8tCGQUQtCOfkjB3VxbVtwuA3u9kh2XuxQumKhekg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVKmb8tCGQUQtCOfkjB3VxbVtwuA3u9kh2XuxQumKhekg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> New features:
>   - Slave Clock Stretch Select,
>   - Fast Mode+ Enable,
>   - Enhanced First Bit Setup Cycle configuration.
>=20
> Looks like the R-Car V3U variant can be treated as a generic R-Car Gen3
> variant (lacking the new features, of course).

FM+ doesn't need an update. It will just handle higher values for the
bus frequency. This is also the most likely one to be supported in
Linux. First Bit setup is not even supported yet in the basic version.
Configuration via Linux is unclear same as SlaveClockStretch. Use cases
are unclear, too, which we would need for implementating any of this.


--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEIvwACgkQFA3kzBSg
KbbXFBAAsihiUyUTEcje17AWbRdnKQkuD5JVydJjOMwI7v2ZLVKjK0vDePImlnG2
modkQu7otK5NtzioVRulBmHD9Yrc5LtPx3F6SpAMwBX7ovo4lmII7xPmFnWozNfm
pyoVsJBqrWxLe85lg979FRHuUqRePzlv+Cbb9DhPmzfHzKw3pQFt1en1qkp9S8P1
W9NaU+aMYM5Yizh2tuZOCI4BVVan9bp8EWKLTn3Ke/lg/9oC8UomeYrVCgjz5kB3
YWWjOb4/anST2RMUEU5dWy4WKClGCphUWZdbdBjS7Sq0k6C23SpX9dmz2jwADJ3a
75s3+nOZo4TwtVm0Mt9vjACr+znaP3rT47vXx+zff4CHMLgdt+savJkzw25tnCxb
xzFRU0snOc6jwm+NZZ41DfDVgvWGZzMB5t2lSig9CzyOQGBkEbT9p/jrUY94AoyH
RyQEwl7m/H/UlLN/dFMbZWOSS3Xekl8ISAR6mhuDwloWNU/zHuV4r7xZGA1TXD0F
XIXtF9Qozu4HORJvY0oh3fiBz5X95KwChhD19xuBAKgVm1DSpYznHpX6KA8SZgI5
hKwucm+/E30C0HVqOSBLlKHZhVjicDamYYEvAR7Db05oTNQiPtnEgZqqKkWH7ZAo
bkqnMZEeAzjVzodn66XEVFMwgXn/TqmB8kWlQHA571jpA6KItI4=
=+IuA
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
