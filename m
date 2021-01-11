Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED052F216E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 22:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388226AbhAKVDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 16:03:38 -0500
Received: from sauhun.de ([88.99.104.3]:47620 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728396AbhAKVDh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 16:03:37 -0500
Received: from localhost (p54b331ec.dip0.t-ipconnect.de [84.179.49.236])
        by pokefinder.org (Postfix) with ESMTPSA id 123D92C08AE;
        Mon, 11 Jan 2021 22:02:55 +0100 (CET)
Date:   Mon, 11 Jan 2021 22:02:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: Re: [PATCH v3 1/3] i2c: use void pointers for supplying data for
 reads and writes
Message-ID: <20210111210254.GB17475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-2-dmitry.torokhov@gmail.com>
 <20191118074349.ags3c4tmvapguqcp@pengutronix.de>
 <20191118080446.GB251795@dtor-ws>
 <20191118083810.467iry6w4kt3s7kd@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20191118083810.467iry6w4kt3s7kd@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think it is fine to require from a caller that they are aware that a
> byte (or byte array) must be passed to i2c functions. Given the (maybe)
> two problems I pointed out above making it a bit harder to pass non-byte
> data to these functions doesn't sound like a bad idea to me.
>=20
> Obviously your mileage varies, but I personally like having an explicit
> type in the API. I guess we have to agree to not agree and let Wolfram
> decide if he likes your change or not.

I am on Uwe's side here. I like it being explicit and think the casts as
they are now are the smaller problem.


--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/8vP4ACgkQFA3kzBSg
KbY5xRAAjU9/zaesSAgzJYAKhkC/DjbeQfMhwK9paPFwKSq3WYYZs/Iczx9ROaFC
+PwpUgNPMZfq2aCQcZ2nRTXAEPiSNp30Ws7B8L3kYT0epEgxToexy43UT+6rhmML
4WdGgyvkqGNlmsi8l9jpdOyzkHzrzJx2y3Ww/Hs5Uql7Wy6yiZpgjDUAnErpdvHx
RRndK0PaaQ0Obbl3SbAnZ7pwQ+NlnWCyBkIbt3DoLz8+MRHqa8uScd5oEY9vNAQs
NCmkkAetUjUybEnR5vUmH50mKcMTQZOoLeEF+akt2VJCLX4Bur44hfog/Idb/BX0
sJ5ULmrrD2remku0+do2srFtldkVj2n1Y7/Vda3eJSR7091vmKhw3ZWpc6AEE6xi
yGSUYP3K59LE3XzJJpUf64NmUCWkNnP8e53KFeigNjzMPtB3HZtzLBINDxXKl66B
UFRKgT63vW6SHh1HYaWRo8BMStgR5FX1wkUzVy1pe+cqYWFnTZ4gvikhRsDdKurK
WtF76VSWRqlXzddjBTCScsKgnF7H4jlA3rSrtm2v1RdHLju9fGBm4S1uqyI1GZbZ
3fAAV4G6KUySw105afVdG4IAkmuPYKMKx9wXSDiS+1i5pG3t7L0DMysOezQVHSAW
fqoC1kUvW1Dh9+HeM7kaCFyfZ/zZhKXnIP0yl7LZMCU7E4Zdids=
=37CA
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
