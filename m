Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FBE2841C1
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgJEUzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:46660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgJEUzt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Oct 2020 16:55:49 -0400
Received: from earth.universe (dyndsl-095-033-158-146.ewe-ip-backbone.de [95.33.158.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8DB5207EA;
        Mon,  5 Oct 2020 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601931347;
        bh=RauhoP+lY6PB4M6PjyFmPFjt0my1MIgv0r1A7kpjI2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HkOPmEqswDfagOwa/8h6eYeJ28nUpx4kzUzMEiO5C2WpZ/JyxwPsMpOCvfalXuv/N
         SHdwGJl0wavO+zZoAFWHwvQtMiirhu1+TeuQnuYzBjE+S+5qOuOKtkPXd2EjrwLySS
         ddJlXztUaG/j988mXtEhLvSqV8GY7zi9RJGnOy4s=
Received: by earth.universe (Postfix, from userid 1000)
        id B9D193C0C87; Mon,  5 Oct 2020 22:55:45 +0200 (CEST)
Date:   Mon, 5 Oct 2020 22:55:45 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201005205545.sqvohrh7jpt7w63w@earth.universe>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7db5qni5yh4rtlce"
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7db5qni5yh4rtlce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 05, 2020 at 01:38:30PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  [...]
>  .../devicetree/bindings/power/supply/power-supply.yaml       | 2 ++
>  [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--7db5qni5yh4rtlce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl97iEsACgkQ2O7X88g7
+pr9vg//fpVYpKsaZc4pw203Kmzwve+W4z3OPaQS7g1Y93QHWykKxFYpCgOrbmA7
Ikwy3xwBLfMhPIUs8KZDsiaLVkKTi9XJifhEKiG4Uz772vFOZqAPgskcT6Sx4+iN
4lqd7WmgV3hGelDss8qw6dQ1FY0/MHuMXvoDeNHTvqi0ZhttRrQmOEO6spkWL1io
39Au/Pxbh2dK06Y7Y0qoKlqCKxnL4fWlUjFqJkJI+d4LjK/XYvukOTPmAhEYfP2H
tZ38WZd/3SxwQD+Nh6ZJCfKC54D00G54g+fkxhaiypSSgI1IPWfIsrqPfPnVMowq
wI2fo/C10LMZ1kqUi/LCW+OET8aePRkYjUMWZ2GBNRY9MJCJH/WkOPy7PaKHrOfU
EdJx9OH7guvFWaEJGhClazwYS6QkM8CEKy7Nd5nJTeQOBEg/p2Lb2etNPNq34nju
o9euArIjrnqbHK5X9Ijyvhaqw3bxsVPmPkOGUayDMB44UtwHNFqIosmboJnkJ6bt
BGS1zVnJs2sdLMqMZcCwfHGoX00rThZgvCACDas7fVEdsZgtaEnCW8aySbWCKPdY
1gtR+xdosJheKba+kMxfhmR0nm62rAmJvS9XOZaBY+cveye5NtC3kvk+Al5ixucd
jYmH3Iudn+0hC44ZPGUl49YUa5cwsX8NZlyh8ItyWm/x+WiVyb8=
=9y9P
-----END PGP SIGNATURE-----

--7db5qni5yh4rtlce--
