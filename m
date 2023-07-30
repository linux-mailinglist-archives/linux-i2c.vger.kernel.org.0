Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421E47687F1
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jul 2023 22:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjG3UbD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 16:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjG3UbC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 16:31:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C467BE7A
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 13:31:00 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c10ba30afso106984066b.1
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690749059; x=1691353859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxg8TeRb0NZN4rPS9q09YPBYQiS+mNKDuiZUWy7sPoE=;
        b=T2n6ZC3LdIPpNjPMhN0clIMSRupAJ5wmAIrIV2AoJfro+kU5iA8/4yn42jO6rr69KY
         wlFKXo9FYxNLBpVmMuMD7xjD7OfDUHbdkDV5H4bL5F1gwwgYCoBVQziK2Ov72H+8AYXD
         dAs3n55aJS/5MJTM41Sk2zeIycwOvxCY392vlX/oUddRdV4BebFpNM/2yxnMzjPoILmv
         kL6nr9rbvkKvpw2Z+POeAAWSI5wmttSM6ttgdwlNXQZ1xhi2CPIzvSdVAGv4oFnZQPsb
         oNKKsCSf/9bgaDzt1UY1bsmaolIp+qu61sqcEKIHVawKKhkzmGr2oTGz8jxq1KQq1KDT
         aMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690749059; x=1691353859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxg8TeRb0NZN4rPS9q09YPBYQiS+mNKDuiZUWy7sPoE=;
        b=XHLFR8KEImxKX+Utb+6s9sVJTIPSOduNP9cmxEXZiher3mLdEEHdK2WG4hL1vIUi5j
         qHyM0VFjsGrgKK4bFB+8Buh1i3H3q2ZLRCUvh3x+ddoVMPMum6ceOYSeB/lTs0dKlJ3F
         bPs5GyH8pADWu/4FijzWvfo4h0TI968zVEOC6DC2eWi39/wGe+XmG7h8NZLuu538JZof
         gsKMXcPLDcmqicDHYrOjoYgq9TCMfiE+3CwRUdteX5Nkg370UbXbFf4UsKh7g3ZNZDQY
         CvDqOn6R5HssAjlhQb1dLB3kctM5qDN769CTsEeRPTmn/9i8CREX/4VcAy6AsjmYyQnW
         DWfQ==
X-Gm-Message-State: ABy/qLYWOZvWp24QSQOxYj4HlZsZ9kcCXZWT16AYqD1eRAEoo6Vi5WBF
        MSLu/ZMVubWkJdH1eUkRF705vQ==
X-Google-Smtp-Source: APBJJlHOTxeh1CTXqfEUzI4IuLFNKbWoKOerY31UzGFO9qNi7Sim6hqRNPHAsYOXrUACqIz4IMuq6Q==
X-Received: by 2002:a17:906:53d0:b0:99b:4d3d:c9b7 with SMTP id p16-20020a17090653d000b0099b4d3dc9b7mr6068918ejo.31.1690749059260;
        Sun, 30 Jul 2023 13:30:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906841600b009934707378fsm5072399ejx.87.2023.07.30.13.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 13:30:58 -0700 (PDT)
Message-ID: <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
Date:   Sun, 30 Jul 2023 22:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729160857.6332-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Implement driver for hot-plugged I2C busses, where some devices on
> a bus are hot-pluggable and their presence is indicated by GPIO line.
> 
> This feature is mainly used by the ASUS Transformers family. The
> Transformers have a connector that's used for USB, charging or for
> attaching a dock-keyboard (which also has a battery and a touchpad).
> This connector probably (can't be verified since no datasheets or
> special equipment is available) has an I2C bus lines and a "detect"
> line (pulled low on the dock side) among the pins. I guess there
> is either no additional chip or a transparent bridge/buffer chip,
> but nothing that could be controlled by software. For DT this setup
> could be modelled like an I2C gate or 2-port mux with enable joining
> two I2C buses (one "closer" to the CPU as a parent).
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

...

> +	ret = devm_add_action_or_reset(&pdev->dev, devm_i2c_put_adapter,
> +				       parent);
> +	if (ret)
> +		return ret;
> +
> +	priv->gpio = devm_gpiod_get(&pdev->dev, "detect", GPIOD_IN);
> +	if (IS_ERR(priv->gpio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gpio),
> +				     "failed to get detect GPIO\n");
> +
> +	is_i2c = parent->algo->master_xfer;
> +	is_smbus = parent->algo->smbus_xfer;
> +
> +	snprintf(priv->adap.name, sizeof(priv->adap.name),
> +		 "i2c-hotplug (master i2c-%d)", i2c_adapter_id(parent));
> +	priv->adap.owner = THIS_MODULE;
> +	priv->adap.algo = i2c_hotplug_algo[is_i2c][is_smbus];
> +	priv->adap.algo_data = NULL;
> +	priv->adap.lock_ops = &i2c_hotplug_lock_ops;
> +	priv->adap.class = parent->class;
> +	priv->adap.retries = parent->retries;
> +	priv->adap.timeout = parent->timeout;
> +	priv->adap.quirks = parent->quirks;
> +	if (parent->bus_recovery_info)
> +		priv->adap.bus_recovery_info = &i2c_hotplug_recovery_info;
> +
> +	if (!priv->adap.algo)
> +		return -EINVAL;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		return dev_err_probe(&pdev->dev, priv->irq,
> +				     "failed to get IRQ %d\n", priv->irq);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
> +					i2c_hotplug_interrupt,
> +					IRQF_ONESHOT | IRQF_SHARED,

Shared IRQ with devm is a recipe for disaster. Are you sure this is a
shared one? You have a remove() function which also points that it is
not safe. You can:
1. investigate to be sure it is 100% safe (please document why do you
think it is safe)
2. drop devm
3. drop shared flag.



Best regards,
Krzysztof

