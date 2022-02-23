Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97BE4C1650
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 16:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241193AbiBWPP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 10:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241278AbiBWPPw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 10:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CE28B8B53
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 07:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645629321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O6+c51iuuUW7TW2hkZLDSsCaYp0f0FPO2qejnzoryOk=;
        b=WVD3/3vzF3CrUZg4E5adzgYP5th/ygfL2VsxKmB90+HNvFzamHcq7kLt+8kLBujSFr/BFq
        EAvGiP5V1CLTC8JLLjKIakNKMZXTkumDV+QkpPdGK1eXne696bO7KIUZanMSVtumcsvWc8
        hedx7T5Hcol7QCtYX21ym7WwcKdtblo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-2mibqwwhNOqGk_5ipAcsbA-1; Wed, 23 Feb 2022 10:15:19 -0500
X-MC-Unique: 2mibqwwhNOqGk_5ipAcsbA-1
Received: by mail-ej1-f70.google.com with SMTP id m4-20020a170906160400b006be3f85906eso7218892ejd.23
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 07:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O6+c51iuuUW7TW2hkZLDSsCaYp0f0FPO2qejnzoryOk=;
        b=qcv2M7plGyLigsemutnEdmdEGj62aeHppfmXQaQQNUWf54RSnhmxohcw+/dnZ2jp6b
         rx51J7iFd1Umo/RPIyveNLVsHk0wX9zhUvxyTv0zKcmd/lgyfsHiZGUMiKdCdNy3qHcM
         MI/0exB2XVPdMweOtOrFhSUtV2N25mmNE1kkTTRuHfe4SW0xqg6so9Uvuzv2owe1iVxi
         VUJxmgZqslIEu6y4gxk+IY/XuThuMfi4tH7YlARYYk6tVECgwemhK+hQvjo/k9pJokrF
         nr6zBoZOOMykXi4up9bvmnG5G3FZhxq89ZL9VaFK/Xh0fFvZh29/oqKABhXQo4JYKlHG
         J4hg==
X-Gm-Message-State: AOAM5312vzVT/GKBph4DicwEgsgB6F7qKOWWxKuPoNPN2gs/M1dwQ5Bt
        i2+BUA6pazN96m1Nrgrwe1IUJ+jasDZq5hISaHIhXSAL1AwMRl+nMN0ygTDHjUkczE0ml6fQuxZ
        GCiHdQb6v2XovCFFo+zAL
X-Received: by 2002:aa7:cfda:0:b0:410:aaaa:320 with SMTP id r26-20020aa7cfda000000b00410aaaa0320mr31897668edy.360.1645629318437;
        Wed, 23 Feb 2022 07:15:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUhsr/r3uXnbWjQxP2tLqeIG8tJfZvKZW9I9BzQjxrhcARuKJgqAyanY/V5mPutXg/AgJ8sw==
X-Received: by 2002:aa7:cfda:0:b0:410:aaaa:320 with SMTP id r26-20020aa7cfda000000b00410aaaa0320mr31897646edy.360.1645629318156;
        Wed, 23 Feb 2022 07:15:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id di19sm7502020ejc.191.2022.02.23.07.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 07:15:17 -0800 (PST)
Message-ID: <8589d685-b075-cce4-89b2-129588a5dd2e@redhat.com>
Date:   Wed, 23 Feb 2022 16:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] i2c: designware: Lock the adapter while setting the
 suspended flag
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220223134839.731138-1-hdegoede@redhat.com>
 <YhZKNqpeD9M9xxk6@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZKNqpeD9M9xxk6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 2/23/22 15:52, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:48:38PM +0100, Hans de Goede wrote:
