Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C303F78018A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 01:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355999AbjHQXOc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 19:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356058AbjHQXOY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 19:14:24 -0400
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Aug 2023 16:14:15 PDT
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552E535B1;
        Thu, 17 Aug 2023 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692313654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=olil0f2AGt0apD2/rszLZhWeMQ7T8LQJsK2l2NxohTE=;
        b=yGexVlzo/UYFHsYk8QGjSVf+ut9aOVbESjaThLmwUu5I7wkffPOJbEa2PoKhosTCAd0iTL
        37oYhmmuNGQYAPLPjGSgw+oS3ZssCvj5nKRdyjoxfThuOT5zzxHuz0HD7zpa8Hx6OBcf4g
        4faJEHI2DDCcTdXv/9H1XbRefDm/CA4=
Received: from [192.168.43.126] (37-170-51-247.coucou-networks.fr [37.170.51.247])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 4f503b14 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 23:07:33 +0000 (UTC)
Message-ID: <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net>
Date:   Fri, 18 Aug 2023 01:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Content-Language: en-US
To:     Leo Li <leoyang.li@nxp.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux@armlinux.org.uk
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
 <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
From:   Yann Sionneau <yann@sionneau.net>
Cc:     linux-gpio@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Le 17/08/2023 à 19:30, Leo Li a écrit :

>> The devm_pinctrl_get() function returns error pointers and never returns
>> NULL. Update the checks accordingly.
> Not exactly.  It can return NULL when CONFIG_PINCTRL is not defined.  We probably should fix that API too.
>
> include/linux/pinctrl/consumer.h:
> static inline struct pinctrl * __must_check devm_pinctrl_get(struct device *dev)
> {
>          return NULL;
> }

So, as Leo pointed out it seems devm_pinctrl_get() can in fact return 
NULL, when CONFIG_PINCTRL is not defined.

What do we do about this?

Proposals:

1/ make sure all call sites of devm_pinctrl_get() do check for error 
with IS_ERR *and* check for NULL => therefore using IS_ERR_OR_NULL

2/ change the fallback implementation in 
include/linux/pinctrl/consumer.h to return ERR_PTR(-Esomething) (which 
errno?)

3/ another solution?

Regards,

-- 

Yann

