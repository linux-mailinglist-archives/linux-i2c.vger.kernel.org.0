Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E6C78BE6F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 08:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbjH2G3e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 02:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjH2G3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 02:29:22 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A90D198
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:29:17 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bce552508fso60761951fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693290556; x=1693895356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4y36Kw7tPQGYU0mT1wFGWeedkJujNX66EluC9tVAL0=;
        b=eGGAYKDYUoEC26cXyiq1EY8Q5M+B6iyB92Wm1jnd/LtFyXVyK48Nlhi3bH/mZc5SSP
         wvcBujzisq4C3rfW7Go4kXBci4n7cFkqzOATCmy26UvwvB3suAMrkohnKv5VnIx+Fg5a
         05rayvmMlUnXwDHC5qXGiKbZaPy6VG+EqkdE/rXsbVOgigt3C/kmRYcnm361ZVhEBBmF
         HE3vqw4hwPdgKnAu3JwhLZS1l8mxgmqmODGQwmL5VUlq0YavV18ztDhyzQy8dYN6qKNA
         kkAfP4lp3JtEKTvgTPrCyoubX/IIwLgn8XB7hefowW+X/kcWZHqO7WZtnK7GgMPRplJO
         uuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290556; x=1693895356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4y36Kw7tPQGYU0mT1wFGWeedkJujNX66EluC9tVAL0=;
        b=SEVI4IIOoZ/UCJoohI/bf5AVrerpiWp81y7b+l9bYu79xkPvS/UmsvSgevaHpMpWRH
         IR5EC4Uxqvw0v7pmTG40LJTlydV11o7wYLWWQb0HrcDcSkHqnZhc9a1DaDyXopzBOQdB
         9LwqmhVCnywFbpfcAtj23tYRwCpaQH2gjsKhS72tCzGiFsqkrdIVPtHLe09fBLKw0GR6
         GgZ2ER2ovi/BWut0hPZPXy45qlPrS3aOYfJOMk7El3142J0d57nbjaZ/6JQzcq/6Y1R0
         S8LJ0RJn/N7hoUa0gl0GkwBt9FoBQvfm9FW6lwRmHYwVbt/QCqvKGPF54jSrVq2oIsa9
         CFIQ==
X-Gm-Message-State: AOJu0Yx5EZVRjzfMH8dqMpmtuARDV9J5vdmRmjJkGgzAjW5EAD+Oirry
        HflDZNSdDGL7m+xCWH2vHrn5O4tNIyQ=
X-Google-Smtp-Source: AGHT+IG/sNUlJKffwD/Ch5SFEfpfA+c4Zde5T0wOyP0HpfmgqZL5JNliR/uYjteZq2x6fy/MwsFriw==
X-Received: by 2002:a2e:a209:0:b0:2ba:7fc2:cc4c with SMTP id h9-20020a2ea209000000b002ba7fc2cc4cmr19553182ljm.24.1693290555330;
        Mon, 28 Aug 2023 23:29:15 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b874:8100:450a:ef92:6833:4f2c? (dynamic-2a01-0c23-b874-8100-450a-ef92-6833-4f2c.c23.pool.telefonica.de. [2a01:c23:b874:8100:450a:ef92:6833:4f2c])
        by smtp.googlemail.com with ESMTPSA id ha19-20020a170906a89300b00989027eb30asm5515233ejb.158.2023.08.28.23.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:29:14 -0700 (PDT)
Message-ID: <91a83342-dcfc-734e-01f6-e6a18eda2175@gmail.com>
Date:   Tue, 29 Aug 2023 08:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
 <20230627154606.1488423f@endymion.delvare>
 <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
 <20230828152747.09444625@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230828152747.09444625@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28.08.2023 15:27, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 27 Aug 2023 19:14:38 +0200, Heiner Kallweit wrote:
>> On 27.06.2023 15:46, Jean Delvare wrote:
>>> Hi Heiner, Andi,
>>>
>>> On Sat, 04 Mar 2023 22:36:34 +0100, Heiner Kallweit wrote:  
>>>> Here we don't have to write SMBHSTCNT in each iteration of the loop.
>>>> Bit SMBHSTCNT_START is internally cleared immediately, therefore
>>>> we don't have to touch the value of SMBHSTCNT until the last byte.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-i801.c | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>> index 7641bd0ac..e1350a8cc 100644
>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>> @@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>>>  	for (i = 1; i <= len; i++) {
>>>>  		if (i == len && read_write == I2C_SMBUS_READ)
>>>>  			smbcmd |= SMBHSTCNT_LAST_BYTE;
>>>> -		outb_p(smbcmd, SMBHSTCNT(priv));
>>>>  
>>>>  		if (i == 1)
>>>> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
>>>> -			       SMBHSTCNT(priv));
>>>> +			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
>>>> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
>>>> +			outb_p(smbcmd, SMBHSTCNT(priv));
>>>>  
>>>>  		status = i801_wait_byte_done(priv);
>>>>  		if (status)  
>>>
>>> I tested this and it works, but I don't understand how.
>>>
>>> I thought that writing to SMBHSTCNT was what was telling the host
>>> controller to proceed with the next byte. If writing to SMBHSTCNT for
>>> each byte isn't needed, then what causes the next byte to be processed?
>>> Does this happen as soon as SMBHSTSTS_BYTE_DONE is written? If so, then
>>> what guarantees that we set SMBHSTCNT_LAST_BYTE *before* the last byte
>>> is actually processed?
>>
>> It's my understanding that writing SMBHSTSTS_BYTE_DONE tells the host to
>> continue with the next byte.
> 
> That's indeed possible, and quite likely, considering that your patch
> works.
> 

This understanding is backed by the following from Byte Done Status
description in (at least) ICH9 specification:
When not using the 32 Byte Buffer, hardware will drive the SMBCLK signal
low when the DS bit is set until SW clears the bit.

>> We set SMBHSTCNT_LAST_BYTE whilst the host is receiving the last byte.
>> Apparently the host checks for SMBHSTCNT_LAST_BYTE once it received
>> a byte, in order to determine whether to ack the byte or not.
>> So SMBHSTCNT_LAST_BYTE doesn't have to be set before the host starts
>> receiving the last byte.
> 
> How is this not racy?
> 
> In the interrupt-driven case, at the end of a block read transaction,
> we set SMBHSTCNT_LAST_BYTE at the end of i801_isr_byte_done(), then
> return to i801_isr() where we write 1 to SMBHSTSTS_BYTE_DONE to clear
> it. This lets the controller handle the last byte with the knowledge
> that this is the last byte.
> 
> However, in the poll-driven case, SMBHSTSTS_BYTE_DONE is being cleared
> at the end of the loop in i801_block_transaction_byte_by_byte(), then
> at the beginning of the next iteration, we write SMBHSTCNT_LAST_BYTE,
> then wait for completion. If the controller is super fast (or, to be
> more realistic, the i2c-i801 driver gets preempted between writing
> SMBHSTSTS_BYTE_DONE and writing SMBHSTCNT_LAST_BYTE) then the byte may
> have been already read and acked, before we have the time to let the
> controller know that no ACK should be sent. This looks racy. Am I
> missing something?
> 
> If nothing else, the fact that the order is different between the
> interrupt-driven and poll-driven cases is fishy.
> 
> I must add that the problem is not related to your patch, I just
> happened to notice it while reviewing your patch.
> 
>> For writes SMBHSTCNT_LAST_BYTE isn't used.
> 
> Agreed.
> 

