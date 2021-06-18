Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077E13AD399
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 22:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbhFRU31 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 16:29:27 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40543 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFRU31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Jun 2021 16:29:27 -0400
Received: by mail-oi1-f176.google.com with SMTP id d19so11857250oic.7;
        Fri, 18 Jun 2021 13:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EGzlVaaWgDgImE2RiFVAxvE6ghgaevoPSA5LifmrdQ8=;
        b=ldbg/wtv+5YQf5IcmTiKa2gB11bFUSvMIZ1ABV2MqcHeZllegDMgG9DIs8kdGLIZPH
         PqKkyao2G7LC7XVqGBP8bmCbbNXYjtrKwNyQ0fe1G6V9pGPpiZKtYAdxFmnKoJbrScsd
         YlXoxqV2YL2G/aS7GcAr1vQ7HxIOWuueOQHQ3a1PV17I4sgS79xAkIf/UFDqOCPBlaxP
         MH8KAJLY90zrF+HFONpz7exAfmUm+Z/ba4giEr4SjX1o2Eu/UoxzKOSq4ZTmceVEP/xD
         oFlMvafuXraKxV8Xt3i2bap119p15Tm9lU4fVE84gS4vBVXb5iMhLmJlQ4029UZnuhF4
         +MXg==
X-Gm-Message-State: AOAM5339ZGr5zBpGJ12rPYFvcJOvsRGKlukHzw+y1MESSvG8Gpi2OZAo
        yz5TskW2GgXCakaoKYEhjw==
X-Google-Smtp-Source: ABdhPJyfAyyaLY4H7Vlj/t/qvvFUmjmcDszM8JUTlfrWdI26tW4mLJUlSuRgTbUEiX1igVmo87r5Kw==
X-Received: by 2002:a54:488d:: with SMTP id r13mr800504oic.152.1624048037301;
        Fri, 18 Jun 2021 13:27:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k7sm2091185otf.72.2021.06.18.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:27:16 -0700 (PDT)
Received: (nullmailer pid 2821948 invoked by uid 1000);
        Fri, 18 Jun 2021 20:27:14 -0000
Date:   Fri, 18 Jun 2021 14:27:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     qii.wang@mediatek.com, qiangming.xia@mediatek.com,
        matthias.bgg@gmail.com, wsa@the-dreams.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, leilk.liu@mediatek.com,
        linux-mediatek@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: update bindings for MT8195 SoC
Message-ID: <20210618202714.GA2821918@robh.at.kernel.org>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Jun 2021 11:16:38 +0800, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8195 soc.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
