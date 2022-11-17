Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C6962DE85
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 15:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240132AbiKQOpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 09:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240498AbiKQOob (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 09:44:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CF329341
        for <linux-i2c@vger.kernel.org>; Thu, 17 Nov 2022 06:44:24 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d6so3115080lfs.10
        for <linux-i2c@vger.kernel.org>; Thu, 17 Nov 2022 06:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BK/kpu0QGEcj9NPlL+FeUj4R6i4NhriCFaq6Qr3WbbI=;
        b=BSaqKazKUG10ONhQymONIWDkvjfN0N5/li2mu86+b4sKVe18HR8LH0oUJyBA82p9Do
         vGUrbr2GXdiab6k7qb741GvY5A8gnSn9Kc+Hz2qL3WVMZc4Iie3WbO/ENlP3rWq+FIln
         OO16/pOdMoi7FJ5BCRuTrinV9T6FAdBW/n5z0U+wzM1rSGKREAN7X953bPqj7Gm2Rk6D
         EcC135bxYK3F8Zye+L2Yzdc+mmj+2x+e3gv/hHjMpML29Z8hYnkiWMsuphvNom8bHNtB
         kqGk1EnOuIa3dsWtaLOPK3FrWgSguDHeRC1qCb6qxv/6ZH4SPbKAvqJBnRAY/GpBnHgm
         vcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BK/kpu0QGEcj9NPlL+FeUj4R6i4NhriCFaq6Qr3WbbI=;
        b=yXxTWDfLR3+0Aj9TCm5c+axBK8zBb6DBj0xKuPbcwdTFds51/RBYb6dbh+KKZWRYhZ
         U64j0LDfIygFJYSpcVdZyZKl+yeUg3nIMAERUoFowR1FESlZtk8hjWaytih73d8kA/az
         xQQb5oRYLZk6y0zI7jimECPDYYLBRjdnGUurje1QxjkoSXuZxh7oV57Jp/ofhaDk1yy1
         jkWHEPY5k55ND4Gy97ho0h03Q/ggVd53VbrKb2VTm7/RDEJleMRTf+vkSirmVbE0TcTr
         amVkBGfcn7/xm+I33GTZBx3suAjc83ODALAjqCkQ26aWRJ2Wsg/ztMsZac4s/WilwGqJ
         YmOA==
X-Gm-Message-State: ANoB5plYFfEVKB26ljllO5UVHXzvWmaXLjSqCcTI32uC9EuJhronEGLK
        s++PGP+laLriks6sbr4ajGA0cD9XFz6trgoC
X-Google-Smtp-Source: AA0mqf6gXDMnLPD3JMcrA9kx9+f055OZFviLTt13CX5KEtbqZvjTQAcb7nz49Gmik9G82dJwziFqyw==
X-Received: by 2002:a05:6512:36d1:b0:496:c661:81da with SMTP id e17-20020a05651236d100b00496c66181damr1052532lfs.480.1668696263065;
        Thu, 17 Nov 2022 06:44:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f24-20020a2eb5b8000000b0026df5232c7fsm234711ljn.42.2022.11.17.06.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:44:22 -0800 (PST)
Message-ID: <176cb990-f853-0e5b-37e6-0294801b6eed@linaro.org>
Date:   Thu, 17 Nov 2022 15:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] dt-bindings: i2c: qcom-geni: document I2C Master Hub
 serial I2C engine
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-2-64449106a148@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-2-64449106a148@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/11/2022 11:21, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> This documents the I2C Serial Engine variant used within the I2C Master
> Hub Wrapper. This serial engine variant lacks DMA support, and requires
> a core clock, and since DMA support is lacking, the memory interconnect
> path isn't needed.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 61 +++++++++++++++++-----
>  1 file changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e7ed00562e2..ea2c28e70cf5 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -15,13 +15,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,geni-i2c
> +    enum:
> +      - qcom,geni-i2c
> +      - qcom,geni-i2c-master-hub
>  
> -  clocks:
> -    maxItems: 1
> +  clocks: true
>  
> -  clock-names:
> -    const: se
> +  clock-names: true
>  

Same comments as in previous patch.

Best regards,
Krzysztof

