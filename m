Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB1055489F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 14:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355474AbiFVLOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 07:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357125AbiFVLOt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 07:14:49 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333A83A1A6
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jun 2022 04:14:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j24so2194175wrb.11
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jun 2022 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
        b=z/ocsiUElwq2Ol2fF5l1HRqMMaNGMSC1/+8oQHLpQWLu429YrVBR/tnvq7KNWtwIO1
         vKJqA7rgUAiiGOKNdlwMjFurZAQLeqniaiGR74ASbDLlSriMOOzxItVhWE0QSvWSDF1z
         wnPR/hU6q/nU74KNLjXg2X84SJR1U2jxSqWO8a/x7jRbPZXjDqGeLFevtBezqUe56R1a
         7f0rlv+IRmpyGwRbiZXR3FrVvja2Yq3MOLg0mNs6za1kfz0V4uxdyGWKXZaA8ELytILx
         BDkiRFg7pp2SBYMObq/aoJYfogEZJWR+YhfycgXRStqMXxha87O37ft3cnQe33+/4mvE
         LISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
        b=z9cYq7he0x5Dc4NTHyA1VOa7V/YOlMKPENMLqE9Mcm74VkW2tRXxMbDwR5ZU4gmjZk
         jrvRRqn1YSseHiL+Zhr9x8vECYL8PE22zH6f9tZfWlEsslNcgs5e8NImoRm7PZjv6PmL
         1I07Fw4r+2AK+x4Oc7kEaiq8D455dHIlnRN1oWckC/PNwqI16Ljz2PnOXwurSURu8FU6
         CR1VzN6CRIwRRiiCWxiVLgHKOVbcz8ZBuxH6x1VKxgBtv/2rGsCOS226GB+erzrRw9y6
         4GrjnSx724MNlaNfQcBnCgyuam1WhC7kG4WiAgC9e73gSB/uBHJVOhh7W6a8yM+KVt2B
         MveA==
X-Gm-Message-State: AJIora/KITnHtFBf74qYzS9VDFYHCJtlTTj9Hna2epldH2F7Oo+npvOF
        sjjd8ic+Tjdy8lMRPakC8Hy/gQ==
X-Google-Smtp-Source: AGRyM1v8ZhY0hH8c8n7TvnmAfbU48Dyk1bFg4uJSDokafOQgQ79E0o3w+OeeG5ifCToe2pBEDS6Ykw==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id l1-20020adffe81000000b0021a3574ec8emr2726909wrr.410.1655896484628;
        Wed, 22 Jun 2022 04:14:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1a3a:95bd:5b55:a798? ([2001:861:44c0:66c0:1a3a:95bd:5b55:a798])
        by smtp.gmail.com with ESMTPSA id e16-20020adfdbd0000000b0021b91ec8f6esm7841714wrj.67.2022.06.22.04.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 04:14:43 -0700 (PDT)
Message-ID: <d57a6c52-a9e1-5660-cd47-6f9ba2389d86@baylibre.com>
Date:   Wed, 22 Jun 2022 13:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
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
        =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
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
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
 <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/06/2022 12:36, Andy Shevchenko wrote:
> On Tue, Jun 21, 2022 at 11:01 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>> On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:
> 
> ...
> 
>> (Pro tipp: The commit in next has a Link: footer. If you follow the
>> link, you find the thread that was actually applied (i.e. v9) and where
>> the fix is also contained.)
> 
> Even easier, you may take a message-id from the Link and supply to `b4`:
> 
>    b4 mbox ${message-id}
>    mutt -f ${message-id}.mbx # or whatever MUA that handles mboxes
> 
> 
> Dunno if `b4` has capability to parse Link instead of message-id.
> 

It does:


$ b4 mbox https://lore.kernel.org/r/20220616144915.3988071-1-windhl@126.com
Looking up https://lore.kernel.org/r/20220616144915.3988071-1-windhl%40126.com
Grabbing thread from lore.kernel.org/all/20220616144915.3988071-1-windhl%40126.com/t.mbox.gz
5 messages in the thread
Saved ./20220616144915.3988071-1-windhl@126.com.mbx

Neil
