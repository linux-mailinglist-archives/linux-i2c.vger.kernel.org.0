Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9326C6877
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjCWMf6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 08:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjCWMf5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 08:35:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39F3234D1
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 05:35:55 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so85823522edb.9
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679574954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcdcFW2o7lO4HSULvRwKJuKAN+ANvBzfqs/0VanCNtA=;
        b=SKWgUpGw8QCzkIH0er3CYuYtajmychdMFo1YNnpHWm4cN3IEo4qhST6TCQxJcfR3p5
         tHUmRH559dEWePF3/X7g2W1n7qeIi+ruBMx83ysMDLJJJt9+CSFpH5pvoIaxeq6h9SW9
         kpf4m2otdltH1s5lzUaB3VpYPHLgZ9+oCreK6T6DWsunVGmMSFPD/0f6UXopMgUbt3mu
         oHA/JgSVqksydQW4Aeu3DeTQg5EMz3e90db/xCVvrCOqdhxpx4aH1Y7mrPQwj3JX2mxh
         wdlkEBaqRi6fPqVtVx3c0nLvsHzNgv9BQqZF9oC5ooyNXjYgNOCkwScoeX5Gj2lc9wPd
         X+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcdcFW2o7lO4HSULvRwKJuKAN+ANvBzfqs/0VanCNtA=;
        b=TwFSOa2tybsjKSPmJ28o8SCbp0wG627IQA47oUqTxZSP4adDvgIiB6A152g/pFzeAR
         TuuCfoShLvoCnnoFn4cpNLhCwyoj9pBDABo7V9t/tPlSTuwJypBdq2FJqajJKVmUSBiR
         2DxY5I/7d1xnl9sJE6RM/7tCJAjePdyrSCAGzFs+epJphIL+Rf8mpXtKjnbOjIi7Uu60
         /8di0d8bGl87rQdze3quSmwQFVb1D/aK/0nACc69xjA5LYuPEdVXfP+MSHlQmvlq8rsj
         031IcniPZ2jV9K8748B3VYyK9TRZWOq7nWQHQM/aCo1a5MDRaYwTmmXH2/iKI3Ah8G3X
         geDA==
X-Gm-Message-State: AO0yUKWCw3jKyaPMDM8+7qNgKUFr1Hv/5QTL+vb1todzOofZuaqDVUEs
        FwCtC9cKPmGbUMSurj/a8Tvwu+kRW64jsJAwuTg=
X-Google-Smtp-Source: AK7set9gCzPMq6UzpYkoDzP8fIbA330Kh0INBz2+cqIjPHXz2lglBtuGncjUGTCTLGJjiHUP+ffU3Q==
X-Received: by 2002:a17:906:4355:b0:92e:c4c9:7a43 with SMTP id z21-20020a170906435500b0092ec4c97a43mr9847521ejm.25.1679574954171;
        Thu, 23 Mar 2023 05:35:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d350:23b1:cb94:f39d? ([2a02:810d:15c0:828:d350:23b1:cb94:f39d])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b004bef1187754sm9086863edj.95.2023.03.23.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:35:53 -0700 (PDT)
Message-ID: <04876110-1dec-dafd-cf4e-a6ed7a8b40b0@linaro.org>
Date:   Thu, 23 Mar 2023 13:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
 <20230323115356.2602042-2-patrick.rudolph@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323115356.2602042-2-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/03/2023 12:53, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

I just received this patch sent twice - as 1/3 and 1/4 - without
changelog, no cover letter, nothing more. Also other patches are
missing, but that I could understand as intentional.

This is confusing. New submission means new version. Attach changelog
after --- explaining the changes.

Best regards,
Krzysztof

