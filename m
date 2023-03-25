Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5726C8D4F
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 12:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjCYLMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 07:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjCYLMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 07:12:50 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CFB14EA8
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:12:47 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id t10so17282403edd.12
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=geb6dszSdPEclC0i9jC/0SdaI754rIyFU2xO6DvpzfKgCLSi+crJ/ha7gvhh4mkKJ/
         RpgSNLq7KKSn/GzBp8VLUBAR+2ZIhvhymqwW8mJDYGVIrWgkNps7uRpPPjtE4ewNxu0Y
         7eqDdNgaBIFoabYq9srYc4gpT12DeaRGWU45faXGSVfjkHKsc3pxgRnhYvs6MqoShDeO
         35kDR18K7Zsn3GNsRPQXmh3wXADALhYL37fUF4LBkC70l+l3bpBLVFsgE+5aZ5aHU1XQ
         Q3+Lu91azxFIeVN+MsAPRA6V+IMmKDyRLJwaan9TVO8Pe0FO37SarJm5xDtDR8HWUqso
         QO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=smVCAcERWZMDcOVMR/1NKnkjMMvultZzLPp5MilWI0PzuFv7oy0O7uXmMhf3PK7bZE
         r2jhyJgpb/ptPLOj2g5vsb5+CfPTiJmg0dzXp87xqb2z2Jecmy1RgAJY6ygYxZE2Zt06
         ljinR+d3/V4PDeCe4NBz0dcsP+xb7enzR8aHJgW1i7gmpKeiM5tp6Mdl0Q9tvUbWZ+YR
         v0VDuJgCHInN9g6ER1n/lDPR7bCvYDaPAj1UC/4ODyb8vbH0W0M1CcLDtcQdxvLu2GRg
         uUjAfrSXWtn5RNk6E80MwfrpFpuS8aqH+uYSwNbeMZbQ9np0nB2oMEJWiyByKsyECQRU
         GViQ==
X-Gm-Message-State: AAQBX9dZ5vWGDfQf6kGHuvxbzdkQG3/ptLyr++3DK49Gr+6GSKm26MFb
        Z31pRL0o1naDigDlUbcmKw2Nbw==
X-Google-Smtp-Source: AKy350ba6T8ZzFpM6baZosd4rhtYX0c3g3ppufyrcSy2Ttex0o5fyknxa3roehxOistyoBz3X8p/AQ==
X-Received: by 2002:a17:906:b349:b0:931:91a:fa4f with SMTP id cd9-20020a170906b34900b00931091afa4fmr6752833ejb.41.1679742766251;
        Sat, 25 Mar 2023 04:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm11988618edj.91.2023.03.25.04.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:12:45 -0700 (PDT)
Message-ID: <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
Date:   Sat, 25 Mar 2023 12:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 08/18] dt-bindings: gce: Add header for MT6795's GCE
 mailbox
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> Add the GCE header file to define the GCE subsystem IDs, hardware
> event IDs and thread priority IDs for the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
> 
> diff --git a/include/dt-bindings/gce/mediatek,mt6795-gce.h b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> new file mode 100644
> index 000000000000..97d5ba2d2b44
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

This should be squashed with previous commit adding this compatible. It
is one logical change - bindings for mt6795 mailbox. There is no point
in splitting one change into two.

Best regards,
Krzysztof

