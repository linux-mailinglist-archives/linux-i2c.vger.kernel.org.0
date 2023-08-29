Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1BF78BE44
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 08:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbjH2GIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 02:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjH2GIP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 02:08:15 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04F0124
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:08:12 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fee8af9cb9so37473775e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 23:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693289291; x=1693894091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQT1cEx6fMFGwQQyP2Kby8GawBalpX/YGkXT5Hx3xIg=;
        b=A+YCZGxacV7xZ5D2qfv1Jx5Q1Js4b6VBNmbruh4bZ2gY2uWqOuEfLhzwR9IBuvhEGG
         c642xRkZEsnSvoEZLz7J1KdmnrGo/Y80bfsrhsqVuF+wuLyWDJVFRPqDvbj8/QwCGKa0
         p/8cz4OVHUT9xqaMwSdMoSE9w9w1O0dOD3iX37X8HKdBg6YDZTeJgcVvawnGaL1xfveS
         wUpJedf2i9nEnqqwDJN2yEJQ36GwJV3+6MAiKrUqLSx68uoENfl0PAtYTvPa2UpnJqD/
         KXnod1J3KpzxO+WEl6t1sHj7WGJrl6KoWfzAEGwJ4sedtRgyc5OASZdfRwIT9XiaLZjK
         ahfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693289291; x=1693894091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQT1cEx6fMFGwQQyP2Kby8GawBalpX/YGkXT5Hx3xIg=;
        b=VxZ6OTMvGJYpIWwIakJnWUKWmCEFknW4ZaKQHRkAMseqKI3ilxbph06X/ZWw3S9LWD
         +at6XSIgWAbg0pOCLTpIioh07zFC9hWnMjK0bnHaCnE1ysfx8gB3NkOmtgm6z2WYfTKN
         D12WW3vlwUDC1aILUXuy8054A/327pkLngrVLIx0BwimUaBqdzQMqySdzRHTeY9PYuvI
         0DhGdFHXPVE0FlLe9aTxLlKALqn4QkU8CxDSW5YMOfu2309LRvnxbf4nNE7E1USmFk3d
         o3ylUbl5Fh9V95y0qOoAJiHm4c3XMGrXRnGRMb38o8Gb1CWlIw+eMPeU67Zd3KWJSbHH
         vSjA==
X-Gm-Message-State: AOJu0YxBN1AJ0WW+QqMMxQjKNdLuNJHvJus3T1EkQiO1lDQb4GLkyNcO
        +j7AXnUUZtNb0WzMnwFAd81U6//pOn4=
X-Google-Smtp-Source: AGHT+IH0hlxKSo+GgZhy8xp1BchV/SY5iXXRkQqWbJP4pK1OhxQ6KaOro0qz1A6a6Uijla88ta/I1w==
X-Received: by 2002:a05:600c:ad2:b0:401:aa8f:7562 with SMTP id c18-20020a05600c0ad200b00401aa8f7562mr10525647wmr.11.1693289290755;
        Mon, 28 Aug 2023 23:08:10 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b874:8100:450a:ef92:6833:4f2c? (dynamic-2a01-0c23-b874-8100-450a-ef92-6833-4f2c.c23.pool.telefonica.de. [2a01:c23:b874:8100:450a:ef92:6833:4f2c])
        by smtp.googlemail.com with ESMTPSA id r19-20020a05600c299300b003fed70fb09dsm12761304wmd.26.2023.08.28.23.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:08:10 -0700 (PDT)
Message-ID: <0af32a66-c51b-99d1-0a85-8a848d82b0d2@gmail.com>
Date:   Tue, 29 Aug 2023 08:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
 <20230627154606.1488423f@endymion.delvare>
 <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
 <20230828152747.09444625@endymion.delvare>
 <20230828171014.2bc37cab@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230828171014.2bc37cab@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28.08.2023 17:10, Jean Delvare wrote:
> On Mon, 28 Aug 2023 15:27:47 +0200, Jean Delvare wrote:
>> On Sun, 27 Aug 2023 19:14:38 +0200, Heiner Kallweit wrote:
>>> We set SMBHSTCNT_LAST_BYTE whilst the host is receiving the last byte.
>>> Apparently the host checks for SMBHSTCNT_LAST_BYTE once it received
>>> a byte, in order to determine whether to ack the byte or not.
>>> So SMBHSTCNT_LAST_BYTE doesn't have to be set before the host starts
>>> receiving the last byte.  
>>
>> How is this not racy?
>>
>> In the interrupt-driven case, at the end of a block read transaction,
>> we set SMBHSTCNT_LAST_BYTE at the end of i801_isr_byte_done(), then
>> return to i801_isr() where we write 1 to SMBHSTSTS_BYTE_DONE to clear
>> it. This lets the controller handle the last byte with the knowledge
>> that this is the last byte.
>>
>> However, in the poll-driven case, SMBHSTSTS_BYTE_DONE is being cleared
>> at the end of the loop in i801_block_transaction_byte_by_byte(), then
>> at the beginning of the next iteration, we write SMBHSTCNT_LAST_BYTE,
>> then wait for completion. If the controller is super fast (or, to be
>> more realistic, the i2c-i801 driver gets preempted between writing
>> SMBHSTSTS_BYTE_DONE and writing SMBHSTCNT_LAST_BYTE) then the byte may
>> have been already read and acked, before we have the time to let the
>> controller know that no ACK should be sent. This looks racy. Am I
>> missing something?
> 
> I made a little experiment which, I think, proves my point.
> 
> Firstly, I loaded the i2c-i801 driver with disable_features=0x12, to
> make sure the poll-based byte-by-byte code path is used. The EEPROM
> data starts with:
> 
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: 92 13 0b 02 04 21 02 01 03 52 01 08 0a 00 fc 00
> 
> The following commands read the first 4 bytes with an I2C Block Read
> command, then fetch the next byte from the EEPROM (without specifying
> the offset):
> 
> # /usr/local/sbin/i2cget -y 4 0x53 0 i 4 ; /usr/local/sbin/i2cget -y 4 0x53
> 0x92 0x13 0x0b 0x02
> 0x04
> 
> As you can see, I get the 5 first bytes of the EEPROM, as expected.
> 
> Then I added an arbitrary delay in the driver where I think the race
> condition exists:
> 
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -684,8 +684,10 @@ static int i801_block_transaction_byte_b
>  
>  		if (i == 1)
>  			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> -		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE) {
> +			usleep_range(10000, 20000);
>  			outb_p(smbcmd, SMBHSTCNT(priv));
> +		}
>  
>  		status = i801_wait_byte_done(priv);
>  		if (status)
> 
> I loaded the modified i2c-i801 driver, still with
> disable_features=0x12. Running the same commands again, I now get:
> 
> # /usr/local/sbin/i2cget -y 4 0x53 0 i 4 ; /usr/local/sbin/i2cget -y 4 0x53
> 0x92 0x13 0x0b 0x02
> 0x21
> 
> So I get EEPROM bytes 0-3 then it jumps to offset 5 directly. This
> means that the EEPROM started sending the byte at offset 4 at the end
> of the I2C Block Read transfer, due to the controller sending an ACK
> after the byte at offset 3.
> 
> For the code to be safe, we need to set SMBHSTCNT_LAST_BYTE *before*
> clearing SMBHSTSTS_BYTE_DONE.
> 

I think you're right with the preemption scenario. I'll submit a fix
for it.

> Note: the transfers do not fail, only the internal register pointer of
> the EEPROM gets screwed, so this is probably not an issue for devices
> which don't rely on an internal register pointer, only EEPROM-like
> devices are affected.
> 

