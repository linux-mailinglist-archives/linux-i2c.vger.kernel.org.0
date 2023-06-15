Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F2073216F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 23:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFOVRR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 17:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjFOVRR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 17:17:17 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B75F2960
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 14:17:15 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f8d0e814dfso21476415e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686863834; x=1689455834;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVMkoeUXAYosT8MI9Q/3mimgumQ87s7G5is3qoh6i2c=;
        b=VgFbp7RNMFsWKXCGXAhP9OhhGDUD48EjVWBn3S/RfKXdmyJ1txkMhWfWgJJTCku8x7
         PiqZ6VJVior1Ikke8x+caMtJLViGEK4ADtHTUJKek6jnRVj3Vop5UEiORq6rpg5IuU1H
         ifEltvTF8m2NlgjUvt6A8GpVF6DhPyDp8MP7eMjnLw5oWk+35bLuTXDKUXlzd+yYRwpt
         +s+MCxcCK6HdTtbQ9x/l/0jRVhdESz/cKc+SO67PDfry9WiFyvvGCHhHk8OXkat7gJyz
         9sG3yOXdRO/l82Yr8zRk8w+QAsSeyBdkIwYNKkBKMfPhkBqYV6RZPCVde3iuxOZ25reo
         u/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686863834; x=1689455834;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVMkoeUXAYosT8MI9Q/3mimgumQ87s7G5is3qoh6i2c=;
        b=adTzb5m4yDSxaysaIpVMqbeI2KaSijZITtLcOX8TsRTHCw/kKwRZd2RdQid7Rp1f0n
         mUfCM/jvzt/up+ThYEzIBkfshOaVMm8gbWVjutbPHoR+ZkrZ6eYI7WJHid6cQUoyWLMx
         hEmoa5n5e6yTCocpYRXLwQFiOLW4QYDA3sPwB0wBbxQqdpT+5Lvz4l/Ro1j5XSi/sLRR
         R+DsLjYPCVHog0p1dyEOTpqwHs0Sb7npqclajMDqqxxbmo6AoUONd9vdWk6RJHuRdQo9
         7dKt5MKDzFo7+7mhBIAGa9spc5Ta2sQDHfx/tf/Mmdxh3i5aeP/HQ6B57TNR4J5JSzgM
         Wcfg==
X-Gm-Message-State: AC+VfDzyAu7AaWm5H+EaXjzuOXZ2SNxfDif/RAaEPBuqXE8kcPZMOBB4
        0xcLlOEFdJPItJXjW6bbOc7Mi6e/+rk=
X-Google-Smtp-Source: ACHHUZ6vL/O/ikxe42keL8MRFih7Vz/11hWrr1q0Ao6uUPSzSlHAz26aInDVSKMIpsnCjookjpUOgA==
X-Received: by 2002:a1c:7c1a:0:b0:3f6:5cbf:a3a1 with SMTP id x26-20020a1c7c1a000000b003f65cbfa3a1mr306871wmc.14.1686863833410;
        Thu, 15 Jun 2023 14:17:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6ec5:c500:ad06:edcc:b27e:b067? (dynamic-2a01-0c22-6ec5-c500-ad06-edcc-b27e-b067.c22.pool.telefonica.de. [2a01:c22:6ec5:c500:ad06:edcc:b27e:b067])
        by smtp.googlemail.com with ESMTPSA id y20-20020a7bcd94000000b003f60a446fe5sm218294wmj.29.2023.06.15.14.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 14:17:13 -0700 (PDT)
Message-ID: <62cf2367-5917-1459-b899-7b325e80505c@gmail.com>
Date:   Thu, 15 Jun 2023 23:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
 <20230614222439.i7uw3dai3why7bk2@intel.intel>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
In-Reply-To: <20230614222439.i7uw3dai3why7bk2@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15.06.2023 00:24, Andi Shyti wrote:
> Hi Heiner,
> 
> On Sat, Mar 04, 2023 at 10:31:23PM +0100, Heiner Kallweit wrote:
>> When entering the shutdown/remove/suspend callbacks, at first we should
>> ensure that transfers are finished and I2C core can't start further
>> transfers. Use i2c_mark_adapter_suspended() for this purpose.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index ac5326747..d6a0c3b53 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
>>  {
>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>  
>> +	i2c_mark_adapter_suspended(&priv->adapter);
>> +
>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>  	i801_disable_host_notify(priv);
>>  	i801_del_mux(priv);
>> @@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
>>  {
>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>  
>> +	i2c_mark_adapter_suspended(&priv->adapter);
>> +
> 
> is this really needed in the shutdown and remove function?
> 
I think yes. Otherwise we may interrupt an active transfer, or a user
may start a transfer whilst we are in cleanup.
Note: i2c_mark_adapter_suspended() takes the I2C bus lock, therefore it
will sleep until an active transfer is finished.

> I'm OK with it, though.
> 
>>  	/* Restore config registers to avoid hard hang on some systems */
>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>  	i801_disable_host_notify(priv);
>> @@ -1807,6 +1811,7 @@ static int i801_suspend(struct device *dev)
>>  {
>>  	struct i801_priv *priv = dev_get_drvdata(dev);
>>  
>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
>>  	return 0;
>> @@ -1818,6 +1823,7 @@ static int i801_resume(struct device *dev)
>>  
>>  	i801_setup_hstcfg(priv);
>>  	i801_enable_host_notify(&priv->adapter);
>> +	i2c_mark_adapter_resumed(&priv->adapter);
> 
> BTW, I see that very few drivers are using suspended and resumed
> and I wonder why. Should these perhaps be added in the basic pm
> functions?
> 
For my understanding, which functions are you referring to?

> I'm OK to r-b this, but i want first Jean to give it an ack.
> 
> Andi

