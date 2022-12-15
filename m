Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1620564E3B7
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 23:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiLOWPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 17:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLOWPe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 17:15:34 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992414AF00
        for <linux-i2c@vger.kernel.org>; Thu, 15 Dec 2022 14:15:31 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id n20so2083476ejh.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Dec 2022 14:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxD8XzMuXUHOmN84tXt07wPlbCC8OmTyw0QKXTLjL3U=;
        b=i3rWZ16XVrH2jk7h3S7r1GI1esonn6SvoO1+GUnTS+tOciXbkKP1vo1x5IQy3PBT2h
         VH20HKOy0E7C9+MNkYt833HtGD0veuDZwF2FLxcoO8XHL+/3BSE1eITCRTwcVr0OESNd
         UcvoQO+6cEqQuod6gBPs78nsXfPtyqubhb+DGmO1IsYiQJcDGVY2uGKR0YzPcVDKCaWu
         EdTRAVLL89Iqq4SWb9WLfX1CPUTFhGKkgN/qCpLGrR8iHmBjW2ZR1jewF4H266O3GRBF
         ZpV8DrLLX2XP+ddUrrMkks4Up9kXlnzWkj1LiQq8cKdhg/8CMiZmnRoXxX94GJ4PoaLs
         7eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxD8XzMuXUHOmN84tXt07wPlbCC8OmTyw0QKXTLjL3U=;
        b=B0Sq9cwW9YUudkXEYTB+6TQ1OjsgfkQNyGABR/iMd17mC81QRykXo6wLnrUu5+URlJ
         q9fueNFTmfKOLhBjk4k98wW+aa162YQzfKJ0d1QIS0ktOJtz1j/MMae3AD9XrYHmc06T
         7lgqpDN/ImEtQsf6zOCT6ALVnz3LYvgn1P/bwqTLLP0/9KXKGTC/rcJ80XAT0Gy8JHEA
         qrDNR95wVhhja5f3GMwnDlm/wCo/hesEwoE/HdfoyhXkVO0OUGdEJICXfCj4zqObcYhm
         YZ7M3270e8Gm1NuzTnnCVrmoz0QC3N+ptJ5JYZId8FeqkSFZvsehWodOiZ0+1sV8kFSt
         SXrQ==
X-Gm-Message-State: ANoB5plP9KeKnJLuYvqIVej0NPRQAl8Z3rxdc8T1jIMJTtkQSCvmpJFo
        pN2x/0R01rHM3KHE5BPBtv2rT8QUUcw=
X-Google-Smtp-Source: AA0mqf64x1lVpbj6BfftCMItKJeZfeJr9+gttDRKrALbLUKX8Q/1cG0pMWJCvWKUvTiqQYn4hXFHFw==
X-Received: by 2002:a17:906:2802:b0:7c0:b3a3:9b70 with SMTP id r2-20020a170906280200b007c0b3a39b70mr26634566ejc.62.1671142530109;
        Thu, 15 Dec 2022 14:15:30 -0800 (PST)
Received: from ?IPV6:2a01:c23:b994:d200:f5f7:4fbb:396a:5352? (dynamic-2a01-0c23-b994-d200-f5f7-4fbb-396a-5352.c23.pool.telefonica.de. [2a01:c23:b994:d200:f5f7:4fbb:396a:5352])
        by smtp.googlemail.com with ESMTPSA id k20-20020a17090646d400b007838e332d78sm124147ejs.128.2022.12.15.14.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 14:15:29 -0800 (PST)
Message-ID: <5d1ef6c2-cd98-8946-e96f-1e82ee6aafd2@gmail.com>
Date:   Thu, 15 Dec 2022 23:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <05bec021-6958-0157-b825-619ac21ddd41@gmail.com>
 <20220607143447.58058154@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/8] i2c: i801: improve interrupt handler
In-Reply-To: <20220607143447.58058154@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07.06.2022 14:34, Jean Delvare wrote:
> Hi Heiner, 
> 
> On Fri, 15 Apr 2022 18:54:32 +0200, Heiner Kallweit wrote:
>> Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
>> and an error flag is set, then don't trust the result and skip calling
>> i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
>> in the main interrupt handler, this allows to simplify the code a
>> little.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
>>  1 file changed, 8 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index ff706349b..c481f121d 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -556,9 +556,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>>  		/* Write next byte, except for IRQ after last byte */
>>  		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
>>  	}
>> -
>> -	/* Clear BYTE_DONE to continue with next byte */
>> -	outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
>>  }
>>  
>>  static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
>> @@ -588,7 +585,6 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
>>   *      BUS_ERR - SMI# transaction collision
>>   *      FAILED - transaction was canceled due to a KILL request
>>   *    When any of these occur, update ->status and signal completion.
>> - *    ->status must be cleared before kicking off the next transaction.
>>   *
>>   * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
>>   *    occurs for each byte of a byte-by-byte to prepare the next byte.
>> @@ -613,23 +609,18 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>>  	}
>>  
>>  	status = inb_p(SMBHSTSTS(priv));
>> -	if (status & SMBHSTSTS_BYTE_DONE)
>> +	if ((status & SMBHSTSTS_BYTE_DONE) && !(status & STATUS_ERROR_FLAGS))
> 
> Isn't this better written
> 
> 	if ((status & (SMBHSTSTS_BYTE_DONE | STATUS_ERROR_FLAGS)) == SMBHSTSTS_BYTE_DONE)
> 
> ? At least my compiler generates smaller binary code.
> 
OK. Meanwhile I prefer readability over saving few bytes, but here IMO
the readability doesn't suffer.

>>  		i801_isr_byte_done(priv);
>>  
>>  	/*
>> -	 * Clear remaining IRQ sources: Completion of last command, errors
>> -	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
>> -	 * assertion independently of the interrupt generation being blocked
>> -	 * or not so clear it always when the status is set.
>> -	 */
>> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
>> -	if (status)
>> -		outb_p(status, SMBHSTSTS(priv));
>> -	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
>> -	/*
>> -	 * Report transaction result.
>> -	 * ->status must be cleared before the next transaction is started.
>> +	 * Clear IRQ sources: SMB_ALERT status is set after signal assertion
>> +	 * independently of the interrupt generation being blocked or not
>> +	 * so clear it always when the status is set.
>>  	 */
>> +	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
>> +	outb_p(status, SMBHSTSTS(priv));
> 
> You are making the call to outb_p() unconditional. Is this under the
> assumption that at least one of the bits must be set, so the condition
> was always met?
> 
So far we exclude here the case where SMBHSTSTS is written in
i801_isr_byte_done(). The patch allows to write SMBHSTSTS here only,
so we don't need the condition any longer.

>> +
>> +	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
>>  	if (status) {
>>  		priv->status = status;
>>  		complete(&priv->done);
> 
> Tested OK on my system, looks good overall, nice simplification.
> 

