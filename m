Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CFB663B3B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 09:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237954AbjAJIgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 03:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237709AbjAJIfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 03:35:45 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA214F13C
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 00:35:36 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso4846293wms.0
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iY2kNKoTIXZn2gSTCybP9yJzCdsfQZ3WA/pnwKJAnKY=;
        b=Uj3oQaHjeYYpzutkftegGDOi1+X0Xm8kuiYk6QJu4Z41fDjcNYu2LJ0pmpa0DtZ1mo
         zey0AQOqYno52448CqwFWaRPqY0/tpe0uY2b4f6SagaB1myNpvcNt+HlVR5RwBcnMX1z
         HQ33A1FRZz/lz35GAe2t29DqsmXMJM8h3BSBqbZd0Ozsi0PfHWGXus9NP8rn3szflW9w
         Np3Ka1VHiQzVaBWP4EVqHrr87eVevHNhhHQMa/VuJJkyk4BoIFTZ9TjLxGndb174vmNV
         HBbJzvoYI8BIULUu7Kz9wZhQQ15yMEKAjFjgN68/taR84EzOTC4rj1g4ZH9Gbb5RsU1I
         3Rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iY2kNKoTIXZn2gSTCybP9yJzCdsfQZ3WA/pnwKJAnKY=;
        b=LXhYdV2s3d1v/kmK/o6fv7OIlc3//3PqdRzW4+2mCOmaxeu4NvyOkPUymmfT+4rUdc
         bayH4mK93v5ACXdSVn7eopwwjoMBKNicxo9hYMzxr5jqt0gQj79b4NO2sbEROH5J3pT0
         zpcodWw+0aG7fTvrZ0vfqbSw3rkL0N/Bw5IaXrVw95PpYMasuYvPTKvuRHNO222hc/YW
         cGdZQO2rQv9mjTeF6rS87nJSU2r9Qfb0ItrUyD0+HWLCSRv91Prs7OOyEPJDhX/dS1Q3
         ap9Ome/NxtUK3MPy/lS30a9XQ4r9MxRyQ+ZKENrZIGDaAwLzngsGjas1O64OoD+mLQ2s
         T8bw==
X-Gm-Message-State: AFqh2koBJ7n27zkry9AIRxuX5Md2uQ9GvQvFr9j33n8tJOlgkz7DKUGd
        0bStksQ+LAs0cAIESimB7NmKaw==
X-Google-Smtp-Source: AMrXdXuAbHhYKCwefQTQIpdarosnfxcUv4i7yZv1WIZFY6OiIxITGjfCUiYlmzSTmiaK+mPkvQryVQ==
X-Received: by 2002:a05:600c:4f12:b0:3d9:f492:f25f with SMTP id l18-20020a05600c4f1200b003d9f492f25fmr3521200wmq.16.1673339734712;
        Tue, 10 Jan 2023 00:35:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i13-20020adffdcd000000b002a91572638csm10334677wrs.75.2023.01.10.00.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:35:33 -0800 (PST)
Message-ID: <ec0fae6d-4677-2299-3970-662c657eb919@linaro.org>
Date:   Tue, 10 Jan 2023 09:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/6] i2c: hpe: Add GXP SoC I2C Controller
Content-Language: en-US
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-2-nick.hawkins@hpe.com>
 <832510cf-0a1d-35cb-8754-7d9c9e94b0a6@linaro.org>
 <1F4A96B7-F90D-401D-93D8-A14CD8F4E0B7@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1F4A96B7-F90D-401D-93D8-A14CD8F4E0B7@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/01/2023 21:23, Hawkins, Nick wrote:
>>> + GFP_KERNEL);
>>> + if (!drvdata)
>>> + return -ENOMEM;
>>> +
>>> + platform_set_drvdata(pdev, drvdata);
>>> + drvdata->dev = &pdev->dev;
>>> + init_completion(&drvdata->completion);
>>> +
>>> + res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> + drvdata->base = devm_ioremap_resource(&pdev->dev, res);
> 
>> It's one call, not two. Use the respective helper.
> 
> Greetings Krzysztof,
> 
> Thank you for the feedback. I am in the process of applying your recommended
> changes but do have a question on this comment.
> 
> I can replace these two lines with:
> drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> 
> However, I still have a need for the resource "res" here to determine the physical
> address of the device here: 
> 
>>> + if (IS_ERR(drvdata->base))
>>> + return PTR_ERR(drvdata->base);
>>> +
>>> + drvdata->engine = (res->start & 0xf00) >> 8;
>>> + pr_info("%s: i2c engine%d\n", __func__, drvdata->engine);

Entire pr_info must be gone, so you do not need res anymore. You should
not print any addresses. Unless drvdata->engine is used further?

In such case you have function just few lines above the one you
mentioned, don't you?

> 
> Hence at some point I believe I will still need to call the "platform_get_resource"
> function to accomplish this. Is this acceptable or perhaps you have another
> suggestion?
> 
> One alternative I thought of was including a property in the device tree node
> That specifies which i2c engine this is: hpe,gxp-engine = <1>.


Best regards,
Krzysztof

