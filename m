Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1874679F5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 16:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhLCPIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 10:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352480AbhLCPIT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 10:08:19 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1FDC061353
        for <linux-i2c@vger.kernel.org>; Fri,  3 Dec 2021 07:04:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so5146711wme.0
        for <linux-i2c@vger.kernel.org>; Fri, 03 Dec 2021 07:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=mHniwuC3aLuG1Ga7XGz1Q8OS8zgBHVgTussgjPrQ+SI=;
        b=XzqFimUxNCszgpT5jLiiuN00bgX0rcoVBbhvlk720Sxny5NRdjOxZNyeC3T56U65pC
         Wg4R+P4jxlaaUNb1WlY5zrmJYsBk6pS0MtxGTbcWWb7606Al3RzyW0F7LJTJu6Gk5tTJ
         rMDKph2gGioXGWIpQzDXBJk/rAMY5A0NDjL1q3Nb6TSxAvDQhZU13IOxNGPUkqCZW2v4
         hzn5aygn6Jp9G9SawZkVa6XRk5DyQbo1cxMOFitxpTwHTk3mUyYjzElDZqVhH7JvEJIR
         E91CJmTYlfAtvyrGdM01t+ZfFQm2BtTYNnfEXJaCERwbZCUsGSXr2YTRGqFUFcuHS8pe
         t7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=mHniwuC3aLuG1Ga7XGz1Q8OS8zgBHVgTussgjPrQ+SI=;
        b=ntVM7MDYQeeCdIiYWFQ/vuGGKP2p+2TxQnb1kqavJmzAgmNO6cmfpD3mezJGX1CO8o
         yV7e61ViwLpXPhPFlw6Av4bIRKofKBc0zQ8LA7ZmRv5XKNtRxIwgbpZj6fk1btAdzk/g
         SyL8nVgzfIc1/0S+WXGUhclucJFsKEvgd+NruEtjwokICx3fYaH2wX670fVGCFXRW6SB
         dw0GJLWiTm7Yt00deDxtk7/tX6BaIRM8F7bZy/OmbS9DmSnGudGUOyPM+uELkekZwFqH
         b0WG9Mz6/VB/UiVSb58lYE/iExaz517oHmrI7n+oG8b7kPlf1bMrc249tOINkhkpx5fM
         tgpg==
X-Gm-Message-State: AOAM530++loatycw3nW86MQY9qx2q+zhrGUA5vyZ/IH0gRA6l0repyrX
        xmWdAheVD2QMfX1SasRat/eBcd4UXVM=
X-Google-Smtp-Source: ABdhPJwNQ/tsieKwdR61jOz5hJeRHTTGwGo/vG0bn01GdFJfgs+dJNprnvn99ULkkzXOjBUgit0Imw==
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr15523752wmq.32.1638543893247;
        Fri, 03 Dec 2021 07:04:53 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:ddb4:c635:82a6:bc31? (p200300ea8f1a0f00ddb4c63582a6bc31.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:ddb4:c635:82a6:bc31])
        by smtp.googlemail.com with ESMTPSA id r62sm2844778wmr.35.2021.12.03.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 07:04:52 -0800 (PST)
Message-ID: <7567d8ed-3020-53c5-7f26-401bf01305c0@gmail.com>
Date:   Fri, 3 Dec 2021 16:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <8fba896a-81c4-dda7-6481-92ae8dccf41c@gmail.com>
 <20211203114156.3f0142bf@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Don't clear status flags twice in interrupt
 mode
In-Reply-To: <20211203114156.3f0142bf@endymion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03.12.2021 11:41, Jean Delvare wrote:
> Hi Heiner,
> 
> On Thu, 02 Dec 2021 10:57:43 +0100, Heiner Kallweit wrote:
>> In interrupt mode we clear the status flags twice, in the interrupt
>> handler and in i801_check_post(). Remove clearing the status flags
>> from i801_check_post() and let i801_wait_intr() clear them in
>> polling mode. Another benefit is that now only checks for error
>> conditions are left in i801_check_post(), thus better matching the
>> function name.
>>
>> Note: There's a comment in i801_check_post() that i801_wait_intr()
>> clears the error status bits. Actually this hasn't been true until
>> this change.
> 
> While reviewing this, I have noticed other comments which seem outdated:
> 
> * In i801_isr(), "->status must be cleared before the next transaction
>   is started." We no longer do this since
>   1de93d5d521717cbb77cc9796a4df141d800d608, and things are working
>   well, so clearly this is no longer necessary and the comment could be
>   removed.
> * The comment before i801_check_post() is obsoleted by your
>   proposed change.
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 7446bed78..82553e0cb 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -438,9 +438,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
>>  		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
>>  	}
>>  
>> -	/* Clear status flags except BYTE_DONE, to be cleared by caller */
>> -	outb_p(status, SMBHSTSTS(priv));
>> -
>>  	return result;
>>  }
>>  
>> @@ -455,8 +452,10 @@ static int i801_wait_intr(struct i801_priv *priv)
>>  		status = inb_p(SMBHSTSTS(priv));
>>  		busy = status & SMBHSTSTS_HOST_BUSY;
>>  		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
>> -		if (!busy && status)
>> +		if (!busy && status) {
>> +			outb_p(status, SMBHSTSTS(priv));
>>  			return status;
>> +		}
>>  	} while (time_is_after_eq_jiffies(timeout));
>>  
>>  	return -ETIMEDOUT;
> 
> I like the idea to make things consistent between the interrupt and
> poll modes, however I'm afraid there's one code path not covered by
> your patch. If i801_wait_byte_done() returns an error flag in
> i801_block_transaction_byte_by_byte(), we jump directly to
> i801_check_post() without calling i801_wait_intr(). In that case, the
> error flags are not cleared, right? Doesn't look good.
> 
Indeed, good point. I have an idea, I'll propose a patch that we can
use as discussion basis.

> Makes me wonder if we shouldn't actually let i801_check_post() clear
> the flags and remove that piece of code everywhere else? Or is there a
> reason why it has to be done earlier in i801_isr(), that I do not
> remember?
> 
I'd like to achieve that check_pre/post() only check and handle error
conditions. Both functions shouldn't be involved in the normal flow.

> I'm also wondering if there's actually any reason to clear the flags at
> all at the end of the transaction, considering that we'll be doing it
> again at the beginning of the next transaction anyway to be on the safe
> side.
> 
Clearing flags in check_pre() should just be a last resort (IMO).
The regular flow should leave the flags in a clean state.

