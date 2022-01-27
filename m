Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF3F49E184
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 12:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbiA0LsG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 06:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240203AbiA0LsG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 06:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643284085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
        b=i7jHfFD6GHIUq+GaqQH75gIOYuVAhNEoGoxpf4XsVhrkQuNpyQe9a3P55Q9djwgZjCYJIU
        bv2VhUniS2H/Yx2v3W+EeGjrZbs5/r6pguZyWk+7spWldVDBhjmubI0RvNCdz7bM6gb1IP
        WfhPjqd6oesvHid94oGYAVlfVboYxzs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-gyzWqD8CMWONTNXtiT5_sA-1; Thu, 27 Jan 2022 06:48:03 -0500
X-MC-Unique: gyzWqD8CMWONTNXtiT5_sA-1
Received: by mail-ed1-f72.google.com with SMTP id f21-20020a50d555000000b00407a8d03b5fso1285532edj.9
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jan 2022 03:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
        b=XLUJSsj9ZLugeL4Puv5G5Zk6eLF5SJstXx+KmQ2G1tmCZs+jYm7X6xgUyjIpOKtTcp
         PRvaKx0ZkiHk4wiKhpkS8nqhoaxQwshdiz74CN+ubUZxfhN1lSUbsvaslHGLfVPVP92t
         o0XIfmxMSSdZOK0pa3IJ6He7d4HUsV/xRfpr90Q43JQZOOrqp3xdYraYbGsRwSi0LVRl
         zQytVvPwTfmQdDsMSCz1hUOs8IKIIxpkljXiiqmYLjaNLqXdIR1DBYKoFMNsZVN9Y1DE
         qNgCcrXDs8femqidj0oWO6+JvPc4/GxorA26cU+ZfMoYWdb77P9EI0fS4Dz3Htsr1iJ7
         SW3A==
X-Gm-Message-State: AOAM532TJdDRcnfqQoQuQ0/+bK0m0OwSouGg7mgg7ir4Y3d7b2Evb1G4
        +Dvt6LccrzIFM3VIUuOw8Lsf6ANhgcTn+0U1SYLin219xoIVef5pJZx9e7cEhiUaxKgxDRtgVeK
        xqBuEgvWuRjHXUPIKHbPj
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705644ejc.199.1643284082707;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxALJ4orODysCyzf5OM83HGtMr7Bi36PqNUiGN5jpHNx9oPF+XO/JirOr44geRnmCZ4NtbP3g==
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705630ejc.199.1643284082537;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id cf13sm8735609ejb.141.2022.01.27.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Message-ID: <bd44bba7-de30-bb65-a328-1bc3c44b53eb@redhat.com>
Date:   Thu, 27 Jan 2022 12:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
Content-Language: en-US
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/27/22 12:32, Sebastian Andrzej Siewior wrote:
> Provide generic_handle_irq_safe() which can be used can used from any
> context.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  include/linux/irqdesc.h |  1 +
>  kernel/irq/irqdesc.c    | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
> index 93d270ca0c567..a77584593f7d1 100644
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -160,6 +160,7 @@ static inline void generic_handle_irq_desc(struct irq_desc *desc)
>  
>  int handle_irq_desc(struct irq_desc *desc);
>  int generic_handle_irq(unsigned int irq);
> +int generic_handle_irq_safe(unsigned int irq);
>  
>  #ifdef CONFIG_IRQ_DOMAIN
>  /*
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 2267e6527db3c..97223df2f460e 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -662,6 +662,27 @@ int generic_handle_irq(unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(generic_handle_irq);
>  
> +/**
> + * generic_handle_irq_safe - Invoke the handler for a particular irq
> + * @irq:	The irq number to handle
> + *
> + * Returns:	0 on success, or -EINVAL if conversion has failed
> + *
> + * This function must be called either from an IRQ context with irq regs
> + * initialized or with care from any context.
> + */
> +int generic_handle_irq_safe(unsigned int irq)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	local_irq_save(flags);
> +	ret = handle_irq_desc(irq_to_desc(irq));
> +	local_irq_restore(flags);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(generic_handle_irq_safe);
> +
>  #ifdef CONFIG_IRQ_DOMAIN
>  /**
>   * generic_handle_domain_irq - Invoke the handler for a HW irq belonging
> 

