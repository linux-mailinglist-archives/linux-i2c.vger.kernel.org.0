Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5802938CDD2
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 21:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhEUTB2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 15:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhEUTB1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 15:01:27 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AD2C061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 12:00:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so7676633wmf.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0imTAsK8ZQyc4jJmJUU8Rqec7Q3ZLN3kP6ZVfLLu974=;
        b=ekbv5DtMQcDIXg+qTguBPRFuYev8HhANXmqrPVgVeKTHSir2/T/Ekqxz2pLp5JPKDh
         4DGBxqFvk5i6/jiT9EHc9NgXzdW/6xs/NtakXT0dDtdJ37tDt91x6mtHPnb8bwgvUDsz
         VvhTusSw8pqdDPfOpfhSKoPNAtmimfHUiJdi3Y9va8FYh2L4DN4dNmlo6W/Y3140cuSF
         +H/nkG1Yc2lt9ALvNt0dsCslumEvfT0u0MHm+guVp8Vhhp14/Mn3rdyQjV6Vzp4M5D4z
         hC6YJAU8CnsnTmmDYr1LcYMQeL1QTvXwDUucE5JhGyTL4Or6ZtaiomAOrNUX/fOmw+4i
         d3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0imTAsK8ZQyc4jJmJUU8Rqec7Q3ZLN3kP6ZVfLLu974=;
        b=guWnKcJYa63VBmhu+9I1JvSKNGCYgKQIQNr6HAT0NoJfbYGNylWJ3E5vODx+g9hYOL
         d/+Lxag738T+9QAj+R0rM72SPSSxUVlc0OLXHxiZprpaNKsq4JOiJCGw7tsXplH8D4QG
         NZoeB1wVi5wBy7F53oHTadlPdFjjQrUdDJlpp7HGP9mkj/h1B22RD1F6GlvC9MeAp15I
         eOMWod5zEkvfA9bhb+VNVCB3W8SYSVNn54P6ScRD9fC9JmNdAls47UFhsDWPTi2XY1M1
         Sv6BQDLWQlBUacV6avV5+rs0L8AuJ98zBdbVp9EZiKOs5Xf1oEn248QO3wCogG8hCoyi
         8YQQ==
X-Gm-Message-State: AOAM532EXOWrCm56ibteF7MmI3OYvlzX7Td8T5s1R6jtjF0nSYTGW56D
        zTWzEm4rBKvj7O/IawISKXd7piXstr4=
X-Google-Smtp-Source: ABdhPJyh7rt2lR5ukvrsMczTJPkDFnIGthjOQqe4987zZGZlIopeSOqWWrGzUWumbbxq4zo+QfcVEw==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr10014655wml.188.1621623602029;
        Fri, 21 May 2021 12:00:02 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:3901:4092:a56:60d4? (p200300ea8f384600390140920a5660d4.dip0.t-ipconnect.de. [2003:ea:8f38:4600:3901:4092:a56:60d4])
        by smtp.googlemail.com with ESMTPSA id m9sm3007282wrq.78.2021.05.21.12.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 12:00:01 -0700 (PDT)
Subject: Re: [PATCH] i2c: i801: Use pm_runtime_forbid to prevent suspending
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f42094aa-fc5b-ab1f-26fc-7f6bf2d11a35@gmail.com>
Message-ID: <196f4945-32f9-b8ba-3ea9-ffef4b38a082@gmail.com>
Date:   Fri, 21 May 2021 20:59:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <f42094aa-fc5b-ab1f-26fc-7f6bf2d11a35@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20.05.2021 13:14, Heiner Kallweit wrote:
> Using pm_runtime_get_sync() here is not the best approach.
> pm_runtime_forbid() is better suited and it doesn't require
> cleanup activities in the remove callback.
> 
Please disregard this patch. The user may re-enable runtime pm
via sysfs and that's not what we want.


> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 6b17afb7b..4e8dc2b0d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1664,7 +1664,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  		 * BIOS is accessing the host controller so prevent it from
>  		 * suspending automatically from now on.
>  		 */
> -		pm_runtime_get_sync(&pdev->dev);
> +		pm_runtime_forbid(&pdev->dev);
>  	}
>  
>  	if ((function & ACPI_IO_MASK) == ACPI_READ)
> @@ -1704,11 +1704,6 @@ static void i801_acpi_remove(struct i801_priv *priv)
>  
>  	acpi_remove_address_space_handler(adev->handle,
>  		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
> -
> -	mutex_lock(&priv->acpi_lock);
> -	if (priv->acpi_reserved)
> -		pm_runtime_put(&priv->pci_dev->dev);
> -	mutex_unlock(&priv->acpi_lock);
>  }
>  #else
>  static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }
> 

