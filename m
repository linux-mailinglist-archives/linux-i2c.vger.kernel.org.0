Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440C17222F6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbjFEKJK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjFEKJH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:09:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC008E3;
        Mon,  5 Jun 2023 03:09:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7165B6142D;
        Mon,  5 Jun 2023 10:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A84C433EF;
        Mon,  5 Jun 2023 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685959745;
        bh=vR126awxcUVwkB+vDMvPtCpzsX4o/jUNFWue4cfisK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jGzB5Lk8x9cx95oG26XZOnRJk3ecWXQXEE07nQpVPtV0ldNyjBH+HF+PE67Y7BaJJ
         Rr3ULQyt++0jpBkQcUB6dtzHGzTjv3M2ialKNinB+zPSqHMhJHjuOXl09E3kIINcDr
         ainCX7TdvicCZowvSKu0Imjn3a2HSe+PaHRV5wCbfibFHwmjxecOKX/pBzY6MMJVH9
         PRUd1U94/aMQLLs6h2roaIwCi2wKw54+JxUdln3ex3j1eeHU3sfXSFSi3sNId2DTA1
         A9TVGDCBa3pkug7NMMjLVIV38slENc59CTNhjtBV91E1BeYMtSxuqGpEoGjEOJorUU
         t+ravi9eHQa2Q==
Date:   Mon, 5 Jun 2023 12:09:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Message-ID: <ZH20PkU1WAqQ0rap@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@amd.com>, piyush.mehta@amd.com,
        nava.kishore.manne@amd.com, sai.krishna.potthuri@amd.com,
        shubhrajyoti.datta@amd.com, vishal.sagar@amd.com,
        kalyani.akula@amd.com, bharat.kumar.gogada@amd.com,
        linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>, Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m1s0pAgPK6Y5qfq2"
Content-Disposition: inline
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m1s0pAgPK6Y5qfq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 03:51:08PM +0200, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.
>=20
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--m1s0pAgPK6Y5qfq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9tD4ACgkQFA3kzBSg
KbYxkhAAr/KV+7eVEy7Tyr1buRUjnSFHfeoi92WwdiRkwD3KEgGd3CGm8RFiHEH3
xVJnR47Ii6/IU9NidYLsuN6WTYlCdGoQqY6ncEpZui1rIIZpJPEbHbw4IRrDEu+o
/wd/3S/y3VvGjvsnBK2sbBpTOb8N10Xw084aSJTmFz8Ztzy9mZU9ub6TFxMZhWK2
w0Unv2I6q+Yl0kEy05PAoEID7mXf33aFnz+j3iz0LtUU6nMQilQHdkfYSsec5c04
jirw6YLgK+VBRncT55L3XKpAamfUKU7o3DY20/pPw8fSlDj2Z0aQkHM1P22cKwNF
C1Q0epu85vIJVBW45SEBY7ccPLZuwjFNMl5Do8hRZGBtHJOxhqmRjOA3SWc0u4lx
txwo97w+Ux9dMlS+UJhD5rWGFfF+HHqxg+M71SCOa94kg2Drs+WLHXd1NgG1YEcb
FoHsGkzv0nvkBf0O6X3hd8tAdkks9l1370YbDSBvSXUUHxIefUNzEjvQVTdJUj0J
y+X6CigfCUyYdoscjH8rCdA7fwbxnbeX5zSSXKKp2coIAwEl7ItMx8h8QwwQzZB2
z/05V/3n4FekryCdpDn5/YH7k2rO6WgSN4L7n+8yDhjWtTwXPRB0XeomogN5CpGj
T+DR5iqEdJHfmWETr4Pn7ttnc/rvH5ak5U9raBF2+SYA5p/XQGU=
=PkRp
-----END PGP SIGNATURE-----

--m1s0pAgPK6Y5qfq2--
