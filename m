Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2651E7B3780
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 18:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbjI2QJG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 12:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbjI2QJG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 12:09:06 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B7D139;
        Fri, 29 Sep 2023 09:09:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-505748580ceso51086e87.3;
        Fri, 29 Sep 2023 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696003742; x=1696608542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCN934VhabHlWJc9p5aUyxuMGd+S4iIxKk262wTizkQ=;
        b=WXYTwTnP+PrU4HfGUzRVWDFTZ4E8jucN5WaPFMPEbJE/x864LMMfU8+gB7fXdUAApQ
         7a0dLO0jgybjDpkPcljh6kokbDnvqM7cLP6g3/AktUIRkYwr4k7dDI2tuHsc8B/fXgDi
         2JKup1yxhJU6nKzoCMds8n+2q278kh0ciXW2noYcrnZX0rBOC+Sn8XMLN1GGtKZlKgHq
         LASv4ceQIVMMdztSJl1YGQ4rEnfKZTQoOj3eo8uRuRUWPdPzxTfSuwU88IHtCx9/Q3+D
         ivW5bw1VQE/4K5z1v9tyy8rtgpWawGQZimUUW5QPMB1gWq6freupHY0PWspn3iU7zc8R
         mEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003742; x=1696608542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCN934VhabHlWJc9p5aUyxuMGd+S4iIxKk262wTizkQ=;
        b=YvFdUn6cJIBt6izGvwyG4NYeyN7c5R1qtxgkH3MQb5hPb8hKq4mvcbrwAOzHO3HP9q
         5GKpo4D927zJhfAJ3SFk0I7EsngLSQu1p6aVCqG3ml0qzQi26WJ0hm9ZWnnJuxTK8fuu
         60jBQQ6VJpkXBTClTFvUJX6KRViYlq5SkyCZUNt0hOEl9e9tu1b22keZqH854621GZEO
         Rycuoo9BxwxB8C6ogohIQi3HiQ/XZwU4PIxWHaWmynJ6s4lpz++/WOGNjUbl4f14U/wO
         WotVbV+6yVOnzm+MwDomPeVg4HcKqdiiqY9h8L75BvfB8br0PpXfmr/tc7WTkjSSCEhU
         AT0g==
X-Gm-Message-State: AOJu0Yx4nbe4s4EaMxg+O+LTdcz22y9xMP4BOv80YkP3A99nPCg2mi6D
        RIeLrqJWCFp/9IqzveqqGmU=
X-Google-Smtp-Source: AGHT+IHOnFq1zeqSSK3P/A5O+MTaHM4TSDzr6YY7Q+M2Qa7yO9OEpAsyizPdPF7tKw/bdEsCGEwhIQ==
X-Received: by 2002:a19:3817:0:b0:4ff:70d2:4512 with SMTP id f23-20020a193817000000b004ff70d24512mr3820036lfa.23.1696003741534;
        Fri, 29 Sep 2023 09:09:01 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id h21-20020a056512221500b00502b04e2722sm1296268lfu.3.2023.09.29.09.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 09:09:00 -0700 (PDT)
Date:   Fri, 29 Sep 2023 19:08:57 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Message-ID: <avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk>
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 29, 2023 at 10:53:56AM +0700, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY irq until I2C DW receives first data
> byte from I2C device, then re-enable it.
> 
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 55ea91a63382..2152b1f9b27c 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -462,6 +462,13 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)

>  		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
>  			/* more bytes to be written */
>  			dev->status |= STATUS_WRITE_IN_PROGRESS;
> +			/*
> +			 * In I2C_FUNC_SMBUS_BLOCK_DATA case, there is no data
> +			 * to send before receiving data length from slave.
> +			 * Disable TX_EMPTY while waiting for data length byte
> +			 */
> +			if (flags & I2C_M_RECV_LEN)
> +				intr_mask &= ~DW_IC_INTR_TX_EMPTY;

Is it possible to reduce the indentations level? Like this:

		/*
		 * Because we don't know the buffer length in the
		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop the
		 * transaction here. Also disable the TX_EMPTY IRQ
		 * while waiting for the data length byte to avoid the
		 * bogus interrupts flood.
		 */
		if (flags & I2C_M_RECV_LEN) {
  			dev->status |= STATUS_WRITE_IN_PROGRESS;
			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
			break;
		} else if (buf_len > 0) {
  			/* more bytes to be written */
  			dev->status |= STATUS_WRITE_IN_PROGRESS;
			break;
		} else {
			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
		}

>  			break;
>  		} else
>  			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
> @@ -485,6 +492,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>  {
>  	struct i2c_msg *msgs = dev->msgs;
>  	u32 flags = msgs[dev->msg_read_idx].flags;

> +	u32 intr_mask;
>  
>  	/*
>  	 * Adjust the buffer length and mask the flag
> @@ -495,6 +503,11 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>  	msgs[dev->msg_read_idx].len = len;
>  	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>  
> +	/* Re-enable TX_EMPTY interrupt. */
> +	regmap_read(dev->map, DW_IC_INTR_MASK, &intr_mask);
> +	intr_mask |= DW_IC_INTR_TX_EMPTY;
> +	regmap_write(dev->map, DW_IC_INTR_MASK, intr_mask);

1. What about just:
	regmap_update_bits(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_TX_EMPTY,
			   DW_IC_INTR_TX_EMPTY);

2. The in-situ comment is pointless because the statement already
implies the IRQ re-enabling. I suggest to add more details of _why_
the IRQ needs to be re-enabled (what is supposed to be done after it's
re-enabled?).

-Serge(y)

> +
>  	return len;
>  }
>  
> -- 
> 2.25.1
> 
