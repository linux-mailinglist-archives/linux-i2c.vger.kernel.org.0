Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBE03AD257
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 20:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhFRSpc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 14:45:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:58646 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234172AbhFRSpc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Jun 2021 14:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=I5gdECBkz7zsIYjLY7ohPiNWkV6x
        wkX2+Y6NoWm8fng=; b=wO5lfvOq7pqz/jbHsrbPokfTv5J1e0hQPKfysJwqqsy4
        OR3pPv+nAmaTjP9QqGpmqi1+jYT6iqhXUDFlDNb1K0tusc9l+A5NxF2TC5AS7VVz
        kACTElzfBnWgQ9jWf7ejDw0RQTJg/zbCZTpY1WcO+s7weFGAC90gTQrSa6SvwFk=
Received: (qmail 806836 invoked from network); 18 Jun 2021 20:43:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2021 20:43:20 +0200
X-UD-Smtp-Session: l3s3148p1@0cpjsg7F0oogAwDPXwaEAFEHweBlyxQF
Date:   Fri, 18 Jun 2021 20:43:16 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] renesas,iic: Fixes and DT binding to json-schema
 conversion
Message-ID: <YMzpRBecpbwwEhyI@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1624013644.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6oYIEDPASqLcVoDU"
Content-Disposition: inline
In-Reply-To: <cover.1624013644.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6oYIEDPASqLcVoDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> I plan to queue patches 2-4 in renesas-devel for v5.15.

I like the series! So, I will queue patches 1+5. For the rest:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for doing this!

Have a nice weekend,

   Wolfram


--6oYIEDPASqLcVoDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDM6T8ACgkQFA3kzBSg
Kba5Rg//XovZVRBMxn5UrFi49mJVf8UgjGy6jcI0DgsiEUX/1R2xzZajXJSRng9K
DdiG7+XlXYEv6lXLS/KxZz8OBqakmRCxCxoUH50jjUG11BWhZ4uipmULaP2pZgvm
qkD6mLxbafU4t83UNSbWPc5ZLQ5rPE3AGfN4qSHnE/7tEjG9fzhYupjfNj7oew43
SQdmn1P2Dn5JWUU2gAXkoSxuL9HqSvv2OTpQoeFKvPaJWEpWVoThJWgTDDrbT7sE
DYhHWZcwl+ZlI94yq3pRfjQFTIS+AFZZJGIfW5LsOAxQO9fTHn0/c1WHAxaQpS8R
wCn/LFNLpbcb0mW+BcxM7nuEkxp57K7FjaSgU40nfW9FJ6oBHraGLWfVHveKam1W
581/QGOwRZIlTQiX5QVZ7cly1YXPBPTAwJSXb/v4wg2dPRD208IBe9nioZmLx9XH
i++c0o3ft9T/UnxzXKhuuzm2OAzIYwh8Rtk+fiY0Qs/JSQ991bkmi+F46QmiIN8K
Ca1igV08Pdzj6aKSZkV8qoARl1dQ66fGVDbXFfJ4+bN3vo7QqOeopZHk4Z6G2feN
KiOPJU0ojjLQcndMABFh9E5K8u5q2/GylAmQhHJR+iMzz5H2UecV32aPyLfn8vZE
Zrzzdls2a0xmoWwQ0jVPDhhvhwvAm7sfOUe8cnyLjhxnO5ZDGO0=
=FOJc
-----END PGP SIGNATURE-----

--6oYIEDPASqLcVoDU--
