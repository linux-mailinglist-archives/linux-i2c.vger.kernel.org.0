Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C87C465F60
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 09:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356141AbhLBIcw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 03:32:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47514
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356136AbhLBIcv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 03:32:51 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A8C0D3F1F7
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433768;
        bh=YD7mUj+VeYPuZolMYaACkW8aNIy8jYTBKxq4B2rUYBM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=H7nYT/aK+7qH/dXa58e2YAeDyPz058zl1kfjECgVhiDPjlKJBE7K2gB5RwKlrbByl
         5elgyV8v3b5Uv1SNNCqxac0k7xqnXJhs1EOWUyv63tN5NWJw7WRQ4l0P3qfHMBInZF
         SQImp0rXfUHVY+Lo+O1k2IVN27P30eeMxecWDEXKTYZE02ChmKJUiJuf0gzqFXSzQ6
         f7H6/tpPLV5chMR3LMoOm1K4EHWFQFzKRNpm2ZQet7fqBm2s/dIKTi7g8Hfa5e7J2c
         r75DrESzGkvuuFVzuLoIlVCD8kRXB+x9XAT+mx8xoXa8Wgz9tpkMtcikaom/QxQZKd
         cCzMtgwSbEoLg==
Received: by mail-lj1-f197.google.com with SMTP id u28-20020a2ea17c000000b0021126b5cca2so9275166ljl.19
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 00:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YD7mUj+VeYPuZolMYaACkW8aNIy8jYTBKxq4B2rUYBM=;
        b=B0xmn5HM5da6Iz5N0f3HzrqP6proqz/1vhbEomP7OL+z/Y51JKaGBLdzCSr/tzmLNc
         r3o8fVFZ8ui8UdSrssfny9LxBc2yBXyw2Rdu4CSOZBsFkLqvdONDv9Vy3UzJ4t1ljqJN
         y4gvKp38sV9HXEhgeuiBvaYlCok8EAmo8Vc//HNJf8TsBSLYXoVYQr4f3lhlMBoGS1Kr
         29USF16IkCnflNiVMtVso2/kOb6BkhtqxxOcQRB1bxHG5tH7h27kZmfpOqXqxI1C+epW
         NCtR16EegqERKZaplXlM0yRzvqZPTh/qTQjh4MejaOj4PW7DR8IncoHGg+5tJa9dEhV2
         Dt3Q==
X-Gm-Message-State: AOAM532vNnugiq7d2ZptGUz6NnKvcbZmJ2lykVsWpSwq4yW5c3ismxbN
        8oGp4RD6zpLEUn5DJ3ieLWmwtzp4cP4Nr5+tGbbTcqeLmmMJQCrl/N5r0cvbXtrFTSyrfbnyheO
        XxMlulBYTnTuW8fBovq2irRN73k1nOjXEztcSxg==
X-Received: by 2002:a05:6512:3117:: with SMTP id n23mr10923740lfb.16.1638433768180;
        Thu, 02 Dec 2021 00:29:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmYh1KFdoBF3+bod0WLIOsobg9H0TiGRupimh+bPu0ZdrM1+TaVxC7h+94IiGAH4+zbwKxZA==
X-Received: by 2002:a05:6512:3117:: with SMTP id n23mr10923729lfb.16.1638433768027;
        Thu, 02 Dec 2021 00:29:28 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id q6sm258654lfa.133.2021.12.02.00.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:29:27 -0800 (PST)
Message-ID: <307f3c64-9ccc-44c9-ebb3-f9ddc29ac11b@canonical.com>
Date:   Thu, 2 Dec 2021 09:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/6] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in
 Kconfig
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
 <20211201190455.31646-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
> Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
> symbol help section.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
