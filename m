Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFC5790108
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 19:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243003AbjIARCW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 13:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjIARCV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 13:02:21 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87D010F2
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 10:02:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a5be3166a2so257185066b.1
        for <linux-i2c@vger.kernel.org>; Fri, 01 Sep 2023 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693587737; x=1694192537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjLIE0CRPv1DMJDSSwRhapSZoWr3GymH7mb9JYxnG0U=;
        b=Q4Cjly24sMF2sM3Nfjh+PBYVOy/FIt4C286ALp7WSyX5aR/eICUnJqWLNhq0V/0JOJ
         ETRZnKvzocXVc1Onbj950Kphat6/RSaFcrVHU7aOHC3j5xNTVsmvxeFFeyrWwEI1SNa0
         h5bFYzeOMjSD9rNzJvMvvwy8LoEsInDF1OaOBz+jOiSGgvnJWQkl6EMzfWR4KCS4K5qG
         s5p0/c1UsJ6grVaIhIibJfO+NAnNVbP5Azj0W5nYFXGkGjYPu5wqhItqAWYMQpcsQDxP
         QLMA/69c988+zjXXATCTKFgSivIMDr0NpMp8uiLZhCSpJSk7zLJST1f3btAbu/29H2ZQ
         EOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693587737; x=1694192537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjLIE0CRPv1DMJDSSwRhapSZoWr3GymH7mb9JYxnG0U=;
        b=iW87XRpYQs5bOGYfAZi5vnGmoRJrL9khjpglNABvu4OhwGPT0LJyUCUaQVk04CtATp
         iRtwDPJn3s5GGGKWovMm+/fe1GrRwPhgb3wzXR7qJAjaOimbIEr71eEn/XzsSQaC9Rl1
         DRmEQ9wLtsdDLQQHPxC496I6vfhD/vMQiXsYMCDKlLyyGOtng+n30fzYdDPulb3snjq6
         I7VWaeMIbBtikirOtbk+Wmykq71Mvp8/B2RkNBabv7ZWYm58fLwZfVpXBKo1+T1GVCGP
         e7MPywwCQb4hlmLsGQPenabt3JtusuaI64sA4ZO1OQlfmQOL6O6fMXAIIq0O59xvYjXE
         r98A==
X-Gm-Message-State: AOJu0YxLhjY66O6GAF219f2cAxc9S0/dXMKwpgRtWbTZ96dw/SAanQ1L
        ta3gKNB0XBEcz7d54GDfxu4=
X-Google-Smtp-Source: AGHT+IGkFrcrWErZphXcgQVCV91YgR7w4RTChs3DoWx0FGcli5ACW4K+OVFnAUMBJ28r93hrWqtL6g==
X-Received: by 2002:a17:906:cc0f:b0:9a5:c79f:bed5 with SMTP id ml15-20020a170906cc0f00b009a5c79fbed5mr2040217ejb.16.1693587736769;
        Fri, 01 Sep 2023 10:02:16 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72e7:e700:d0a8:40ee:858e:f418? (dynamic-2a01-0c22-72e7-e700-d0a8-40ee-858e-f418.c22.pool.telefonica.de. [2a01:c22:72e7:e700:d0a8:40ee:858e:f418])
        by smtp.googlemail.com with ESMTPSA id y8-20020a170906914800b00992f2befcbcsm2202973ejw.180.2023.09.01.10.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 10:02:16 -0700 (PDT)
Message-ID: <d392cf3a-a029-2cd6-44e6-a98f57d42b5f@gmail.com>
Date:   Fri, 1 Sep 2023 19:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org
References: <679ddcf8-b03d-15eb-e914-bdbaa3f5b890@gmail.com>
 <20230901184455.54effcea@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230901184455.54effcea@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01.09.2023 18:44, Jean Delvare wrote:
> Hi Heiner,
> 
> On Tue, 29 Aug 2023 08:25:23 +0200, Heiner Kallweit wrote:
>> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
>> receiving the last byte. If we get e.g. preempted before setting
>> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
>> before SMBHSTCNT_LAST_BYTE is set.
>> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
>> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
>> is also consistent with what we do in i801_isr_byte_done().
>>
>> Fixes: efa3cb15ad8b ("i2c-i801: Refactor use of LAST_BYTE in i801_block_transaction_byte_by_byte")
> 
> I don't think this is true. This patch refactored the code but didn't
> change the logic. The bug existed before already. As far as I see, the
> race condition already existed when the kernel switched to git, so
> there's no point in having a Fixes statement.
> 
Shall we go with the patch as-is or do you think it's better to resubmit
w/o the Fixes tag?

>> Reported-by: Jean Delvare <jdelvare@suse.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 7a0ccc584..8acf09539 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -679,15 +679,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  		return result ? priv->status : -ETIMEDOUT;
>>  	}
>>  
>> -	for (i = 1; i <= len; i++) {
>> -		if (i == len && read_write == I2C_SMBUS_READ)
>> -			smbcmd |= SMBHSTCNT_LAST_BYTE;
>> -		outb_p(smbcmd, SMBHSTCNT(priv));
>> -
>> -		if (i == 1)
>> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
>> -			       SMBHSTCNT(priv));
>> +	if (len == 1 && read_write == I2C_SMBUS_READ)
>> +		smbcmd |= SMBHSTCNT_LAST_BYTE;
>> +	outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
>>  
>> +	for (i = 1; i <= len; i++) {
>>  		status = i801_wait_byte_done(priv);
>>  		if (status)
>>  			return status;
>> @@ -710,9 +706,12 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  			data->block[0] = len;
>>  		}
>>  
>> -		/* Retrieve/store value in SMBBLKDAT */
>> -		if (read_write == I2C_SMBUS_READ)
>> +		if (read_write == I2C_SMBUS_READ) {
>>  			data->block[i] = inb_p(SMBBLKDAT(priv));
>> +			if (i == len - 1)
>> +				outb_p(smbcmd | SMBHSTCNT_LAST_BYTE, SMBHSTCNT(priv));
>> +		}
>> +
>>  		if (read_write == I2C_SMBUS_WRITE && i+1 <= len)
>>  			outb_p(data->block[i+1], SMBBLKDAT(priv));
>>  
> 
> Looks good and tested OK.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 

