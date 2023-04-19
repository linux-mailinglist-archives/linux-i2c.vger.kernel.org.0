Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D54B6E810D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 20:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbjDSSOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 14:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjDSSOh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 14:14:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84FE903C
        for <linux-i2c@vger.kernel.org>; Wed, 19 Apr 2023 11:14:08 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id vc20so414620ejc.10
        for <linux-i2c@vger.kernel.org>; Wed, 19 Apr 2023 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681928047; x=1684520047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xg3K3M8j59tMsqtihbLK8heSWq7f1ie0foKRcCv+H/w=;
        b=fnNwTRGi9HUBN2zEvwQ89hYmX+LWWW+J9Mp12/44/oBqIHMuqwdCS2HyfeiTqh5VH+
         qjpjGIetaBELAI3SHuQ+ojgsm1a4SIP5XMylYmr/XRzVs4pYauH7FG3NlCajoHEVbv0U
         a1u0Lt2jjFwrzaZ0Wdzo+Vy9EehOdS4EU2JFVaDqy8vFLr0qAJDBNsV9rKJ4G/3IBR2K
         3TZX088sudpRL8KiaRO4QDOld6A1JOcp0vIcUvJDLbVGbvpO6b5J1lao0+8KDG9MNMN3
         HIwVy6cN+TFw8oSgBVe4gTPszFeSYxXwt6TosTUcsKbBzEtWys5A7ezEF6x9ozCF0RbM
         2euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681928047; x=1684520047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg3K3M8j59tMsqtihbLK8heSWq7f1ie0foKRcCv+H/w=;
        b=Qw/2NnrNd2TX4FsKfl+QVgapDKXX8a/7FUoNDYg3CEw2KywWOj9f9ZJqLJZEd8I6Kl
         aDcyeDR9HQ0TK98PIL0Oq0uiGgnzElDR41dpiNJsW0M9g4Lr6t06vUHm13+O3Yu+iEnV
         AWwh+tl2INm7k19urQ08ekS4jqn5NSnPxRZRu5/MnwfviHvR61gJ6m/JoOyVHs/s+CkM
         M+fH9PO93eIaquukBOLOuc8EDQPEH4Cm7sDCVROwm4pavTwHiLHD6UMGKjPfKrNpBPIu
         ArJ76rfTh+jz2b4ZROR/s76iLQbSjhvhWzQH5BAwRs44Iv7pclks9/6WO5CPjVdmgAYz
         RtsA==
X-Gm-Message-State: AAQBX9eGk+CuGW7NQtOXbEHxchN/aE+UBiaewX70nIbCwK9tGuLpywwY
        i7GQLl2gT6a43IQ4E3YS9mliQw==
X-Google-Smtp-Source: AKy350br1hRHPBQPh7/yhSG6kX2cW268D8yfyrjD0fO5T5B5egerpgp7UimoCyx83w1tZFm4KXxfMg==
X-Received: by 2002:a17:906:a1c7:b0:94a:97dd:aed9 with SMTP id bx7-20020a170906a1c700b0094a97ddaed9mr17222396ejb.70.1681928047045;
        Wed, 19 Apr 2023 11:14:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906ef0400b0094f969e877bsm3847134ejs.43.2023.04.19.11.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 11:14:06 -0700 (PDT)
Message-ID: <9070d030-088c-f917-93bb-bc3bffceaaab@linaro.org>
Date:   Wed, 19 Apr 2023 20:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v13 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418103430.966278-1-patrick.rudolph@9elements.com>
 <20230418103430.966278-3-patrick.rudolph@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418103430.966278-3-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/04/2023 12:34, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the existing pca954x driver.
> 
> For chips that are powered off by default add a regulator called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

