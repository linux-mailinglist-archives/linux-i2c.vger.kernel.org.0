Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CD451D299
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 09:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344647AbiEFH4S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 03:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353933AbiEFH4R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 03:56:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A833467D0A
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 00:52:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso6394071wma.0
        for <linux-i2c@vger.kernel.org>; Fri, 06 May 2022 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gMeYUcunQ9s7ulEnRlF5vKDKL/0JjyKSw80VuJAbcaY=;
        b=Aho85y8yggkvIcNTBvN2ySStCMWKvXOE++5WTQ1nWsY/APWLTtz8NbH/T8+AL+uk6i
         HYEV16PfXYgM6s5O9OkqrxTXt0BORdJ4Bp+CPpblnkwETLcEwUCuS93cspfSW4hA4mNS
         0LnCc2qsyRVru3A8K1oS9cqXLLWfJUG+36OhVF8BVN/XORdx/fwDWCZPggPxUFnUCIJj
         bHT2nHVGj88c/v81JCkZTfhANHJZ1pCwkz/5OQ8A1FO7SE6oywpfzNoTDIx6GPV8HVS5
         i4bg70ObD8nDHrEItV+W9v89StkToAKyD/j3J8kUEJdpar+pJdFD3/e1HIhM7J3ZGdbw
         +70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gMeYUcunQ9s7ulEnRlF5vKDKL/0JjyKSw80VuJAbcaY=;
        b=Ya96Z7pYejSdXxoKXxhENfiTjLeC+rpgbWmMGpioF8lrsNgMd+D1+9UYnOwKMiD9Ki
         nG+h06L1W0afH7Q/9WYiInR15rgj5vAaodZAy+OuyNlfYdKVHDN+JnW4dO2YFzcswpx9
         KQrRjCGGwXiFkL3BZzULPKRl0zBXAkrVOfsqzaGnGzJry7xjJkvRCui0od6TDBcTb3Tm
         3Re6pC0aNDIEBITd20cv9l+G7zdlx0FkY2f1nNGZ0+dswrzdoquQRHKQFOs5E3i0bCnU
         tl/c0O8sbmyzKQXoMPKou4EiJQpYmIkA0NGKMWBMb+IgXM52EPJJfEtRHvLIRBGqq4Zt
         dnUg==
X-Gm-Message-State: AOAM532bI4dRdCm5Av9qaR+mfA3AkgzhiGGAWWI8grXoGbQ91o2NoWiv
        kDwXuj1CM1Ea1QOwE0rDSLCuLw==
X-Google-Smtp-Source: ABdhPJwbl8yjl/Xxp5ORYcUlHPMyIQHV5om0GxDNcFsIzsx17MOQuyljt/6IxM7sSwEamGITfOqtFQ==
X-Received: by 2002:a05:600c:190b:b0:392:95b8:5b18 with SMTP id j11-20020a05600c190b00b0039295b85b18mr8490715wmq.152.1651823553220;
        Fri, 06 May 2022 00:52:33 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c00da00b00394517e7d98sm3291109wmm.25.2022.05.06.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:52:32 -0700 (PDT)
Message-ID: <60612719-a41d-3523-0109-2f2406d31d6e@linaro.org>
Date:   Fri, 6 May 2022 09:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] i2c: s3c2410: fix returnvar.cocci warning
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
References: <20220506073134.6544-1-hanyihao@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506073134.6544-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/05/2022 09:31, Yihao Han wrote:
> Fix the following coccicheck warning:
> 
> drivers/i2c/busses/i2c-s3c2410.c:388:5-8: Unneeded variable: "ret".
> Return "0" on line 551
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

This was already reported:
https://lore.kernel.org/all/0d1a0027-e74d-9f07-3b96-372b5ca14ae3@canonical.com/

Please apply instead my previous suggestion.


Best regards,
Krzysztof
