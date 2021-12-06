Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0C46A907
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 22:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242378AbhLFVHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 16:07:19 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33493 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhLFVHT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 16:07:19 -0500
Received: by mail-oi1-f176.google.com with SMTP id q25so23916507oiw.0;
        Mon, 06 Dec 2021 13:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hR7bXgwLHYJkT93zfCU56hRcK8Far9k2bXy+0JZvYDA=;
        b=4GpwwEZCb9r3Dm+K67J6PzhzaYaZSCpXSFesJQR/5jKMhwIMNWqmpjQZJSYD8xWNYV
         0xx8Riei4ifpV9QcABYXIgFQIbnlrwH7xtWg5N8UUQST80nusySS1WbSyipCSMBvuaai
         E9PgN/6UIkkhX4ifVKiLQcWae58SzdKFv1Uk0GoOaJtuh7UsN9ZC3bNuSDJZscjjwUw0
         gwuY5hYbd4/u/iLJtOWOZM4mdqiQSNhhao22Na4E13p2rtYahUVIe74DqoeZ0XBFOVSk
         /q1XNW4vJz3NPmuvZlsOFNB+2EmRGdm4qB2lNwqLjLMUN1b22PLPzV1lRbelHwdjuQ7V
         +4jg==
X-Gm-Message-State: AOAM533BupcjvmZ3GYvjAClwC617uo4ghyMjwGXljhk8hANGunH+2Wb5
        L2ugrluer+7NX/AOCFH8Sg==
X-Google-Smtp-Source: ABdhPJwEhRVefMyREWgslDkwbGbmgUCsTUUusAb3pxk6xbwt92Gj19SDHua+BYuS/j/FO/WGC47EFw==
X-Received: by 2002:a05:6808:994:: with SMTP id a20mr1186870oic.18.1638824629694;
        Mon, 06 Dec 2021 13:03:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g7sm2372135oon.27.2021.12.06.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 13:03:49 -0800 (PST)
Received: (nullmailer pid 2580406 invoked by uid 1000);
        Mon, 06 Dec 2021 21:03:48 -0000
Date:   Mon, 6 Dec 2021 15:03:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     devicetree@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        David Virag <virag.david003@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v2 RESEND 2/8] dt-bindings: i2c: exynos5: Add
 exynosautov9-hsi2c compatible
Message-ID: <Ya56tLvLR/msqMZP@robh.at.kernel.org>
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211204215820.17378-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 04 Dec 2021 23:58:14 +0200, Sam Protsenko wrote:
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> 
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> Changes in v2:
>   - Added R-b tag by Krzysztof Kozlowski
>   - Removed quotes around compatible strings
>   - Added Exynos850 to comment
> 
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
