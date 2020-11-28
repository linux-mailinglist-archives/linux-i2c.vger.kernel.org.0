Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185CE2C727B
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389851AbgK1VuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733067AbgK1TFP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Nov 2020 14:05:15 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A92C09425B
        for <linux-i2c@vger.kernel.org>; Fri, 27 Nov 2020 23:19:45 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 34so6008309pgp.10
        for <linux-i2c@vger.kernel.org>; Fri, 27 Nov 2020 23:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l0rVIvtsW51c7Ccpavw8OYRMig1yB9jbJuctIw5klvQ=;
        b=a8MF0bjLIbRnZCU6cEhLaXXy/AdUPSVvanp4o0/1hi8wmw5J7mKuIF7siw8NwZvyxr
         xRYuu3GHvBbNgi3fuXWBtftW4qXdGaKsdmV4wH88qsJDf4HmtAQbYmFAOJRTUw4O8S3W
         t+OPQKZHl8h/2cJwuIefVv2dz8HtotHGPZsdAhqaLr3RBwhCskY/x87YpfQHR+vrnwiH
         +85jBGxnZO8viJQ5LcWLwvKY9ltqUJw/HSnTI6vhXk0jx/Ds+23gpA83hStzH2xHHslj
         130VE+5eYKmP+v51iwyVnj+wB1aqXWiwqRTK/UWdnuCGC69KAHZCpq/rIpeBdlPAsbkG
         WFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0rVIvtsW51c7Ccpavw8OYRMig1yB9jbJuctIw5klvQ=;
        b=fF2KVBznbM96fHyFIYMVsHXLKEqDYpLwuSvlAE0ke1fRlcZ1dqu3bw5EuRHq7T7C5E
         VXIPMwd5wWIFQWsFJJCvN85IKc7n30Tpb51ghCqgt9yIVndkYrVv4nMPPhyy3kuygKEK
         406ByVB+jwlG/Bwp9rL1IfgGxCFOnpI5CoOmUlQGO0+LakGSSsZVymVneOL2TFPBG7Ru
         XX+1Z+RW1jOUSn3mbtovwXKmGg+ycnwXWPu/3K9GyAKEFRuHRrGlt0vAd+oaf+l8Wec9
         kL5HJPCNIZWREm8MDresOWnDgyLqhbKQhM1VqMSzhix3MNCSD///AVaTL58YcW1DJfYI
         /btw==
X-Gm-Message-State: AOAM533qNW5cBHjmS+LDsJxuwqIPhYbsNVx5tbOw4OpwFPIvyAaV4wyd
        FJ9IWD3a55t9dkewRm/0TGOM
X-Google-Smtp-Source: ABdhPJxiSQxBSKdCIpK8nSHxvobIsO698gvNKn20ieEzGCwZ0w6ro0EVK2rwIIa4sxlnKCkO0kMGsA==
X-Received: by 2002:a63:5126:: with SMTP id f38mr9722126pgb.11.1606547985296;
        Fri, 27 Nov 2020 23:19:45 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id c22sm9383950pfo.211.2020.11.27.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 23:19:44 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:49:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 12/18] i2c: owl: Add compatible for the Actions Semi
 S500 I2C controller
Message-ID: <20201128071937.GO3077@thinkpad>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <7622fae80d12d7f423fc25190159af494c359200.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7622fae80d12d7f423fc25190159af494c359200.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 20, 2020 at 01:56:06AM +0200, Cristian Ciocaltea wrote:
> Add S500 variant to the list of devices supported by the Actions Semi
> Owl I2C driver.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Ah, I thought S500 support needs some change...

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/i2c/busses/i2c-owl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 5cf5a119a6ad..98882fe4e965 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -508,6 +508,7 @@ static int owl_i2c_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id owl_i2c_of_match[] = {
> +	{ .compatible = "actions,s500-i2c" },
>  	{ .compatible = "actions,s700-i2c" },
>  	{ .compatible = "actions,s900-i2c" },
>  	{ /* sentinel */ }
> -- 
> 2.29.2
> 
