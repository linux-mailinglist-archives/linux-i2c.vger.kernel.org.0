Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3235D753494
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jul 2023 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbjGNIF2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jul 2023 04:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbjGNIE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jul 2023 04:04:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F8B44A9
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 01:03:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso2783432e87.3
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689321786; x=1691913786;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPlbjouEMCmtmH35L0gqCQg6vRDnBuMdkZij3f/ssMc=;
        b=bhP8fYX9dEU6bOySzvgHG85Mf+FRPQJ29brY+5xL+9sI6Zk2L1zBr7GTr0g9agHgYR
         zIslyE+apPJK65b1dc3D7F59KuGXOq7xmx/CQQP2zLBp/0lFfVRs+t0U05eDoFEIDJnF
         0vx5nFx1lVNtV61P+85zRE/yms7crKlL4Ab7LXl4Xn7wwxcbAgFvDMLSKNSm6ie9qxZz
         jKZkhqrT2JoOR76B33eQ/FE6leBS2sTEmJgMrDMqEU9CHgDSAIuoztc+0ACZfmw3IysD
         /RwHIHWrrtUwBoFLxJYQTBQq823r4UbGZjCexmAGc9QOZmPJwD9z8Rm4Bua7DljOpD2j
         MU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321786; x=1691913786;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPlbjouEMCmtmH35L0gqCQg6vRDnBuMdkZij3f/ssMc=;
        b=byqc4YBWK1m18nS+lL3w3dmpYP/25pvJxHfVdDR5zwqiTEy8ROqF/rbp0MmHNyn2qP
         whMl4Y7aQelcpd4uwJRmjAbU//7HCuLEnVLbRiLjOUuj4UQU/JlsNw4uh0lHVayL+02p
         sgLE6gkNoCTRtnEV1QX3RcOaw1kLZZCusdcGTglk+iZHNRt63dMlqdGqrvGdqa5MEed9
         oYcaHU4Aqr8SxkPFsmKJVsyrdmiaBmutKvTBgWxtBMoY+ufc2+o4edIAxQ1/YXOlF5CA
         fwassLeG48mvCfIMu5r/l20pOMfbVlYwLAWlXdr+PkIwlXgIv6Vsu1OdJ1xcufiWwnQp
         f2cA==
X-Gm-Message-State: ABy/qLaWHzkqlwQKMx/rWhTeVxu+c+Pp3nAHBwVapzo10E7Hwl3A1Ewu
        LfWUAGCuQxuxNVJhWh9dUG7FSQ==
X-Google-Smtp-Source: APBJJlF60HULCfG7k/5a41y7t6j2dZdb5LzfuFbVWl51hjMtFsl7R8EmVJR0j5t4/VA4mA94vdHLYQ==
X-Received: by 2002:a05:6512:3b90:b0:4f8:7524:8431 with SMTP id g16-20020a0565123b9000b004f875248431mr3592714lfv.44.1689321786367;
        Fri, 14 Jul 2023 01:03:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c24-20020aa7d618000000b0051df1797222sm5427691edr.11.2023.07.14.01.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 01:03:05 -0700 (PDT)
Message-ID: <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
Date:   Fri, 14 Jul 2023 10:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Content-Language: en-US
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, =linux-kernel@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714074522.23827-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/07/2023 09:45, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

...

> +	ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	i2c_del_adapter(&i2c_bus->adap);

I have doubts that you tested this. I think you have here double
free/del of the adapter.

> +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
> +


Best regards,
Krzysztof

