Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5BD66DB7A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236353AbjAQKtX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjAQKtW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:49:22 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87772D16C
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:49:21 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k16so1247088wms.2
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hw9LSsAC+JoG6t7UQRkksJH/sKygxvY+0Hbj6I0x4NU=;
        b=dYLDQ84qhLknci0JyJ5YViFyJvPEvYzYN9BvqSEZiCSLsxxzXldEKMSKPSrh2d+RBm
         9EsATFRiyaAn4bnCfr5o2BcyOIaefFQHeLcNV6HshNkayK1hvEkp8dHkvBWNPIb3UX2Y
         s8mz8ZZquszsxRxVgiv+TmFHzquHK6/ORHzJCOHnjTqRrqHPexhLF5YLGqQtAZIRp/3J
         NOecZVIbtgmyk+HaKgnChU79SQfA5VaYeS+zTQdYjyphDGx4u01q8tx4m7m0tcByCb9H
         fx+oTd1NF8kFsgJP4XJBso1kZ9NOYdtsenF0LaVAoOka79fHb535vuPGGcg3NbnKrIWS
         6Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw9LSsAC+JoG6t7UQRkksJH/sKygxvY+0Hbj6I0x4NU=;
        b=5uvV9DaJK0CtGu0gN2o5Ddfz8iv9qnxiMZz+Ei2LoE/oebF/BmZCCIDt2ivwrAwxrX
         irGFVGGVNPnsLUTa2WVNBOAMCkewO/5VukbXUFPliaJ0P8gs0+y41eP0TEzi4jQOVx32
         wAyopqqLWiZufUNdI8ul3HvfltJY7/2K2+BtL82+7K3ignxIdy0CQTllqPaPuqNUOvl+
         GcFpqg28cFOed3PHhJZI0dn6uiyo+3BNryh6D1+9S8YEitxE0YZ7rZcycZUbZQSzF3wL
         +Lcha5T97Vb6aO5hyXpix3q7Hg6Mt8D4h5I56l/eQ8Tq14vy0TI8ly3EIwQcrqnb1189
         jK7g==
X-Gm-Message-State: AFqh2kqWon+Vy8sfFo1rSrKRLBR9hSGO92Mk11DaBGWQ672eFDIAbgZ4
        19v0KRGHT76WcFliMIQg1MzLyg==
X-Google-Smtp-Source: AMrXdXuJR/Nap/1o/9BFs2yQmhrWI3X0LsxMxUicPwDCEX41QW7/OEhWrSlO5WJWSaWhGM6Ye0Fpbg==
X-Received: by 2002:a05:600c:1d12:b0:3db:53f:baea with SMTP id l18-20020a05600c1d1200b003db053fbaeamr2320734wms.6.1673952560238;
        Tue, 17 Jan 2023 02:49:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c2cab00b003db0ad636d1sm1152853wmc.28.2023.01.17.02.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:49:19 -0800 (PST)
Message-ID: <c5ee50a1-1838-3a29-e800-3492dae63167@linaro.org>
Date:   Tue, 17 Jan 2023 11:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add an entry for
 Meta
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     garnermic@fb.com, Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-2-Delphine_CC_Chiu@Wiwynn.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117094425.19004-2-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/01/2023 10:44, Delphine CC Chiu wrote:
> Add "meta" entry for Meta Inc.

You need to be a bit more specific. There is Meta Platforms Inc. but not
Meta Inc., so you might be talking about different companies. Describe
shortly the company (e.g. website, NASDAQ ticker)

Best regards,
Krzysztof

