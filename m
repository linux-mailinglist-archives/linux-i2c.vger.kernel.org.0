Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF053A19D
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 12:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351633AbiFAKCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 06:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351654AbiFAKBp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 06:01:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E40DCFD
        for <linux-i2c@vger.kernel.org>; Wed,  1 Jun 2022 03:01:41 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gi33so2679617ejc.3
        for <linux-i2c@vger.kernel.org>; Wed, 01 Jun 2022 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vbUaLzVSugxs2v7OnNZbCsv3RN8rW0zxbgQMgNkMQlY=;
        b=qCpD1ecykxdeE6o3r8Cl/HN+JB2JFyigbZJlrKP52lBfoHDsyA2xb2PBziwMaOLe1L
         +ewbx3IykafZ+LJtO4B8BKDB2IyrfzINE1zuJk//fmotP6JwSkeIpQcUF6mLq2dfbnUT
         id45AXNxrujLTYpyw6jP2QDYJIzr9BY0N3s8HJ238smwiIBOOd9ssD51XVXvgidg4pFU
         vtlr+5crCYAwwfwFD4D7rMKRHbYqcm/jk/pCkCAVWj4hcJSDsRu/1oRg2Xqyf0xeIbSs
         DPFJuENPrJcJctlpOrgVppdtX/s1hl29N4snrnSQtwvXRS5g6iTzs2pTXRgpYDe80yDo
         QNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vbUaLzVSugxs2v7OnNZbCsv3RN8rW0zxbgQMgNkMQlY=;
        b=6hgIj2VJCeEzYWWCCuF8q4t08Spruj/97Vi6HXw/WCmJuYFILq6fvf5OhgJwi67LNc
         OZydeaEaDbZTKwmwrAm8akoZSBs9q0/pLZ4n5xuvDQuiFnLYKYSt0cKWHstUO2e4X7Ye
         xx1AI6Gfn9opfZmCGrhXKkpc9BoH99N0DlABYZnMxfwiCDpwSFOO1r1H2BmVkTL33T8+
         9rY2L9enXLaoVhEOErOJxjNcOhD2Cu00kDxx5GAh9JL2ejTgzMI6Rgwt6e/+Eut1qKXW
         1bm/OEHE/ihHu1KAA38efwqQIRIGYghiIwMOY/6n8+qK9rIUQ7TcVX0VYyNkmD+no/mU
         t/fQ==
X-Gm-Message-State: AOAM530/pjo4SKzGzg8eh1IZQJ+QDepiuDwJWrTVxOZsfctsszKYhuQH
        xgbKcVY4wCB9PmFXO5iGGZBIHQ==
X-Google-Smtp-Source: ABdhPJwyvVq0TPWBllaxxHglMZiV85mpdMH40cNFM5d4DKr4ArZwz+H/GQSSEeH1Ljb0CVHQAWEnQA==
X-Received: by 2002:a17:907:7248:b0:6fe:a121:d060 with SMTP id ds8-20020a170907724800b006fea121d060mr53409161ejc.9.1654077699553;
        Wed, 01 Jun 2022 03:01:39 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906359600b007041e969a8asm511703ejb.97.2022.06.01.03.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:01:38 -0700 (PDT)
Message-ID: <d6f2531d-2869-92b0-4c46-f2cf84990d35@linaro.org>
Date:   Wed, 1 Jun 2022 12:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/17] dt-bindings: nvmem: mediatek,efuse: add MT8365
 bindings
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Lala Lin <lala.lin@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-8-fparent@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-8-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add bindings documentation for the efuse driver on MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 7c7233e29ecf..444875264493 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -32,6 +32,7 @@ properties:
>                - mediatek,mt8192-efuse
>                - mediatek,mt8195-efuse
>                - mediatek,mt8516-efuse
> +              - mediatek,mt8365-efuse

Order please


Best regards,
Krzysztof
