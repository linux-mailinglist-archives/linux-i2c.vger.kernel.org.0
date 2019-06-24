Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290E4504C2
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 10:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfFXIoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 04:44:30 -0400
Received: from sauhun.de ([88.99.104.3]:58792 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfFXIoa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jun 2019 04:44:30 -0400
Received: from localhost (p54B33083.dip0.t-ipconnect.de [84.179.48.131])
        by pokefinder.org (Postfix) with ESMTPSA id BE0FE2C0398;
        Mon, 24 Jun 2019 10:44:27 +0200 (CEST)
Date:   Mon, 24 Jun 2019 10:44:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c
 drivers
Message-ID: <20190624084427.GA1014@kunai>
References: <1560796779-17117-1-git-send-email-info@metux.net>
 <20190621211744.GC950@kunai>
 <c669a041-f025-693a-492a-80ce888db737@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <c669a041-f025-693a-492a-80ce888db737@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Okay, what's the correct initialization method then ?
> Just convert it to already existing module_i2c_driver() ?

"module_platform_driver" you mean? That's tricky because it can
introduce regressions easily. I had one situation where one wanted
subsys_init and one wanted module_init.

The correct solution is to fix the boot dependency in the affected I2C
client drivers. That definately needs HW and thorough testing.

It may also need something better than the current deferred probe. Big
topic.


--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0QjWcACgkQFA3kzBSg
Kba6KQ/+IrEzoHbD83+bm8LnEjqeS/uxQqdU5H+QGLisgt8JNWkTX98cpx6LRTex
NiAXDmg6yvZxOew2cB+lTdcbs/4N9BhTdRlYpCwpT+f28udsB1eeKRVWmQRfI1Op
j9sVIIK5CyvIKfnX6nNYKplz1Hiq+5Plstigjqu695n78nLhKPFAMNvIOi/3JuQq
Pcyy9AAxFFU6stvxLb6jtFTW9IMK6NYy4UUQB/b5CGFdAenmdrFbQyHZQq6JaU1r
QigZ9wafmD/nUCXy5yfVAU6Fe14+OZyf+r81eKK8Wcsa4q82eLMjXmSAMe1xestF
1NNDy8B3/vr5B/pgfjNu6nIwZ+zkUDZxTdMULm0tHgbNG83ZDhafVRbkuhBaDmeU
7d/y7+zDeZh8yDNGh7G6N++Y6CDMBmK5hpoSAf6vixQNp3MJr1qoFU6diZlUAtIc
MeFj18lSRF0sjzxWAYA6Fy64zA/1bqpC3mR+rOqCeK6Lgv1TZ0+VY7CQMfbx/5MH
4MA5bDKacpUoL9FGS6JZl/F+HteIuTP1YYXkaiEk/utUZCB1pdv4F5JWtIoXs66w
U5W+FprEMJRGuf51YRXcr43FWCm13QhXUDSi8qN70dC8UqGMvf61jW8MICskROx2
Af12uBnPkqsS2OanoYNdnQJvxUWQaCJKBXdla2j3vQHDo4KxNLY=
=PWGk
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
