Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3832D7326F1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 08:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240942AbjFPGAV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 02:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242078AbjFPGAI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 02:00:08 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728662D50
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 23:00:07 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f8f3786f1dso2520175e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 23:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686895206; x=1689487206;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEsgswoBh9rJee1QwgrO5YFj7DZzC55m1LKonp+DDkc=;
        b=K5ZiZaFvJoHI4HUHE/sXDpQnIPbt1H0LzsWQgkGMMQE3IBZIJfYMBFHtga9n1lTpCm
         OgO/mBQTPsi9Kr+4EA09jZtgT3m44A+kxE/m7I3aGsBB0tuRAPriJ0FuWOauJIHGAu7P
         xMOYEDwbdfseZiBTUCFlKRWARh++jfR8yMHu0rNGDnqwgp2Qj8GHDXqwJlCI5XCUBUCP
         lwJ7VuU3fxSsQlkgFxdKPhRyvzOiXwW/JnFCmpfaGGFUR+7tJrFV9Fxb4rUdOLWBcDrv
         FWkodDA8+BiogvuA4umHTO3fB5UgJ7FeorCEUygvA18QvPi9vRT0k7cZ7qoYgxqyAqcY
         JEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686895206; x=1689487206;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEsgswoBh9rJee1QwgrO5YFj7DZzC55m1LKonp+DDkc=;
        b=bnqmUKmHQrJQlGbdnz+nL+mlhyP27uX3+RfMoXoMCfsHoNNZF8NWwhhWLhDYjvQuuI
         cFsI7hjRGBVW0MxmUVQ5vdyi205qzJUdiVRArHl6xIvM2MGVteh7a4WUSvTPGE/tDNqJ
         0ngDVNhwJVeyj4EOQUQx0KEcF6FvlZ1LUFvXiYdEUBOLVx4OSvQN7gbaqPlM3v/hlw54
         7fMmS+7zoykqCPhqPA/2RkciG1XVfQ77osjIfmFpXCP9N58hUskbonvwyNQYI1KUQ1Jq
         FtKpNYsZkUqqHAkPahcU8VBGkkJodZQth7E8tc+tc0Yst8SsEeCkLnqlKPsDWEh7r98V
         ZbAg==
X-Gm-Message-State: AC+VfDyAiTYQFDoT+dw3bIeqxGYkC30PapzaXaQXiEs9EN5va9QTbn/u
        shYeB24IjAcfw4S5IZxN8Pk=
X-Google-Smtp-Source: ACHHUZ4B6KC+5sYhVk7PSsEc+mnSF+06wG1nC4P9lykCYZlVamFYANPp17JtqgAvnpbyAyT8U8tUXw==
X-Received: by 2002:a1c:f70f:0:b0:3f7:2a1d:1b05 with SMTP id v15-20020a1cf70f000000b003f72a1d1b05mr901781wmh.14.1686895205608;
        Thu, 15 Jun 2023 23:00:05 -0700 (PDT)
Received: from ?IPV6:2a01:c22:777f:c900:e887:479e:881b:43d3? (dynamic-2a01-0c22-777f-c900-e887-479e-881b-43d3.c22.pool.telefonica.de. [2a01:c22:777f:c900:e887:479e:881b:43d3])
        by smtp.googlemail.com with ESMTPSA id 23-20020a05600c22d700b003f7f1b3aff1sm1135910wmg.26.2023.06.15.23.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 23:00:05 -0700 (PDT)
Message-ID: <1dbab8ee-324b-edb2-9489-72e75ad4f5dd@gmail.com>
Date:   Fri, 16 Jun 2023 08:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
 <20230614222439.i7uw3dai3why7bk2@intel.intel>
 <62cf2367-5917-1459-b899-7b325e80505c@gmail.com>
 <20230615214517.niwhcdnzxuumed2k@intel.intel>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
In-Reply-To: <20230615214517.niwhcdnzxuumed2k@intel.intel>
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

On 15.06.2023 23:45, Andi Shyti wrote:
> Hi Heiner,
> 
> On Thu, Jun 15, 2023 at 11:17:12PM +0200, Heiner Kallweit wrote:
>> On 15.06.2023 00:24, Andi Shyti wrote:
>>> Hi Heiner,
>>>
>>> On Sat, Mar 04, 2023 at 10:31:23PM +0100, Heiner Kallweit wrote:
>>>> When entering the shutdown/remove/suspend callbacks, at first we should
>>>> ensure that transfers are finished and I2C core can't start further
>>>> transfers. Use i2c_mark_adapter_suspended() for this purpose.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-i801.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>> index ac5326747..d6a0c3b53 100644
>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>> @@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
>>>>  {
>>>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>>>  
>>>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>>> +
>>>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>>>  	i801_disable_host_notify(priv);
>>>>  	i801_del_mux(priv);
>>>> @@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
>>>>  {
>>>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>>>  
>>>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>>> +
>>>
>>> is this really needed in the shutdown and remove function?
>>>
>> I think yes. Otherwise we may interrupt an active transfer, or a user
>> may start a transfer whilst we are in cleanup.
>> Note: i2c_mark_adapter_suspended() takes the I2C bus lock, therefore it
>> will sleep until an active transfer is finished.
> 
> yes, I think you are right.
> 
>>> I'm OK with it, though.
>>>
>>>>  	/* Restore config registers to avoid hard hang on some systems */
>>>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>>>  	i801_disable_host_notify(priv);
>>>> @@ -1807,6 +1811,7 @@ static int i801_suspend(struct device *dev)
>>>>  {
>>>>  	struct i801_priv *priv = dev_get_drvdata(dev);
>>>>  
>>>> +	i2c_mark_adapter_suspended(&priv->adapter);
>>>>  	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>>>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
>>>>  	return 0;
>>>> @@ -1818,6 +1823,7 @@ static int i801_resume(struct device *dev)
>>>>  
>>>>  	i801_setup_hstcfg(priv);
>>>>  	i801_enable_host_notify(&priv->adapter);
>>>> +	i2c_mark_adapter_resumed(&priv->adapter);
>>>
>>> BTW, I see that very few drivers are using suspended and resumed
>>> and I wonder why. Should these perhaps be added in the basic pm
>>> functions?
>>>
>> For my understanding, which functions are you referring to?
> 
> I am referring about having a more generalised pm function which
> can mark the i2c adapter supsended or resumed even before or
> after the driver specific functions are called.
> 
In case of i801 this bus driver is a pci_driver and the remove callback
is handled by the PCI core (pci_device_remove()), I2C core isn't involved.
At a first glance I fail to see how we could inject I2C-specific code.

> This way all drivers can benefit from it.
> 
> In any case this out of the scope of this patch.
> 
> I'm going to give my approval, if then Jean has something to say,
> I guess there is still time to chime in.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
> 
> Thank you,
> Andi
> 
>>> I'm OK to r-b this, but i want first Jean to give it an ack.
>>>
>>> Andi
>>

