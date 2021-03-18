Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A4833FDFA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 05:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhCRECP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 00:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhCRECE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 00:02:04 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF67C06174A;
        Wed, 17 Mar 2021 21:02:04 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so3939977otf.12;
        Wed, 17 Mar 2021 21:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yPPNJ/iuMbYQdPze8KDj5MSdlpFP5EItMkTH0DbgL7g=;
        b=eTNOqDUON1e5faLvL9M7KB42WLQjZt471iyOIGQM5sPNcm1DkkaFAHq0jElFahiRoB
         xBmQeiOLLpl/1xqMDn+6x3M3gj2Uv/x+2+amD3/B6pfJSwrlRLWXxxG/tvzcNykVIdWZ
         KdKp17U5n0gryOtcsQzLkX+5gT0ve9Wt1Nkaokyg/L+VH70fkV7M96+7kBk86AUOfTYc
         NJZF+iJ8WTnm2b+M3/YwZmvFeAOF7xiy2gdmLr8y22orzEzYi8Xp6S0eN1AM3jUSQa0l
         fHvEV1QMxxJ/035103668b0/MzMAAt+SsVC+ZjLL1KPD/SwpQMqSYsBdnc4+ATL5xxUQ
         ImJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yPPNJ/iuMbYQdPze8KDj5MSdlpFP5EItMkTH0DbgL7g=;
        b=QAwPspA1/lxmsumnUZas+MLapbLiRDDFAUw+2HgrEcwKIfSOqTTLAxqhpY4Bi/fUCd
         U3mzZXtwWoxgMD9xtIccIG8vii+A6WsXUxCy6jUfeu8lechBTx49dql3fpi1fjS0K8gv
         7FGv0u1ApeNI7sZMXOmpyhjeMFslJy24sEV+ZdDUaOY9nYNNtgyUuqDB1CgEFQybJCQp
         wmRLvF/+Jv0xslgkz2aVTs2vdxYx1COQi3ltp/Wdq59RGjW6u2h9qajqnTwMTpywwwKH
         Av2RubLWfGG/XyDpzDL7oNB3cvYBnuNpUtJsOh9blNHowOiQ56dEik0BdVsKpe9Apvkk
         uHCQ==
X-Gm-Message-State: AOAM531r9ajl3WFiHg/gzv6g9fwC3TxTc52CG4+MwcaXkSopTMA0ShSM
        Vdc+RrsSAr2pgQ7VS0phTOx9ASFe2CY=
X-Google-Smtp-Source: ABdhPJxoToCJpxVnBlX8zjBz4PEI1c5sVhZMQtNK8lkVSBq1SufotWu8/IlEnttIMyYXoZRwf69/Pg==
X-Received: by 2002:a9d:8d5:: with SMTP id 79mr5916165otf.345.1616040123041;
        Wed, 17 Mar 2021 21:02:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d21sm247135oic.54.2021.03.17.21.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 21:02:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8e516ef6-340e-a873-68a9-71a10008f32c@roeck-us.net>
Date:   Wed, 17 Mar 2021 21:02:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/17/21 8:46 PM, Chris Packham wrote:
> 
> On 12/03/21 10:34 am, Guenter Roeck wrote:
>> On 3/11/21 1:17 PM, Chris Packham wrote:
>>> On 11/03/21 9:18 pm, Wolfram Sang wrote:
>>>>> Bummer. What is really weird is that you see clock stretching under
>>>>> CPU load. Normally clock stretching is triggered by the device, not
>>>>> by the host.
>>>> One example: Some hosts need an interrupt per byte to know if they
>>>> should send ACK or NACK. If that interrupt is delayed, they stretch the
>>>> clock.
>>>>
>>> It feels like something like that is happening. Looking at the T2080
>>> Reference manual there is an interesting timing diagram (Figure 14-2 if
>>> someone feels like looking it up). It shows SCL low between the ACK for
>>> the address and the data byte. I think if we're delayed in sending the
>>> next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
>>>
>> I think that really leaves you only two options that I can see:
>> Rework the driver to handle critical actions (such as setting TXAK,
>> and everything else that might result in clock stretching) in the
>> interrupt handler, or rework the driver to handle everything in
>> a high priority kernel thread.
> I've made some reasonable progress on making i2c-mpc more interrupt 
> driven. Assuming it works out for my use-case is there an opinion on 
> making interrupt support mandatory? Looking at all the in-tree dts files 
> that use one of the compatible strings from i2c-mpc.c they all have 
> interrupt properties so in theory nothing is using the polling mode. But 
> there may be some out-of-tree boards or boards using an old dtb that 
> would be affected?
> 

The polling code is from pre-git times. Like 2005 and earlier.
I'd say it is about time to get rid of it. Any out-of-tree users
had more than 15 years to upstream their code, after all.

Guenter
