Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCDD1EBF36
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 17:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFBPmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 11:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgFBPml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Jun 2020 11:42:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F14C08C5C0;
        Tue,  2 Jun 2020 08:42:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so1559972pjb.1;
        Tue, 02 Jun 2020 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7bWnrd7umFBH01tkVkxcf5w00Z7S8X+gUXJZqUHju+Y=;
        b=Cp+3JDR3Mq+WCW4ZtXCOK4rCbpMcTAfSK8CCKbgoXVR3yHtZvPUp8wQBKYG+NTnFAH
         kIWhCgZPO+tl9gkSgY94x/6+HTH1goMxi6pPQSY5YJurYLNgveEULA2hWqW3IR0AbKWP
         G0ivb7bVvppLm7DTwL1yMTLMoMkJs42nrCA2+waArTOLHKJFPhz22dgL79YX21G/0cbJ
         afUx8uvcFWZb+1swujVpWBWRLNPiq++5XulPJsrFPvWJeczo8v0QrwLuEGTf799B20Gu
         uFWygE2Hg+qIdK9a2SW72IyW4TA31/53Su58WsJ54/uQegpvOxcSKjWHxn46SveQ6eNx
         Ns5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7bWnrd7umFBH01tkVkxcf5w00Z7S8X+gUXJZqUHju+Y=;
        b=Co7z9pUQu+yxDjfIdRcPSI1LVJBS8/RTujlAFqvoD7YLh0WlTkO1WSYTMqowYflfYl
         1tw0xZAGnsR+zuXPgzqGdtq6QcoE4Z/ROYNY1Bl+YSx8ACdlWiiBHyR8BaqZB/koSXrt
         Ki4t/ocj7LxoTVwnTP+rtfxIeBpdh2nvltjv/u4tXs6LS6mQWXtVx/tIVQ2Ym6UTEdU3
         HvFUI3gc7C2JeMPIe5LNphutsKsNtqqJfgLjna1tGkXEHyXHal0otB0DDs9/KZS9uur0
         mYg1TzuRTtISo3BpftJoBd+rzQFsW4pV5e/ARq6yh/0c+6b7aNRUAqRbuvFq9LGmUkCh
         PvKg==
X-Gm-Message-State: AOAM533oSB+mRnG2oVgEzy1uLg7sm7EnFEIzTJDRYimL/uZws5n6Cqe/
        WN+XutCLPHoRWMsHUk0RqicREQhN
X-Google-Smtp-Source: ABdhPJxlP5M+lMbxBj+QsJlbD8gTxN6qqLEWHERxDajWnbAVCH1npZ2X296bqZANf6DnEAyvmSoAyg==
X-Received: by 2002:a17:902:ea8a:: with SMTP id x10mr25553334plb.61.1591112561148;
        Tue, 02 Jun 2020 08:42:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w65sm2710504pfb.160.2020.06.02.08.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 08:42:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] i2c: mux: pca9541: Change to correct bus control
 commands
To:     Peter Rosin <peda@axentia.se>,
        Quentin Strydom <quentin.strydom@bluwireless.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1591099969-30446-1-git-send-email-quentin.strydom@bluwireless.com>
 <2e2c3b98-20a6-2671-ad74-a0f171073bd0@axentia.se>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <89e367db-a5f7-6eb0-5437-0ea0646b85d0@roeck-us.net>
Date:   Tue, 2 Jun 2020 08:42:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e2c3b98-20a6-2671-ad74-a0f171073bd0@axentia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/2/20 8:05 AM, Peter Rosin wrote:
> On 2020-06-02 14:12, Quentin Strydom wrote:
>> Change current bus commands to match the pca9541a datasheet
>> (see table 12 on page 14 of
>> https://www.nxp.com/docs/en/data-sheet/PCA9541A.pdf). Also
>> where entries are marked as no change the current control
>> command is repeated as the current master reading the
>> control register has control of the bus and bus is on.
>>
>> Signed-off-by: Quentin Strydom <quentin.strydom@bluwireless.com>
>> ---
>>  drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
>> index 6a39ada..50808fa 100644
>> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
>> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
>> @@ -211,7 +211,7 @@ static void pca9541_release_bus(struct i2c_client *client)
>>  
>>  /* Control commands per PCA9541 datasheet */
>>  static const u8 pca9541_control[16] = {
>> -	4, 0, 1, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 4, 5, 1
>> +	4, 4, 5, 5, 4, 4, 5, 7, 8, 0, 1, 11, 0, 0, 1, 1
>>  };
>>  
>>  /*
> 
> I found all your mails from git send-email in my spam folder. They probably
> lack some headers that have become increasingly important... [Don't ask me
> for further details.]
> 
> I do not have the HW to test this. I'm only going by the datasheet.
> 
> But yes, pca9541_control[1] and [2] indeed seem exchanged with [13] and [14].
> 
> However, pca9541_control[5], [7], [8], and [11] are never used AFAICT.
> Trying to write 7, 8 and 11 also attempts to write various read-only bits
> and makes no sense. So, I'd skip those changes.
> 
> All that said, I'm a bit skeptic as to why this has worked at all if this
> is incorrect. I would like to see a more detailed failure description that
> could explain why this change is indeed "it".
> 

Good question. I had tested the code quite extensively. Maybe the failing cases
did not apply to my situation. Too long to recall, unfortunately.

Guenter