>> Lock the adapter while setting the suspended flag, to ensure that other
>> locked code always sees the change immediately, rather then possibly using
>> a stale value.
>>
>> This involves splitting the suspend/resume callbacks into separate runtime
>> and normal suspend/resume calls. This is necessary because i2c_dw_xfer()
>> will get called by the i2c-core with the adapter locked and it in turn
>> calls the runtime-resume callback through pm_runtime_get_sync().
>>
>> So the runtime versions of the suspend/resume callbacks cannot take
>> the adapter-lock. Note this patch simply makes the runtime suspend/resume
>> callbacks not deal with the suspended flag at all. During runtime the
>> pm_runtime_get_sync() from i2c_dw_xfer() will always ensure that the
>> adapter is resumed when necessary.
>>
>> The suspended flag check is only necessary to check proper suspend/resume
>> ordering during normal suspend/resume which makes the pm_runtime_get_sync()
>> call a no-op.
> 
> Both patches look good to me and seems like a nice clean up. Not sure if the
> first one should be backported (and hence have a Fixes tag).
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for the review. As for adding a Fixes: tag, this was inspired
by an actual bug-report, but it did not help in fixing the bug, so I left
the fixes tag out.

If you or Wolfram still want to add a Fixes tag, then it should be:

Fixes: 275154155538  ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/i2c/busses/i2c-designware-pcidrv.c  | 31 +++++++++++++++++----
>>  drivers/i2c/busses/i2c-designware-platdrv.c | 31 +++++++++++++++++----
>>  2 files changed, 52 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
>> index ef4250f8852b..9553d7075223 100644
>> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
>> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
>> @@ -213,14 +213,30 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>>  	},
>>  };
>>  
>> +static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
>> +{
>> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +	i_dev->disable(i_dev);
>> +	return 0;
>> +}
>> +
>>  static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
>>  {
>>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>>  
>> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  	i_dev->suspended = true;
>> -	i_dev->disable(i_dev);
>> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  
>> -	return 0;
>> +	return i2c_dw_pci_runtime_suspend(dev);
>> +}
>> +
>> +static int __maybe_unused i2c_dw_pci_runtime_resume(struct device *dev)
>> +{
>> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +	return i_dev->init(i_dev);
>>  }
>>  
>>  static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
>> @@ -228,14 +244,19 @@ static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
>>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>>  	int ret;
>>  
>> -	ret = i_dev->init(i_dev);
>> +	ret = i2c_dw_pci_runtime_resume(dev);
>> +
>> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  	i_dev->suspended = false;
>> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  
>>  	return ret;
>>  }
>>  
>> -static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
>> -			    i2c_dw_pci_resume, NULL);
>> +static const struct dev_pm_ops i2c_dw_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
>> +	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
>> +};
>>  
>>  static int i2c_dw_pci_probe(struct pci_dev *pdev,
>>  			    const struct pci_device_id *id)
>> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
>> index 2bd81abc86f6..8e45f65bab73 100644
>> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
>> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
>> @@ -368,12 +368,10 @@ static void dw_i2c_plat_complete(struct device *dev)
>>  #endif
>>  
>>  #ifdef CONFIG_PM
>> -static int dw_i2c_plat_suspend(struct device *dev)
>> +static int dw_i2c_plat_runtime_suspend(struct device *dev)
>>  {
>>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>>  
>> -	i_dev->suspended = true;
>> -
>>  	if (i_dev->shared_with_punit)
>>  		return 0;
>>  
>> @@ -383,7 +381,18 @@ static int dw_i2c_plat_suspend(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int dw_i2c_plat_resume(struct device *dev)
>> +static int dw_i2c_plat_suspend(struct device *dev)
>> +{
>> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>> +	i_dev->suspended = true;
>> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>> +
>> +	return dw_i2c_plat_runtime_suspend(dev);
>> +}
>> +
>> +static int dw_i2c_plat_runtime_resume(struct device *dev)
>>  {
>>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>>  
>> @@ -391,7 +400,19 @@ static int dw_i2c_plat_resume(struct device *dev)
>>  		i2c_dw_prepare_clk(i_dev, true);
>>  
>>  	i_dev->init(i_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw_i2c_plat_resume(struct device *dev)
>> +{
>> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +	dw_i2c_plat_runtime_resume(dev);
>> +
>> +	i2c_lock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  	i_dev->suspended = false;
>> +	i2c_unlock_bus(&i_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>  
>>  	return 0;
>>  }
>> @@ -400,7 +421,7 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
>>  	.prepare = dw_i2c_plat_prepare,
>>  	.complete = dw_i2c_plat_complete,
>>  	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
>> -	SET_RUNTIME_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume, NULL)
>> +	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>>  };
>>  
>>  #define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
>> -- 
>> 2.35.1
>>
> 

