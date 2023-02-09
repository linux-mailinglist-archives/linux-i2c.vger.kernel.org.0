Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CBE6902AE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 09:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBII7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 03:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjBII7S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 03:59:18 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46D36A50
        for <linux-i2c@vger.kernel.org>; Thu,  9 Feb 2023 00:59:16 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3354756wma.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Feb 2023 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8pUbyQuguMCPwZW2RElTPCVuJKUGTRlRW/wJdW3+V4=;
        b=Ow4huEPqyLhYoVRrD86WnY1MlQp7HdWZQmtkJytSmdBVRtRFPOhg2UCn7XotYGpH+U
         M8e2ys2LBDh+P7q2fSjS/bSM6jKZqqXKi9+fCaibpBnB+X42dpBUkIVBpfPQNuTo9l+1
         YLHXs+13djHk9T1fNnUUZeYV5C+B0XEVFZaafAVyboVQWAuGXC/tVB0lNzaQCepNjkji
         vr1qVnG8mTc1YE31jq9QuuX8PP8sx+zBgokKqTuKPGh6Zat1shYSnc3mPNcRXXX9S/JN
         RYGuU03KKqp/Mcs2/qJMltEbL4JyfN/hUG2peymAcFNR/prGppXFTTeSB8QsVySv+9K6
         IlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8pUbyQuguMCPwZW2RElTPCVuJKUGTRlRW/wJdW3+V4=;
        b=JiXjO4e6Apl8Dy1sPot+bZ2bd8GwWB+4bFGWwlmFZ0RFzW2Nmr/hCvGdCqt3fPyc1o
         B6HJRQmYte9TXMjiqKSYdv2LtY6C013NC3I22vNZejbsiAZws3FzSYp0o+JGRCFQhe4B
         3cV/hqqgzriOZJHo5hNJPq99+qEm/qd8Gm+COw9LszfDoO1oAP4GpAnxLOeNRtSK4FOV
         50CWOBPjzQE7E1ZWmkjg+d4MTsqOPu6RbsZhIOy0faH501j8XbMTP8zI2i6hG1hpP+qN
         /qi/sb6jEu7NVpu5Jbs++JSftNgJXqACK47+65F+vUaEnQLGzxkP+SLbM/giFLvhCBMi
         M41Q==
X-Gm-Message-State: AO0yUKU/Pr/QQHaC6VgJBFnsytkqLjAZjoiP1JKOQRz5iqblHyoaIUHT
        IfHndBwxbwg4kpUt3MXJd5majQ==
X-Google-Smtp-Source: AK7set+XdLST77MGN29lRhG+UDTY7sifhmxD3nCMq7rWmiAdHkddtJM/T/83puc6W3tudLYkQombYw==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbc7:5b10 with SMTP id i27-20020a05600c4b1b00b003dffbc75b10mr9064027wmp.0.1675933155460;
        Thu, 09 Feb 2023 00:59:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d14-20020adff2ce000000b002bc7fcf08ddsm700290wrp.103.2023.02.09.00.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:59:15 -0800 (PST)
Message-ID: <b2adce9e-df73-db36-9703-a66565120791@linaro.org>
Date:   Thu, 9 Feb 2023 09:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: i2c: uniphier: Add resets property
Content-Language: en-US
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230209014340.17979-1-hayashi.kunihiko@socionext.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209014340.17979-1-hayashi.kunihiko@socionext.com>
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

On 09/02/2023 02:43, Kunihiko Hayashi wrote:
> UniPhier I2C controller allows reset control support.
> Add resets property to the controller as optional.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

