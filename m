Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0655314D239
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 22:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbgA2VAc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 16:00:32 -0500
Received: from sauhun.de ([88.99.104.3]:41680 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbgA2VAb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 16:00:31 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 365CB2C06AB;
        Wed, 29 Jan 2020 22:00:30 +0100 (CET)
Date:   Wed, 29 Jan 2020 22:00:29 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PULL REQUEST] i2c-mux for 5.6-rc1
Message-ID: <20200129210029.GD7586@ninjato>
References: <50c8b786-b261-311c-6c25-07959442c878@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline
In-Reply-To: <50c8b786-b261-311c-6c25-07959442c878@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2020 at 10:43:09PM +0000, Peter Rosin wrote:
> Hi Wolfram,
>=20
> This has been in -next since a couple of weeks, and has thus been tested =
since
> right after Stephen got back from his break. And it's hopefully not too l=
ate...
>=20
> The main feature is the idle-state rework of the pca954x driver from Biwe=
n Li.
>=20
> Please pull.

Pulled, thanks!


--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x8m0ACgkQFA3kzBSg
KbZ5qg//cEKg2gYVDctjRlRx0gqdQjp6W3WhIyfDULB6WWzE3KqL4+O5OeYoqr87
mLlCSymQhg69tK9tKRglKfXAduyUK4D+HW3NNkCzl4ZwWoRSBisvTdhySg/Jvis7
N26NTrq+o6qdn+S/RjWhkoJeSgkCr1iyuatAeu3VgzhECzp+q7hWhWY+G8qDi1Sn
Z37jpPeimPOlSaeID8vfhl7OpzUQgqNL1J92LTlvnbuLJP4dYMvcPnc/AOTXv3Pn
tHXvVMXy+u+FCFJ7yt0XaGgOIZnABTkA5+g945UnE4/OQo26gCbKYHR0RoBwh/R6
I/fPtTD2TAJUv33hRADuKocfrlCz8QC/DKpZMYznap174VhfvzdNH5k/8u7gD5fq
TKCRraLjz+RfkOUWKAt6rOeZMe2k4LNA9D6wvW5tyS4QmZS1cJ/dZSx5/wabdZF2
PnTJkRFNIwbgynYa2Wzd/Hwq2K3xnGUHpaiaRv0YHqxb7zY1s3/raBY1iO9GMw75
SSJBPWGfEwuNfGdRuU65R2G1CeoELBed1IAgk5xzcXoQo6IY0I4gKAYX2kSLbq8/
fJ7pIb+14t+jRVPHogy8xt78B+WpbuFoob+zflM/c1fYRMN3kbobatSnvXwW5V6N
vYYTWIwmBh10ga/HlVGvR1k1gcx6WuWkEd0aOLIb1tJkvgOSv8U=
=utmT
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
