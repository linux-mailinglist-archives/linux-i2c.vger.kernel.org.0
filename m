Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8477FB1B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 15:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391684AbfHBNhH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 09:37:07 -0400
Received: from sauhun.de ([88.99.104.3]:37712 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405101AbfHBNg7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 09:36:59 -0400
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id 9D4F92C08C3;
        Fri,  2 Aug 2019 15:36:56 +0200 (CEST)
Date:   Fri, 2 Aug 2019 15:36:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: rcar: Rename bindings
 documentation file
Message-ID: <20190802133656.GA23542@kunai>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
 <20190724121559.19079-3-horms+renesas@verge.net.au>
 <CAMuHMdUYTo1_zz4sCv5=PRL90EyFSU_b5WgUJoc4Oii08F_tww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYTo1_zz4sCv5=PRL90EyFSU_b5WgUJoc4Oii08F_tww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Now I understand why I applied this patch despite your request for a
change. Patchwork picked up the tag, and so I it looked to me in the
patchwork summary that this patch series was completely reviewed.

Would it be OK for you to not give the formal tag in advance but rather
describe it like "you may add my rev-by tag like in patch 1"? Or just
wait for v2 and tag?

Workflows aside, thanks for your continued reviews of patches!

Best regards,

   Wolfram

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1EPHMACgkQFA3kzBSg
KbZ7RhAAlCroZhSd5jTgDALjGRyID5fY13IsztvuZnprWKyFazvBExSaXA1UCyPX
VKMrdS0wStW2XkD1ub1vSt9AwEiIoOi/xjNj2/KplcZlNybArQxvl0KlcYQSt/lT
49zfXC+Mq3JtHQ620a2gkydYhdtW3V3kVf+jrmDN6E40/5GmQ8mXww172IbzR8xz
m6V3JKn/LUX3RYceLNJOU92SIiO9zi+xWrGDZ+py/7GR0S7r2Vay8CZ6ODyaPU8v
n9JdZDWqUCeFwsaiv5rAjTAVVaon5kCkowxYihzbq1CiWYVKVsWEZejX03XjuDiu
vwiNyQou86Wrn4hWAZKdWvGBf2TcKmK4DoE2XVGLlOJw7U7s0D9xepzZYDFQn7kM
GVkQDZl7WU2IXaah4NfsXljMMaTXU00+eH+A2kfjz0vXHv7JIy285jR0VH6aZxzB
UPl8hJCOxVYi1TuuwRXl5zd3KIwoWJDOmGUYKBFVUSuvxIoRE8ERK7DdC2aeOAK7
9Lc7ggneN4RynDfU1vo8JQk/gF2zBuCOQtlZ98Vh+sQXbhjlLp5SRVvcSW8YCgjZ
/LHn8/8fDFaVzZ2Kx4dMvpoTb2kHI+cVCu9INgBmRd+7M2/D4nD5p76NWGsiG5vb
7Xyc1/zgsg3iXjFNuFNr4moVyv77I51WWvdHCHX/muYLUMl/vqc=
=bVeD
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
