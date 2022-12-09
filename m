Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D624D648246
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 13:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiLIMQ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 07:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiLIMQZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 07:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D124A5B0
        for <linux-i2c@vger.kernel.org>; Fri,  9 Dec 2022 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670588125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BtgQ7WbWz1/dygP/4Q3Y766uFdX//7j3uN4Cs1hiL7M=;
        b=hySjvmUmNVWCIKWCNnf2xb5EVURxGjRIs5yl2QFpPLI0yo2PJhW21N98p9BF31s89/ZnX/
        8pOxoTQXsKyKKTMw9dsgKjzdTrnB0CUr5OPnZpAvXJ8CkMfTX4TbexyGnXNSJHWRHbVlM+
        i4mGjTqfAEFrSEQvgbEC7ZrI4Sm6bfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-mGd5gCqdM3mOnuXuL2kkcQ-1; Fri, 09 Dec 2022 07:15:24 -0500
X-MC-Unique: mGd5gCqdM3mOnuXuL2kkcQ-1
Received: by mail-ej1-f69.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so2988293ejc.11
        for <linux-i2c@vger.kernel.org>; Fri, 09 Dec 2022 04:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtgQ7WbWz1/dygP/4Q3Y766uFdX//7j3uN4Cs1hiL7M=;
        b=8GeUYl8IUMBCkF+6Sjzd6jUb5cpMH5OxbyXiztR67en3+6WDiXyJkGhUHcSbtjPC50
         d4eVbWc7EBI3ykij3uLAZk3lWwtwyBJBtefwzjhaIs295TtvlAoQBrOjo3kutop2ZiAP
         tHS8q7XMWSol7CzLVBXMUH8Gg/R49/3/T8lCwqwpM6MJIo8VHR1I1dvfNlPA+QiYskX/
         jWE0kVZPwdfeswL0E6m8oesNlishq3ZG0CGJd3za8yk9zSLIuRkNemFUV9iYrhgsA4t1
         Vd3VUw1p6GC7zvFl1xNm6yzm/exezcPWPBJbga960++fLQbFLImlORed0Gxut339AIog
         F5LQ==
X-Gm-Message-State: ANoB5pnF9RVMu+rq8J3mEvPutDg2x6GfC99GJVvFuq6YXylIuthYXFiB
        UqLpy/tOkxC7OEp3OXHs/xqXloHZK+0PCxPu87AQuTww27HcHsrYLghlKHx6guLY59ijkq5iMzJ
        j4hfpTCSAVD4k3Bry7YyW
X-Received: by 2002:a05:6402:1002:b0:467:9384:a7aa with SMTP id c2-20020a056402100200b004679384a7aamr5155781edu.15.1670588123399;
        Fri, 09 Dec 2022 04:15:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4RRYy2HgbHVKh12Vfe0a9mMIpHtpM3J9HE/UTuFWgQs5mNOeVUx5s++T0sq0ZD4BHoDdHokw==
X-Received: by 2002:a05:6402:1002:b0:467:9384:a7aa with SMTP id c2-20020a056402100200b004679384a7aamr5155766edu.15.1670588123176;
        Fri, 09 Dec 2022 04:15:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ky2-20020a170907778200b0073d796a1043sm482155ejc.123.2022.12.09.04.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 04:15:22 -0800 (PST)
Message-ID: <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
Date:   Fri, 9 Dec 2022 13:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US, nl
To:     Richard Fitzgerald <rf@opensource.cirrus.com>, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221209114034.18025-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Richard,

On 12/9/22 12:40, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
> 
> Don't set DPM_FLAG_MAY_SKIP_RESUME to skip system early_resume stage if the
> driver was runtime-suspended. Instead, always call dw_i2c_plat_resume() and
> use pm_runtime_suspended() to determine whether we need to power up the
> hardware.
> 
> The unbalanced suspended flag was introduced by
> commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
> suspended flag")
> 
> Before that commit, the system and runtime PM used the same functions. The
> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
> had been in runtime-suspend. If system resume was skipped, the suspended
> flag would be cleared by the next runtime resume. The check of the
> suspended flag was _after_ the call to pm_runtime_get_sync() in
> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
> the flag before it was checked.
> 
> Having introduced the unbalanced suspended flag with that commit, a further
> commit 80704a84a9f8
> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")
> 
> changed from using a local suspended flag to using the
> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
> checked by I2C core code before issuing the transfer to the bus driver, so
> there was no opportunity for the bus driver to runtime resume itself before
> the flag check.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")

It is not entirely clear to me where the unbalance you claim to see comes
from? When runtime-suspended SMART_SUSPEND should keep it suspended at which point
the system suspend callback will never run ?

Are you sure that you are not maybe seeing a suspend/resume ordering issue?

Did you add printk messages to the suspend/resume callbacks of
i2c-designware-platdrv.c which show the system suspend callback
being called but not the system resume one ?

I guess that is possible with DPM_FLAG_MAY_SKIP_RESUME, but
since we also use SMART_SUSPEND I would expect the system-suspend
callback to also always be skipped for runtime-suspended controllers.







> ---
> Apologies if you get this message multiple times. I'm having trouble
> with my SMTP server.
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ba043b547393..d805b8c7e797 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -351,13 +351,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>  		dev_pm_set_driver_flags(&pdev->dev,
> -					DPM_FLAG_SMART_PREPARE |
> -					DPM_FLAG_MAY_SKIP_RESUME);
> +					DPM_FLAG_SMART_PREPARE);
>  	} else {
>  		dev_pm_set_driver_flags(&pdev->dev,
>  					DPM_FLAG_SMART_PREPARE |
> -					DPM_FLAG_SMART_SUSPEND |
> -					DPM_FLAG_MAY_SKIP_RESUME);
> +					DPM_FLAG_SMART_SUSPEND);
>  	}
>  
>  	device_enable_async_suspend(&pdev->dev);
> @@ -475,7 +473,9 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> -	dw_i2c_plat_runtime_resume(dev);
> +	if (!pm_runtime_suspended(dev))
> +		dw_i2c_plat_runtime_resume(dev);
> +

I'm afraid that this is always going to run now, before this callback gets
called drivers/base/power/main.c: device_resume_noirq() does:

        skip_resume = dev_pm_skip_resume(dev);

        if (skip_resume)
                pm_runtime_set_suspended(dev);
        else if (dev_pm_skip_suspend(dev))
                pm_runtime_set_active(dev);

Where skip_resume now is false since you dropped the
DPM_FLAG_MAY_SKIP_RESUME flag and dev_pm_skip_suspend(dev)
will return true (see below) for runtime-suspended controllers,
so they will be marked active here. and then your
!pm_runtime_suspended(dev) will always be false.

Did you add a printk to both the if + else paths
and have you ever seen the controller not get
resumed with this test added ?

Regards,

Hans




bool dev_pm_skip_suspend(struct device *dev)
{
        return dev_pm_test_driver_flags(dev, DPM_FLAG_SMART_SUSPEND) &&
                pm_runtime_status_suspended(dev);
}




>  	i2c_mark_adapter_resumed(&i_dev->adapter);
>  
>  	return 0;

