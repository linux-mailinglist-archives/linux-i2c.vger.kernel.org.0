Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1403949E189
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 12:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240856AbiA0LsN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 06:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24839 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240863AbiA0LsK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 06:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643284089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=auNbphr0O+ZKEvruwSuBE0OHO47V2eSZrfO/lffC05E=;
        b=jHD6QNPzgHtjTWhZ9HN+fxFuSQPVWtbqacVTu+9rETt6BqvxmjwrwIqfNZ+qjrlAOesjbK
        xH/E6iC2DJqWbQNddvpw1I60qY7Euc1BE6dz1FMfDedaTKZwn+7NX2AuCidwBXbC1AQR4Q
        b9TEgI5LzMMyiForwjwVVgHlFavt2sU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-pRzgveVuPzinIxCied2PqQ-1; Thu, 27 Jan 2022 06:48:08 -0500
X-MC-Unique: pRzgveVuPzinIxCied2PqQ-1
Received: by mail-ed1-f70.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso1300697edb.5
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jan 2022 03:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=auNbphr0O+ZKEvruwSuBE0OHO47V2eSZrfO/lffC05E=;
        b=JPz/O96qRy0CvvkJSrDOcm4FsEbo3kqtfU+62QTK1aRMnIx94PNlyRLSMNvUNRhsru
         Gj0ZqMGAFKVSD4SKTRmKyVIy0CPHAUiAaUbnI47a73oQxwVhnW08IEJ3DHEND7hASmSW
         S0ClTzB0Af1+axvh+t0o+B6SC/D5DBsab3QAdgUOUhWQm/CTh7VkRcv3kaDR7KJFDM3P
         nhLeyOiwaHSHSh9F+bRqeEo6q2TVf1g+1FBglsDSVpQpOSVSyKfTX1+liIKJaRm8VZ55
         PP2FwFYxEafFiq8iqNYDXGv1TH+JCc845I+1afenvnU0G6OYGXN2+/9NmneWUzZTqUXl
         jZBQ==
X-Gm-Message-State: AOAM530DM0dwiMPX/Xf8vAAQxO968QJBCFO3EWzgNgrVuakpHJpYk9HK
        QgDFZoS2u3BlSaLoKQJ+pKPuXB9FlBFfedatcqoUCMV6RnXeEfhnZTK6eIucImTFpXS14jyencL
        ONZEoR8nbXMYPUzTw96b5
X-Received: by 2002:a17:907:3e9e:: with SMTP id hs30mr2562586ejc.763.1643284087279;
        Thu, 27 Jan 2022 03:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcEud1ZLU/PI2jZMnSrnzhoVD8CFiasTZqWCZy6IcKL/FlIahL6m2vDnUDCAwN3QlUsJj6SQ==
X-Received: by 2002:a17:907:3e9e:: with SMTP id hs30mr2562575ejc.763.1643284087023;
        Thu, 27 Jan 2022 03:48:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a14sm11157077edx.96.2022.01.27.03.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:48:06 -0800 (PST)
Message-ID: <c7531d52-62ba-cc4c-a8ea-2fd126e3b0b3@redhat.com>
Date:   Thu, 27 Jan 2022 12:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/7] i2c: cht-wc: Use generic_handle_irq_safe().
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
 <20220127113303.3012207-4-bigeasy@linutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127113303.3012207-4-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/27/22 12:32, Sebastian Andrzej Siewior wrote:
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/i2c/busses/i2c-cht-wc.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 1cf68f85b2e11..8ccf0c928bb44 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -99,15 +99,8 @@ static irqreturn_t cht_wc_i2c_adap_thread_handler(int id, void *data)
>  	 * interrupt handler as well, so running the client irq handler from
>  	 * this thread will cause things to lock up.
>  	 */
> -	if (reg & CHT_WC_EXTCHGRIRQ_CLIENT_IRQ) {
> -		/*
> -		 * generic_handle_irq expects local IRQs to be disabled
> -		 * as normally it is called from interrupt context.
> -		 */
> -		local_irq_disable();
> -		generic_handle_irq(adap->client_irq);
> -		local_irq_enable();
> -	}
> +	if (reg & CHT_WC_EXTCHGRIRQ_CLIENT_IRQ)
> +		generic_handle_irq_safe(adap->client_irq);
>  
>  	return IRQ_HANDLED;
>  }
> 

