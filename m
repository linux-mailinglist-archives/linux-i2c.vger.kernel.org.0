Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C213E9841
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 21:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhHKTEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 15:04:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:42170 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229802AbhHKTEk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 15:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yotAXwGxPU3du2t0851ttQ/XEv4u
        xc75haydCGhcwDk=; b=uhRV3nizCjjBdQUbDSIINuQ40KhPgDduxHvZ7loqVD4E
        J5TZYUfonKw/uoS7XbNuyCR6VO79Br63PP+58KBbgbc4aFWHYpFrobsZpXCAB/YH
        fsFHVaXHKtntIDaby9s4/LSP/qeB1kx99cKx1blQeryPrz1UgkkegpucWYY/G3s=
Received: (qmail 2749631 invoked from network); 11 Aug 2021 21:04:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 21:04:14 +0200
X-UD-Smtp-Session: l3s3148p1@8oDASE3JxOIgAwDPXwY8AGSWydYZifHX
Date:   Wed, 11 Aug 2021 21:04:12 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH/RFC 0/4] dt-bindings: i2c: renesas,riic: Add
 interrupt-names
Message-ID: <YRQfLN3r0gFiQMG1@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1626267422.git.geert+renesas@glider.be>
 <YRPdTiAakb6OBd2k@shikoro>
 <CAMuHMdVmKuYo7XhrQsLhXCOyRa=-aKwbtub=yi5nuSvJ22An2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VhfuD+Qk+C9o4mf/"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmKuYo7XhrQsLhXCOyRa=-aKwbtub=yi5nuSvJ22An2Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VhfuD+Qk+C9o4mf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> Probably it is not worth doing this in lockstep (1/4 in v5.15 through
> i2c, 2/4 and 3/4 in v5.16 through renesas-devel, and 4/4 in v5.17
> through i2c).

I agree!

> I have different branches for DT binding and DTS, but I guess it
> doesn't hurt to deviate and apply both to renesas-arm-dt-for-v5.15...

Sounds good, thanks!

All the best,

   Wolfram

--VhfuD+Qk+C9o4mf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEUHygACgkQFA3kzBSg
KbZXaBAAim/mI+VPfpgtyAN2RE3C4n/H5lYiDnzByB2Rqq4t1ammd2RoLwDibtxp
5wE1CelXSD64Q3tRvRCyQBImxrhI76BlD8UjtXaQ2Y3PRVdRHgR1DueVXa24q/6N
ofkxPM4LAWU4kF2I7RfMyFau5Dtf/oJlCKncF/TK5+/SGO/eBqxgZVY1o0+9r7ix
C1yHFEEI3KVnvbRygGk1aUT+kQm5KZAPD9/SnPnyu9Fq81I0r0oJi8jWNm8hT3i3
JxjCR0y+OrhUP2jrknkTTZfghYiR17GVcAPqVIog+dbZ8Eq5l8v2u0Qea7OWLtDV
hzZ3l9owIhjXk0uXDX7VYhwRTq1WreY0fqm9686mQOTNBcf/1BuY6gr0fp1Woqhf
PNsgEkBm/TgTIA08gLkB1E1HHDSErBYwAnXy2zRW/BTTA/MdrM9GFkMZ1EuzVLwv
9/jiDGuD/kYJwxH+TzzkW2IwK05UEg9j+kY4iMbHeOntM0LNTAj5n7jYH4TXdm9v
z9NnEGOXxHgJoVeK98yFxUQk5GOjXzg59Jsp00qtVFGf1Y6f+4RaXw/zP1NODoru
37UnxfH9XoRB2qZo6Rf0w7r+L2zDe3r8IFg03lDt6B5jeK1R+icVZ2SUWmT2t0Ob
2b/JHxlxqf54JVcj7kwifucu1oO0ScCLV2Q0mOsGgIdU2Jg/V40=
=bJpJ
-----END PGP SIGNATURE-----

--VhfuD+Qk+C9o4mf/--
