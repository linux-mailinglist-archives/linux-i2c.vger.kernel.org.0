Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78753544363
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 07:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238688AbiFIF5L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 01:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238569AbiFIF5C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 01:57:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7EE2DA8D;
        Wed,  8 Jun 2022 22:57:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59BA661D58;
        Thu,  9 Jun 2022 05:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC28C34114;
        Thu,  9 Jun 2022 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654754219;
        bh=Lk9VcDtnAmCoMRcuenCeRZs/rDxjxHcun+H8Vl2ka0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8DsCVOvrbUU3PHnU9OPtRCyArNV8i7UbH9DNGl7TQTrqQ4QI7VQ5i95Stk/stCgr
         YYAmxAxiLsrvk1cIGG0run+4Ybvh/EToyMRuDLma6Cmb1lDLk5QhonRFQ4sG/OYGAE
         NGVw+25bVGzor8s8SnzbogYrxcfOjmVgLwdAj5WuJhkIEbpvjEbeOoKPh3mAdmL2hA
         AK65I65XkoVohj15Fh3+kfSy/Ztc+1NcGEvSKtko3BqWRiyIU+Vd0BrlihMeOsAyxp
         OFr1SUy/HsJLwXTE6fVsRjmBgTmzESxWO0PkIYFv4lcb1WjgbDfiJolR85nSV0pEM0
         NrbOxi/3MTnSA==
Date:   Thu, 9 Jun 2022 11:26:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        Long Cheng <long.cheng@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 05/17] dt-bindings: dma: mediatek,uart-dma: add MT8365
 bindings
Message-ID: <YqGLpyWUgBJQXG9K@matsya>
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-6-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531135026.238475-6-fparent@baylibre.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31-05-22, 15:50, Fabien Parent wrote:
> Add binding documentation in order to support the MT8365 SoC.

Applied to dmaengine-next, thanks

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> index 54d68fc688b5..19ea8dcbcbce 100644
> --- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -22,6 +22,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt2712-uart-dma
> +              - mediatek,mt8365-uart-dma
>                - mediatek,mt8516-uart-dma
>            - const: mediatek,mt6577-uart-dma
>        - enum:
> -- 
> 2.36.1

-- 
~Vinod
