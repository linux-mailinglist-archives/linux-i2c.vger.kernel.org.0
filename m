Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18F83793519
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 08:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbjIFGGJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 02:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjIFGGI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 02:06:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7391128
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 23:06:04 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52bcb8b199aso4619485a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 05 Sep 2023 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693980363; x=1694585163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys75UHTq1w9Rymlbf/19XkRuZo1p5Opzpd1KmEMOn6Q=;
        b=GW83RKhTbjgyBeRTK/ye7+/+jvxU4rJnPmdpo+yKOGBDdPgY04NSEWWpyr3r8rhTg3
         6tZ4C6PKMT5bqzPlXsImggomIRCSCQ4pvZJz7kCm1kgI1gXwrSn50gjATyAglQsilf3F
         O2xCAd3xzygB4VnaGXIKyKcNjcEgxn+5l7yOsMOO2Q9nHlJb6vFTVS+ro6jSM9f8whH6
         yMb/Mkq3aK+CDaIx/+ApdX2Cdekko3WcrYz4aoRlw6OSOOAyeD6LxZo0nUadNloGoDFg
         6/FWwnmcSLCZwc+ftOrrwKw6j2Phn5pdETN45yz2WdNpamb9i0Tc0yc4kwSRMmVXGBGM
         i+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693980363; x=1694585163;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys75UHTq1w9Rymlbf/19XkRuZo1p5Opzpd1KmEMOn6Q=;
        b=DIEe6Fbi3m7GCwBHJavrwCYl7H54BbyRHQGJM2wHprvYWQvyjUAdOXs/tFxIaax/tt
         seGdwk5x29S09SjSNOs/ltCTAYOYNfRRY4tUcXzu92nC3g+TyRJH7lOhfCIuc6jMX112
         Jrmn1q5rwV08W3RIvfWdRzbEgdmiMs5rs023cjkXoV9Fu9AvygQ4qR1XYpw4f+jlHl7z
         5FGyVsGJ2VEdmhPgYAWp6nKe0tywc8YIZn3MKad+arJmeMap4KFeGcDYheDJs6yeZZwB
         Iz/0zX3OpNI1o909gggkFipMhHqY3uPSJobqPth/yxuRfmOKCKAV6QBtf/6Hy2vson43
         MPEw==
X-Gm-Message-State: AOJu0YzJUGJbHrv81Yyd9+0sjNHKrMrS0bEoMfb+Q1LnCA3k1n1xQwsT
        MyoBeUkzTrowEiKR9KEFKJ0=
X-Google-Smtp-Source: AGHT+IFt6PnGWYaVo0qT+7jRsipBV00d2eiSyxT7Zx4tW+7KePmBAZqkM9USBbDXFrWgdAi/yv+wbQ==
X-Received: by 2002:a17:906:212:b0:9a5:deef:886 with SMTP id 18-20020a170906021200b009a5deef0886mr1332750ejd.43.1693980362784;
        Tue, 05 Sep 2023 23:06:02 -0700 (PDT)
Received: from ?IPV6:2a02:3100:907d:f100:cd98:1b3b:7b15:5f34? (dynamic-2a02-3100-907d-f100-cd98-1b3b-7b15-5f34.310.pool.telefonica.de. [2a02:3100:907d:f100:cd98:1b3b:7b15:5f34])
        by smtp.googlemail.com with ESMTPSA id x2-20020aa7dac2000000b005272523b162sm7868136eds.69.2023.09.05.23.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 23:06:01 -0700 (PDT)
Message-ID: <55e8de0d-daf3-f398-0fc2-357b53c14bc8@gmail.com>
Date:   Wed, 6 Sep 2023 08:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To:     Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
 <20230905101243.39920fe5@endymion.delvare>
 <20230905091155.h3oezdj5g6z5jpxu@zenone.zhora.eu>
 <5838f7e4-dd08-48eb-2f9c-df45daa0214a@gmail.com>
 <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
In-Reply-To: <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06.09.2023 00:59, Andi Shyti wrote:
> Hi Heiner,
> 
> On Tue, Sep 05, 2023 at 01:35:10PM +0200, Heiner Kallweit wrote:
>> On 05.09.2023 11:11, Andi Shyti wrote:
>>> Hi Jean,
>>>
>>> On Tue, Sep 05, 2023 at 10:12:43AM +0200, Jean Delvare wrote:
>>>> On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:
>>>>> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
>>>>> receiving the last byte. If we get e.g. preempted before setting
>>>>> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
>>>>> before SMBHSTCNT_LAST_BYTE is set.
>>>>> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
>>>>> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
>>>>> is also consistent with what we do in i801_isr_byte_done().
>>>>>
>>>>> Reported-by: Jean Delvare <jdelvare@suse.com>
>>>>
>>>> Note for Wolfram: checkpatch says we should insert here:
>>>>
>>>> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/
>>>
>>> does this also need a Fixes: tag? I tried to check it, but there
>>> was an intricate jungle of commits in these lines.
>>>
>> Quoting Jean from previous communication about this patch:
>> As far as I see, the race condition already existed when the kernel
>> switched to git, so there's no point in having a Fixes statement.
> 
> true... I forgot about this comment.
> 
> Anyway I think that this should, then, go to all the stable
> kernels and I believe that without the Fixes tag this will never
> be picked up.
> 

Then we may have to set the Fixes tag to the following?
1da177e4c3f4 ("Linux-2.6.12-rc2")
Plus a comment that the issue existed before already.

> Maybe Greg can advise here.
> 
I *think* Greg (or a bot of him) would complain when receiving
something for stable w/o a Fixes tag.

> Would you mind resending this patch Cc'eing the stable kernel and
> adding a note after the '---'?
> 
OK

> Andi
> 
>>> Anyway, you can add:
>>>
>>> Acked-by: Andi Shyti <andi.shyti@kernel.org> 
>>>
>>> Thanks,
>>> Andi
>>

