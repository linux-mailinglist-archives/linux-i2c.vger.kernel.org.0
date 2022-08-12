Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51C65915B1
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 20:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238887AbiHLS6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 14:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbiHLS6S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 14:58:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1351792D7
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 11:58:16 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e15so2536740lfs.0
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0T4LEUf9g9JExx3ypW6bMQEGQ4KwlOj22ZYnNW8hJ0M=;
        b=qlbem+f5/BkpCRDfrefN/n7Y9dO49InR2/wWpo/bdPKeSsUH1jpYLpjn0TcZW5ihka
         I0RqqTpdQxurQHvmOlTixWFmVPikSrNm9N0T+LLiUIZlEOuC1s87gXWa4AkeLnYq53z5
         sy6kpPQTHE11PQmOhAa2LjMLkscK0Bo2CYn8PAvQew1o7whi6NgehPba/xzXO9nTb8hP
         urpXQeiNnueerXLr7xR2C4xjhLIqWR1aWQPrAmNAEENWwEUFsyU2F6yrhdvG34XD+X2N
         FShYWucn/2YxeBTLHE3zueskvhOwIpch3X8jMQyl/ihwlYojLW+p8pGl8IP98zJNUWIk
         Am+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0T4LEUf9g9JExx3ypW6bMQEGQ4KwlOj22ZYnNW8hJ0M=;
        b=MGy0+N1dlCKr4u4RULMBrmXQFvwJDGZXuMWUceuInjjeiaDd5Vt8ZrFKcfaTrCx1wD
         jAEcCx1+XtJWLkLlvJy7JC3PwbTysqRrgMQKavJpYCnN6kKxKAZI1T0WZolJqXtQLASt
         Mck/FlhiEYtl6Y22PCtVsf21HDtKOYsQn9ZLZIfamyi6L2owlFtBiZZKBizlOOh0GnM/
         tbLnNQThA/UgPqjNbTexuJBF2QwNDOUH62KVR9KolkZgAQUbGFCWngM3JhjHo361o7eo
         HlwXAqC4F8qLCIHxX7WW88wrd5FV+E+MTokUa0ywxmCJyIKcvZa76CZCNnTJ6XLOlMRE
         SUEg==
X-Gm-Message-State: ACgBeo0A+nl5Cwg+z4Jr7aonxcbkXwBonT5bG4dslzYN3evu70Tiq4I2
        4nRqUO37SGug5FaWRgRbJaaecw==
X-Google-Smtp-Source: AA6agR5wj+d2nQJtyJqxzr4mCH5yDVT3DYcZmKTqO46NuZSod1ujbmiKuERxRAG8Ds2Z97ywhBR63w==
X-Received: by 2002:a05:6512:2a8d:b0:48b:7f1:fe46 with SMTP id dt13-20020a0565122a8d00b0048b07f1fe46mr1543360lfb.261.1660330695069;
        Fri, 12 Aug 2022 11:58:15 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p20-20020ac24ed4000000b0048b998be041sm293755lfr.309.2022.08.12.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 11:58:14 -0700 (PDT)
Message-ID: <f8b756ce-984b-2185-6354-b4de3a3350d2@linaro.org>
Date:   Fri, 12 Aug 2022 21:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] i2c: imx-lpi2c: handle IPG clock
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <20220812043424.4078034-7-peng.fan@oss.nxp.com>
 <c2991370-b55f-c782-d62c-f9c667e40389@linaro.org>
In-Reply-To: <c2991370-b55f-c782-d62c-f9c667e40389@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/08/2022 13:13, Krzysztof Kozlowski wrote:
>> +
>> +	lpi2c_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
>> +	if (IS_ERR(lpi2c_imx->clk_ipg)) {
>> +		dev_err(&pdev->dev, "can't get I2C ipg clock\n");
>> +		return PTR_ERR(lpi2c_imx->clk_ipg);
>>  	}
> 
> You just broke all DTS...

And Rob's bot agrees (through bindings):
https://lore.kernel.org/all/1660317233.465911.168987.nullmailer@robh.at.kernel.org/

Best regards,
Krzysztof
