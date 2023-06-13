Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9526472DC04
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 10:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240952AbjFMIGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 04:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240959AbjFMIGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 04:06:52 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C1A10EC
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jun 2023 01:06:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-976a0a1a92bso936248166b.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jun 2023 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686643608; x=1689235608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oh9FMASx+40RIFRTYw/y+LLrrdSrxB/p4X2a4zp9Ws4=;
        b=cqEKvVFfHDYoJgMarpDsGYd3s2g3FDEOBAy4sjzhpE26l/fw+vmu2nYWvxbMrLyulm
         WwFPfPMLMH0hfqH433hC7mMq6rdmFDsgKt1VbEZ/DSVpBAeos7ZKHX/fThfCz3E8KUYp
         +X3FoOqAlFf8bQ7SVPezV7PyjMi8tWcOD7d7OPLjCmNmpqgb1rXfixxydvKNzH/OAc2L
         2a7SIAiKMaJJYNYHaQg7b/3LgvlwQMrhO4BvcFIcxYGiOjrtwRGDiQtL5byU8mMuZo1k
         hDIgEczP5q7QDoAuAbOVv34PaIGmhBEsMtR9exkUus1zRfHW0UpTSXzECxTnhoR76HjW
         0WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686643608; x=1689235608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oh9FMASx+40RIFRTYw/y+LLrrdSrxB/p4X2a4zp9Ws4=;
        b=Cf2tHqRo+uTNECR2wms229puffpqF8ZjL9pJgQe5YbCR+ja1MLeQrOC23fpso9imj1
         EqCF0F5HD5xWvYf2wzjw4fG31ko09lz5D5rkiWqYmr1EPKRLIM+PcShxpBuOJOZ1qPP8
         WYhWiAbYKd9U0oCiTOzM2yTQAbC3CUgLpDkgvXHzUXYVc+PDruJH308wG5TydjVQSoD+
         hNSTz1jmPuY+l4FK0470WrXHXpRBwJMhfsodmTjkz/IOSVKV48IqJmYgWN3djMUs744B
         q9FmKB/yk3sEKAPIphTaS1YYPT5XCWyD3NQa5g8V1zW1gsSOtmIyIDVcDLs1aBUmvYLq
         1idQ==
X-Gm-Message-State: AC+VfDwArVy3Sy5RrQebwR52wj80E1uCeZVKSO2vO5E4xgR9TQQoW+A0
        bHQnDgsh651G7e+0FrgOwarBaA==
X-Google-Smtp-Source: ACHHUZ7ZvoKbB/eR5zPGEdQjV/KEn2jaUSHVtC7Y8ed0326mNJhgj90KYBg6vspasSbY983Naq5Pyg==
X-Received: by 2002:a17:907:36c3:b0:974:7713:293f with SMTP id bj3-20020a17090736c300b009747713293fmr13715718ejc.41.1686643608167;
        Tue, 13 Jun 2023 01:06:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906a28800b009655eb8be26sm6300308ejz.73.2023.06.13.01.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:06:47 -0700 (PDT)
Message-ID: <dcc99c16-3807-1f81-03b8-86095f08258e@linaro.org>
Date:   Tue, 13 Jun 2023 10:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] w1: ds2482: Switch back to use struct i2c_driver's
 .probe()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <20230612072807.839689-1-u.kleine-koenig@pengutronix.de>
 <6d76105f-daa1-1cd0-35b3-1727aa967bcc@linaro.org>
 <20230613070237.srqd3sy2c3lp7u5p@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613070237.srqd3sy2c3lp7u5p@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/06/2023 09:02, Uwe Kleine-König wrote:
> Hello Krzysztof,
> 
> On Mon, Jun 12, 2023 at 10:10:30PM +0200, Krzysztof Kozlowski wrote:
>> On 12/06/2023 09:28, Uwe Kleine-König wrote:
>>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>>> call-back type"), all drivers being converted to .probe_new() and then
>>> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
>>> convert back to (the new) .probe() to be able to eventually drop
>>> .probe_new() from struct i2c_driver.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>>  drivers/w1/masters/ds2482.c | 2 +-
>>
>> Thank you for the patch.
>> It is too late in the cycle for me to pick it up. I will take it after
>> the merge window.
> 
> This is one of only 19 patches that are still needed on top of what is
> currently in next before I can drop .probe_new() which I intended to
> tackle after the upcoming merge window. I expect that most of these 19
> patches will still be picked up and go into v6.5-rc1.
> 
> Assuming there are only less than 10 patches remaining on top of
> v6.5-rc1, I intend to create a pull request for Wolfram with the
> remaining bits and a patch doing

Sure, go ahead:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

