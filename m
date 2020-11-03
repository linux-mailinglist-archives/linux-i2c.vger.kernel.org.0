Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8CA2A50F7
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgKCUgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 15:36:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:46490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbgKCUgc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 15:36:32 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA52521556;
        Tue,  3 Nov 2020 20:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604435792;
        bh=Z2x8JtW7Jt659gqXkTckJoKqTGCGca7XWCshbN9LalU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1agjOoRFfQYunkxE+6Zmd+jg7qf23289C3JbK1rnumqNpWseEp/RpejcbhbMm8ga
         572Ifxp2+z1PteOtOI5Ov7XdhGLXvjG6EsG0w1+c42p1a3TCaF2119BWm+rhLj6PPQ
         29FMl18V27l0NleVWLfu6Dveu7u6VR+ERH2s1RTE=
Date:   Tue, 3 Nov 2020 21:36:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aT91: remove legacy DMA left overs
Message-ID: <20201103203629.GB1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200930145655.3044490-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20200930145655.3044490-1-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 04:56:54PM +0200, Alexandre Belloni wrote:
> Commit dc6df6e90de9 ("i2c: at91: remove legacy DMA support") removed legcy
> DMA support from the driver. Remove the last use of the definitions from
> linux/platform_data/dma-atmel.h and stop including this header.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fixed the typo in the commit message and applied to for-next, thanks!


--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hv00ACgkQFA3kzBSg
KbbxNhAAptbL/WGIALpRuck5F7tHm5Jhm2Ip+AE2vgOOer5/BGU9yIEJ0ii0W50T
jrPq/Roxv5HJBMB3ZbQ7BYApPYzRlfsQn1YhqMH8MELAFQb9cpQGlZwIn00i5cGV
RJ5TUueJ/skficks+ZyMuXJ1ZA1KZjbdeDFsrE3iHDui5H7H38pErxgZDSMflitY
sKEFAGJJyFl4YYbl6UgAJXY1namXn3eiyV0CMwg8NRlEzAGdcua0Z7bgxNU1H9N7
2Du9QvRjtd8bBhHVTg8Ryvj+MDyZIjQkN47SR2P6A1bbpSfs8F7PGXiHTBEbsNrl
bkM+Z30qqxeJMglqlOS0P+Hy7uPSb17OhEOACmgsPPLszis3tpNv86B9PYMpDxYN
DA00us++qDtjeFV0wdBkSjhxwJekm8ap1ZySsucJ6/MWm1miRtou4VWQY/4qkExg
ZZ1SJ8eqFiQtJD7QTeAcXyBAypSIrSSQaAO5n53BQJll3R4caKdCg2l2sl2pZ2rj
QDnMonsXtsCth5ZaNE5Nb2lWABOUsIHNsi90/fZjO4ZgAfBv+VH9nFfVjmv2qV1i
JeIVk0gWJEFeOWJWac8nzBQcOJKS9e7/ZYIsexPMEazmbTWlL9pM7nRVZiktm7CE
/FxNBnCIjwksol9BUBOZ8OnYs8m9S+wPPC6YpkRaJSN5ZUmsQLk=
=sZgt
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
