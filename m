Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A762B46103E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242764AbhK2Iic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:38:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40492
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243616AbhK2Igc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:36:32 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 160714074A
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638174790;
        bh=aCARnuWDBDtCC7T3FRwThc50ZrhDk+owTuPeR9h19HA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=k+yWRq7z6N+utbgCZ7ulmbFvqsY8Y2hN7hLe+yv85KCQOcyDYnrSBblHYVoRIdWlX
         SThoS/yQrgthsoHyCYrn+vRP5R0h0Nj4TWIc4k18XRwCWMqqW54Rb3OMn7dVF2dNaG
         bRSfzf/30AkBpSeGk05dU49OvMV/IcGHqwjICpK1hBafP43YBu0b7vpMAK+9VaFxkA
         6n4VjKVp7hESZScZHvc8IotV9cTAAUrPr+wHRGpMSk7r6TYzUNk0xpHiured/JmHH3
         xXc/3EoACu11hIuVFYQFdG2SkMJRJ69XkZ2O7bbNh5L1+nNzjgLLsTes+f+c6O45AJ
         yNQsRrzEjUw9w==
Received: by mail-lf1-f71.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso5478235lfu.2
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 00:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aCARnuWDBDtCC7T3FRwThc50ZrhDk+owTuPeR9h19HA=;
        b=bCNuSERiuZCHKlYUuumulBMJEe4f+N8hzeyJPED4LzBhdco6XtV0qO7aNPUD2Xs8tQ
         H1KXBmjl38C2YBHRNwcfeFYloCP+GGd9+7oEdB193WtAaesShghjJJFUTQ3dsLtKw1z0
         hYh/0ORoZsaEujEqSs7jxK5PHol1vz92lhOWTxUDfLjsrh+Wk5FWqzlZC+OJBtz+wihe
         NCRAj7k8Lj3Igy8NhQHyBAlMv8VzSfnsii7y9MctrwkjVKe9NCNFz9NmwrvybXMEMkE1
         pyDOU1WthD3GCi2oDEcej2hsCkDVd4TCeZXMlBjuE2AV3oLXSmx2zN4rR3h83YOrCV5Q
         f3fg==
X-Gm-Message-State: AOAM530/B9sxdHoZG5L2NOGyWehhhSKww0odFLFYTGGx07zFXkiyfag/
        EfH81p1CscHrmYFL946Pe6RJf0J9DbXrH9Xke4+3qZbANuANTI+ZmBLnmV8yFnQaWt/gDJPE9H2
        Oc+ZcNn/W+S6DWDyc7S/DMHYvp0bFOr+qSCcrgA==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr47798053ljb.214.1638174789568;
        Mon, 29 Nov 2021 00:33:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+HqYaIWrUgOtsIwWv3NVax4MJeBvRWzGCQC326fhRonBcNHs6JMwj77zI5nkCDsHZVk4s+w==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr47798035ljb.214.1638174789408;
        Mon, 29 Nov 2021 00:33:09 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u2sm1268765lfi.108.2021.11.29.00.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 00:33:08 -0800 (PST)
Message-ID: <b757dcc7-7262-1f17-1889-6159015f2dc6@canonical.com>
Date:   Mon, 29 Nov 2021 09:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/8] dt-bindings: soc: samsung: Add Exynos USIv2 bindings
 doc
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211127223253.19098-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/11/2021 23:32, Sam Protsenko wrote:
> Document USIv2 IP-core bindings.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/soc/samsung/exynos-usi-v2.yaml   | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi-v2.yaml
> 

I propose to squash it with patch #1.

Rest looks good to me.


Best regards,
Krzysztof
