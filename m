Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83B8650AC6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 12:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiLSLgM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 06:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiLSLgL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 06:36:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8462A8
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 03:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671449721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/PTY5ap1jIE3gvJxbvgJcqBaMT685uN+MISB0lKtLQ8=;
        b=VUrWc+h1072c7YbWFPD4smI/eTyvDruRgwqdU4dibUy1lPgym6OLtLE5A08ZU4vOk8PX0b
        +HxccoeQF3K2UOBbFAdb4PR6owlzjqzW6dvXdXmD4Sgh5/uWnEMW8ETijX6v1ROsCUF3Xs
        Sxb0mIf7hrprgOI0yC9DMET6Cq0rj1U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-61KfFB2cPQCDJnsk6bTlGw-1; Mon, 19 Dec 2022 06:35:19 -0500
X-MC-Unique: 61KfFB2cPQCDJnsk6bTlGw-1
Received: by mail-ej1-f72.google.com with SMTP id sg39-20020a170907a42700b007c19b10a747so5968989ejc.11
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 03:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PTY5ap1jIE3gvJxbvgJcqBaMT685uN+MISB0lKtLQ8=;
        b=XOJfFpX/6jcpXl8+F5JLwRar6Tf/lb0sx94d3AEks+Gv2OGzQf6l7vPbRh9DXMQMd9
         TtcFAAH6kqeb+GIDl9dG40auC3OEKbiXj3PeMCyIYbbYyHs1XQO7KxPMp1aLpqZZ6Ay2
         ZLc3rMUC1PlxWp5DXQBNKvStpO1h+oGN9whd5kLX1GS+Pz83STSesm/sNbwE2sHRsm0R
         bQvgJEarQ50dM5FjFuZ6LppbAiHfg/75VpBB+KRtBSZnWQqoM2nrCR635Y9BuXbAjnxZ
         Ust79zM6QrOYUYD4u2Ou+j0K05nO9SZVw6+IOdT5homkOhjAxuatxgaGeuvTDoO8QsXl
         n81w==
X-Gm-Message-State: ANoB5pl/ZyHme4oDxswU7+DLJlQF6goKkVRm1TJmxLonK5qlEIxSA7ZZ
        POsWVZ4baeuQ9MwijQVJK6BCG/mWynskGWlDWF+y4iDCPbvkNeDNeeEKMihSIfUDVjUaHDC+shY
        tHnqip7lRE0IIYfUgW76y
X-Received: by 2002:a17:907:11c8:b0:7c0:beee:2f06 with SMTP id va8-20020a17090711c800b007c0beee2f06mr33252789ejb.52.1671449718194;
        Mon, 19 Dec 2022 03:35:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6UrtfVi46Vgo8hEJYXLZ3rQPBNC7zQlw75rudldjlafEzJeNYwGGIkfH5NpPHe4WU6gpB7Vg==
X-Received: by 2002:a17:907:11c8:b0:7c0:beee:2f06 with SMTP id va8-20020a17090711c800b007c0beee2f06mr33252780ejb.52.1671449717970;
        Mon, 19 Dec 2022 03:35:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906311400b0073d81b0882asm4288633ejx.7.2022.12.19.03.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 03:35:17 -0800 (PST)
Message-ID: <491f2a01-c2ae-8508-effb-dfd89bfe22a1@redhat.com>
Date:   Mon, 19 Dec 2022 12:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US, nl
To:     Richard Fitzgerald <rf@opensource.cirrus.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221219112019.882092-1-rf@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221219112019.882092-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/19/22 12:20, Richard Fitzgerald wrote:
> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
> i2c_mark_adapter_resumed().
> 
> dw_i2c_plat_resume() must always be called, so that
> i2c_mark_adapter_resumed() is called. This is not compatible with
> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
> 
> Since the controller is always resumed on system resume the
> dw_i2c_plat_complete() callback is redundant and has been removed.
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ba043b547393..74182db03a88 100644
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
> @@ -419,21 +417,8 @@ static int dw_i2c_plat_prepare(struct device *dev)
>  	 */
>  	return !has_acpi_companion(dev);
>  }
> -
> -static void dw_i2c_plat_complete(struct device *dev)
> -{
> -	/*
> -	 * The device can only be in runtime suspend at this point if it has not
> -	 * been resumed throughout the ending system suspend/resume cycle, so if
> -	 * the platform firmware might mess up with it, request the runtime PM
> -	 * framework to resume it.
> -	 */
> -	if (pm_runtime_suspended(dev) && pm_resume_via_firmware())
> -		pm_request_resume(dev);
> -}
>  #else
>  #define dw_i2c_plat_prepare	NULL
> -#define dw_i2c_plat_complete	NULL
>  #endif
>  
>  #ifdef CONFIG_PM
> @@ -483,7 +468,6 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  
>  static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
>  	.prepare = dw_i2c_plat_prepare,
> -	.complete = dw_i2c_plat_complete,
>  	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
>  	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>  };

