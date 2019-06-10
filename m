Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD4F3AF5B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 09:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbfFJHPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 03:15:36 -0400
Received: from sauhun.de ([88.99.104.3]:38844 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387541AbfFJHPg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 03:15:36 -0400
Received: from localhost (p54B33062.dip0.t-ipconnect.de [84.179.48.98])
        by pokefinder.org (Postfix) with ESMTPSA id 0E8762C077A;
        Mon, 10 Jun 2019 09:15:33 +0200 (CEST)
Date:   Mon, 10 Jun 2019 09:15:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/34] treewide: simplify getting the adapter of an I2C
 client
Message-ID: <20190610071532.GB2673@kunai>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <661f1084-da4e-75f0-e632-335134932801@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <661f1084-da4e-75f0-e632-335134932801@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> Similar things go on in:
>=20
> drivers/hwmon/lm90.c
> drivers/leds/leds-is31fl319x.c
> drivers/of/unittest.c

Right. I'll fix them, too.

> And drivers/rtc/rtc-fm3130.c has a couple of these:

These are fixed in patch 26 of this series.

Thanks and happy hacking,

   Wolfram

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz+A5QACgkQFA3kzBSg
KbYJ9A/8DYTbi6b0TbOp28F+nJSr8CHl41QgvGx/BuNEd1CKh7IiZjPg9sa3l14s
3zzM5PQhqmR0ff/VzdUS7LJpAK6+ZN6NK8PqxZdgo0Zfm1TgJpYnwdlcEhASGDqQ
5ttT6o7v/At/zuq8Oa1jL4DMyD3oFS2iXzhq3jydOemRGShD0REUpYVhSPdIBunD
L+pNcqvwzGZmHgbwT50Flj7+tO1UB2Y9a8Q2KNKdbT1OXO+4yBgz5sJNT4nhCPQB
2NSaYzPRXpVyzceBHQrT2RbYfR/LjaprvcZNg81cK3oa6mpSTbF7XAMOzMqRFmJj
MMHHDJYejycQ8vBVCS5y2tpsgmZSocn/6oZDHntMJ0+ytyXxaxcibnYERDGc4SZC
GaLHEF90ULPzLT/Ar0aD3jWM0q6mn3wgj3OZOmtXZnkinENc2zKqlk5a7K8KcJVP
2hEqnYC3XjMKX3QcgOxMduau0A71LN2w6eUOa4C4InE/flgR9gcVQ14ll6Gmsi29
OyasroZ/QMwCatiqo8r71RTo/9GVoum+g9myGBPalukTaicXIZIwu6cli7Ne94Cm
+nKmaL/VtYvEhh0MpjsVM3LYBa0mtlim419eCoys2ZEHrGyJiSypq+jDLxmJbl/0
Xt5XhDpZiUMxj+7YmzLVJ8LfoVvxJrQlNk7WO8VtlG3BO7s8rOI=
=VRPd
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
