Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525D828401D
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbgJEUDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:03:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729424AbgJEUDD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Oct 2020 16:03:03 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F4C920848;
        Mon,  5 Oct 2020 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601928181;
        bh=LDBMzSKRgXu0amszn1omwesfIy1frb2RvkSUHKCGJBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DbgBQYYNY8Z0bctQfKlo46vuzwcO7cAJTUA6WI13L1pEYpu6vA8L99qk3PZzFWPH2
         fgJHuHFAkVTZdQ53sCs+i/L1PeWZsSHlt6UaHeg3IMRhnUNJ4vPDlRp6puBpdniGsC
         UK6eoAqXgECVDuSR5AsDUKOCMwvFsyrqkopv5GUw=
Date:   Mon, 5 Oct 2020 21:01:58 +0100
From:   Mark Brown <broonie@kernel.org>
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
        Marc Zyngier <maz@kernel.org>,
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
        Sebastian Reichel <sre@kernel.org>,
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
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Message-ID: <20201005200158.GG5139@sirena.org.uk>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:38:27PM -0500, Rob Herring wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.

Acked-by: Mark Brown <broonie@kernel.org>

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97e7UACgkQJNaLcl1U
h9Cm0Af/WUxMT7VSA2xsxQr5K/rX2H6z1aD4Hr9f+lQLJCFBiUYhNvb9mQnNDvLq
GQeaW1Z1gDtmjIiEOvan3CP1ZUF3VENvyt8orPUmES76eFXx7xEyryHHut1YFimr
3LEvyKzDAcn3KGj/wv37knBc5sifrmqjF+Y1eYYZD6yKKVPbgpA7kKZ0EAqOLxiv
/FbGoxWGWbB7Vfyaboo2dDw/SyuwkZ9+0pr+IhFWbCjIjgkeUq0v857luuRCJMxH
GyPjPkM7+KaeIBbXlY1hRHLTKKbBL7G+dXQ16uS4Ny/DYIf8LXyitPDAfosxQisG
FhLawubQBH3MNzD5RRYvcLznUaJJJA==
=+I0x
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
