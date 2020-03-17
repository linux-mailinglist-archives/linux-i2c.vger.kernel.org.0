Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0468E188529
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 14:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgCQNTJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 09:19:09 -0400
Received: from foss.arm.com ([217.140.110.172]:38088 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgCQNTJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 09:19:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCF330E;
        Tue, 17 Mar 2020 06:19:08 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B9523F534;
        Tue, 17 Mar 2020 06:19:08 -0700 (PDT)
Date:   Tue, 17 Mar 2020 13:19:06 +0000
From:   Mark Brown <broonie@kernel.org>
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
Subject: Re: [PATCH 00/28] DT: Improve validation for Marvell SoCs
Message-ID: <20200317131906.GF3971@sirena.org.uk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2020 at 10:38:54AM +0100, Lubomir Rintel wrote:

> None of the patches depends on any other and they can be applied in any
> order.

For future reference since this is a large set of mostly unrelated
changes it'd be as well to split it up via subsystem or something so
that the CC lists get reduced.

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5wzkkACgkQJNaLcl1U
h9B6lQf+JamIVdYxjeWpJEdZLraQ2ZAnjCDDODoguz6v4CAvK8mbvceAlz/ugLsK
mjNdEb4Z3nOWKxnpII99UfKyDb0s1EhYcovC0vJ71uSHJA9fIFxtnvxk9YSEP2Cd
nfXaYzDl1OJJ3DRJXCrudH/j2dwtX2hGBFjIx/havnLkr2dwzfUzsI3uUSFAWwgt
mv2uHQwNP6rR230/NWLqUPNN6/Gal8/4Pj2cAimegQOFW7493PQQKHoG9JttRQgC
PGbYFjB/JV+gk9Sg4R+afcEFHQN7D17H/Lb+HwFPu6+jWqgUEdLgSTOyELAXnamE
me5/+eb94GmNyA3atUU9W4Ju5o+joQ==
=WksN
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
