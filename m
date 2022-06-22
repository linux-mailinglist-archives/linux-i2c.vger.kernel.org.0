Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC77554814
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355551AbiFVKg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 06:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355402AbiFVKgx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 06:36:53 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FE13BA7D;
        Wed, 22 Jun 2022 03:36:49 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o10so23263128edi.1;
        Wed, 22 Jun 2022 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
        b=C60jruRIr3l7H20jbT6Re8q4TAOBzwgoJniFeCwP9jUCkCeFfZSyKWDXzuiR3+WsFk
         iug9mCtL5f/362puhR37XxfXjPTn+feFC8tv5f+bUCGxDr5RecoUaz5WL/iKgw40h3f5
         nRLlZkcl+Cgcr2kX9I7VZkqGcpVV39vi0d4feUx7Mg7xkPeRevq2RrFsFeI4kgEh2RbO
         1N8lkUgvGsbvP6nJ0yewhGBY+YbTQLHkQCH0wrxztTUCL3jR2tFJCgJ4iW4RmvFKBM5x
         9Wx0qhacGBBsF/oQxleSmTbsTojFMMwK1Y3Znaa7mITTI9ctZr+bJEAD7fH9uR2Py1m/
         LCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
        b=JUQkFuw/LJT3Zo+3RWVoPZFiD2r+ZQg17eyslr5kTL99ME8uvUy2BSEWuIUEBpx+Ju
         5lgkWlveEWsfYs147upTOC8HupaMjHP3uTE3A4wji8AeY3atS3UnXWMtbGJP8uO7+aZI
         b74tRwChr9xVkcZsQIyX39BXUzK2/Jy9rVSj5IpEa/fgr7U+sqNWqNJmOMpTaZ5BuT4y
         kf+tGjg1l3SmsN2QleI70t7hF5P555BGdBlhsSaC8ui0NzV+WrdzsUFdihe0DEmvVdkK
         tv8DMP+r6szL0EAIqsbNaYcUJjHK0VqEzfvQU5AySASWzRKDye8DpG51ZK8E1G+Tb9AJ
         PIgg==
X-Gm-Message-State: AJIora/JbIdlBFYOpg7Dm/7Z1IHgTL1xejn62ZJ6PGGBQCvMFfI1S14t
        YVorYM/L8RLtE96StQo1Et71XIdRB3bDUjKODnQ=
X-Google-Smtp-Source: AGRyM1tnnFr1LC7h/zRLo+HkB47D6IcosyajAFO4R/Wl+PPHAqyQruG56xeyLIJB7dGNj2Z8gyVtab2tS/XsOjguV9k=
X-Received: by 2002:a05:6402:5002:b0:435:1ff1:99ee with SMTP id
 p2-20020a056402500200b004351ff199eemr3312157eda.230.1655894208315; Wed, 22
 Jun 2022 03:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de> <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jun 2022 12:36:11 +0200
Message-ID: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-iio <linux-iio@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Andy Gross <agross@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-pwm@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>,
        linux-crypto <linux-crypto@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        dmaengine <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 21, 2022 at 11:01 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:

...

> (Pro tipp: The commit in next has a Link: footer. If you follow the
> link, you find the thread that was actually applied (i.e. v9) and where
> the fix is also contained.)

Even easier, you may take a message-id from the Link and supply to `b4`:

  b4 mbox ${message-id}
  mutt -f ${message-id}.mbx # or whatever MUA that handles mboxes


Dunno if `b4` has capability to parse Link instead of message-id.

--=20
With Best Regards,
Andy Shevchenko
