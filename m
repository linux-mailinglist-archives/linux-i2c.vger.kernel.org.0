Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC8956B432
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 10:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237649AbiGHIJH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 04:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237318AbiGHIJF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 04:09:05 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B108048F;
        Fri,  8 Jul 2022 01:09:04 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id y2so19030433ior.12;
        Fri, 08 Jul 2022 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kYY4oyP2yJ05X0fyoFzWVBZP+Opu7IULHq7eoqZi9XU=;
        b=kovIpw8pBU9WmGuOEzzXwc4hO2pgx3qRf1Q8w0Rflrd7EwpDimHkEscQeEcy2aHMbX
         ZZVR8F3jfmZRlN80QxInOSUHs3Q9ibjScjiYGRwfoltLK8eXhhmhyqKClro6v1tPgDSI
         0cRnCKtV39qwvb7Qu9pnra56Z8+LSrz33R+hLMlxB5zKDjsUOgtHfBcCPUnxtxmOmCtR
         bki0aO9PcNmkQp864ekmiyWGGwxRJUgxoAUwRNobPbB0+1oo7VJoJEYmuFXyD+vLQq+d
         QQOOcvrXMBnmHbF4jxlZjS8RfKDE6MfSKoSt/fPznvnZJaCdrVmew60mVL+TlQ4ptZkX
         BqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kYY4oyP2yJ05X0fyoFzWVBZP+Opu7IULHq7eoqZi9XU=;
        b=lWhvvXDLTLiQfKcg6WfwpuSkDz53jomBFpMucpvXhiyBMZAJx1eQ+Jx8dhgYt+6HhT
         no3uJmy4OGnChpF6gmlw5FC95MFq7vqNVVGiQzvc1MehkmcumgdNW/a7bZQnUaQ/cYDq
         a4SVh86ukztchINPHJtJW/xy+QkrAvyMEcvgBYqFXHNqVwE/kmwJ9YcLEN8SNgJPsTcf
         Q0NZz56w6vMaSXa02jBTLPQISYRhx92jFuS5SublhGO0q9aDIlgpdyGaBJSacd/F08Kr
         s+TzgjhXqG3eDQcjW5OZI8tpZHbeKzNCunLbFNGIoigAbTTujc0pr8TaR/KLrqK2oe5E
         BJaw==
X-Gm-Message-State: AJIora8mpu3IftVdvRhXt/RxCOz54NZt1E9JtMLE45pYHcvlFm2Bxmm4
        SABMuHU6XL+IIq11ufHOsCRNnwn2AFqiww==
X-Google-Smtp-Source: AGRyM1sgdwuKRZltbNBJhP7k91fifj8h8gY8hnSNgkvQJlmUw0qOjSn8aiLgQ0VhOIQtUUxL3gWggg==
X-Received: by 2002:a05:6638:24c9:b0:33c:b7e8:4a14 with SMTP id y9-20020a05663824c900b0033cb7e84a14mr1349840jat.293.1657267744672;
        Fri, 08 Jul 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y2-20020a056602178200b00665770bcec5sm349652iox.49.2022.07.08.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:09:03 -0700 (PDT)
Message-ID: <2fa2ee1a-6336-b8a9-89eb-2c7b7bfd02a5@gmail.com>
Date:   Fri, 8 Jul 2022 10:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND v4 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Content-Language: en-US
To:     kewei.xu@mediatek.com, wsa@the-dreams.de
Cc:     robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708034758.22747-1-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 08/07/2022 05:47, kewei.xu@mediatek.com wrote:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v4: resend patch
> v3: add reviewed-by owner
> v2: no changes
> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>         - const: mediatek,mt8173-i2c
>         - const: mediatek,mt8183-i2c
>         - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>         - const: mediatek,mt8192-i2c
>         - items:
>             - enum:
