Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58423570D8E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 00:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiGKWvL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jul 2022 18:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGKWvL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jul 2022 18:51:11 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F91149B6A;
        Mon, 11 Jul 2022 15:51:10 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id n7so6322613ioo.7;
        Mon, 11 Jul 2022 15:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jXAWpxsRzdjuf0jW9ze1znkCeK7jZuvAzyAN65D/SzY=;
        b=FNAuOTLO5YabX5Rg1EBTOz0sjDYrZzWX3jah96q4TVfTZoCL9HetW9ReslV/oXC3P7
         abvHzcAvD0by1CWcr5GXkgGwsQ2mL+7nDCk9z1prTpfi3USmKXk9n+CWzpQZxR6a0QzA
         qxineenYLoIai6HOYLyIU7vqvHihybiGdPIPB25qt/DLQFnJe2djA5gaVwR5rG0C+xUj
         3bYD41z9awIlCnmvratna6kHyhS5sQy+HK15aEa9epbo/N+sms2IJufPpZ3+q33rkx4a
         vHHKI0ZRt2zoRu87C9A9jn14h5R36HBeyMrR3F/YrdnSUVngJJCuGDYGXZfI4gEcrz+O
         qSUg==
X-Gm-Message-State: AJIora+P3c53ko+m6X6PA0cGBebI2LtYLH1/Gmd1I1I5hUnwQXnqe034
        YKGQVCvhMrme26NTAeTBWA==
X-Google-Smtp-Source: AGRyM1t8+HTOGXnkYMIWNIFD5Olq8bhfFtLnjZWpAPq65vQDqoVSjEyZZhyCQPGLFyTFy8OvbwWD9g==
X-Received: by 2002:a05:6638:4105:b0:33c:b13:23ed with SMTP id ay5-20020a056638410500b0033c0b1323edmr11732399jab.82.1657579869885;
        Mon, 11 Jul 2022 15:51:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d78-20020a6bb451000000b00669ceb1d521sm4117055iof.10.2022.07.11.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:51:09 -0700 (PDT)
Received: (nullmailer pid 415975 invoked by uid 1000);
        Mon, 11 Jul 2022 22:51:07 -0000
Date:   Mon, 11 Jul 2022 16:51:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     kewei.xu@mediatek.com
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
        david-yh.chiu@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
        leilk.liu@mediatek.com, devicetree@vger.kernel.org,
        yuhan.wei@mediatek.com, qii.wang@mediatek.com,
        liju-clr.chen@mediatek.com, housong.zhang@mediatek.com,
        wsa@the-dreams.de, robh+dt@kernel.org
Subject: Re: [RESEND v4 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Message-ID: <20220711225107.GA415923-robh@kernel.org>
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708034758.22747-1-kewei.xu@mediatek.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 08 Jul 2022 11:47:57 +0800, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
