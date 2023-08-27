Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702C178A026
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 18:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjH0QVZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 12:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbjH0QUy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 12:20:54 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCBAF5
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 09:20:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5236b2b4cdbso3332150a12.3
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693153249; x=1693758049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWgIaaIOc149ue6GXXKVcAQfrTDNE1vHc1RbUyPnKBQ=;
        b=mGZPkNqMnswb9CYve5V5dgjs3I3VAMPXECQXfnS++M5f3QBK4zGjOtEcUJSFnQFQ+N
         SBZyMRjhgXxfKMCWgmt0+Bo/WKeA9KMdyFr4XOSjCSJlcdQrLNHtE8UiJCJh6fiJ5YK4
         OASAoymHvMdl/SHKb7qvK2Ae7BlrB1FkhwMlNoqIMYxQ/o7tZJNNFPidjQct9YYMq2dw
         c6G5ctSayq6A5pMJA2hXBbIgqfO21fOsMFU3S1AyXlG1RWVhSatUGuTvmIAA/ieUIZ1b
         bBZ5ESPMWiADE5tcyukE6C3rvm4XszX5iKnZxTH30CDjqp1rOqa18fFO4VZdrVMaiObr
         Riag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693153249; x=1693758049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWgIaaIOc149ue6GXXKVcAQfrTDNE1vHc1RbUyPnKBQ=;
        b=MXMpp/wWVJncwsYNurpY7SBT72QHEPx+N4EuOqfZFnfjBDNWmzsJUU2zAQ8O56lkj3
         1HduSGpoG1sCq8nVCILBOBRAQBeLIQ0ab4KZyP0VAz8iZ1UEHUF5zv2sd4KuehIfxD7m
         dN/JATeif9UuGV5uU+DQPlSA4yvTHKDlIjtlhgd9QEpKfZiX8If1oRc/Lr9B1m6Bu21x
         SofdJkOe+RuypFqS4YZtpEIhRmw2D6vubbeTqS2xDXxlHiWmrqZFQ5tPazTRz4VOpZ/G
         uXumBDDeSHfIcWM2PWa6gH4mR7qRa0hCyhJculQSHbLL8c5dpFW3pd5mcu20cgXcH/xU
         hTVA==
X-Gm-Message-State: AOJu0YwR4ruWxVTkcCO6EKPncVKejSR12SjGVitW+NcbD46Rsi8X+QzG
        xRKvSIVHRMeB04VEnLyHxr+KJ/Eb7UA=
X-Google-Smtp-Source: AGHT+IHNGJeXfbFEbSRPQpgx65Ho++jqm+bNx9kvOrQZGuuLidw67D8Y8fepTv2vh7O0XIqvED6ZvA==
X-Received: by 2002:aa7:d6d2:0:b0:523:2b8c:d901 with SMTP id x18-20020aa7d6d2000000b005232b8cd901mr17737265edr.10.1693153249190;
        Sun, 27 Aug 2023 09:20:49 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9? (dynamic-2a01-0c23-c0a4-3400-90f1-4994-ce26-fdf9.c23.pool.telefonica.de. [2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9])
        by smtp.googlemail.com with ESMTPSA id z8-20020aa7c648000000b0052a3ad836basm3450062edr.41.2023.08.27.09.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 09:20:48 -0700 (PDT)
Message-ID: <debeb057-1579-13f6-d2d7-bd81b0e012d2@gmail.com>
Date:   Sun, 27 Aug 2023 18:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
To:     Jean Delvare <jdelvare@suse.de>, Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
 <20230614222439.i7uw3dai3why7bk2@intel.intel>
 <20230626192039.315cacce@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230626192039.315cacce@endymion.delvare>
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

On 26.06.2023 19:20, Jean Delvare wrote:
> Hi Andi, Heiner,
> 
> Adding Wolfram Sang who introduced the i2c_mark_adapter_suspended() API
> originally.
> 
> On Thu, 15 Jun 2023 00:24:39 +0200, Andi Shyti wrote:
>> On Sat, Mar 04, 2023 at 10:31:23PM +0100, Heiner Kallweit wrote:
>>> When entering the shutdown/remove/suspend callbacks, at first we should
>>> ensure that transfers are finished and I2C core can't start further
>>> transfers. Use i2c_mark_adapter_suspended() for this purpose.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-i801.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>> index ac5326747..d6a0c3b53 100644
>>> --- a/drivers/i2c/busses/i2c-i801.c
>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>> @@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
>>>  {
>>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>>  
>>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>> +
>>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>>  	i801_disable_host_notify(priv);
>>>  	i801_del_mux(priv);
>>> @@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
>>>  {
>>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>>  
>>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>> +  
>>
>> is this really needed in the shutdown and remove function?
> 
> The very same question came to my mind. I would really expect the
> driver core to do all the reference counting needed so that a device
> can't possibly be removed when any of its children is still active. If
> that's not the case then something is very wrong in the device driver
> model itself, and I certainly hope that the proper fix wouldn't be
> subsystem-specific and implemented in every device driver separately.
> 
> FWIW, I see 13 I2C bus drivers calling i2c_mark_adapter_suspended() at
> the moment, and only one of them is calling it in shutdown
> (i2c-qcom-geni). None of them is calling it in remove. If that's not
> needed for other drivers then I can't see why that would be needed for
> i2c-i801.
> 
> As far as the remove() path is concerned, my expectation is that if
> everything is undone in the opposite way of the probe() path then
> everything should be fine. It turns out this is not the case of the
> current i2c-i801 driver. The original HSTCNT register value is being
> restored too early in i801_remove(). I'm to blame for this, the bug was
> introduced by commit 9b5bf5878138 ("i2c: i801: Restore INTREN on
> unload") which is mine. This should be fixed separately before any
> other change.
> 
I think there's a little bit more to be done for proper cleanup
in reverse order in remove() and in the error path of probe().
I'll come up with a patch.

> Once this is fixed, unless you are able to actually trigger a bug in
> the remove() path, then I see no good reason to add
> i2c_mark_adapter_suspended() to that code path.
> 
> For shutdown, I'm unsure. Wolfram, what's your take?
> 
> Thanks,

