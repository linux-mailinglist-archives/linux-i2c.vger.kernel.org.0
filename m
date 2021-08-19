Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A323F121C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 05:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhHSDue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Aug 2021 23:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbhHSDue (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Aug 2021 23:50:34 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6054C0613CF
        for <linux-i2c@vger.kernel.org>; Wed, 18 Aug 2021 20:49:58 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mq3so4018573pjb.5
        for <linux-i2c@vger.kernel.org>; Wed, 18 Aug 2021 20:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aurVUmLs+p4Znti5XIA6A55s5ceMtli0jCbz2S39Zbg=;
        b=nZK7041w0ZL90M9pCULpJXAOJYxCud8d5A7969Q5IIil+0vh4AOQP8RgZJ41aOLw/p
         NRDpTkSuGMIfZsv8BNk6ILmWhkKUxHbQvsde5dUXjuWE4PwhPycL+eWiqt/+Vz8VXsPN
         cr2EFQ3jCwIMLgSeHs7l93dYH/JVw1aFDC3amn7DdOu/GCPaY67mw+N7L3efXrniIKTQ
         9MjsSOaesnXyXI/swCKL6o5KAznYtVlkSTPpvllNzVBtVWZdT1JDARjd/CKZWkcq73Yw
         572zF5vgvJrGgRNzCN2bu1r3gD2FEe5/oNjTlR4lVKyBQlD48A+4dd4G7Hz6+KMnvX8N
         QgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aurVUmLs+p4Znti5XIA6A55s5ceMtli0jCbz2S39Zbg=;
        b=YOJ31jnKA2WJ0ZIEVEiLp07++AFgObkCWlp9Ra3hB7/QY0crOsZgnnkw8hTtFS9wLP
         6bwC7gFpzXLDn4Wtj/ojiXL0XI4ymd+FSvfcWW1Psavo79BYKeuXws2LKbl/vJfO0rOf
         SYQS55kJBPtPP6H76tfzZBrUPcZvbu/jWs/R3LSF00L1cC437MDWEUMtWzREfNl+324Y
         j1EFmlt8VudelNZapYmz8gEY1lX+EejQGSxWLoiuMKP3nNJyIWtRyh9VfOF5ZGiXE1PP
         3cZL1njldfj4HRDyxx9/m0kvopogfOf/H3+tNQXQ3gMQjQi4j2SXAgsAPJRpaz16H9AY
         fVmQ==
X-Gm-Message-State: AOAM533XabuvWdkZ7Q2eImCJHp+pSS1opIGlq/l2yQDPCSmeXb++DoBY
        6Q8KzYVXPo+OC/A/mwLbMh4SSQ==
X-Google-Smtp-Source: ABdhPJx8SzcYq0vkhmOzl9Df2qv4O2agtmOynlOTH1sKsC3YNHjw/GsNbcaYyO9zYgnDVTJ7AiLPQA==
X-Received: by 2002:a17:902:ea02:b0:12f:65d7:47eb with SMTP id s2-20020a170902ea0200b0012f65d747ebmr4229503plg.3.1629344998215;
        Wed, 18 Aug 2021 20:49:58 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id y5sm1341336pfa.5.2021.08.18.20.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:49:57 -0700 (PDT)
Date:   Thu, 19 Aug 2021 09:19:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org, sfr@canb.auug.org.au,
        conghui.chen@intel.com
Subject: Re: [PATCH] i2c: virtio: Fix the compiler warning when CONFIG_ACPI
 is not set
Message-ID: <20210819034952.vunr5v5xqcu4m4zg@vireshk-i7>
References: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-08-21, 08:48, Jie Deng wrote:
> Fix the compiler warning "drivers/i2c/busses/i2c-virtio.c:208:17:
> warning: unused variable 'pdev' [-Wunused-variable]" when CONFIG_ACPI
> is not set.
> 
> Fixes: 8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> ---
>  drivers/i2c/busses/i2c-virtio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index d3e60d9..964c601 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -205,7 +205,6 @@ static const struct i2c_adapter_quirks virtio_i2c_quirks = {
>  
>  static int virtio_i2c_probe(struct virtio_device *vdev)
>  {
> -	struct device *pdev = vdev->dev.parent;
>  	struct virtio_i2c *vi;
>  	int ret;
>  
> @@ -234,7 +233,7 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
>  	 * Setup ACPI node for controlled devices which will be probed through
>  	 * ACPI.
>  	 */
> -	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(vdev->dev.parent));
>  
>  	ret = i2c_add_adapter(&vi->adap);
>  	if (ret)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
