Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73137A2057
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Sep 2023 16:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbjIOOBa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Sep 2023 10:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbjIOOB3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Sep 2023 10:01:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAAF1FD0
        for <linux-i2c@vger.kernel.org>; Fri, 15 Sep 2023 07:01:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-403004a96eeso23557685e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 15 Sep 2023 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694786481; x=1695391281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJR1xw84ziifS+ZzES1LrgBA3e/qgrYQk/L6ew6o468=;
        b=YbT6Vj0tId7G/8VSqiIaS9C2dnk8Ypzr5VJZ2tIxNbRUQBQH1BogAzxAigOsWCqGGX
         I8pPQGgWnckBLMlATrSho0IQPY/mQwPvNTRt0VkOw9w731/wAvBc7iY1x6UmZkvZyaeR
         YGV/RHr1m/JN4uWVXQkpF4wk/A+saVsy0Ylfb3F1WKkF4grNdfVxpsmBQ/o8OQL8BJWN
         l0ZOBLuePODgPdGSmxsaT0EaeteL7qAh+iqJThbOY32Xeu+LQwbcA7GxyTvpk2zUPgrP
         tquIOLT9RHiicouM3REQe+Ct0GeRlky0l5mAtAx4XMXskBcvEFyFpfOELkdtszkcDSrr
         A9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694786481; x=1695391281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJR1xw84ziifS+ZzES1LrgBA3e/qgrYQk/L6ew6o468=;
        b=WTs+cIO1fBCrJuX9lBFiyc8yGHPZqPkpLO/p9mH7KFHT+CbEUlBiioCjscQ6/63JoI
         snz9QBgoz0ZE1K1Oiq9ln3XidGBCKl2K0gmejfntZn+mIudC9/cB64Y6QbvSw2cEzF2y
         ny+Ko4SGAc2MmjxmOMwTLNTVehbLC/r3lNI9OBLgtp0vcBv2434ECfUrC7UL7zvjDXWq
         Wfy05R/lzFvLbSQBYPscfTOdpRGsLchyZIQP+lIHDFMaFhzMQ5feMDbcB7MYAxuGHP5q
         obYwrzUCfyYDb7p9ciBekcwGJKbPxn+Z5Gwm/+nxeXeW9PnkSAx3Ppm7kjzOP9+cP1fG
         xvKQ==
X-Gm-Message-State: AOJu0YyKVsvFlmMm0MvgPaQ+dPMvMiNL9qfdaQF008fzIlNpD3/mM1k+
        0onfOjoNhUTQcFwpodFzmEobIJX9Bng=
X-Google-Smtp-Source: AGHT+IEqh3CGWInlsTes/SM8VuHFJ+yiIxnV1ykSbQfDo/WywAOENUURixNkwhQowBCk7uYVgNfjmA==
X-Received: by 2002:a7b:c40d:0:b0:402:cc5c:c98 with SMTP id k13-20020a7bc40d000000b00402cc5c0c98mr1750172wmi.13.1694786480931;
        Fri, 15 Sep 2023 07:01:20 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72ca:2100:b41e:6698:bfcb:c537? (dynamic-2a01-0c22-72ca-2100-b41e-6698-bfcb-c537.c22.pool.telefonica.de. [2a01:c22:72ca:2100:b41e:6698:bfcb:c537])
        by smtp.googlemail.com with ESMTPSA id f24-20020a1c6a18000000b003fbb25da65bsm4751582wmc.30.2023.09.15.07.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 07:01:20 -0700 (PDT)
Message-ID: <1a0e3e0f-7dbf-4cff-9704-d46a437a88f6@gmail.com>
Date:   Fri, 15 Sep 2023 16:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
 <20230626195951.1695cda6@endymion.delvare>
 <e31596a9-2753-8528-9fed-5fb17de1d138@gmail.com>
 <20230828090110.0cf57a00@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20230828090110.0cf57a00@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28.08.2023 09:01, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 27 Aug 2023 18:21:43 +0200, Heiner Kallweit wrote:
>> On 26.06.2023 19:59, Jean Delvare wrote:
>>> Looks reasonable, I also can't see any reason why that wouldn't work.
>>> But locking and power management can be tricky of course. I'll test
>>> this for some time, but I don't think my system actually suffers from
>>> this ACPI resource conflict, so this most probably won't be testing
>>> much in practice.
>>
>> What's your opinion after more testing?
> 
> Positive, as I did not hit any problem. As said before, my testing is
> limited by design and thus is no guarantee that the change is OK in all
> cases, but at least it's good enough to merge it and see what happens.
> 
Then I'll resubmit the patch because the series has been broken up.
