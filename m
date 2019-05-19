Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A557E228DE
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 22:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfESUwi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 16:52:38 -0400
Received: from sauhun.de ([88.99.104.3]:45776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727620AbfESUwh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 May 2019 16:52:37 -0400
Received: from localhost (p5486CF3F.dip0.t-ipconnect.de [84.134.207.63])
        by pokefinder.org (Postfix) with ESMTPSA id 4662B2C360B;
        Sun, 19 May 2019 22:52:36 +0200 (CEST)
Date:   Sun, 19 May 2019 22:52:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/2] eeprom: at24: use devm_i2c_new_dummy_device()
Message-ID: <20190519205235.GA19630@kunai>
References: <20190519204012.31861-1-brgl@bgdev.pl>
 <20190519204012.31861-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20190519204012.31861-2-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Now that it's upstream, use the resource managed version
> of i2c_new_dummy().

That was fast :)

> -	dummy_client = i2c_new_dummy(base_client->adapter,
> -				     base_client->addr + index);
> +	dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
> +						 base_client->addr + index);
>  	if (!dummy_client) {

Oh well, the confusion starts already :/ devm_i2c_new_dummy_device()
returns an ERR_PTR.


--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzhwg8ACgkQFA3kzBSg
KbaunhAAnL04MZbjXegMV2akY03VuGzVoHwLdRndBqHOlG33ZNd0u4Wmf+fDv0ju
ddWxKuGDH7XShPa4n29ohHIIY4F6urlQV0zrs5eBS5vHLu+GEmeeXkic+a2wn3CA
O/Xnkgo5N7CXPGv9sTDX+IY3W86ZiKrioj8LcXXVdNcwNm15qGCgbN8ncUzxNrp5
XbJFjGFdoFcBpigZPqK3Pu44yRgdKfBS3eyEzGxwHcVQhaCbxysjMGRtfZwmqDKY
gJT2t3f7hXgK8gvcR4E/XvAT+v3TCvMWw9PiYEKhB+KmxDAQPEIGZFjptPpqsgcF
BCkABUuuknAx4Hl9OaqwrmezyAAnTZorIQUO2RYGk0pydiXEp5wvB6OREdxsARax
CYCptB747v+dkTUZ3ieoJeqj++lMpwH08jqydR3vIstJ7/mZ8YWJLxh/yIX4ew8D
XWj5VXFhleRi+AkfoV5ZT1mkJ1nZcUVMZTExhigkRYLipuyxjfbpwrlOwnpeBB2u
hj7gJ6yGxSlZRCr/kUXxBt5lHKe4677babpk1iQDXcyHK+EgXfJSbwu7K1FDXj2C
b8bWTaPgk8U8fw83BEtYQFruUdn2frsxSRex+qEmLdCHuLW3OCh//8sEbQ60vOsQ
h8r27tRSssN1RcQS36Vhrh8lgtR1ikXZnQfilyp+QSukd6BMMt4=
=jlLR
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
