Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6236909CF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 14:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjBINYf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 08:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjBINYf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 08:24:35 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592C55357D;
        Thu,  9 Feb 2023 05:24:32 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 830A73CE;
        Thu,  9 Feb 2023 14:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1675949070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nStzcWGawBN+FFQgxCUoGQgyi6tWKaLoIEQNCXCbs5E=;
        b=CAOvNc++i1yy4bn7QWCkKmOiAPRZaT3Sf12XY3NDahIE5g/B1IEQChLnqr9Qt6YueWoblL
        iCx3r+c5yyGfAlX7WteUBviEtl8TY5BxRF77in/7CueN/fVxYo5HQ50CgVRSZJgiQYX2yB
        VdsuKMaQmzy7LRDtELuj5bDLiC69U28alewBt/a68Ql6g/lojCAlXFcuSlVnAxP8JadodR
        C2+WMdB8A9tCyJ+tvF25UqXEt2BZzNLI4Lm2iqU4Mzo5cO1tMzFziJherKOjINcSYOjVEP
        zr56czSyTIE9kNa804vAUv48gWDNobclBtWmJ414Z2NQ3tEPAqesBBC+JScGwQ==
From:   Michael Walle <michael@walle.cc>
To:     linus.walleij@linaro.org
Cc:     Claudiu.Beznea@microchip.com, Ludovic.Desroches@microchip.com,
        Nicolas.Ferre@microchip.com, Ryan.Wanner@microchip.com,
        alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
Date:   Thu,  9 Feb 2023 14:24:22 +0100
Message-Id: <20230209132422.179674-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
References: <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>> My main issue is the process of freeing ownership of a pin(s) having
>> another driver, in this case gpio, to take ownership then free that
>> ownership back to the default state, in this case it would be back to
>> i2c.
>>
>> I have tried calling pinmux_disable_setting() and then claiming the
>> gpios then enabling them for recovery then disabling them again. This
>> causes lots of warnings and some cases the full ownership is not
>> transferred.
>>
>> It seems that what I am attempting to achieve is not doable currently.
>> Is this the case or am I missing some extra things needing to prepare
>> for this action?
>
> There are several other i2c bus drivers doing this already, for example
> drivers/i2c/busses/i2c-imx.c
> 
> The idea is to have some different pinctrl states and move between
> them explicitly in the driver to move pins from i2c mode to GPIO
> mode and back.
> 
> The imx driver depend on the ability of the i.MX pin controller to use
> the pins as a certain function and GPIO at the same time.

But that's because this is a limitation of the imx i2c controller.
Usually, if i2c controllers don't have a hardware bus recovery (which
is broken in most designs..) they usually have an override bit to
bit bang SDA and SCL manually. Do the microchip cores have such bits?

Fun fact: also the layerscape SoCs use the imx i2c cores. It's just that
layerscape SoCs doesn't support dynamic pinmuxing...

-michael

> This is due to the imx pin controller not setting the .strict attribute
> on the struct pinmux_ops so that pins can be used in parallel for
> i2c and GPIO and gpiod_get() will not fail. But the Atmel driver does
> not set this so you should be fine I think.
