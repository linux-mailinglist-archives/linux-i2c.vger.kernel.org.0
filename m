Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161803695CD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 17:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242946AbhDWPN2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 11:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242917AbhDWPN1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 11:13:27 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2F4C06174A
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 08:12:51 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id k25so49493139oic.4
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ObtCFyu1lxrPCFSgoh4NgfCuSYVXboqEwODlVJ1EKvI=;
        b=DaGiJ/QYUDjhqCMpf3AGbghtfWxCFA62bxDROcqSkUHOAZwGWSLMsALpnd/x6wP0z+
         DZpGEan86jPhPdfNikC5zz3TQ2VEFkCZDch9NaxaUXuRX31Wt6DQf3HPqsSL9WG2lkUh
         dkxsFtLiOCRhwG7OPIrxQowcXHoEyAE4BeIadEYqe4CuKd88Ben4bQ9aWwDln6X6KEVN
         u0McF18b47lFDh8bpnZc4bcy2Rd8Zsp/6KfNPqBlDy+bLqTnhiwaCK4ede5HllTREAjx
         wf9eYHiYNrn85IM+yl8tCmd3n7vgJ/cscLzVfmXhyFBf235qPJOlnBvX7SDtDq4jH52R
         kdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ObtCFyu1lxrPCFSgoh4NgfCuSYVXboqEwODlVJ1EKvI=;
        b=WMykEzD6tzNjAfOyoHJ+6wNoccXwSWq/JNrivM06eej6rOL/PNVdxJDKcTQjm0mjdV
         tZ7MIQhbQCEqMZLtSrOjL6OqNERTGRX7Zo+sbRylgUYnW8yiTX2LPMN61F9KKJ5Ff8F+
         S1mu1af9x81s9tt6nZfnKeB/Aht3G5eYGczo5FIZ06doK5KOb9ZeGIkL4Ce2v18XjIRJ
         c4wB7Ayypuvm/5RmrpocivbVAPY6fpwUt1no+QQD2+1axfsz1v0X1GnIo5YEbhbYm6+7
         r1bOSsRr/Z8IxZcFA9Gqt5YuxB4d6mRyqgxM9PIzmC0dVb4w7Gb2z6BXJ/xlaUeV7dxy
         rOLQ==
X-Gm-Message-State: AOAM533cReT4wDN7842J60sLm+5aGKp2F5pxz4j4yF59uKB4cJtpxEUO
        KqO78uxfFz7BDyLyr+Ax1H79qw==
X-Google-Smtp-Source: ABdhPJzXAb/hpVXGVKnRkSPipF2bDQHNGTN4HtZ+Whgs/tUaVIWd8s3Cbs+BY52N8zwzBcQCdpa2vw==
X-Received: by 2002:aca:49d2:: with SMTP id w201mr4532456oia.154.1619190770043;
        Fri, 23 Apr 2021 08:12:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k24sm1300408oic.51.2021.04.23.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 08:12:49 -0700 (PDT)
Date:   Fri, 23 Apr 2021 10:12:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 21/27] i2c: i2c-core-of: Fix corner case of finding
 adapter by node
Message-ID: <YILj76yJsntm9Ma1@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.21.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.21.Ib7e3a4af2f3e2cb3bd8e4adbac3bcfc966f27791@changeid>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> The of_find_i2c_adapter_by_node() could end up failing to find an
> adapter in certain conditions. Specifically it's possible that
> of_dev_or_parent_node_match() could end up finding an I2C client in
> the list and cause bus_find_device() to stop early even though an I2C
> adapter was present later in the list.
> 
> Let's move the i2c_verify_adapter() into the predicate function to
> prevent this. Now we'll properly skip over the I2C client and be able
> to find the I2C adapter.
> 
> This issue has always been a potential problem if a single device tree
> node could represent both an I2C client and an adapter. I believe this
> is a sane thing to do if, for instance, an I2C-connected DP bridge
> chip is present. The bridge chip is an I2C client but it can also
> provide an I2C adapter (DDC tunneled over AUX channel). We don't want
> to have to create a sub-node just so a panel can link to it with the
> "ddc-i2c-bus" property.
> 
> I believe that this problem got worse, however, with commit
> e814e688413a ("i2c: of: Try to find an I2C adapter matching the
> parent"). Starting at that commit it would be even easier to
> accidentally miss finding the adapter.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is sorta just jammed into the middle of my series. It has
> no dependencies on the earlier patches in the series and I think it
> can land independently in the i2c tree. Later patches in the series
> won't work right without this one, but they won't crash. If we can't
> find the i2c bus we'll just fall back to the hardcoded panel modes
> which, at least today, all panels have.
> 

@Wolfram, I know it's late, but perhaps you could consider picking this
up for 5.13? It has no dependencies on the other patches in the series
and would simplify merging the rest in the next cycle.

Regards,
Bjorn

> I'll also note that part of me wonders if we should actually fix this
> further to run two passes through everything: first look to see if we
> find an exact match and only look at the parent pointer if there is no
> match. I don't currently have a need for that and it's a slightly
> bigger change, but it seems conceivable that it could affect someone?
> 
> (no changes since v1)
> 
>  drivers/i2c/i2c-core-of.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 3ed74aa4b44b..de0bf5fce3a2 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -124,6 +124,14 @@ static int of_dev_or_parent_node_match(struct device *dev, const void *data)
>  	return 0;
>  }
>  
> +static int of_i2c_adapter_match(struct device *dev, const void *data)
> +{
> +	if (!of_dev_or_parent_node_match(dev, data))
> +		return 0;
> +
> +	return !!i2c_verify_adapter(dev);
> +}
> +
>  /* must call put_device() when done with returned i2c_client device */
>  struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
>  {
> @@ -146,18 +154,13 @@ EXPORT_SYMBOL(of_find_i2c_device_by_node);
>  struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
>  {
>  	struct device *dev;
> -	struct i2c_adapter *adapter;
>  
>  	dev = bus_find_device(&i2c_bus_type, NULL, node,
> -			      of_dev_or_parent_node_match);
> +			      of_i2c_adapter_match);
>  	if (!dev)
>  		return NULL;
>  
> -	adapter = i2c_verify_adapter(dev);
> -	if (!adapter)
> -		put_device(dev);
> -
> -	return adapter;
> +	return to_i2c_adapter(dev);
>  }
>  EXPORT_SYMBOL(of_find_i2c_adapter_by_node);
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
