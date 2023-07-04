Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043E0746A8F
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 09:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjGDH0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jul 2023 03:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjGDH0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 03:26:52 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1CEE42
        for <linux-i2c@vger.kernel.org>; Tue,  4 Jul 2023 00:26:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e109525d6so955006366b.0
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jul 2023 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688455609; x=1691047609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ko8q2mnYLI83it45ln5vyRLkSD2JXittgz6nDfh2LUk=;
        b=Eyn5UqvQRnDHzH93YBxpvy/QxhUhyh7uMIOjZKwG76mk8DnNGhTzZkMIeHEdiws/Uk
         d5IRrBR+TQLGEQNZhhvMmDiTCge0qwfi0a2/tDAllN95wfQ1B2uQaiISr/WaKUBdKIjm
         neIclPd+NIQU70MCKW6TxpKd20MchEFhy6DCtSR3cXZWaCDlU1l6vBeuTW98/9o3XPql
         kB0bnQN1Suq00BeaNBGTg0b3+/wzGktGKvXuaMjmfMICDMBNeRHX3J2ufa6/rVqBcaiP
         XjboSaTxEkRiqPJHlR1N90SmD1ZxGuJ6UU1AGUcYe2IMjknggDSJ+UVhEZXjn8G67iCE
         ZvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688455609; x=1691047609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko8q2mnYLI83it45ln5vyRLkSD2JXittgz6nDfh2LUk=;
        b=C8htrLUeO0mct04Mw4/FJYoQ3zloyzihImP655LEvDaic/FxIyGLJ7/iYw3NVIU7gs
         yQyQMYlJYjgAHBempSYAavF3iZNnH++NUGXUDyHzyqlxYQwbuzxuhqzXhkRqjwA+SGEm
         srAX/vHtE/oF+r1Wpq+il23TNWFOBdjhVposZsv2lxXfpKf9RfzU2l1vV4DmJyGvV051
         zkrSdaTTLz7ypkljXI0uZz/fdj3iEfjpvYKh4D4WgBAkJsH81idLcOrEc+cQaIrwFcfl
         elNz9FCwlRwHY1duRyZ3CwQvEeffF+y0Ymp8Ywb3bQXWpy4BGk58VFi6THP4BrY8c5lu
         Ghmg==
X-Gm-Message-State: AC+VfDyz2BUjAUf2Y7XnieeJ04bcwqHqrZwpbdpwR0efUoF9R/WAQKnY
        IAdXcyKJaytlhN+IUTACBM7hVQ==
X-Google-Smtp-Source: ACHHUZ5hASxtVh21+e43yIjhBs+XizAcCCJiOECAnwwb2VER0djao+3pyeJbY77gN3U5XdE0Z7jP7A==
X-Received: by 2002:a17:907:720c:b0:988:565f:bf46 with SMTP id dr12-20020a170907720c00b00988565fbf46mr12681627ejc.32.1688455609366;
        Tue, 04 Jul 2023 00:26:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id kd9-20020a17090798c900b00992d70cc8acsm5841233ejc.112.2023.07.04.00.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:26:48 -0700 (PDT)
Message-ID: <1fc32a13-489f-8d23-47b8-166ba4c39db3@linaro.org>
Date:   Tue, 4 Jul 2023 09:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: interconnect: qcom,rpmh: Add SM8250
 QUP virt
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
 <20230703-topic-8250_qup_icc-v2-1-9ba0a9460be2@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v2-1-9ba0a9460be2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/07/2023 22:15, Konrad Dybcio wrote:
> Document the QUP virtual bus on SM8250.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


> +
> +allOf:
> +  - $ref: qcom,rpmh-common.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            enum:
> +              - qcom,sm8250-qup-virt
> +    then:
> +      required:
> +        - reg
> +
>  
If there is going to be new version - drop stray blank line here.

In any case:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

