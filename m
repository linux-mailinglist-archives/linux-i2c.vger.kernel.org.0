Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAB12D9AB1
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 16:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438225AbgLNPRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 10:17:14 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37111 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407158AbgLNPRN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 10:17:13 -0500
Received: by mail-ot1-f66.google.com with SMTP id o11so16009456ote.4;
        Mon, 14 Dec 2020 07:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ySr/Vl2ci/XujLZBu5wQq6kxGRFqMO/2YetNSvkqjAc=;
        b=hwvRFzCMkmLAyumcEZ+x5HoxioVtQ55fkctIIb046RV+u8UCTXuqzd6bJKNbLgMMZ6
         FFu5CAVC8RUDt8DL7XB91o5m/lRsY/jiIWgZhuH/5Rp1JqtAeyMfsWlFZdlqq3sRcDR7
         K33Xy/kUSfDCSfstiTPCkNv/oCsX7+cqGqOg+HvLB8VTHt9ttTrKkblKvTbRP/uxxSzJ
         opGumD1/5OrVCnGhDLbtmfNrZ7rjHFdzg86o/mWdc/B9htfIrTqRTsdSb1QcxIKLYenR
         CVV4bGEjCKhhGEvP874Fv3tlIsmqm4HnTr6v2quUkrOC4POptoVpPeD5+4jiGqSpX26K
         ZGUw==
X-Gm-Message-State: AOAM533gYfvudEV3h/0pxvOPA3y/9nfPQhTy1oanaWUNzKEthW/YZVzz
        MNFJmtdqxNGjlBtAcgT/SQ==
X-Google-Smtp-Source: ABdhPJwvWfFei+PUOgunAnO1jgcQwKu4UbC3ifUNhnnCaKcRLPgKg6n6i+c4oz1Hvoc/6ZSzcE5ltA==
X-Received: by 2002:a9d:2d84:: with SMTP id g4mr20059505otb.212.1607958992340;
        Mon, 14 Dec 2020 07:16:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y8sm4027679oix.43.2020.12.14.07.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:16:31 -0800 (PST)
Received: (nullmailer pid 1938534 invoked by uid 1000);
        Mon, 14 Dec 2020 15:16:30 -0000
Date:   Mon, 14 Dec 2020 09:16:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: i2c: dw: cancel mandatory
 requirements for "#address-cells" and "#size-cells"
Message-ID: <20201214151630.GA1938499@robh.at.kernel.org>
References: <20201214124347.2120-1-thunder.leizhen@huawei.com>
 <20201214124347.2120-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214124347.2120-2-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Dec 2020 20:43:47 +0800, Zhen Lei wrote:
> The "#address-cells" and "#size-cells" are required only when the I2C
> controller has subnodes. However, some I2C controllers defined in
> "arch/arm64/boot/dts/amd/" and "arch/arm64/boot/dts/hisilicon/"
> directories do not have child nodes. So they don't need these two
> properties and don't write them explicitly.
> 
> Therefore, setting properties "#address-cells" and "#size-cells" as
> "required" in this yaml file causes the following warnings:
> /root/linux-next/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dt.yaml: \
> i2c@f7100000: '#address-cells' is a required property
> /root/linux-next/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dt.yaml: \
> i2c@f7100000: '#size-cells' is a required property
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 8 --------
>  1 file changed, 8 deletions(-)
> 

Applied, thanks!
