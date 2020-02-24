Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5FC16AA10
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgBXP2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:28:06 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38656 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbgBXP2G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 10:28:06 -0500
Received: by mail-pl1-f194.google.com with SMTP id t6so4192314plj.5
        for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2020 07:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dpyugZ6IL5WFUAGZUs87igmVON1CCIXV1LGvwXQTAOc=;
        b=M/f1DtR44sRg9nE0Q5C2wjZkOomIEMLfkz5gDOkbXRflsD1R6nd1/1lvmfh5jarXry
         dGoMPBS4F4zo0z2GU+Yzu4yx934UIRNMaEx3Bu5TTI3zRujySh4PfmSSdkTRo7Lo1JLu
         DLD+tMW2nLvPz6bG7qkOZNz2/22g7iqcQFFYA9v1J1QNHd9h2XDCupyBed5lTYyIwOE4
         kqK5XA0BKwISMgUnY15V1if2W+qG9IBDXKyUFeWCUAQi/v2EChNPkWbk0MhGdgs7tj2y
         Xoz4wwptdcnWVZncB4jkESf6hEDOGm/6HaxJAAOQlSF3ZPHvkaSLR1cmlhyTtDnRPG0b
         McZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dpyugZ6IL5WFUAGZUs87igmVON1CCIXV1LGvwXQTAOc=;
        b=PPqx5vnmFQ/V3v0BrelV1WmBprz8hC5YdJACFJUTKYMjQeAAVbMalfunMvDohr47V7
         pUMGkICrYfa9qW3xpqeVA9Czix7+GBpNc1WrlSwxiO2OIikzj6k4L+AM7bZoQATfdFtv
         OQE/tXzY/IZHgpFjjH/gHXTi7E4KGGUSfHUP0xY6bcidDuX0Kgko0kvYNHF+STQBd1WF
         kfnouzViYhDWYgfLqTT6wYU/2Yhi3Q9+GCQltxfSLee3mZPxJ1kYQu/pcb7xdZmnmHHe
         LvajEDu6m38HU+PuftiS9xABqDI+5CByOPtIgTAub0QZtoxGiE1F+ui8VBsxbvWDXfbq
         fQ4Q==
X-Gm-Message-State: APjAAAW/norWv6rabuP55LB+JUPwNK4fKuh8eKBylcWshCrMxN1RSVLy
        Tt0SS5BkvBX94jCoiNYXOS1a
X-Google-Smtp-Source: APXvYqyE4xnXAiMn8F75E3/hJa9b7CWWzTayr3+Vklzksn0BvF/I+t62X8uP54bcI3pzMi2UNHexVQ==
X-Received: by 2002:a17:902:a616:: with SMTP id u22mr50362560plq.173.1582558085424;
        Mon, 24 Feb 2020 07:28:05 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:38a:b73d:6c16:c0ee:ec5a:7ea9])
        by smtp.gmail.com with ESMTPSA id v8sm13060580pfn.172.2020.02.24.07.28.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 07:28:04 -0800 (PST)
Date:   Mon, 24 Feb 2020 20:57:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v1 24/40] i2c: owl: Use generic definitions for bus
 frequencies
Message-ID: <20200224152757.GC5656@Mani-XPS-13-9360>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-24-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224151530.31713-24-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 05:15:14PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/i2c/busses/i2c-owl.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index b6b5a495118b..f9baeeb1a711 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -87,9 +87,6 @@
>  
>  #define OWL_I2C_MAX_RETRIES	50
>  
> -#define OWL_I2C_DEF_SPEED_HZ	100000
> -#define OWL_I2C_MAX_SPEED_HZ	400000
> -
>  struct owl_i2c_dev {
>  	struct i2c_adapter	adap;
>  	struct i2c_msg		*msg;
> @@ -419,11 +416,11 @@ static int owl_i2c_probe(struct platform_device *pdev)
>  
>  	if (of_property_read_u32(dev->of_node, "clock-frequency",
>  				 &i2c_dev->bus_freq))
> -		i2c_dev->bus_freq = OWL_I2C_DEF_SPEED_HZ;
> +		i2c_dev->bus_freq = I2C_STANDARD_MODE_FREQ;
>  
>  	/* We support only frequencies of 100k and 400k for now */
> -	if (i2c_dev->bus_freq != OWL_I2C_DEF_SPEED_HZ &&
> -	    i2c_dev->bus_freq != OWL_I2C_MAX_SPEED_HZ) {
> +	if (i2c_dev->bus_freq != I2C_STANDARD_MODE_FREQ &&
> +	    i2c_dev->bus_freq != I2C_FAST_MODE_FREQ) {
>  		dev_err(dev, "invalid clock-frequency %d\n", i2c_dev->bus_freq);
>  		return -EINVAL;
>  	}
> -- 
> 2.25.0
> 
