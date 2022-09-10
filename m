Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0261D5B46A7
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 16:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiIJOae (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 10:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIJOac (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 10:30:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491F932A90;
        Sat, 10 Sep 2022 07:30:31 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso4170930pjd.4;
        Sat, 10 Sep 2022 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=NfxfbFr6yb0xol1xxFYNDP3VjWYzuHsl9L6WlI3ZH0I=;
        b=o8CJbWXfF7dDOkG/l5CIf/K/X51rljLp3Su1VTY6THuSv7r6HBvEecHssTHM10MXAz
         SMIRv61RSwPsKDY0NpAu1a/8WXreef5wZy9lzEa1Tlvzo4qiIgqLpSckinSbLPpGmKsL
         EwiXyjllU2nMgctHnqy9HkEHRPMBH784+q8IR7VxWoXuT+KHOceyVlmeYRVkvTcZHD7S
         0F7WE+CRClm3Sg58TTzZkougAJkCokbofBPu9qntooE6rBkvjc7aWuKjmWes01f5kgM8
         Rp0+peZSiyk8AqeSLwgtvnpxW87q7bi+pu+E+/OA5O0tWmP/AQCv+NXZVw9MjXpYLlCz
         nUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=NfxfbFr6yb0xol1xxFYNDP3VjWYzuHsl9L6WlI3ZH0I=;
        b=jFxFnPkzcJeejC+up4IjWHWA9E5VLgH8K0dEG2FYC+B2CLMpHuAgS1W9GW2sufJ1eM
         nnaNcHQXiqcUmCgBLDRy3esnFP5+xrToIid8nFnxY6AwWiQk2a4b+GL0SDrGLOJzBeYK
         he+ALcHKE+ThC2WXj5gANJ/7pnwFzC3sHrCjRNJcvgYyR0ymdgMD5ajlg95VrZfiNqJU
         f9eTsRyCDpVnn9oZMmwO+rUEqYQE+BiafAQsKBqe1dOzjme98+utn26VgQ7BGqS3zvKU
         D3B2a2jJkyVJNVeqLj7XQiivZ5XBhsZylywTqFbEPzRffPhrvdUY9WP2hBOpC/s9faYl
         uZ3Q==
X-Gm-Message-State: ACgBeo1ZolmKmE9mr4N6p5jaRVV5I7kxjlfzzaDt8F61ODfKjln3E6vv
        E4Htb15QbvAhTpokyuHPqlw=
X-Google-Smtp-Source: AA6agR45j1E2oUagm+srWFqub3Qu6YOOhrbPdG8/lVANoSphqwJKLExI6LaQWXuJkmIkirNUxO79XA==
X-Received: by 2002:a17:90a:a60b:b0:200:919a:55a1 with SMTP id c11-20020a17090aa60b00b00200919a55a1mr14980138pjq.194.1662820230702;
        Sat, 10 Sep 2022 07:30:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b00176b63535adsm2328040plc.260.2022.09.10.07.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 07:30:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0dab9988-3a7e-77f2-de71-58e67cc79663@roeck-us.net>
Date:   Sat, 10 Sep 2022 07:30:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 07/11] dt-bindings: watchdog: rockchip: add
 rockchip,rk3128-wdt
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc:     sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        ulf.hansson@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, kishon@ti.com, vkoul@kernel.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        wim@linux-watchdog.org, zhangqing@rock-chips.com,
        jamie@jamieiles.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <a4da79fe-3449-6538-742f-790835ffe43a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/9/22 15:01, Johan Jonker wrote:
> Add rockchip,rk3128-wdt compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 6461eb4f4..92df6e453 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>             - enum:
>                 - rockchip,px30-wdt
>                 - rockchip,rk3066-wdt
> +              - rockchip,rk3128-wdt
>                 - rockchip,rk3188-wdt
>                 - rockchip,rk3228-wdt
>                 - rockchip,rk3288-wdt

