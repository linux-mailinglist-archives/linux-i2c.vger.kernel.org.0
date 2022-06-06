Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419A553E3CA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 10:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiFFHem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 03:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiFFHej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 03:34:39 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD70122518
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 00:34:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v19so17600512edd.4
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jun 2022 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f+ScugHy4AlcscEnldL2i5PmbfvQGH4t+6gM1Or5hQU=;
        b=vClp7zDdiSSua3oBwwpibNjZV1/FgtOu6YjrqDwUTJeboiE7xMBaRmFzZMij4Ifk4V
         wi1bRx7Z9cZm8iePc4KGYsAxqQaczdTNO0TuWLC8sfYe58H85wFqY/tTJYRNnFpoENnd
         q/Q6OcXje+KY0K+IBjZYvdv9ubDHESPmjIzGv/ZQHo5WiZzovNe1QccTp6zliv/2bjRy
         8bO8xx8Rx5LzCmfv8xmrsU9sHqkxzHw14kni133wgXHF+3wjZDjumWn+4mZkQyH+ygl9
         Od415jviG4Ua4gqf4lZaqwnvChKc2TkvTQaRd05vx77YDjoRUphETVbVnVhB5QUpH/9Q
         mVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f+ScugHy4AlcscEnldL2i5PmbfvQGH4t+6gM1Or5hQU=;
        b=Ue0kqZOQLCKPyABynwTDQ/I2VfKx/VwXaSyVU2hoyVN8//reS5DEWuiaNVQf9SdJPy
         uqDH5TupDrVfJyknI0okm/sgOgq7RFUbJquFPfGCHGP9uiMdIvL19okd+vxmDq3jflOP
         11e72sfp2NgOOhn1HnXmVMYk7jpWM1h74M6JUEmpuH8wuXETfJ043asWSr6lIlVDF28v
         gvxCO2wRBhO0rGoUn6b0ZSshxh3eaqvaP6CBji3A8uiXY9UJ1XFJO61j4jZeEJIZZMxy
         c2FM8p+DNfBFXe7TxzCIz0rrTlxtOAQDzuutGY9VzCCWYr6tEUU8+M875y+TqCo9I55n
         7/Yg==
X-Gm-Message-State: AOAM532RTu5AKu73jgZ7Iibj1VjzOsHPdG06cXnP8a2cMUUnvdEDRNmM
        T18GYwEF9CpJJgR/s0hh4GHHyA==
X-Google-Smtp-Source: ABdhPJzsdrYxbqs5FgA4BhHAFfwRp0nwo5WvSOzpYDmPzZFoFqOex6Gm7p+2PUm7Ju5jyIpMQcx65g==
X-Received: by 2002:a05:6402:1cb5:b0:42d:ddda:7459 with SMTP id cz21-20020a0564021cb500b0042dddda7459mr25843817edb.16.1654500876277;
        Mon, 06 Jun 2022 00:34:36 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906560700b006fef5088792sm5980417ejq.108.2022.06.06.00.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 00:34:35 -0700 (PDT)
Message-ID: <a83be47b-4cba-e397-51ba-c2093fa0d46c@linaro.org>
Date:   Mon, 6 Jun 2022 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
Content-Language: en-US
To:     mail@conchuod.ie, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/06/2022 15:32, mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> Couple conversions from txt to yaml here with the intent of fixing the
> the dtbs_check warnings for riscv. Atul Khare already sent patches for
> the gpio-line-names & cache-sets (which went awol) and will clear the
> remaining two errors.
> 
> Rob/Krzysztof:
> Have I correctly expressed the mutually exclusive properties?
> I had a look around, but wasn't able to find an obvious binding to ape.

I'll take a look.

> 
> Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
> to be in the same patch or not, so feel free to squash.

It's the same patch, so please squash with next release.


Best regards,
Krzysztof
