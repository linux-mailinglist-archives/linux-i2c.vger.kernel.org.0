Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95FB5184C7
	for <lists+linux-i2c@lfdr.de>; Tue,  3 May 2022 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbiECNFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 May 2022 09:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbiECNFj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 May 2022 09:05:39 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25A31ADB2
        for <linux-i2c@vger.kernel.org>; Tue,  3 May 2022 06:02:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n10so15885005ejk.5
        for <linux-i2c@vger.kernel.org>; Tue, 03 May 2022 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gG0dwpdZEvdDBuvEs96CRkJ96qnrRXLRezy0ryDW5k4=;
        b=iiLBanpH6wybOhZdNakFRvRs/BeXfFL83n5+Lp6Hk+x8s4leUeYYMGQWoKhxdpV0J7
         1pMHBh7WBGFu2aKPfvAG8qHgzXsaxjTaUP21ZqKj2SdLil5rGETMK+rKKjik4TsIGlz4
         bStUUyeQgLTPYIQbXVH9CI+JwLohyzcNlnh0EddrVl/+5iXTis7GfrF8gXtp22jpqs6x
         Os702VOj32qcnCl6Y+AvVClQGt8Xc9lno1vKq5ntzEEQiZPBZhEw3UL/WiHPD/nCT0sR
         G+D9buwLum2kNO2Dv69bhfmEDDFTPqng8UG3245Vaof+4RALxYwzxjBGxDrOAJYiHy9l
         hdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gG0dwpdZEvdDBuvEs96CRkJ96qnrRXLRezy0ryDW5k4=;
        b=IP8IBqqvl/fk/XwQjn0wNxHNuBuzxZlmapW9E8XTzpa/s2ZG8Luzz67c8ACaeLLv1l
         vzF2aC2Ps/jr9in6+sSg05cIMs4Ty7iOU3YnJCje6K+8nhUudGJpqXhgFGajGD4cQmTf
         T/Evrpr2DQGvX4keBPG8XKk4a4LO9Be5tK90zNEOxvTd8bDl2+LpSllaTxQqCV5tvrxQ
         rgxOLRDhE2hPhL4FAKopGswu1sJn9QkD8yYLYVa/uV7aQ0oKtE3mkJV7JYnUVy6ngiko
         QXi8J+Ukr024RWdZ7MRPKZGdx0eDgPf69FgOA2gX+eWg32Ivo9rQw2U8lKI2dH8jgwLj
         uIPA==
X-Gm-Message-State: AOAM532t8uXhF699nZjo33f2gYeHPj4Kw+agOtDHG7vLNSFs+gegJNP9
        wQ6G6qipr1Dri3heEXypYFmxWQ==
X-Google-Smtp-Source: ABdhPJzUs71nSjzDp07qt341z8RRJvmbCI1x3IOR5rmNgkg5GAi+ZNa6GypbybXufvf81im24u2DAA==
X-Received: by 2002:a17:907:8689:b0:6f3:de80:dc02 with SMTP id qa9-20020a170907868900b006f3de80dc02mr15186555ejc.331.1651582923231;
        Tue, 03 May 2022 06:02:03 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gv18-20020a1709072bd200b006f3ef214e50sm4503961ejc.182.2022.05.03.06.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:02:02 -0700 (PDT)
Message-ID: <b7a42857-cdc8-32bd-04a0-827318fb82e2@linaro.org>
Date:   Tue, 3 May 2022 15:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: renesas,wdt: R-Car V3U is
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
 <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
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
