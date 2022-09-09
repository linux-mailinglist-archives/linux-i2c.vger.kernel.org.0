Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C7E5B33BF
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Sep 2022 11:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiIIJXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 05:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbiIIJXX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 05:23:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A713F133A0F
        for <linux-i2c@vger.kernel.org>; Fri,  9 Sep 2022 02:22:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y29so1093008ljq.7
        for <linux-i2c@vger.kernel.org>; Fri, 09 Sep 2022 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BRDO2BQ3Xl1Levgr73wmq5t+n3chW3rmDPqHwQSlSt0=;
        b=hWVFVJnka1ggt1a7O+OxbBPyJJfYpb8IcppXGWsC4aRCWUt521vR2PHmd7yvueO2dD
         ffDkd2SVlwIjabIG7GfpCvwDHIT8Gr9tSJpW4haLDogGT/gcLB+TPz3lWn+KDFCRccDu
         j7KLs17pkanAGPxx7W1tjT79GV+GmtrMGMFzLZ4PdafptTB45MlZR+QaDQ1TxzmSETnZ
         lCH7iV3yUUXQ+arEPF868B9/ADK113dsBPRiGBvN8x9j55IppBMgeHBcyOp7pwScvb0P
         wvNaKxovPCl+/9JA5dI3zE5XgZAbVIdcNMYPiQuiDYqPed6dSS3JvVl04w2AjQnvIjNv
         tZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BRDO2BQ3Xl1Levgr73wmq5t+n3chW3rmDPqHwQSlSt0=;
        b=Y0dM9+fs/nG7gaFx45KWAnNqt9dadhiBSi7Er9oUZl+bECJe9S71b1cgbRPgH4r58a
         xmyVGrGantnnHUCPCUGvaw/buOOG2nmQyetovwZp977FATL31Yt9WKDC1NIXJaqgsXu0
         tHlnZRceD+ZIyrNsWHyRmar2YcoZUeteFq6Q4mL+mM7x2eTqEks/GGuD9UCKmB2oLRiV
         3CRQYCrJEf+iPXT1klrFR6Z42fE3V4D7tBHjqIUd9xcX2+iMX73nR08YkHyMTgK6ImpN
         htvWQf6wdkPj2gtirYgwteWSbYZo+7DEoSLCf4a1pXt6QWsVLrWuL8FycV4p+NZhKNpA
         NJbQ==
X-Gm-Message-State: ACgBeo1envEmD2fuubmOc4ZvvYqKSXEI9vIWAxl4RfAeMVumXk86jLdC
        0ksbc+QJj8X7oFXsvDZlsj12KA==
X-Google-Smtp-Source: AA6agR5j4Nc7GqZs9UbPumiYas9x5cICuPrTYyU5yJ024yLj1lnOtVaUK226F+3H+tDH1Kk1QjTkQg==
X-Received: by 2002:a2e:5002:0:b0:26b:e068:da24 with SMTP id e2-20020a2e5002000000b0026be068da24mr995390ljb.380.1662715317327;
        Fri, 09 Sep 2022 02:21:57 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s26-20020a056512203a00b00498fe38ea1dsm106684lfs.300.2022.09.09.02.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:21:56 -0700 (PDT)
Message-ID: <dfa59122-afe1-ec9a-34db-f3ac85b0cd7f@linaro.org>
Date:   Fri, 9 Sep 2022 11:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779g0 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <a6a704ff5fb06218daed492010e320605a4efe2f.1662714509.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a6a704ff5fb06218daed492010e320605a4efe2f.1662714509.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/09/2022 11:09, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car V4H
> (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
