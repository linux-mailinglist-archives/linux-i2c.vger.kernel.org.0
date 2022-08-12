Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D06590EDD
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 12:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237969AbiHLKMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 06:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238009AbiHLKL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 06:11:58 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1563DA4B28
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 03:11:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id x9so466445ljj.13
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 03:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=X3Z0i+bzqyd9jkgK2caR27Vz7nwccHaSiGiUTsoE8nA=;
        b=vAw/iHE6ytIOXRXjeN67GwiSEbQA0ctQIwMNSnUafKvpOuljVrJ7vzVm/7sbrBA0Rq
         9W2cgG+jL3RBmB5NEcyu5lMUuVivS36k1XHf3AlImINw7POiSJHt+k0cjXeXMWbzjzI8
         4DbWMTdY2CckYmFjISEC/JQhcrDAU2nl5yNlK37oSg0oRL2rRaZai16iBru+0FbR+THZ
         MHA+XhzhYLsqP/KcE8q+o7RlrZWIg0wVz6878gIJjP33XJbt139OIFaens+nMgkZLaxa
         XpEwjB21sqL5KTW4ekDFDt/YmfuRamdGpkj8VUxH5NlvNTEq0vQZgMQLOYrs6CSzdkpO
         y7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=X3Z0i+bzqyd9jkgK2caR27Vz7nwccHaSiGiUTsoE8nA=;
        b=1Ey63vWpOs2D0LruGO/NLWPpZILW+RsOi2N6BNu5irfNa0zaKxr9eHcXTF8TfKW5k5
         T+Ae6qX3yQgGUfgqcZW7AvYsnrznXUby/3+eRHatyEYKTbxl5cKB+5GQLZITu0t6pCUg
         XwEssbqkCDTPCAlD0SCiTGO23Kr5eF/BA9rpEOCOiPUB8LDE6Jax7Uk2HIS/zI1Idnky
         eAZ2qvqqk7Yr8Op32ITI+mz/gw/9dNPKNeu/InJwyZQbMAtpMr8DDMT1u9EvPixhTWyp
         ZNK17WFL4WHFQ4scEizS5O8X2iMJh9/wYEsQPXyAXPTbC2C342IrjwgQ+jhnRvx9Nkgb
         dPRQ==
X-Gm-Message-State: ACgBeo1u2G/bFJHSK7PqLPpLJ+CCBZBkdZy6+QxDn3J0SIDC/c682vGm
        pWVmtcrnGfvDT7OSXsUJKAPSdw==
X-Google-Smtp-Source: AA6agR6qtRCwidZpSuqbgG905ivGtqwXa5YBWgMlvaWcKMi1Z7GJ4rwJwfHHDDGohyfeQPJ4RGY2/A==
X-Received: by 2002:a2e:a7d4:0:b0:25e:cc18:caf7 with SMTP id x20-20020a2ea7d4000000b0025ecc18caf7mr874022ljp.107.1660299115508;
        Fri, 12 Aug 2022 03:11:55 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id a25-20020a056512201900b0048a1f17916esm155162lfb.300.2022.08.12.03.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:11:54 -0700 (PDT)
Message-ID: <f596077e-81d2-211d-258d-7fa7be85d759@linaro.org>
Date:   Fri, 12 Aug 2022 13:11:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] dt-bindings: i2c: i2c-imx-lpi2c: add i.MX93
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <20220812043424.4078034-4-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812043424.4078034-4-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/08/2022 07:34, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX93 LPI2C compatible string.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
