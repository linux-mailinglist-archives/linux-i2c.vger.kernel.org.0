Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A44A64C7F4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 12:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbiLNL3m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 06:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238113AbiLNL3l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 06:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0649EFAE9
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671017334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3XelnpOuY5/WYkqlV/X03EOrEyOH1/4r4MLd+9T0uOI=;
        b=DnzCuvg9U3MzArYbEBo6Rv1XpiR1XwbqQ+i0nbVHnW2Mpz57WhOTJuJ6BHLGQ6Q4/zMhal
        dkqH2fw5fUCXKHc3j/PqBSJ4HYP+XETWoyUOksAF9gbV7zeXj3PcQgxe3kbefwYOulck/T
        BbrZQrS0Mfv69GYOQefWUFyH0Xhr/94=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-eMa6Jm6dPSuQUo748wbZ1g-1; Wed, 14 Dec 2022 06:28:52 -0500
X-MC-Unique: eMa6Jm6dPSuQUo748wbZ1g-1
Received: by mail-ej1-f72.google.com with SMTP id ne1-20020a1709077b8100b007c198bb8c0eso2291874ejc.8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 03:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XelnpOuY5/WYkqlV/X03EOrEyOH1/4r4MLd+9T0uOI=;
        b=cQ38YNR5K23HAO2zF7PwI/GkNqN72Jygbb6JZBO+Wft8Td0F+YPd7hH9TD5J5yogNB
         s37ORPAzSXjVgU3h4sPg+zygaorbeRJ4h7ZV1QHXoEYTvlbXJtfNRauzqiNACqWvs6GM
         lmLS3GSqZQUmJCEHVfmrG9Yvd5Hk+jClMGjfGua2/K1BvkbgC+vLm0Q/E9sW7LJ21em8
         ngf49N878NXXupXP62+AUVKDXgMUhlPLf73/ar11fFv483ePpHNezchavdVIwdGs5lMX
         OAJkWzDelLG3TV/bzO2gWYo0xJPcFtT2mawRYGvhl9ZfMmCe3///LBUlcDU9ItxTG2Bh
         JNNA==
X-Gm-Message-State: ANoB5pkBaTwUs2SlueX9VHKEpe1uxn4A9lKIsXLjit8uQSSfA8X8E9pS
        A4Psu0itaCwkPS06b5oxYUuiyZ5yUk6mGFds9TkxvjD6nLpU/z7egGtQs8EyJbfFiJwiGu+8PuB
        hnYmowWw5dz8KvuK3gipd
X-Received: by 2002:a17:907:2e01:b0:7c1:4785:d650 with SMTP id ig1-20020a1709072e0100b007c14785d650mr15753709ejc.26.1671017331311;
        Wed, 14 Dec 2022 03:28:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf51zQh3SZbC7NTgw2aWPtw7FbZNJ77uN6cebDF0KH1vWAazOQTKapn1o/HoydATeVdIirBWLg==
X-Received: by 2002:a17:907:2e01:b0:7c1:4785:d650 with SMTP id ig1-20020a1709072e0100b007c14785d650mr15753699ejc.26.1671017331116;
        Wed, 14 Dec 2022 03:28:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id qx38-20020a170907b5a600b0078df3b4464fsm5815368ejc.19.2022.12.14.03.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:28:50 -0800 (PST)
Message-ID: <8cf30cb2-6dec-b21b-ba15-f21490546426@redhat.com>
Date:   Wed, 14 Dec 2022 12:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] i2c: designware: Fix unbalanced suspended flag
To:     Richard Fitzgerald <rf@opensource.cirrus.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221213144524.368297-1-rf@opensource.cirrus.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221213144524.368297-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Richard,

On 12/13/22 15:45, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
> 
> dw_i2c_plat_resume() must always be called, so that
> i2c_mark_adapter_resumed() is called. This is not compatible with
> DPM_FLAG_MAY_SKIP_RESUME.
> 
> The pairing of pm_runtime_force_suspend() and pm_runtime_force_resume()
> can replace this. If nothing is using the driver, and it is not currently
> suspended, it will be put into runtime-suspend and will be left in
> runtime-suspend during the system resume.
> 
> pm_runtime_force_suspend() is not compatible with DPM_FLAG_SMART_SUSPEND
> so this must also be removed. DPM_FLAG_SMART_SUSPEND will set the device
> back to pm_runtime_active() during resume_noirq if it cannot skip resume.
> This would lead to the inconsistent state where the driver runtime_suspend
> has been called (by force_suspend()) but it is marked active (by PM core).
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
> commit 80704a84a9f8 ("i2c: designware: Use the
> i2c_mark_adapter_suspended/resumed() helpers")
> 
> changed from using a local suspended flag to using the
> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
> checked by I2C core code before issuing the transfer to the bus driver, so
> there was no opportunity for the bus driver to runtime resume itself before
> the flag check.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")

Thank you. I like the new approach in this version.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 26 ++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ba043b547393..590503e56bd0 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -349,17 +349,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	adap->dev.of_node = pdev->dev.of_node;
>  	adap->nr = -1;
>  
> -	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
> -		dev_pm_set_driver_flags(&pdev->dev,
> -					DPM_FLAG_SMART_PREPARE |
> -					DPM_FLAG_MAY_SKIP_RESUME);
> -	} else {
> -		dev_pm_set_driver_flags(&pdev->dev,
> -					DPM_FLAG_SMART_PREPARE |
> -					DPM_FLAG_SMART_SUSPEND |
> -					DPM_FLAG_MAY_SKIP_RESUME);
> -	}
> -
> +	dev_pm_set_driver_flags(&pdev->dev, DPM_FLAG_SMART_PREPARE);
>  	device_enable_async_suspend(&pdev->dev);
>  
>  	/* The code below assumes runtime PM to be disabled. */
> @@ -453,10 +443,15 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
>  static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
>  
>  	i2c_mark_adapter_suspended(&i_dev->adapter);
>  
> -	return dw_i2c_plat_runtime_suspend(dev);
> +	return 0;
>  }
>  
>  static int dw_i2c_plat_runtime_resume(struct device *dev)
> @@ -474,8 +469,13 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
>  static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Resume if pm_runtime_force_suspend() suspended. */
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
>  
> -	dw_i2c_plat_runtime_resume(dev);
>  	i2c_mark_adapter_resumed(&i_dev->adapter);
>  
>  	return 0;

