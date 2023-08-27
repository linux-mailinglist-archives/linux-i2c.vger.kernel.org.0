Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A1978A074
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 19:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjH0RPA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 13:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjH0ROo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 13:14:44 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEC212E
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 10:14:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bf1f632b8so327207166b.1
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693156480; x=1693761280;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC5MsqUFARlKjAPBUvR2BmWh1xxOJ+/IdJ1gNB8kW8Q=;
        b=oiILlv4eat6PO08Z4GmrjmewertrH9G1sYhYRcbGUYxOHlk/XK3jf8OgHfiiXOl9qc
         UqQhZ0udgpDGJ6G/M87PCyqn5imyh5J1DHFLFPhsT8vCovtohHuBJtxD+jSBGbimMUNP
         dqxF4//W/eru3lLeJGpDZhqWKY7GFuWdQ7CTfF2o0ulMviRLhYo7YQg3reZXz+NbuFnw
         G1ruXmWW/bUhcOSWyqH8P2Xv4wVvmRO0Yz4Z9povtBOERuv2SBJdM5HidXdT1e6Pi8I5
         e1pUvFD0f1VSOfLCARWh7c/PunyzBRCzpT2ELBlhDpSaUzihklq4tCnptZifFyhGkG7d
         CXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693156480; x=1693761280;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CC5MsqUFARlKjAPBUvR2BmWh1xxOJ+/IdJ1gNB8kW8Q=;
        b=N6JMCrflhxOWtmbXBCWpIlK+dAgSMHkJ/eKLiUlMXSq1hlTBFfOqDV+zVUCkGUMiUH
         paJTa4N7pqLc58eRC0HklDrEWpQjXHOCqGke7CMHuQzG8I6qiAQ2pzDOcMnmiDHtPqnc
         I68GS7r7Gl93g9v6MCrc8XlqLIFOurRwzMMwoBIEawtR3+XQQVHdyIhGb8TyhXCNBYzE
         CptU5eJxJ12Auv67ydTtTDlAWZiqeCJQ9hTyQrv7bv5eovuw9lh+BV6fXa6iCP25/oh1
         O327MhW726WaUM9CBMrRO/DVVPb4wH2Rk7Dxag+IQ+OcSx1gttq5J6tfyrv24pVyHUAg
         uUsw==
X-Gm-Message-State: AOJu0YyNRZZmq6mIc/vGSPdLDobQVwwkCwbPnJOmwPrR6rqek/f3W6mb
        8WWfbNK/mXLLP1LnNxmH6HY=
X-Google-Smtp-Source: AGHT+IFru723cnMlyDrtahRaODTZ7YTu+U1+XxUCgeZY8Lw38E3urC252M+w5D7845tPCipIk2aokw==
X-Received: by 2002:a17:906:539a:b0:9a4:dd49:da41 with SMTP id g26-20020a170906539a00b009a4dd49da41mr6445186ejo.76.1693156479895;
        Sun, 27 Aug 2023 10:14:39 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9? (dynamic-2a01-0c23-c0a4-3400-90f1-4994-ce26-fdf9.c23.pool.telefonica.de. [2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9])
        by smtp.googlemail.com with ESMTPSA id t18-20020a1709063e5200b0099275c59bc9sm3649327eji.33.2023.08.27.10.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 10:14:39 -0700 (PDT)
Message-ID: <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
Date:   Sun, 27 Aug 2023 19:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
 <20230627154606.1488423f@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
In-Reply-To: <20230627154606.1488423f@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27.06.2023 15:46, Jean Delvare wrote:
> Hi Heiner, Andi,
> 
> On Sat, 04 Mar 2023 22:36:34 +0100, Heiner Kallweit wrote:
>> Here we don't have to write SMBHSTCNT in each iteration of the loop.
>> Bit SMBHSTCNT_START is internally cleared immediately, therefore
>> we don't have to touch the value of SMBHSTCNT until the last byte.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 7641bd0ac..e1350a8cc 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  	for (i = 1; i <= len; i++) {
>>  		if (i == len && read_write == I2C_SMBUS_READ)
>>  			smbcmd |= SMBHSTCNT_LAST_BYTE;
>> -		outb_p(smbcmd, SMBHSTCNT(priv));
>>  
>>  		if (i == 1)
>> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
>> -			       SMBHSTCNT(priv));
>> +			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
>> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
>> +			outb_p(smbcmd, SMBHSTCNT(priv));
>>  
>>  		status = i801_wait_byte_done(priv);
>>  		if (status)
> 
> I tested this and it works, but I don't understand how.
> 
> I thought that writing to SMBHSTCNT was what was telling the host
> controller to proceed with the next byte. If writing to SMBHSTCNT for
> each byte isn't needed, then what causes the next byte to be processed?
> Does this happen as soon as SMBHSTSTS_BYTE_DONE is written? If so, then
> what guarantees that we set SMBHSTCNT_LAST_BYTE *before* the last byte
> is actually processed?
> 
It's my understanding that writing SMBHSTSTS_BYTE_DONE tells the host to
continue with the next byte.
We set SMBHSTCNT_LAST_BYTE whilst the host is receiving the last byte.
Apparently the host checks for SMBHSTCNT_LAST_BYTE once it received
a byte, in order to determine whether to ack the byte or not.
So SMBHSTCNT_LAST_BYTE doesn't have to be set before the host starts
receiving the last byte.
For writes SMBHSTCNT_LAST_BYTE isn't used.

