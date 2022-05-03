Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6CB5184C5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 May 2022 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbiECNFj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 May 2022 09:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbiECNFj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 May 2022 09:05:39 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B301C119
        for <linux-i2c@vger.kernel.org>; Tue,  3 May 2022 06:02:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l18so33263791ejc.7
        for <linux-i2c@vger.kernel.org>; Tue, 03 May 2022 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wjuyFMi3EftK+wExgb79hTBMB0k+0b/v8BwPvQxw7y4=;
        b=oOvQhBmRi4yPVLzZLUCYGs+BVsIOuNPmOP7zuAv3LXMD5ryY+jr8t0qhKx9q+F29WQ
         BFUMY9tC0t8775IV0zq6ZGatAqZ8vb+XQPoD5u8WlFYXY9Uh+p91xkYsKG1i6AMM+dea
         QjUYneOUmX+FKsXrxfDeRI0ClPGkjLAM7MA2UhERQfXsNikqp61+ZKvyowpZMAVC1kcc
         IE+J4noOuFayzwmzRnfXx3bb+i4h+LEFOJSnIgygLWD/q1uU/+Jj/KuwQbLrnbyGdnyL
         bI29AB4FWa5i4EPxR51jt+dA0JJVySxiPs/gI4T72agQLr11VJ9FxB4fZ4IyFzsXoqlV
         6vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wjuyFMi3EftK+wExgb79hTBMB0k+0b/v8BwPvQxw7y4=;
        b=NqbUfU1o+i6lrhjyuD0vhUFgiI3+cIQG86N/yxzGOX8E5WCLXhZsA4FKjGixR6Kfv9
         VgWHe4MjJqrMgnHQgCH/7gXVfzTj129NAGNKecT40MEPdBeq0dMhCxQhWP+5FzTMtYT7
         R4Z5uz8EGGrjCRKEsVDq8yoKvBdcBG09nrnvA0u0JJb6sSRMbSpiJtKH5UVo/VVp8kzn
         u/aiQtbmBVh7CZgTvtVFMxAOEDP/z+kQID3RlXYX83auItnjVZyAnfX0Fzjm8ZW8OVtS
         WibbeVi5wLxyjuRj4MG9wTS4rFT3Qu6FTGlBAf/CcpY09xsVi2ZNWmGNIWuQBzbUTE7T
         ubZg==
X-Gm-Message-State: AOAM530jHg/P9LtKlt+G12hHw+5/z0t5gQWBTF2fyU0d9MXMyAfJpj2b
        YqRBlDyLPlmQp31vHZp6lWAI0w==
X-Google-Smtp-Source: ABdhPJxwG4sLoDPShcHTI6lbe5nIz0+kudelkrlQymVFFYb3TDP1oKvJEVUWereTSbkBgJoKAqV1MA==
X-Received: by 2002:a17:907:6e28:b0:6f4:6428:6ee8 with SMTP id sd40-20020a1709076e2800b006f464286ee8mr6584030ejc.608.1651582918486;
        Tue, 03 May 2022 06:01:58 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz26-20020a17090775fa00b006f3ef214e49sm4580080ejc.175.2022.05.03.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:01:57 -0700 (PDT)
Message-ID: <b854c7b1-b0b5-b921-e6bf-ee88472d2f66@linaro.org>
Date:   Tue, 3 May 2022 15:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/7] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car V3U is
 R-Car Gen4
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d351ca12724d5b306119bd8dcd9bfac09ba2a925.1651497024.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/05/2022 15:34, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
