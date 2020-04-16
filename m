Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089D01AB894
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 08:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408634AbgDPGvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 02:51:52 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:32963 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408571AbgDPGvd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 02:51:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id BE3AB7D6;
        Thu, 16 Apr 2020 02:42:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 Apr 2020 02:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qCRyzl00MQBivzL68vkel39NEbd
        7kC6dFuyLRxBAey0=; b=Mz6xjOhoyl6u3JLJF3XNH/WDRWC0mCT6w/uiIwB8GXd
        UpxsH9oudz3X48RMKQfGJbGVDAHug8ZXney1LdfZdZRq90LqW1W0/A6iVYMtK1mN
        EU59olTzwMNiYltMNJBPysQF0H63fbn5e/tsDm+LApzpl9Y1Sw18AZHKdzIsmaEf
        9+M1vvWOyW669ZVwQQ7awZo8Cj7vc6UYa6yBhQm8s+v3rqgHnFf6xakj6sV5HtJy
        j8vNj53XWuWvnoqroGZji7jvJbTKs9v3cgxRMfEEZdJgii7uQdjwtKHH0A6lf3I6
        8ffKsfT/ph6VFQvi+fA3JKKLi4LFnglOMoqGVSlscBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qCRyzl
        00MQBivzL68vkel39NEbd7kC6dFuyLRxBAey0=; b=eMPRhPF78n2AJHUnF3n8N7
        nDj6R2uaCMywF1zqUJb8H41DWXRLIqM1X1ixKQ+5du5Sep0O62e5Zg70DW4miS5c
        q+6UZlgUneRQ5zBCZRQTn2+qXHpcWSINUMIVtTQcMv4fBlmNQ0cDxvod+yis2IMy
        Qn9LgZrrIPxvZU1tIvrIvajwPmKsY2XzJGObIt+ux8BDMn9VQLisIuN1sQagIjTc
        2yVfkg9fn7+7uqJ5UWxMBZLYc2drb5gpFG/CrUVannsfz1vkv8nOhZz7tV+2yvw0
        Ini85WXCVW9bOz1VY1ANTmk22DTeHV41NcnSM3ax/Ybs4KlWFUPVQUigEqOYYq4Q
        ==
X-ME-Sender: <xms:ZP6XXpgBOuLk6y78w-8QXnLsPxfPb8tJCQV-nhCw3w9E3J6Z_6umzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZP6XXlHUnHhPoyiEoNq4uvG-eeIU9F7rJ3L8YM4tBAlhX9jwZlg92Q>
    <xmx:ZP6XXgxO_UPW-eCgOnJDSb4q6E6_zvBdAp-UhPR4OHFshAivUQ-klg>
    <xmx:ZP6XXkq3F6zITJzf5EbL-eKRftc0jlz2H_3d673Bq8y2Zr17XFw4_g>
    <xmx:Z_6XXi9WoWOt_JDiBWjK2eTP19mseq86rp4c8pS9eo_D669xJmpieNKZPV8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 59AE0328005E;
        Thu, 16 Apr 2020 02:42:44 -0400 (EDT)
Date:   Thu, 16 Apr 2020 08:42:42 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416064242.azdjulo76ymwgpfq@gilmour.lan>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s675c5ai5d6avmtq"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s675c5ai5d6avmtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For allwinner,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--s675c5ai5d6avmtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpf+YgAKCRDj7w1vZxhR
xZmqAPwLCqvPnd6KBgcsRgWmwe8BxcsE0xhduyc59wNSaliiHQEAhUMizDtya0EL
yGrmpfvuS8/nRsvbMHGM2twyMWfc6QE=
=F+e6
-----END PGP SIGNATURE-----

--s675c5ai5d6avmtq--
