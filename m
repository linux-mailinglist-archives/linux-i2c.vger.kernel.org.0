Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1931ED789
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 22:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgFCUlu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 16:41:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:37318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgFCUlu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 16:41:50 -0400
Received: from localhost (p5486cfa5.dip0.t-ipconnect.de [84.134.207.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FD0B2074B;
        Wed,  3 Jun 2020 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591216909;
        bh=SwtQdzOor59+vXHd3f6F9lk8585uAp3wtylcBGqMqQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kO8cFCe0Q0Bfo2MKvweLEp18Up8QwwJUUfy0MLA+laQLkKmkeSp8Hs9F96LhDicLo
         KkN0wFE4WPkjAVyTAoNUXcGBpqBt/3TVfieXaFgF8SfkixATeezzEOOwQzJE+dFslx
         e5dDGjeVYpL9n6tZ9xCpzkQ3js43EwtVQPhDGIOM=
Date:   Wed, 3 Jun 2020 22:41:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 22/28] dt-bindings: i2c: Convert i2c-pxa to json-schema
Message-ID: <20200603204146.GB1347@ninjato>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-23-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-23-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 10:39:16AM +0100, Lubomir Rintel wrote:
> A conversion of the i2c-pxa binding to DT schema format using json-schema.
>=20
> This also cleans ups some errors in the binding: The compatible string
> description suggested that "mmp" in "mrvl,mmp-twsi" is to be substituted
> with a processor model, which wouldn't be a right thing to do and indeed
> nobody seems to have been doing that. There also was "Recommended
> properties" section that included optional as well as mandatory
> properties. Missing mandatory properties were added to the example.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Waiting for an ack from someone with DT-YAML experience here.


--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7YCwoACgkQFA3kzBSg
KbbJvBAAhOSQEJ8IukeodYEjHMpjA4Dcx5fvpBnGvrxXQBvSIOKYdNTW/I/RitM2
80cJ6nuKvdFbdxDZkK4QjMuBSMmhi8AgafJmuAlBmEGItG7pElyjQ90070ISZDPD
tVY9epZq/e8RtcYayajUN8saNIdDpvGNeEdFn6t7aLa5Sww2SpfgtkIlozOp44/6
Tf/fjBd9Ml87SWjsIwW1f6w0dQiF3ib6oqWZXE8fxH8v6LUs8M0mE2hX23NjttP5
/w8oAV3OqgVGMn/ydUOtmuLRzBqQ8ONO3+pG6h8lYAnPuh0ZGmpaV0RxigcJDGSd
yTAob0lzrFXKSkQ6Kl0keFn8aC9F56OknDWMf3wm8OME85QCls7fzeAwZhEclyf5
NrSyInNZq0xj1JQjIkagcWSmLyWu+e0Er09iVm5T/6eqUm6mElu8VpOVkiIrlI9e
4FX7Yj8D1ucGJzgiLN8lYzUUXMl78Ym+U9Il5h3fOP/FKINTq2bvBKxjpmHIxbZb
sBIZPdGdjNSwZ5wA4Cf01Wy0ghmMuKNVkV6IDFXmLIjszXAA3ZCX+kBFyDuHWir/
TqkYPD+GYP6n9f+xFUlit6Kf3Pv6tXxVBnyWsS0k0LyB3dGTV9dp2d6MaA3IGP5n
m78a0tAD4l4HN1oWcH/QNOUH5YV4ZdWonkhaHbJYZiCcjtRq+lE=
=Qlp8
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
