Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB72635FBD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 14:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237951AbiKWNcn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 08:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238096AbiKWNbg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 08:31:36 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382C76F359;
        Wed, 23 Nov 2022 05:14:36 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f7so24786039edc.6;
        Wed, 23 Nov 2022 05:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
        b=JrgCjNHpmpS+UFD/hJxkEdxsDcmk00K9l1zgw4rjJ6QL5LFgR9cDjNY17XgiVyuKWT
         GVX3FjNvQF532OmACfplDQxa0ET6vUF3+AwWkzCoQgdvk8wm/vwi5bqEPhjgds3tvHVk
         qcn3+9bWbQ09f6O6mbQXTHtJZBCGwc8Lfjz7fIehiorZZ8oPg8dRKYCne/QKG+ZgQ3Z5
         zzGAl10ChcVHD+8+Mhy+mnFO2Ek6zUiOt22qnko9TArrSnnj1eidLr1A138vvA9aLTcz
         ZwMNfHN3QT6GpL5rAIMHY7Io5oO/gphYT8wcDC9vjb4hS9xYXmqoE4cy5//Ks0/sJomc
         X3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
        b=hTNUNN9prRDxYVem/12iuh5DtKfC5PRe+pzM1IrmUMOLxQc3FQ/yFXOPvGHBcvGji9
         Wzl22oWHAMP9an14CgNX2/ihv8DD2OqqgNEAYqJd+3JNTaoqi+Xtopqi1pTy498UAVvW
         cMC1niuea8DC+Vp1EuaBc2oBhoArwK86qNSq7CPerDBxPZ+Vl0mBWB/DPt4JE5K+EmGx
         1u8VH+yBg8xOyCyYN09YFJlaO1EtG7SWE3aNDDXR3Fxorqu5VhaIlfs9UxMnoMA/BnCF
         +EBlhakytqHlVOEQyRaANdboSi3nT5W0Flujf/+2evK7KMsI+xz8YPqSfZZ51erEW/g/
         b9yQ==
X-Gm-Message-State: ANoB5pnopyhkTq/4FvLPy0osu2m+4sy5RaC2DL4duSgtGf6o4Q0Cy4oF
        4twblCdXN3tBgDHzhtoAL7I=
X-Google-Smtp-Source: AA0mqf4EMwcpsdY1UQ9nMh8FYiw8FldQtuxFrB6UO57Z4G73kQazssLgzz4HdFhaHz+MfDNKhbLKUA==
X-Received: by 2002:a05:6402:181:b0:461:ea0c:e151 with SMTP id r1-20020a056402018100b00461ea0ce151mr11327924edv.376.1669209274614;
        Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id oz36-20020a1709077da400b00734bfab4d59sm958602ejc.170.2022.11.23.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Message-ID: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Date:   Wed, 23 Nov 2022 14:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.

[...]

> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
> index de539938896e..407eb55050a6 100644
> --- a/drivers/platform/surface/aggregator/bus.c
> +++ b/drivers/platform/surface/aggregator/bus.c
> @@ -35,9 +35,9 @@ static struct attribute *ssam_device_attrs[] = {
>   };
>   ATTRIBUTE_GROUPS(ssam_device);
>   
> -static int ssam_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int ssam_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>   {
> -	struct ssam_device *sdev = to_ssam_device(dev);
> +	const struct ssam_device *sdev = to_ssam_device(dev);
>   
>   	return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
>   			      sdev->uid.domain, sdev->uid.category,

[...]

> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -229,7 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>    * Return: Returns a pointer to the &struct ssam_device wrapping the given
>    * device @d.
>    */
> -static inline struct ssam_device *to_ssam_device(struct device *d)
> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>   {
>   	return container_of(d, struct ssam_device, dev);
>   }

I am slightly conflicted about this change as that now more or less
implicitly drops the const. So I'm wondering if it wouldn't be better to
either create a function specifically for const pointers or to just
open-code it in the instance above.

I guess we could also convert this to a macro. Then at least there
wouldn't be an explicit and potentially misleading const-conversion
indicated in the function signature.

Regards,
Max
