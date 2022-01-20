Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D396494CD4
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbiATLZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39342 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbiATLZt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642677949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3JnRnkAUl6ydn4aYabatzx9NKCMlhuJGRaxEfTdkCPw=;
        b=BpsC1vz5p3eK5QkEd2JnqFeWMk8is9JNptf9Xu1q4IhDWmeikk4FUijbxTKfME42XzzCCs
        eiAmitzGeuAc6KQe6QLdik0QyJvscC09o9xNojXFBPGuiTcd60txcDoW+vXLnYfyIw0SYQ
        XZESjznKr34CoAFD/SqnjEdFr1nuBvQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-Az6NFneVM_iFJGyAvVdv0g-1; Thu, 20 Jan 2022 06:25:47 -0500
X-MC-Unique: Az6NFneVM_iFJGyAvVdv0g-1
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso5623859ede.12
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 03:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3JnRnkAUl6ydn4aYabatzx9NKCMlhuJGRaxEfTdkCPw=;
        b=OVbT7ylwg91wVZifES+fA3v9O5+yvMwKvoR2l2iMP8G6fqhzjjH3xYjDoahqfufcpf
         oweWV8Zb7bQPP+Is6svuDJWmDHlmr6LQVAZ3clMDforRz+DHUdNfLnw5sOAPILQDKAQg
         PYfrTkmt95UDAjNPcP2KUoaM++nZA7/DITnF6yY0K90rDQ0d/gC5XBKghqmZiqtFz0eC
         t0oiipsc2PChhZpOvJhhIZ1kPoPPB2WLoxqGwo5PNL154GpVbNDUamIPcdeq2AzkNKtB
         6UOsHyIDSVbFTIkA2Fzafe1Vam5YQaOvNrNMEGvpfXgWSeHTLUZ3j3r73ZxcRlFdvEyu
         KlPA==
X-Gm-Message-State: AOAM533WE4eSb+OKgLb7jgiuHHTka8d4uys+BUSiWSgs6QVllj+DrbWj
        aOYgmY2Ch/4GUHrU5T+UaE4YOgiKVWbFcb/AVTQAOIgmFk3AdCx6Ndvc5tSrEHK0z0N3A0B7LgI
        tKSMDRlTviokCj+0J/7/1
X-Received: by 2002:a17:907:9618:: with SMTP id gb24mr28623940ejc.385.1642677946696;
        Thu, 20 Jan 2022 03:25:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRXCxE2hLOmRh02HFHNmkPepiNeZYVlbYK0NAeBVGZTQMTodp6TTTM4xCYRWls3p+5LgfQZA==
X-Received: by 2002:a17:907:9618:: with SMTP id gb24mr28623919ejc.385.1642677946463;
        Thu, 20 Jan 2022 03:25:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id v4sm1184714ede.42.2022.01.20.03.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 03:25:45 -0800 (PST)
Message-ID: <5bec947e-272b-cfa0-b9b6-4d0d2626153f@redhat.com>
Date:   Thu, 20 Jan 2022 12:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] i2c: designware: Add missing locks
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-2-jsd@semihalf.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120001621.705352-2-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/20/22 01:16, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controller by kernel.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
>  drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index bf2a4920638a..9f8574320eb2 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -578,7 +578,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
>  	 * Try to detect the FIFO depth if not set by interface driver,
>  	 * the depth could be from 2 to 256 from HW spec.
>  	 */
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
> +	i2c_dw_release_lock(dev);
>  	if (ret)
>  		return ret;
>  
> @@ -607,6 +612,11 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
>  void i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
>  	u32 dummy;
> +	int ret;
> +
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return;
>  
>  	/* Disable controller */
>  	__i2c_dw_disable(dev);
> @@ -614,6 +624,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
>  	/* Disable all interrupts */
>  	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
>  	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
> +
> +	i2c_dw_release_lock(dev);
>  }
>  
>  void i2c_dw_disable_int(struct dw_i2c_dev *dev)
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 9177463c2cbb..1a4b23556db3 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -905,7 +905,13 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
>  	}
>  
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
>  	i2c_dw_disable_int(dev);
> +	i2c_dw_release_lock(dev);
> +
>  	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
>  			       dev_name(dev->dev), dev);
>  	if (ret) {
> 

