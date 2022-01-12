Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC11E48BCD7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 03:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348029AbiALCEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 21:04:51 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36356 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbiALCEt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 21:04:49 -0500
Received: by mail-oi1-f175.google.com with SMTP id r138so1578596oie.3;
        Tue, 11 Jan 2022 18:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mx5kM8/eFbEmj5GoTrBeZpE6D6++kND6itmYCnUWRS0=;
        b=kAoDR+yqCD3SDy7h6YZXw+cWz+AwiDCWkRFaOgJMcH2QWiQAE8y+R5kFdpj5zwdHRQ
         m353DI3rZoVAZdZ4YfA23EwRcWKUGMV2AH3APil+xBHoYmWw2lQhtZ+/mVCrwhQwLOzm
         F9jBTHT3eivG3vBUQL7uxkzXvqxgnqYA5JAjLKyd9XCHY1kuqFcjHsV2eceXjdhMbPdh
         UUog8ciByRa7+fTzLLj0teoyuCbZlKpo8wmf9CW1UpJPnrHGM8QM/mtxa2VMy0MABtOa
         ZBYCbxXY3k8AwSvpodxX2FJAKS6U9gTkfwZ4+woC7+zYGbAjrNEamyG/nVwiiMgRhTXS
         eTFg==
X-Gm-Message-State: AOAM533dk6/sVbMNtLDHeVtCUGno+qDk3amedtrLbikdxvKxf+x3DWjj
        Qx5CSRhKaW8urvRH2hZoIQ==
X-Google-Smtp-Source: ABdhPJynGAXr53l1wUKltZqr7h7zzdGD6GxIzBkcgKyEgLxkRVSe1Db0vrJMsEmFIWjnp27Sat1n9Q==
X-Received: by 2002:a05:6808:1a13:: with SMTP id bk19mr3783151oib.52.1641953089018;
        Tue, 11 Jan 2022 18:04:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k19sm2279660oot.32.2022.01.11.18.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 18:04:47 -0800 (PST)
Received: (nullmailer pid 3920282 invoked by uid 1000);
        Wed, 12 Jan 2022 02:04:46 -0000
Date:   Tue, 11 Jan 2022 20:04:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, yuhan.wei@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qii.wang@mediatek.com, ryan-jh.yu@mediatek.com,
        leilk.liu@mediatek.com, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-i2c@vger.kernel.org,
        housong.zhang@mediatek.com, robh+dt@kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
Message-ID: <Yd43Ptp6dTxd93Ej@robh.at.kernel.org>
References: <20220108095418.16602-1-kewei.xu@mediatek.com>
 <20220108095418.16602-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220108095418.16602-2-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 08 Jan 2022 17:54:17 +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8186 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
