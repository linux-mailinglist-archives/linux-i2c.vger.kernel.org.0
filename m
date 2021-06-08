Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4292039F84D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 16:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhFHOCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 10:02:30 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43820 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbhFHOC0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 10:02:26 -0400
Received: by mail-wr1-f53.google.com with SMTP id r9so5001679wrz.10;
        Tue, 08 Jun 2021 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wha8NSsJMXDXrgiU3SNfxp/2iBxAp8C222zWJjqhoMU=;
        b=bcJnF3H57bJobBww34fPeDlDuVccrVj5KUGko7NQweDYMMXx7lqxEkDXL0NR5OKARZ
         uKUc4ywXc7NJ3V45uiYqjUzW7IvRUdHBiBR+XclX4qf8MOe7SMCPX5PI0FCjDKBwWrNg
         /8cvtLpllVjowaDJryvXyx4ZdZ+G8+MLeXPNNOkXPK2sKVZfkuYwd8lXLgTTB5IrkHci
         PcDzpxUebjnu9qaNEf9amsuW53IAKY+AWPRoVnELwCthEo38JDNrjTDmsQe4cLEoNO4x
         Ii9LNgyup0+1+s8QavDbSf9g533wmF67Wn4Ofr5yg0muN9KDXv+eMh3jIwdYLNLw3S8L
         JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wha8NSsJMXDXrgiU3SNfxp/2iBxAp8C222zWJjqhoMU=;
        b=jJKwqlL/bcwAO3NBFt17OROEW+u4K6U3tScuYKPV4Sub7Ge0CFCatvdcvHFw4nuT7r
         boGSBXsfk4Z0PtqOxhQFaBE1U8XP7AoaMe+S/TurnRUxplTJADTOF60JAv/f+e0XftRy
         WINjObL3LFpGZeLqsKT7HE8nRF/cZ89C15R60utev4jzzvPPL2Ep9O+B7rABlxpDACTV
         xAeOTBuyPEFAml2TxWE5xSoHIZh+Vhd62MLIDaVkTOwUKu5LLcthAbH2dDhHXizrMhHq
         9ef2mhMtDOO7VFeX41AlV7QPMBRO40z6XHyN7ehqlendhEGto/N9FJX/RcoBVVkV+4bd
         5W5g==
X-Gm-Message-State: AOAM532Ou43XVOHq81wJzoTrpixbC90Dw+cvXRLaiBT1AGIgcM8Rg/K8
        5RuyDhVkSAkZhsmZ2D4Yyxs=
X-Google-Smtp-Source: ABdhPJxWHnY/CZiNAzieh2cURAlIqm+0x7tH/zf160ESS25e2FExXNlpwmpZT2iayb4PANYHUMn/ig==
X-Received: by 2002:a5d:4567:: with SMTP id a7mr22632327wrc.362.1623160759809;
        Tue, 08 Jun 2021 06:59:19 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id b15sm19028240wru.64.2021.06.08.06.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:59:19 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: i2c: update bindings for MT8195 SoC
To:     Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, qiangming.xia@mediatek.com
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4df57c35-529f-9534-979a-f5d862a519a3@gmail.com>
Date:   Tue, 8 Jun 2021 15:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 08/06/2021 05:16, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8195 soc.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7f0194f..7c4915bc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -15,6 +15,7 @@ Required properties:
>        "mediatek,mt8173-i2c": for MediaTek MT8173
>        "mediatek,mt8183-i2c": for MediaTek MT8183
>        "mediatek,mt8192-i2c": for MediaTek MT8192
> +      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
>        "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
>    - reg: physical base address of the controller and dma base, length of memory
>      mapped region.
> 
