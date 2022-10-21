Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A317C6081AF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Oct 2022 00:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiJUWdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 18:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiJUWda (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 18:33:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81592AD314;
        Fri, 21 Oct 2022 15:33:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69253B82CBE;
        Fri, 21 Oct 2022 22:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4070CC433C1;
        Fri, 21 Oct 2022 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666391607;
        bh=g5SUbc3dxCone79caS0M2AEu5MpWd5JFL171Tn/U2d4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YtT4bLoLT3AdAlNhZAuWY10vexMQTJrTFgGjHybRvOmmgqCsx8pKtm0zVkueeQbLC
         K1m/sojgD3EMuFX/rcQI58EnKk68AVJNtO9JiMKs/6ZwTgDRov4jmgc2ydvStn23ag
         GvR7y/2LAlBe2M1nuLAhW5vkosztclzcGnUgYIgwqC81NmFmc1up42azXQpER9T20A
         CLWBmZzb96celcpPnCzalJVcG3hOZMKp8B00T3IhYbMWjwpGhvoTMm1M/b4lZzePg3
         YQlPgGhd1URgg6MqJfR9Yeai00VsTcYaYL1I9dJTOVXHN4hE0/5hMAK8/MoHnqxz4X
         OUGBYYU9we38Q==
Date:   Sat, 22 Oct 2022 00:33:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Message-ID: <Y1MeLqsE2fggyhzU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q4IaRr9rlP9eixcE"
Content-Disposition: inline
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q4IaRr9rlP9eixcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 10:27:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--q4IaRr9rlP9eixcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNTHioACgkQFA3kzBSg
KbYeNA/9HlDxIncjyh8NS2x57Q58pKmrahP7tNy2sriAnglRPdeXjkmitx/PDnHg
bIozZCPd20DhLP05iEjhC03Z+mkJJjnjo+rhRpAKX8NlI1+pvJXTmfxiAvwkIU3b
Ra+7NbDwBKiltZo/jJ7QNRjr6bWyZCLx3/0VIEx/ILC+ukZen1jdsJhdPD1/X1b3
RiA8N9L3oPIcLmesbdb1HDiF5iD5C+2baALIuBeZ9xXwF8uFSsFpq4Qn1/HgpJFu
AP6+2ksTWEj7H6ARmXOA/u6frOxsWH1kahCSTBB0dtX0gSarueTzo0FxEQsyhkAx
dgtZB9qGsy7A92ya7u69s+VLgXQyEH3C+JOBW8Ww+faoCz2nk3VFqWjwKy8kqCil
wgbEHv9oPuQDtlP2lw9ApUxfTkWIWp3v1EfZ7dALMcfSyMjh+kGcYntEhMlD1u3V
lZrp9wbt5yJoIZ18mFHHbaiVCdcEjwn5fvLHSQ2znhLiyBT6pbWcC7Is5xb2hiF7
Rl6+VuLynCXX36g/7J8hFkwcKZIa7x95++ksHb908o4tjNKX+6oYSKdbYW1gUhxJ
yUNJs6W+HsoC0DFOWt71wex8PgRwG3HGkxBKDkd5dmLDcUYlLA9xENa6fH5MVdHI
37v4yvkdM8L5yq07lG/mJkHC7C/7+kdZ/ahDQsSuIdcAoV1dIPc=
=za7Y
-----END PGP SIGNATURE-----

--q4IaRr9rlP9eixcE--
