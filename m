Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8BC100EAD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 23:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfKRWQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 17:16:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41453 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRWQN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 17:16:13 -0500
Received: by mail-oi1-f193.google.com with SMTP id e9so16918158oif.8;
        Mon, 18 Nov 2019 14:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KnuBbVAKHbMtMVfXJXYBniSdagQcrSD0bPdsm4tuqh4=;
        b=oks8fAFXQNnFpT6MSooCFkQyFl4UhfCyGRCtFF5DH1K2gd0NtSF7tMj+hjT22kV/Qd
         KJyudEAJBWeyKhpuj8jYtMsVkGpJl4/hzQw8IGz7R5DXxuJ3hRGz5MoKum8nCr2DxRct
         blV4Ne+WhPd0yyR+NzZ74t2LtIdhKzhepObkHT26Q8g1aCbrSj/Rll8FjmamzR7OL04f
         xIiNb12K5rXd01j2O96FmkMC6HCI/d+NQBKpHSaSTORumJLkrKm0ukUgCJvQL6oxmoy7
         YCyJftGS/uablvDSMSAhw29Sjjhow1Tbnlv7CG53sWpYoX200DZpVPy1+d1Lxsj4hmja
         XorA==
X-Gm-Message-State: APjAAAVfpbDXviKw9m3RVPLDavnxDFRHVHXKT+ef/CrriCTL6A0T4v3M
        +eWmwSj2oBaB9/lB460ibY+gPUg=
X-Google-Smtp-Source: APXvYqygUVenonCmA1oSV8uGqeMySnY2XKrtqxrf+Ry4Vh5n+7pXFTIjziFLnBjOpiLj4dEV/sPg9A==
X-Received: by 2002:aca:52c2:: with SMTP id g185mr1121042oib.45.1574115372467;
        Mon, 18 Nov 2019 14:16:12 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h9sm6643971otn.14.2019.11.18.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 14:16:11 -0800 (PST)
Date:   Mon, 18 Nov 2019 16:16:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, peda@axentia.se,
        devicetree@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Message-ID: <20191118221611.GA30841@bogus>
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 14, 2019 at 01:47:02PM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Typo in the subject.

Run get_maintainers.pl and Cc the right people.

> In case of multimaster configuration the last channel cached value is
> not reliable. Basically the first processor/master does a write to the
> mux and then to the intended slave, it caches the value.
> Now the second processor/processor does a write to mux on another
> channel and writes to another slave.
> The first processor/master when it attempts to write the slave
> skips the mux as it relies on the mux channel being the same as the
> intended. This causes an issue.
> 
> To fix that write always to the mux address.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
>  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> index 30ac6a6..fc4c0b0 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> @@ -34,6 +34,7 @@ Optional Properties:
>      - first cell is the pin number
>      - second cell is used to specify flags.
>      See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +  - no-channel-cache: Write the mux channel always.
>  
>  Example:
>  
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 923aa3a..37d32b0 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -85,6 +85,7 @@ struct pca954x {
>  	const struct chip_desc *chip;
>  
>  	u8 last_chan;		/* last register value */
> +	u8 last_chan_unchached;	/* write channel register always */
>  	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
>  	s8 idle_state;
>  
> @@ -244,7 +245,7 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  		regval = 1 << chan;
>  
>  	/* Only select the channel if its different from the last channel */
> -	if (data->last_chan != regval) {
> +	if (last_chan_unchached && data->last_chan != regval) {
>  		ret = pca954x_reg_write(muxc->parent, client, regval);
>  		data->last_chan = ret < 0 ? 0 : regval;
>  	}
> @@ -479,6 +480,9 @@ static int pca954x_probe(struct i2c_client *client,
>  	if (idle_disconnect_dt)
>  		data->idle_state = MUX_IDLE_DISCONNECT;
>  
> +	data->last_chan_unchached = np &&
> +		of_property_read_bool(np, "no-channel-cache");
> +
>  	ret = pca954x_irq_setup(muxc);
>  	if (ret)
>  		goto fail_cleanup;
> -- 
> 2.1.1
> 
