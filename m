Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E587A2237
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Sep 2023 17:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbjIOPWM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Sep 2023 11:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjIOPVt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Sep 2023 11:21:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AD4E78;
        Fri, 15 Sep 2023 08:21:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502e6d632b6so3290052e87.0;
        Fri, 15 Sep 2023 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694791303; x=1695396103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BU/syGSFe6Gjj/XolZ9AyWZKPPrwvCC7uloQeNjFZZ0=;
        b=YiV7kKn46gEsEgJYH6bXLW9smMDAP900/rnTTYzTC63IdYnLu/vK80lK5c9rCG+3ZE
         G/duumRGBwp9WBNaEeHQjpM469CbHXuwWwMbt8IIsj6qiw7n2GmfixzDLY1MWQecftsI
         OUjRYRMCSYgQdBSCNn+o/dHOSJ604eFiEDqWNau5M8+oAPsvKooA8E9+PcmJZwa09LZY
         1NCiUUD90I5RmTrH5jDEfRfPG+BguSEydjoyGBJn7n+kIM7TFinir/v+dqBhd5PBF6p3
         GGvSlA0om3Ban+b8S8JNdASvALPgiK4NnbbZOOKPRA0JtsCBc82iPtZl6pDeXYbrJCzV
         fU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791303; x=1695396103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU/syGSFe6Gjj/XolZ9AyWZKPPrwvCC7uloQeNjFZZ0=;
        b=rYSDOxTcBFd3m7YiFrRH0XgN9/bSZh/Tsdu2Kpn1FS2EKFVxhuYMBPZfSTmNEJvYa1
         2rDyZvTYNPvgBSoHPJg5OhCr9Esn1/tuQ9RWvSu8fPYIh2wAh2L5t99EZ1+1pulsrU81
         2dpQ2tdcV+WJ2DpT7h8R4ybF1OHCOusBsvCCgLk3NA/LNsaC3EbKtniuDI65KiKKHxSm
         CUm1meJa13VIWX20K29liTOsMlMJja40dvjD9kek6VZi9HALjvkcmR2UIRUj3jaWCpuZ
         k/aIien9uasyUhcEcCBJ73+wxOMrN/ls1eNi+AEKE38Sb+PUg69sw7eGiTB/CyG6mlng
         WbaQ==
X-Gm-Message-State: AOJu0YyrIYsRgqscydmkgs4rF7Vg265/elgDO3Z7BeXvLvzpuV2Hioz4
        fxmHtoCJtj8Ms9gtBypD9BOXqc9IpLtfNA==
X-Google-Smtp-Source: AGHT+IFJYHS/pvCqoE8OEq8p/tsy9Cg/DGSjms2eSxdnr9L4OO3x9Lu2jO1ORzJrfid9Cr9u99YyCA==
X-Received: by 2002:a05:6512:39c9:b0:500:acf1:b432 with SMTP id k9-20020a05651239c900b00500acf1b432mr2074297lfu.63.1694791302609;
        Fri, 15 Sep 2023 08:21:42 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id er25-20020a05651248d900b004fe39f31dc7sm667836lfb.294.2023.09.15.08.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:21:42 -0700 (PDT)
Date:   Fri, 15 Sep 2023 18:21:39 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913232938.420423-1-janb@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan

On Wed, Sep 13, 2023 at 04:29:38PM -0700, Jan Bottorff wrote:
> Errors were happening in the ISR that looked like corrupted
> memory. This was because memory writes from the core enabling
> interrupts were not yet visible to the core running the ISR. The
> kernel log would get the message "i2c_designware APMC0D0F:00:
> controller timed out" during in-band IPMI SSIF stress tests.
> 
> Add a write barrier before enabling interrupts to assure data written
> by the current core is visible to all cores before the interrupt fires.
> 
> The ARM Barrier Litmus Tests and Cookbook has an example under
> Sending Interrupts and Barriers that matches the usage in this
> driver. That document says a DSB barrier is required.
> 
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index ca1035e010c7..1694ac6bb592 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  	/* Dummy read to avoid the register getting stuck on Bay Trail */
>  	regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
>  
> +	/*
> +	 * To guarantee data written by the current core is visible to
> +	 * all cores, a write barrier is required. This needs to be
> +	 * before an interrupt causes execution on another core.
> +	 * For ARM processors, this needs to be a DSB barrier.
> +	 */

> +	wmb();

Based on the patch log and the comment, smp_wmb() seems to be more
suitable here since the problem looks like SMP-specific. Most
importantly the smp_wmb() will get to be just the compiler barrier on
the UP system, so no cache and pipeline flushes in that case.
Meanwhile 

I am not ARM expert, but based on the problem and the DMB/DSB barriers
descriptions using DMB should be enough in your case since you only
need memory syncs.

-Serge(y)

> +
>  	/* Clear and enable interrupts */
>  	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
>  	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
> -- 
> 2.41.0
> 
