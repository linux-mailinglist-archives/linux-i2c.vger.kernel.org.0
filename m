Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205D77E0348
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 14:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376452AbjKCNC1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Nov 2023 09:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbjKCNC0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Nov 2023 09:02:26 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20693FB;
        Fri,  3 Nov 2023 06:02:22 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso29083061fa.1;
        Fri, 03 Nov 2023 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699016540; x=1699621340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVRMR6YslgMlENBhjhH91GkTg9GwysvZfgqPT8N1N/4=;
        b=JbjqdCxbdx/0SNfpm2ImZoDyFqT6l7eLqymYBPEakkp9bSbb6nUL536RoCXzYAI9Kq
         WYlpWQgDzc5RwNDp3AXpJNW85jBNkZDsIDZcn4dJAqJUmPBysymAHpFA4V65kdjylWAL
         9/O/UN2Aymda5PreGi8B8bc5LrFRCL/KhXT1qJxDtIpwnHIlPmz3OahvFkvsf47qWIrD
         M/cD4AZhRoDc6cLE6ttVeBxgvmLE/khRgRCesP5H/nPAJa5NMEL+EYfq7bFBcAA0h2Bv
         RLtq2BRkpgRMvV0UDjKPQw8MjrXtQS3JjUs/znDGq0KZ1ico2x8XMyqBEgrsCVKqIJmc
         dLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699016540; x=1699621340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVRMR6YslgMlENBhjhH91GkTg9GwysvZfgqPT8N1N/4=;
        b=fjA7nbDGla2NiA1mxDRDWNdcsik6fv5mFoSQBctoxvCoe67bMJEv+wfgRgP0MhSquV
         7iqhJslXuUGA47JX49eNxUHFPPNOzX5iWrAOcubY71bvhdwgttvqMbKcqq6zaAOo0iF3
         JonQvOZVDsaxgDphrmx0eNAzUa7OzZ0t7LnRHBjHPuGf1us4SyhImrt8jwF0T2OuCW4Y
         +d1eb0sLXx1PFpdwsOtqaERGPm6fKcsJIL4jv3R0iYj2mMJOcfHkigabCjyfOhEFUo1n
         sFMH23K+U06JapQl+I52YMyDGgzImZvipDm4WAqz25ovqHw9YUyRoyS0mCV6G4dyyiYi
         F3Dg==
X-Gm-Message-State: AOJu0YzB6q6zarhjXTTYiTVztiyTaDz6aL+1KiVxeSbz+VnOfswsbwOK
        t7BJ1pGAwB+qdpWlzyXHLOA=
X-Google-Smtp-Source: AGHT+IEnCyTa4ZrVf7cDx7rnwPCww2Y/j0c01kiWJ1rnEljcmW2iP1uBhgzfyGkEfQAs17nVY9uozA==
X-Received: by 2002:a2e:9cc8:0:b0:2c6:f51f:c96d with SMTP id g8-20020a2e9cc8000000b002c6f51fc96dmr3648374ljj.13.1699016537170;
        Fri, 03 Nov 2023 06:02:17 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
        by smtp.gmail.com with ESMTPSA id 12-20020a05651c008c00b002b702dfb510sm233633ljq.39.2023.11.03.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:02:16 -0700 (PDT)
Date:   Fri, 3 Nov 2023 16:02:15 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Message-ID: <673zmmjr4bpsfepbcjegmj7gddvj3yeacljmiux57ywn42fk4p@behzguqduv6k>
References: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 02, 2023 at 10:30:08AM +0700, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY IRQ until I2C DesignWare receives
> first data byte from I2C device, then re-enable it to resume SMBus
> transaction.
> 
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr() is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
> 
> Cc: stable@vger.kernel.org
> Co-developed-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>

Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
> v2:
> 	+ Reduce the indentations level
> 	+ Use regmap_update_bits for bitfield update
> 	+ Rewrite comment statement                     [Serge]
> 	+ Update commit message
> 	+ Add Co-developed-by tag for co-authors        [Andy]
> 
> v1:
>   https://lore.kernel.org/lkml/avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk/T/
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 55ea91a63382..ae76620ef35e 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -456,10 +456,16 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  
>  		/*
>  		 * Because we don't know the buffer length in the
> -		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop
> -		 * the transaction here.
> +		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop the
> +		 * transaction here. Also disable the TX_EMPTY IRQ
> +		 * while waiting for the data length byte to avoid the
> +		 * bogus interrupts flood.
>  		 */
> -		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
> +		if (flags & I2C_M_RECV_LEN) {
> +			dev->status |= STATUS_WRITE_IN_PROGRESS;
> +			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
> +			break;
> +		} else if (buf_len > 0) {
>  			/* more bytes to be written */
>  			dev->status |= STATUS_WRITE_IN_PROGRESS;
>  			break;
> @@ -495,6 +501,13 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>  	msgs[dev->msg_read_idx].len = len;
>  	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>  
> +	/*
> +	 * Received buffer length, re-enable TX_EMPTY interrupt
> +	 * to resume the SMBUS transaction.
> +	 */
> +	regmap_update_bits(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_TX_EMPTY,
> +			   DW_IC_INTR_TX_EMPTY);
> +
>  	return len;
>  }
>  
> -- 
> 2.25.1
> 
