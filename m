Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A68428D8F5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 05:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgJNDUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 23:20:40 -0400
Received: from linux.microsoft.com ([13.77.154.182]:45918 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgJNDUk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 23:20:40 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 627A720B4905; Tue, 13 Oct 2020 20:20:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 627A720B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1602645639;
        bh=X/lgLtvI5yARcXsG3L0YJTffUHRbyGIv/Y8Hr0+JSIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ao+6bwGGbRULNWSKAUgXNrKQGd9nAQ/4vvhMvX6HxUKpTxBkC5k7JTpUe+lWKoCa3
         uwwGqxydii9FaZ210rGklGI0k1FO4CfdVCDR9Xm90sdg2hJ7wkDyuPOwH2h51pcbuj
         0gkNN7JXrAm3mEPr6HHr1vhg072GE9bbtv+IrgCA=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     rayagonda.kokatanur@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Subject: [PATCH v1 5/6] i2c: iproc: handle master read request
Date:   Tue, 13 Oct 2020 20:20:39 -0700
Message-Id: <1602645639-12854-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20201011182254.17776-6-rayagonda.kokatanur@broadcom.com>
References: <20201011182254.17776-6-rayagonda.kokatanur@broadcom.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 11 Oct 2020 23:52:53 +0530, Rayagonda Kokatanur wrote:
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> 
> -		} else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
> -			/* Start of SMBUS for Master Read */
> +					I2C_SLAVE_WRITE_REQUESTED, &rx_data);
> +			iproc_i2c->rx_start_rcvd = true;
> +			iproc_i2c->slave_read_complete = false;
> +		} else if (rx_status == I2C_SLAVE_RX_DATA &&
> +			   iproc_i2c->rx_start_rcvd) {
> +			/* Middle of SMBUS Master write */
>  			i2c_slave_event(iproc_i2c->slave,
> -					I2C_SLAVE_READ_REQUESTED, &value);
> -			iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> +					I2C_SLAVE_WRITE_RECEIVED, &rx_data);
> +		} else if (rx_status == I2C_SLAVE_RX_END &&
> +			   iproc_i2c->rx_start_rcvd) {
> +			/* End of SMBUS Master write */
> +			if (iproc_i2c->slave_rx_only)
> +				i2c_slave_event(iproc_i2c->slave,
> +						I2C_SLAVE_WRITE_RECEIVED,
> +						&rx_data);
> +
> +			i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP,
> +					&rx_data);
> +		} else if (rx_status == I2C_SLAVE_RX_FIFO_EMPTY) {
> +			iproc_i2c->rx_start_rcvd = false;
> +			iproc_i2c->slave_read_complete = true;
> +			break;
> +		}
>  
> -			val = BIT(S_CMD_START_BUSY_SHIFT);
> -			iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> +		rx_bytes++;

rx_bytes should be incremented only along with I2C_SLAVE_WRITE_RECEIVED event?

> 
> +static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
> +				    u32 status)
> +{
> +	u32 val;
> +	u8 value;
> +
> +	/*
> +	 * Slave events in case of master-write, master-write-read and,
> +	 * master-read
> +	 *
> +	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
> +	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> +	 *                    events
> +	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> +	 *                    events or only IS_S_RD_EVENT_SHIFT
> +	 */
> +	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
> +	    status & BIT(IS_S_RD_EVENT_SHIFT)) {
> +		/* disable slave interrupts */
> +		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> +		val &= ~iproc_i2c->slave_int_mask;
> +		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> +
> +		if (status & BIT(IS_S_RD_EVENT_SHIFT))
> +			/* Master-write-read request */
> +			iproc_i2c->slave_rx_only = false;
> +		else
> +			/* Master-write request only */
> +			iproc_i2c->slave_rx_only = true;
> +
> +		/* schedule tasklet to read data later */
> +		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
> +
> +		/* clear only IS_S_RX_EVENT_SHIFT interrupt */
> +		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
> +				 BIT(IS_S_RX_EVENT_SHIFT));
> 

Both tasklet and isr are writing to status (IS_OFFSET) reg.

The tasklet seems to be batching up rx fifo reads because of time-sensitive
Master-write-read transaction? Linux I2C framework is byte interface anyway.
Can the need to batch reads be avoided by setting slave rx threshold for
interrupt (S_FIFO_RX_THLD) to 1-byte? 

Also, wouldn't tasklets be susceptible to other interrupts? If fifo reads
have to be batched up, can it be changed to threaded irq?


