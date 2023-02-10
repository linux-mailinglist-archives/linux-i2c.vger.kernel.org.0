Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA6D691E82
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 12:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjBJLkj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 06:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjBJLki (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 06:40:38 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD332A6C2
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 03:40:37 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o36so3628370wms.1
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/8Pm8otgvuIcD10Zw5d+1Xdi4JIWGeXmfgq3MAhdLo=;
        b=lZdJWdlCGsoSvv2HrB5MxOYBR9t7M0m/6es/J29iRkHJwIg2FYiHSUnWuRPJlXvOkf
         82lx3K2u612x++dzVtirRuDsUw3G/+ocPDLOdYqsgWMYam63n4GtEHQthNPhmSTF2KQk
         pSw/a5T5VHYMTBrEkhVhq30kI8b+CnceSduwssaJCjWDbt1ETce8vFqx/2QgVLHf5ngA
         9yFCUa5bQOxvHIevK/QGKra1CRUxGuMu1kOSb7wh+9d9O5nHJ2e9gwDI/2GyWWUnBTuL
         ppP7B03ywEspPwIEiCEZowRH0XmPWa8i3F1RDy6taGqdNfajySg8AScTPfUCqj9mh315
         /34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/8Pm8otgvuIcD10Zw5d+1Xdi4JIWGeXmfgq3MAhdLo=;
        b=50tBdU0Wxyj5Zq0luxKgcg2tdLpbAGIIpf78CZkygxps1cFZoDbzO1uL3Qz4LHOvsw
         RmOhDpITxGSHXvNI2ygJMTS5xD/qW3WkSPJxgEVEt4L950C6H7r/8ydrSUqjfatwluEP
         p9VAnUdazbljOtM2o51qWD4tHjTxcGIBCyCQLDXl1oalOiM/RGrathR7PdoNCc+1TAY3
         xfdTsmWZE08q+g4wLMBgbYxoEcgkTN00zjBXL+MVwoWsF6MlNb4jqB2nOE25h9P0SR6D
         xF7XlK6DVerVxDmCAMj4paPGANmiXZwt/I896yKeRoixoZyCDi8WLf0umerEQUeMgk49
         jB3A==
X-Gm-Message-State: AO0yUKXD+ISH0scRb0qTmEM2R8hX57DcDGRe4Z9YJtGTntZqTyOw5T3a
        XGH6678jxed3CtMFi6c0WfyPjw==
X-Google-Smtp-Source: AK7set+WjGBjahYz9ocoZeCt+9iNkzBLgdueVDR1ZSpT8QU8aOfFDcfbToNfZqxXc4TJ5eBgmnLhLA==
X-Received: by 2002:a05:600c:703:b0:3da:fd07:1e3 with SMTP id i3-20020a05600c070300b003dafd0701e3mr12649869wmn.22.1676029235975;
        Fri, 10 Feb 2023 03:40:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b003dc4aae4739sm9030580wms.27.2023.02.10.03.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:40:35 -0800 (PST)
Message-ID: <9b523fe7-ef94-bcaf-62b0-9e8503f592e4@linaro.org>
Date:   Fri, 10 Feb 2023 12:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V5 1/3] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
 compatible
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     git@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
        manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675942646-31006-2-git-send-email-manikanta.guntupalli@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675942646-31006-2-git-send-email-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/02/2023 12:37, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> 
> Add xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible

A nit: Missing full stop in this sentence.

> Add clock-frequency as optional property.
> 
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---


>  
> +  clock-frequency:
> +    description:
> +      Optional I2C SCL clock frequency. If not specified, do not configure
> +      in software, rely only on hardware design value. Supported frequencies
> +      are 100KHz, 400KHz and 1MHz.
> +    default: 100000

Then also:
enum: [ 100000, 400000, 1000000 ]

and drop the freeform text (last sentence from description).

Best regards,
Krzysztof

