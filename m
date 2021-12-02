Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1D6465F41
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 09:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238857AbhLBI0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 03:26:12 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46686
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233087AbhLBI0M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 03:26:12 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 203083F1C0
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433369;
        bh=/yVgv1GOFqN+8AHHqsg9jJdYjVHA4XAnE27binztNiI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BJiPfzlpXbRfIseygfeX/To3Nfk7McxUHtPVvnqswZZRovhFUA9nj/4UQtGHU7cp8
         rBoDfLq5SnfRJ0g6ZtbP3WCCPEG9EOVOW4beCHr1W/kF82tZHii/WLRmpZAg2erQ3X
         1AmI3f++VLJ8bfa4chAy2nwro8B0A7vw7Ti1PHvVg4qWwai2LTOwbkktaia5tSXHd9
         7iJztlZFfXHAibjT57fQiEC2ebSNaQzKrisMc1ZrO6CGR61xAox4DAoh4FSqNqGhnf
         doUcdlImq8wOcWuNXwG+ec103aMV9WS3qFjSbkwfU8PtwEUct2ez5cIqYapvnwYTtC
         tHDQ0EwaLxWgQ==
Received: by mail-lf1-f70.google.com with SMTP id bi30-20020a0565120e9e00b00415d0e471e0so10886751lfb.19
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 00:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/yVgv1GOFqN+8AHHqsg9jJdYjVHA4XAnE27binztNiI=;
        b=uC7qcNWMvE6MZMfLkKtP5ECJZxEvr4l8UmMpvz137uGpFkC8dC6srcOR14KXQXV21k
         0QBbwpOkFP6W/Asiv8PkeplWZWbEBwtX23Yl8h6eA1bVLB5Oa6q5H04x7EDJjoNHKwhR
         A50rHQh7PkuwNgl31701FoC7n1TknoLRVnTjoU4qH/58U6dZHtR+CnhT8d5K/Rm8Q4UX
         V0ZCemAbjBQzKuY3vdmNwV7qCWLwX6yJz0ePSY6LfqrBLo7SGM9JtuGmohlASQ4bmLQx
         5/DgUYYsgV/tSUx2hbpP8HwWiX+yhAtGYOirX6I3TI3gtnGkIBAMKhuVPGY93UE5nUnn
         7q5w==
X-Gm-Message-State: AOAM531a5y0aiw5EBO/zVCoTklbrWj9d+kGU/NNrfrohzYhhAL/AT485
        46XaLi4FfY937+Q2SHJ3n8pI0oOBOYFRmK/4zZURmbIH22AviDrD7JAI0JKeijJ3wvYSxyOjB/T
        6o+LcfltxcE8604r786eJUXr7Ks+XYFuSAPiN1Q==
X-Received: by 2002:a05:6512:ad5:: with SMTP id n21mr10799112lfu.460.1638433368331;
        Thu, 02 Dec 2021 00:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP3ORFJiJfE5pvx7rMdaizQ6DgKbWsDyzXXT5JfQ1TAZJykEWZ1xtOgS/qz/7LRQhqd24CfQ==
X-Received: by 2002:a05:6512:ad5:: with SMTP id n21mr10799089lfu.460.1638433367928;
        Thu, 02 Dec 2021 00:22:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s4sm255390lfp.198.2021.12.02.00.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:22:47 -0800 (PST)
Message-ID: <95e19574-8b6b-491a-3997-e0a37748d9da@canonical.com>
Date:   Thu, 2 Dec 2021 09:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/6] dt-bindings: i2c: exynos5: Convert to dtschema
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
 <20211201190455.31646-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> Convert Samsung Exynos High Speed I2C bindings doc to DT schema format.
> 
> Changes during bindings conversion:
> 1. Added missing required clock properties (driver fails when it's
>    unable to get the clock)
> 2. Removed properties and descriptions that can be found in
>    schemas/i2c/i2c-controller.yaml [1]
> 3. Fixed the example so it can be validated by dtschema
> 
> [1] https://github.com/robherring/dt-schema/blob/master/schemas/i2c/i2c-controller.yaml
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-exynos5.txt   | 53 ------------
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
