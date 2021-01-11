Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD842F2178
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 22:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389050AbhAKVEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 16:04:54 -0500
Received: from sauhun.de ([88.99.104.3]:47648 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730320AbhAKVEy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 16:04:54 -0500
Received: from localhost (p54b331ec.dip0.t-ipconnect.de [84.179.49.236])
        by pokefinder.org (Postfix) with ESMTPSA id 212EE2C08AE;
        Mon, 11 Jan 2021 22:04:12 +0100 (CET)
Date:   Mon, 11 Jan 2021 22:04:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i2c: smbus: use get/put_unaligned_le16 when
 working with word data
Message-ID: <20210111210411.GC17475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-3-dmitry.torokhov@gmail.com>
 <20191118073659.7yomkvqthuenqjpu@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <20191118073659.7yomkvqthuenqjpu@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You claim this was clearer. For me it is not. With the explicit
> assignment to msgbuf0[1] and msbbuf0[2] it is immediatly obvious to me
> what happens.  Even though the endianness is explicitly mentioned in
> put_unaligned_le16, it takes a bit longer for me to understand what it
> does and which part of data->word ends up in which byte.

Seems like I am on Uwe's side again. For me, the current way is
also more readable.


--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/8vUsACgkQFA3kzBSg
KbZnZg//e2fQzH9ZTIyGQjTr7+Bt0evXnmsQyYJ4n5mcynQA0I1d1vfIGY9odSLc
YTEpI2BrKDh6g/YDh56T8+zhywxDJE1dmnzm3ep5ewzMAndjdKwVtBDrXJsQMjN1
8iT30yZeKcivZe097xVyRZ9zKdDjMS1G3eTFgLCJFH0F/zhyy+1bIozC5bHuHB3L
3Mfzn3pnxd8UrjWsE5gyA5QWJL/lWEZpKrk5Cul0rr17QTg8LE0uIegMK7g+ouDJ
Rv7OZ8LfQzK7FGFz5jMSLstgtNkMfUlPewu/oIrcvoeIeLcqqFW49rJbW1+mUnP6
K+JZoAeA5UW8Nzwxm/VJio5mNVYRILunYsb924SR6HzVblgGrJdFtF73gfgBdYum
ktPeafv8um7GLUoXb6r653G88UyJb3rs2SEkUFrwOy9AwJIyIjgKdo9Rez7tYVWw
RV4bTgPl8Va3klM56T4g/dY4sYipQFXDDjMQn9HMpvk4QriTEEcnpetQ3jF8Arbo
kstPwb5Yx/6goJTUtpnukC3tPLzrhmeTNIl/zH+BuHt4rlsFT6KeNe9Oa9IDN3rt
BxoWyjnd5cqn4sKPl17gsK6ffGnMqtoCAWhioIBjsWoIXaqcCFYzC6bcjH8I3oT3
5Gmuy8pXdxTwp9Gu4/gxg4zlh+tuGZQDSufoRczcnmjOIzNuuzQ=
=Q5N4
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
