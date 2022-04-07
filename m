Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83B414F86F1
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 20:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243325AbiDGSM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Apr 2022 14:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiDGSM1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Apr 2022 14:12:27 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C29224775;
        Thu,  7 Apr 2022 11:10:26 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id o20-20020a9d7194000000b005cb20cf4f1bso4439692otj.7;
        Thu, 07 Apr 2022 11:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6TEYtr0WQJYpfQ0AF5934WwFtrAlPa1PaWKEAl7TxDc=;
        b=Av4vl3MD3UczPb2r4CZhUxzfFrGKhi0UheOJsL16ZkU1wPmno2hSYNev94a8KZ4b/0
         aYWKGNYHfJAwrlQtXKjFLacQE7zqc6mtStJm2v5SIW0X5tUvwpWfdvcXCtgOtiJJVe6k
         qp6v8mHTF9XTBgx/bQ9EB2OS8vv7gYhZVk0l4bdUZfKo/ehy34AY2TZZHxmlLr1e8ChF
         M4UdvJubFVlzVYmULMp9BfoM4JarBrWB2ekYmwjbAUfbZbMx7yUdPyS+0kplE8UCJwjj
         OWYxejrjImKMQR906TSWv65pJKnleL2dwAI0Vo1+GrZp//2IYPJW7m5kWC/WzH3rVKAL
         Nn6Q==
X-Gm-Message-State: AOAM533o8v78zCfhtoRx2VZKPvrlyCmRgikaaNPmVyKrbwsfsLbullKU
        KrPTwIedf5qBKs0W2pggzg==
X-Google-Smtp-Source: ABdhPJzB/b9X7R/SPQT9WwYzSy0K71IXwHdQnVUmKIG6nDijEMu0eda107qtX4FiJ/lv/sp3bz3ezw==
X-Received: by 2002:a05:6830:14a:b0:5cf:b0e5:485f with SMTP id j10-20020a056830014a00b005cfb0e5485fmr5299147otp.293.1649355025378;
        Thu, 07 Apr 2022 11:10:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k10-20020a4abd8a000000b00324907b406fsm7298601oop.21.2022.04.07.11.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 11:10:25 -0700 (PDT)
Received: (nullmailer pid 1716498 invoked by uid 1000);
        Thu, 07 Apr 2022 18:10:24 -0000
Date:   Thu, 7 Apr 2022 13:10:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, wsa@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
        miles.chen@mediatek.com, kewei.xu@mediatek.com,
        linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        hsinyi@chromium.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v2] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Message-ID: <Yk8pEIqxeZeblOWM@robh.at.kernel.org>
References: <20220407094753.13282-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407094753.13282-1-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 07 Apr 2022 11:47:53 +0200, AngeloGioacchino Del Regno wrote:
> Convert I2C binding for MediaTek SoCs to Devicetree schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> v2: Changed minItems for clocks, clock-names to 2 (main, dma clks are mandatory)
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 119 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 

Applied, thanks!
