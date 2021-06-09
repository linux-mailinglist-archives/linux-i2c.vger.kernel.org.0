Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61AC3A1BD6
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jun 2021 19:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFIRfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Jun 2021 13:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50712 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhFIRfH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Jun 2021 13:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623259991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z5PeafNk3PET9iL6P0K5jSNG1YbfyZtfZ3N7TbBn370=;
        b=OImRQG6hbpP6gTgK+So8tGEEV89TKonitXeGzVJQPG5Rq1pHoRBMhRgbdV+GoVoC704C8r
        QSKMroiAU78LqBc/EUK8wGb1+RLf2ilWI4EpBxC5M3j65aMfWlRdOZ2Jk9XlAzOqxJl3mx
        1XmconQPtgV7GYNxsKf2/QS3WXAdUN8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-sEVYpGhyNjSiuvwQkiZhhA-1; Wed, 09 Jun 2021 13:33:10 -0400
X-MC-Unique: sEVYpGhyNjSiuvwQkiZhhA-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso12783989edd.12
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jun 2021 10:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z5PeafNk3PET9iL6P0K5jSNG1YbfyZtfZ3N7TbBn370=;
        b=ZxizrnoPhSE6IsB19xBxkUS+XwFIA8WW1vinT8q6cCitFmVFAxrJcda0PBsRTDMZuK
         y19OCmXXGI9FRCLnIOq+giIjjxpCtYTvaSB1Lki1KK7EaiFQUN/ZKs3+4eTAGQrjVIXO
         zrnhzQ635V48/gLRXFWS8Wt7TAQjEE08Jo3ZN0xiuz6xaNui2iv6LzK5ZSxjIx2VXCOJ
         pb1MTOPh+9FEBd3deOtAre9bk5szXNj+5Z5/aWlAHRiKEgNyhb9c0FjaBZicmY66H9ke
         88JbnCIno210bMDLbYEPMnSs5kT8rkzW9vac3xKWtxvT/zI9hajpWhrz5zoemATtH6BE
         YA9Q==
X-Gm-Message-State: AOAM531C8tOAnAhoBKHGARZKtEY8tyS0mYfFB8BnBflyDRdyUfBX8/8L
        l2UnSStXCxJtAZHNZmY2NTL2v/ZDjv4HjbCQtiyqrdWc5ncj/N7NZG744UBwsTauWfE9gN8g+uH
        DsD4IbSyP6g9PaucjFRXT
X-Received: by 2002:a17:906:2dcb:: with SMTP id h11mr954405eji.52.1623259989322;
        Wed, 09 Jun 2021 10:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4nbim+Zr6BK+zgNZSMI68VdIfv/jfWQlUElfYxtyDWRUb5a2I4XkK7fPwA76egn6tK0cHLQ==
X-Received: by 2002:a17:906:2dcb:: with SMTP id h11mr954397eji.52.1623259989163;
        Wed, 09 Jun 2021 10:33:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i5sm178077edt.11.2021.06.09.10.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 10:33:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] i2c: cht-wc: Replace of_node by NULL
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org
References: <20210609173035.83777-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <12ff5e74-a38d-a1f4-3a9d-6ac9379b2924@redhat.com>
Date:   Wed, 9 Jun 2021 19:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609173035.83777-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 6/9/21 7:30 PM, Andy Shevchenko wrote:
> The driver is run on the platforms where OF node is always NULL.
> The confusion comes from IRQ domain APIs that take either OF or
> firmware node as input parameter. Since fwnode is not used here
> either, replace of_node by NULL.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rewrote in order to pass NULL instead of of_node (Hans)
>  drivers/i2c/busses/i2c-cht-wc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 08f491ea21ac..1cf68f85b2e1 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -354,8 +354,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Alloc and register client IRQ */
> -	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
> -						 &irq_domain_simple_ops, NULL);
> +	adap->irq_domain = irq_domain_add_linear(NULL, 1, &irq_domain_simple_ops, NULL);
>  	if (!adap->irq_domain)
>  		return -ENOMEM;
>  
> 

