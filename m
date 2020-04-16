Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBBF1AB882
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 08:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408595AbgDPGvd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 02:51:33 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:40643 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408565AbgDPGvb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 02:51:31 -0400
X-Greylist: delayed 492 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Apr 2020 02:51:07 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id C15CD717;
        Thu, 16 Apr 2020 02:43:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 16 Apr 2020 02:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=eYZf6ks0Ag4vWkdY+FBeNSBOYxZ
        kZ9RWoI7L/wXDw/Q=; b=pG92PCpDKEaySEE6b3KK5owRlyOg6omtcBJRh6H2P9g
        A4+dSJ8ZhNWYumPEo8RSeGX3Y1ofqBKY5EwBKyaQ4uWCzw59hiXAUOxV0z1366xq
        iuHHZUldbuzXYDjsaxnBz0RsGbyN9Oo/wuSRdS/D5gtGdR/DOID4nUO++5rp07K7
        LG4gEmPTqHamlJRrP5V34H6lR2pNC4zXGMW/GSE2CyOUmLq5FhAQ7reYixyNSF9S
        Sk3l1mb29qIgPDMYY0/5m7I+DShBoF71j+C3gAVSuV2Nq12oir1/bimsDQytaFI9
        rw3mdDAsOxKY1bvJX6PjvfGpx+6c3IrKClpgJXpZ0wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eYZf6k
        s0Ag4vWkdY+FBeNSBOYxZkZ9RWoI7L/wXDw/Q=; b=Ybg5/gOxzIy3RezsVgMA1k
        TNS1SpWdG/vSznxDhwvoLrldOuulzJrzOesiyd4OdIPHp7Pvdeido6VN49AZFJjX
        vpbJjlQnZcrl0XVEenAR8HUbxv1iPLz1X4h7y0gO3Y8YvGQ+Gxco5vWU8dTZpAOa
        BZauQ/RaI9M2F28kXPygdaAyXtkuoiRko9nhnLAnG7Fj/vpriF3MX/GnDqw3vD54
        E2nE7ygWUQnJK7D2pMU5A92RDAXmSDVWG2auXATUw58gux8Zcplt8XXxS8uZEPyq
        dwoVwWzcbh8nau5x1J4Tli8kmRSzPV5DdHht5f7hGV1AlT9ldV7F13ym9Jw80idw
        ==
X-ME-Sender: <xms:lv6XXlbZsjXCgRSobpV_OahNA0F2bAh_xQnNz30ENtpJCk6C2O5pKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lv6XXtpOixejZqr7iO1LBzaErDc2trud85HnQReIvup6Nj_ECC1-ug>
    <xmx:lv6XXtQpwDnG3Phz4jTAefVSpE0PDruqeQW4tMGm8dv07y5H0bXPXQ>
    <xmx:lv6XXhnZDnOcsLKYGPwKo5ewvcFCHv464DpLD_f1alqPkiWElJ017g>
    <xmx:lv6XXk2v6et9oVVZCGJreRdM-Z9u-aFhl26_bHzMhmr4x9e7prVi_X54wQY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D7E56306005F;
        Thu, 16 Apr 2020 02:43:33 -0400 (EDT)
Date:   Thu, 16 Apr 2020 08:43:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416064332.cbtmgnbwjityninz@gilmour.lan>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wl56qmwukpbi7dfb"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wl56qmwukpbi7dfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:49PM -0500, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For allwinner,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wl56qmwukpbi7dfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpf+lAAKCRDj7w1vZxhR
xfXZAP9GMb4mpNd2CMjZwk5BxMrLzEIpKJTiQ4orqceXOWVHrwEA79RK8mnQLFzA
6mFAQXdPtJjk58zdTQSSSDo30M+OtQk=
=foV0
-----END PGP SIGNATURE-----

--wl56qmwukpbi7dfb--
