Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5280651AE4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 20:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfFXSng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 14:43:36 -0400
Received: from sauhun.de ([88.99.104.3]:36360 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfFXSng (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jun 2019 14:43:36 -0400
Received: from localhost (p54B33083.dip0.t-ipconnect.de [84.179.48.131])
        by pokefinder.org (Postfix) with ESMTPSA id 1B22A2C0398;
        Mon, 24 Jun 2019 20:43:34 +0200 (CEST)
Date:   Mon, 24 Jun 2019 20:43:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kjetil Aamodt <kjetilaamodt@gmail.com>
Cc:     "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>,
        "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        linux-i2c@vger.kernel.org
Subject: Re: Bug present in at24.c in 4.14 kernel
Message-ID: <20190624184330.GA8035@kunai>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
 <20190624170228.GB6164@kunai>
 <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Thank you for bringing this to our attention. We are actually using
> > > Linux 4.14 and the original patch was developed on 4.14. So we are
> > > covered.
> >
>=20
> Are you saying that you have a local, not upstreamed, patch for 4.14? Not
> sure what you mean by "original patch" here.

Yes.

> > > For getting the patch on mainline we ported it to 4.19 and sent it to
> > > linux-i2c.
>=20
> I can not see the fix in 4.19, is it there or was it written for 4.19 but
> not applied there, only in the master branch?

That makes sense. Porting to 4.19 means, using 4.19 as the base for this
patch and then send out. So, the patch will appear in the next release
after 4.19 earliest.


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0RGc4ACgkQFA3kzBSg
KbZ1XxAAsC5gXVUWiFAP+Xy/8jYG05sxLXKRzydk+sZyvb4Kmua9qRlJgVPzCR+O
XpeJhUsRf37a1RZ0sfavPq9+2kuFyC0kYj9jZmIf/QshBer6Q+yq5dS5fdF1cUwo
D7R2mO8GvSOrAc38GUodjf9nO2kFswD0jJJP0coR3ohir1UWxNxaklkrBUfdlD9s
AZGRjhK0uX4llxuS6a98pJW4rztVhcIxFHtLvqr3RrbsBxXYwU9D76YQ1rLbh2cR
wHKKrIjBM6aPmZrHkPkO8mfxrhDBmgRaKWpVXT1w3cvkDc2c7A0xvwfTYWc1K1Or
ZB/CkbirQbiMSBt1kPLiMxIjOrqQ67kPz0e/22SBPPBQuMQEXvT2QCnmG4HUQodC
BGfRxPwazLPTC3wIz0yhdzcQi9KgSZo5cKw2UWOsO6xv+1tI3fBCR2dX5ChJx2pB
7eODEverGECNS3V2k/pVtdf0yr+hc54yUMRTNleenvvNBG7NgFSyl0ICM8S4ooiS
TUxhA6tHB3wdYl7BbaKp3N/FGyOMKwKmF82z8GdLj2v09ebX82tww0/NCjMK+2R2
02NS+ZPHgrZHwXKuVe8zzxem3pqlXFZ2WxZF2qvFMlGjQr5mr3mXooE42QfoLm7b
c4oQrt9eeWcKhVMwJtPrPt2nDFGvR21XAofgxiSPLWza7sQWAik=
=b3+A
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
