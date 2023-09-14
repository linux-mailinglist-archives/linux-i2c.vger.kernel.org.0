Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749417A0F76
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 23:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjINVFs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 17:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjINVFs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 17:05:48 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C64269D
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 14:05:43 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40434d284f7so12982835e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694725542; x=1695330342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8lid9GnUzIryiInYjVMTJy8bPFJxIFq8QwUwImS/Wo=;
        b=RMKsqqrWtNLyFrLZYnl7VRGjuzxmp7k1gdt8j8vNcJQ4v0rctPXrSaenHt1nV6+SFL
         oIxM5aVfOpZvGnWGpZ3+3amSGa1IO625NbtOGVLOIYGDf0oRExZ9MsM2ltSNj3DHVcYC
         uM4mntwizkuNxPXlbSaLCNs9GUwyvRr6yUH4HVFdqmFihp8PLRjbMUnvzXYadp189nfk
         MtK7tdti0nmGNyrl+uSvbXpbNQGyqdZ0GYPPupl8m/RklU5OnLc9CANzzoh2lByuihsF
         i1s45qzv0dGErwk0JKBgSaOWDzMy9ISnSHkQqGz7m5+M/TSg4j1LQpr1UrnL+k5HvOtI
         w7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694725542; x=1695330342;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8lid9GnUzIryiInYjVMTJy8bPFJxIFq8QwUwImS/Wo=;
        b=gbiPnoX1oA3Y49z6uru6TB2gMqn3Qj3LcfQJ7vKedJYIZ4nQh6JE1YDw455+YJo0JM
         dps+w46LK+nlr4EVyCVzd3bVku2mtovSn1dhSnzHQ6IIO8TgMzIRJwSNEszVshWKeWYc
         wt5acy/Qi22WV+gl/A5/9jPNOZ8uurV9QDnAU7M7VRAxKVb06UlWYoLKRGn9RkonJvF9
         YyDEW00vRAXwR58y2wS9CALWVCde1RtfAqzfzc7kAQH93lmM8MOOxQGw6RhkMF2KiGDM
         8DWaiKOB5hTXVubJvTKkZtZkDPPo1d6G5FH8sHwCpIzgIMdXjzGqaD2X/dz5pIH5KRGx
         lIQA==
X-Gm-Message-State: AOJu0YxfZk2isfaZlQxKE5RwJ4D2RZUq58tAYnd/hts//IQOqcx1wBth
        RwdCDuPENThNYyTIFzBJJ3g=
X-Google-Smtp-Source: AGHT+IHAByIwFCg4fQPQRpyvSI2fHejGlR+XtmzM9mLcyIvr5gn/n3poIJi0IwB6h2k8SwTfrEKyUg==
X-Received: by 2002:a05:600c:c7:b0:401:b6f6:d8fd with SMTP id u7-20020a05600c00c700b00401b6f6d8fdmr5770518wmm.6.1694725541793;
        Thu, 14 Sep 2023 14:05:41 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b8fb:f000:c88d:b899:9013:9bfe? (dynamic-2a01-0c23-b8fb-f000-c88d-b899-9013-9bfe.c23.pool.telefonica.de. [2a01:c23:b8fb:f000:c88d:b899:9013:9bfe])
        by smtp.googlemail.com with ESMTPSA id l14-20020a1c790e000000b003fe4ca8decdsm5763256wme.31.2023.09.14.14.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 14:05:41 -0700 (PDT)
Message-ID: <1aa92346-75f1-9d7c-f02c-2a37c9faeca9@gmail.com>
Date:   Thu, 14 Sep 2023 23:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error path
 of probe()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
 <20230906134745.24dfa076@endymion.delvare>
 <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
 <20230906174739.499ab821@endymion.delvare>
 <20230906182523.sncigwwmbifm4gpn@zenone.zhora.eu>
 <439f1a0b-363e-90ff-b5b3-cb0b290df258@gmail.com>
In-Reply-To: <439f1a0b-363e-90ff-b5b3-cb0b290df258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07.09.2023 07:45, Heiner Kallweit wrote:
> On 06.09.2023 20:25, Andi Shyti wrote:
>> Hi Jean,
>>
>>>>> I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
>>>>> actually bothers people. Error paths are rarely taken, and driver
>>>>> removal isn't that frequent either. Consequences are also rather
>>>>> harmless (one-time resource leak, race condition which is quite
>>>>> unlikely to trigger).  
>>>>
>>>> we are having this same discussion in another thread: if a bug is
>>>> unlikely to happen, doesn't mean that there is no bug. A fix is a
>>>> fix and should be backported to stable kernels.
>>>
>>> No. Please read:
>>>
>>>   https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>>>
>>> There is clearly a list of conditions for a commit to be eligible for
>>> stable kernel trees. It's not "every fix".
>>
>> I think you are putting these fixes into the ""This could be a
>> problem..." type of things".
>>
>> But as I see these fixes don't belong to this category, as they
>> are clearing the exit path. This is a kind of fixes I want to see
>> going to stable.
>>
>> Which means that if we exit through that path, do we exit
>> cleanly, e.g., without leaking? If the answer is "no", then this
>> is a fix and should go to stable.
>>
>> It belongs to "This could be a problem..." type, things like
>> dev_err/dev_warn (first thing coming to my mind) or other non
>> functional fixes.
>>
>> Maybe this is a matter of opinion and different background. For
>> the i2c side I'm in peace :-)
>>
>> For the stable backport I'd love to hear another opinion.
>>
>> Thanks, Jean!
>> Andi
> 
> Please let me know once you come to an agreement, then I'll
> submit a (hopefully) final version.
> 
I think I'll split the patch, that should make dealing with it easier.

