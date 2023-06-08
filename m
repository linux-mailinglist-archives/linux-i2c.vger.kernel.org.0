Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C5C728BE9
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 01:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjFHXji (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 19:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbjFHXjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 19:39:37 -0400
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DE33586
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 16:39:04 -0700 (PDT)
Received: from [192.168.1.114] (unknown [185.145.125.130])
        by mail.ispras.ru (Postfix) with ESMTPSA id 3CF25400CBDC;
        Thu,  8 Jun 2023 23:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3CF25400CBDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
        s=default; t=1686267072;
        bh=WXsynDXbMoQpT2neUy/yAKrNWB/bMLMyKDiCAEa7FsE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KLkX+TMP6j/RATJvfTlec2TzDOTewb5qZ0kiTUiMrwIleXcCZF/6CdZTspz9VgosY
         zAVjgV3IIThFPrw1efTgF3ivciQ5KrLc/P8iaErAOqxsGG+8by21QanzwwSJEfpnmr
         LYrYns8E3/hQ1GPG5+0/fguKQPvAJhZghdYDUKWc=
Subject: Re: [PATCH v2] i2c: hix5hd2: Make sure clk is disabled in remove
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20230608225513.1151574-1-andi.shyti@kernel.org>
 <20230608231035.ppfzyuegkk5ysjau@intel.intel>
From:   Alexey Khoroshilov <khoroshilov@ispras.ru>
Autocrypt: addr=khoroshilov@ispras.ru; prefer-encrypt=mutual; keydata=
 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
 kK2E04Fb+Zk1eJvHYRc=
Message-ID: <801bb876-abd2-412a-183c-04144fd99971@ispras.ru>
Date:   Fri, 9 Jun 2023 02:31:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230608231035.ppfzyuegkk5ysjau@intel.intel>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On 09.06.2023 02:10, Andi Shyti wrote:
> Hi Alexey,
> 
> are you still around? Your patch looks good, just two things...
> 
> On Fri, Jun 09, 2023 at 12:55:13AM +0200, Andi Shyti wrote:
>> From: Alexey Khoroshilov <khoroshilov@ispras.ru>
>>
>> pm_runtime_set_suspended() does not lead to call of suspend callback,
>> so clk may be left undisabled in hix5hd2_i2c_remove().
>>
>> By the way, the patch adds error handling for clk_prepare_enable().
> 
> could you please put this in a separate patch?

Sure I can do that, thank you for catching it up!

--
Alexey

> 
>> Found by Linux Driver Verification project (linuxtesting.org).
>>
>> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
>> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> 
> if you're taking this, feel free to drop my SoB...
> 
>> ---
>> Hi,
>>
>> Look what I fished from the far December 2017 :)
>>
>> It looked better to respin it rather than replying to such an old
>> mail.
>>
>> I haven't made any modification to the patch exept for a little
>> rebase conflict. Here's a full changelog, anyway.
>>
>> Changelog
>> =========
>> v1 -> v2:
>>  - Fished this out from the muddy pond.
>>  - Added my SoB
>>  - Fixed rebase conflict
> 
> ... but please keep the changelog.
> 
>> Andi
>>
>>  drivers/i2c/busses/i2c-hix5hd2.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
>> index 0e34cbaca22dc..ec775ffefa9fc 100644
>> --- a/drivers/i2c/busses/i2c-hix5hd2.c
>> +++ b/drivers/i2c/busses/i2c-hix5hd2.c
>> @@ -421,7 +421,11 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
>>  		dev_err(&pdev->dev, "cannot get clock\n");
>>  		return PTR_ERR(priv->clk);
>>  	}
>> -	clk_prepare_enable(priv->clk);
>> +	ret = clk_prepare_enable(priv->clk);
> 
> please use devm_clk_get_enabled();
> 
> Thanks,
> Andi
> 
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "cannot enable clock\n");
>> +		return ret;
>> +	}
>>  
>>  	strscpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
>>  	priv->dev = &pdev->dev;
>> @@ -469,8 +473,10 @@ static int hix5hd2_i2c_remove(struct platform_device *pdev)
>>  	struct hix5hd2_i2c_priv *priv = platform_get_drvdata(pdev);
>>  
>>  	i2c_del_adapter(&priv->adap);
>> -	pm_runtime_disable(priv->dev);
>> -	pm_runtime_set_suspended(priv->dev);
>> +
>> +	/* Make sure priv->clk is disabled */
>> +	pm_runtime_force_suspend(priv->dev);
>> +
>>  	clk_disable_unprepare(priv->clk);
>>  
>>  	return 0;
>> -- 
>> 2.40.1
>>

