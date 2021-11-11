Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB4744D389
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 09:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhKKI4b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 03:56:31 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47690
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230129AbhKKI4b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 03:56:31 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 71E0F3F19F
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636620821;
        bh=0Svl+eFQ7YNUr5AuRvNYApFYmUrQVsAuZa9qnzL1YbY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=lyYIjHqAjYVUCIfdR/HXm7fT0W5jktuFpXb3Zd+S1cDRI9PM7LTVPMoVfFLvXcDqt
         rQ/x/aGHQE1Y1aofSawS/QbX5EfQzbcwm6SpY0DKwE6QfWEsBni7BTmhSuf/hniWNJ
         147UOZGa2SUuJd9fDFL/cKkFDe9QfT47HeZ0yNA0T6jOMiMN9ET+/OHfD7YyqBDmzi
         ccLsHjueURylMSZFwM9wBqZLVAEGbr2O8cehE6voDqdcShpaywdd5j0am+gAmhWkEj
         PggbbBm4EzFGwsrWAgVR+QuC0G0O7uNOsZG9GSFBuGUuqQqglIqP0v4gFevezpdTX7
         zMPGRcZoZ+SWg==
Received: by mail-lf1-f69.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12so2402712lfp.21
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 00:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Svl+eFQ7YNUr5AuRvNYApFYmUrQVsAuZa9qnzL1YbY=;
        b=Z1SLORbyj7QAptjZf6JSVyoMMusArKrYgqB93HwF0RG0jQysfPGBUzx2NU8lRnraD2
         FZMNSn+RLxtoGyt9tbLCC/StGkzBwC38jeAGdKErLs37NeLc4f/e5Gr+tTL7EuMZ0CKA
         n1+MYyzqb3cEv1wd4xgn4rd+hoUyhNs+YOWsUHHyGGJ4SkSYu4AUZikDvKsPIcT1bYqO
         ywhfmR3zO3HV2gWpwOfyROy860ybitt6PcMcf2zCaP+UUpZThm450XQhrseyDZ952rR+
         J45VcVuwUaCZo/jD48er4nJAbSZ6TkIZg1aweewGUc9MbPfH5j4SLfMYOflgZmtPOWMv
         ClIw==
X-Gm-Message-State: AOAM532SnT16nLtlN7iDstNT6Zs0zhpl4RQmM7F/jM27IVcWJkI+lBLc
        9MscmHYPbieKR39IxukosGCBQRwMX74PfRBxDgg2a+3oKWZctk9MgN3jYfzMmA3a9Cbacvh52lD
        nVyUoVmJ0UlmjW92PEdkGF4fu88suYpfe5ehkyw==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr1861180ljc.394.1636620820173;
        Thu, 11 Nov 2021 00:53:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO2BY4siKh/EcTOSPKbywuDox2ug+4b7NO1Ji9teIwijIsGcEpMZ1GlkqEcPYuqO80fAhtYw==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr1861153ljc.394.1636620819985;
        Thu, 11 Nov 2021 00:53:39 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n1sm208525ljj.79.2021.11.11.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 00:53:39 -0800 (PST)
Message-ID: <3f66a3bd-2253-e887-badc-f51fa9447fe9@canonical.com>
Date:   Thu, 11 Nov 2021 09:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
 <CGME20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5@epcas2p2.samsung.com>
 <20211111084327.106696-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111084327.106696-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/11/2021 09:43, Jaewon Kim wrote:
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

You did not Cc the necessary lists (devicetree). Please use
scripts/get_maintainers.pl to get list of addresses to CC.

Patch itself looks good, so you can resend with:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
