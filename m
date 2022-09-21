Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CB45BF6D0
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 08:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiIUG5I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 02:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiIUG5H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 02:57:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF63792D0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:57:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id h3so5844287lja.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ST9LOdbD8b98u8DVosLruAc6e3OeQDMBIjH+I77FEAc=;
        b=UVBobvtXONp5sEgR8szPLKrisdM9tw8wMEIIHlozjTfTtlIcAUDoqQKrewG2GMZkKu
         orDz/31Ow+IGh0Va8POh4vixsmmfGzysUZPkSzLUWNqZCUVP01u8jB68iFDrouetJlQm
         AdLLFUk9mqEFUAKAa/WlVzyDV+YL4TfewLmgEIK7Fs6Ppx9y2Ss9SWy0JMvlxae+SaB/
         sVU/wVmA0ntOGryI4CJGmXZWWuq7Ate3SilFf6LeixFKU9ecAF+panDZ70GGCwrXY42a
         BtGBnZp2ZYkYgtVL1MWYyQwWtccBCZiKO9/htt6Q3DLl6EcC659cG7JnIjgPICg/BLRz
         mDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ST9LOdbD8b98u8DVosLruAc6e3OeQDMBIjH+I77FEAc=;
        b=xW2VCdYZuNwyPtQ2FdUxzTYPIt8GtCo2wD3WT/An05+i23XxhsIxwaWayhmMQbJG84
         fV/kNfJXFMLXtTn2ybQdwjX7PysT9fOXTa1127ylpcwamcZlRay83HRtpoqBWciRGyIg
         C0DP0mhQrsIpLfc4JwU9sKLCfjTO/qWHKWqTyKkaCVseOhOM5/Wnb7EW6wgUTpBE5dHJ
         JgmmH5rbqpd0j8r0PWe7I8ofsgvATCpwinKV5W8kUHOgJJ71L5S2zAj8Gpe6unADs/wH
         4hRKQQVkw77lq/jwGizHCGmAtLjnnREosnNvYIIy1ljmy8AXzHYc6AsQ9YAg8tAcXQrA
         n3uw==
X-Gm-Message-State: ACrzQf39xPtpzbqZfZBdoPzYEkQzJDmmQCd3JoZpvp7jMdc5TVwQys1M
        ZL7te3Rl1rfUmnHEHwLy7/h6tg==
X-Google-Smtp-Source: AMsMyM6Lh8r3OYaAI/zAuEnTruNBaeAE4CPnkzf/pkZBfrvX2/sCoKDAKa4Mgf/qH6kcJJ478fb9ww==
X-Received: by 2002:a05:651c:626:b0:26c:9cc:e094 with SMTP id k38-20020a05651c062600b0026c09cce094mr8584535lje.409.1663743424410;
        Tue, 20 Sep 2022 23:57:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x25-20020a0565123f9900b0048cf7e8145asm307753lfa.117.2022.09.20.23.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:57:03 -0700 (PDT)
Message-ID: <f8495316-42f4-59f9-a824-7e944b7185fb@linaro.org>
Date:   Wed, 21 Sep 2022 08:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Content-Language: en-US
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920174736.9766-9-asmaa@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/09/2022 19:47, Asmaa Mnebhi wrote:
> In the latest version of the i2c-mlxbf.c driver, the "Smbus block"
> resource was broken down to 3 separate resources "Smbus timer",
> "Smbus master" and "Smbus slave" to accommodate for BlueField-3
> SoC registers' changes.
> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists.

You keep cc-ing other addresses or you rebased your patch on some old
tree (like 1 year old...). If this is the second case, please be sure it
is rebased on LATEST kernel, maintainer's tree or linux-next.

By not-ccing people, you will not get reviews from maintainers.

Best regards,
Krzysztof
