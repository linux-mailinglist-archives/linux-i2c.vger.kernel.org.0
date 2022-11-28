Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362F463AA97
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 15:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbiK1ONG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 09:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbiK1ONF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 09:13:05 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE42310FD0
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 06:13:01 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id y5so4542394lji.0
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTh1nEEe1sZRF8M0HBvSAqoj/WogzsicuLZxTaiVtEk=;
        b=cnGclIVTIKCjEAuQSzJYnC7wk8mdlCiLluFSrAmgb0ybDl4nhlr9Gd6tNHSrPiflp3
         lnbpE+R1iEXEC+yLedMHs0Z6SkiDoVBj+nMrZ90QuQGiLmHBTp7HVlqM8AIxddxP2KAT
         sbIzJFvNJxy+LP0qB7aZE1xNlmQIvtlruGRIyYNP6OVSeSI7GaG/D2FhVUKQW01qWWIs
         SRxx8WGbcISDj7VNirmDOQizwfl9+7Z5AUpkDLchFrNSVAgDF2FAG2+BcH+WSMh3CXH3
         /VX/u3om6/wPKoK0W4U7VSXZf62Pf1dn9EdnPRQBhwK2gULy06Ya1uVZNQAus7l+uhHz
         f+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTh1nEEe1sZRF8M0HBvSAqoj/WogzsicuLZxTaiVtEk=;
        b=aZdBtnbknWwS//jyrzudenj6IqXe09j647IO5ikbgx5YVI/PCdgrWiRbR62y66WsEZ
         SGFm1eXejsJYJ4bGAbFt/cSkV0/wjW0tFxBfHlM6KWiQ5+mWv1lIuNxbyckJLP4UCWGu
         mjQrVzQ+F4SPE1gYYjv0v9YeAa0uvnxOk3T9rDBtIgWwueZhRSwVKRG57ioD78nDKT6B
         XSwNeeIMmFvXDjkHx4h+C7uqcRkelW0mj3r/j1usQuq9IXKPvnueL7ImkN2OF0UiyVUn
         nruGxh9DDVfViUOIDeevVEHMn6gASS9avR4M9PXtZIkoxPGmhoJmBurNYCGppb63uUiF
         dJCA==
X-Gm-Message-State: ANoB5pnq3tDA1X29DkRlE0U6yovloDuAOiywqT/ukuhJ2tZFTUV8wTSC
        qq+yxkDRja0zRLdVG3vZEfdk/w==
X-Google-Smtp-Source: AA0mqf4RTqCSdVc2fh4P/K+7P/sOstE+KCYSuuoGYLYuBYboJ4/i1E5DomK6dGz+ooHuSLU2nOY2XQ==
X-Received: by 2002:a05:651c:12c7:b0:26f:c03d:f99b with SMTP id 7-20020a05651c12c700b0026fc03df99bmr17132650lje.190.1669644776127;
        Mon, 28 Nov 2022 06:12:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m1-20020a056512114100b004972b0bb426sm1759227lfg.257.2022.11.28.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 06:12:55 -0800 (PST)
Message-ID: <ee52f463-f54c-70cb-5a31-5748f26f40bc@linaro.org>
Date:   Mon, 28 Nov 2022 15:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] i2c: loongson: add bus driver for the loongson i2c
 controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
 <Y4S/dh9lztpOHxkD@smile.fi.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y4S/dh9lztpOHxkD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/11/2022 15:02, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 09:00:24PM +0800, Yinbo Zhu wrote:
>> This bus driver supports the Loongson i2c hardware controller in the
>> Loongson platforms and supports to use DTS and ACPI framework to
>> register i2c adapter device resources.
>>
>> The Loongson i2c controller supports operating frequencty is 50MHZ
>> and supports the maximum transmission rate is 400kbps.
> 
> ...


> Why not using the usual pattern, i.e.
> 
> 	if (!(...))
> 		return IRQ_NONE;
> 
> ?
> 
> It seems you ignored some of my comments...
> I stopped here, please check what was given against v1 and try again.

I propose to wait with wasting more time on reviews because you might do
the same work twice:

https://lore.kernel.org/all/822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn/


Best regards,
Krzysztof

