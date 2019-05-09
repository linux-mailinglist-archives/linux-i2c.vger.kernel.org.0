Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0D718E09
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 18:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbfEIQ2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 12:28:50 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:33489 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbfEIQ2q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 May 2019 12:28:46 -0400
Received: by mail-yw1-f68.google.com with SMTP id q11so2380432ywb.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 May 2019 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x8vYgZtBt4v3vnnUr1BC1xWPSsSWoGexZsKlYRRpSXA=;
        b=WgGOYl3tx3XzTu6cutvC8nFcKcMnfF2lULXEPfViN6jIiY81F+zNUDKkK6atwISp+f
         L3s39dMF/EoUppd4QE0+/PXSlml+xjRaUDIFfWeewk+3IrC9DwmbRmBWsWWJnqjoYoIs
         UQ+G11hXwMtqZ9lcGsIq+x8YlxdBS4zPdaqco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x8vYgZtBt4v3vnnUr1BC1xWPSsSWoGexZsKlYRRpSXA=;
        b=BHgM79SqfSMiDsi9fAf04l5ROfpmtSt+elAJuB9NiInIcWf5BtP0SxUnbWqMdB/8Z3
         k2v2LvATTt0WEg89ZU2fCzJDNh0QsEwyz4hJwkUOo4w+IRtrEDjgxTjmrdkm5phCRJvI
         cITufyRLQ9Zvt+2nZW0b8QFjtvYfMxRAYWpIpf753WQwGAGiVJrQJdNEjPX1fX80hgZn
         Ve3L9dhhYsA/u0STLzPzNB2FDEPJpwZXzoihIphBXaHEAWK9SfgChTicCtPuI9lvcYFT
         jWPMC7c9c1bLBJvzZxYv6wa5BeVvIExxPi//C9fC4Vt2XMvY/Xb8bDw8NCTcH5BBT7Nk
         asmQ==
X-Gm-Message-State: APjAAAXNAAyAmsl8eIV2RNbQHNcB1B0/AVnHZe018eORlBRWJf3Dudub
        jPXnqCAHowfSiM65vQRNvSUigw==
X-Google-Smtp-Source: APXvYqxk+lZKWS4eh8CEn6ZjYuVlbms8sbGCMi2YJOwGXYMlPGK8TzgTDAQOuuYlX11+ddgLGqfOLg==
X-Received: by 2002:a0d:fe05:: with SMTP id o5mr2453496ywf.89.1557419324273;
        Thu, 09 May 2019 09:28:44 -0700 (PDT)
Received: from [10.136.8.252] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 207sm622797ywo.85.2019.05.09.09.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:28:43 -0700 (PDT)
Subject: Re: [PATCH 1/1] i2c: iproc: Add multi byte read-write support for
 slave mode
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michael Cheng <ccheng@broadcom.com>,
        Srinath Mannam <srinath.mannam@broadcom.com>
References: <1557375708-14830-1-git-send-email-rayagonda.kokatanur@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <508d6d50-29a6-dfa7-8e25-b64fa2cbbb8a@broadcom.com>
Date:   Thu, 9 May 2019 09:28:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557375708-14830-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Why is the email sent twice? What has changed?

On 5/8/2019 9:21 PM, Rayagonda Kokatanur wrote:
> Add multiple byte read-write support for slave mode.
> 
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 117 +++++++++++++++++--------------------
>  1 file changed, 53 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index a845b8d..2c7f145 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -165,12 +165,6 @@ enum i2c_slave_read_status {
>  	I2C_SLAVE_RX_END,
>  };
>  
> -enum i2c_slave_xfer_dir {
> -	I2C_SLAVE_DIR_READ = 0,
> -	I2C_SLAVE_DIR_WRITE,
> -	I2C_SLAVE_DIR_NONE,
> -};
> -
>  enum bus_speed_index {
>  	I2C_SPD_100K = 0,
>  	I2C_SPD_400K,
> @@ -203,7 +197,6 @@ struct bcm_iproc_i2c_dev {
>  	struct i2c_msg *msg;
>  
>  	struct i2c_client *slave;
> -	enum i2c_slave_xfer_dir xfer_dir;
>  
>  	/* bytes that have been transferred */
>  	unsigned int tx_bytes;
> @@ -219,7 +212,8 @@ struct bcm_iproc_i2c_dev {
>  		| BIT(IS_M_RX_THLD_SHIFT))
>  
>  #define ISR_MASK_SLAVE (BIT(IS_S_START_BUSY_SHIFT)\
> -		| BIT(IS_S_RX_EVENT_SHIFT) | BIT(IS_S_RD_EVENT_SHIFT))
> +		| BIT(IS_S_RX_EVENT_SHIFT) | BIT(IS_S_RD_EVENT_SHIFT)\
> +		| BIT(IS_S_TX_UNDERRUN_SHIFT))
>  
>  static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave);
>  static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave);
> @@ -297,15 +291,11 @@ static void bcm_iproc_i2c_slave_init(
>  	/* clear all pending slave interrupts */
>  	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
>  
> -	/* Enable interrupt register for any READ event */
> -	val = BIT(IE_S_RD_EVENT_SHIFT);
>  	/* Enable interrupt register to indicate a valid byte in receive fifo */
> -	val |= BIT(IE_S_RX_EVENT_SHIFT);
> +	val = BIT(IE_S_RX_EVENT_SHIFT);
>  	/* Enable interrupt register for the Slave BUSY command */
>  	val |= BIT(IE_S_START_BUSY_SHIFT);
>  	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> -
> -	iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
>  }
>  
>  static void bcm_iproc_i2c_check_slave_status(
> @@ -314,8 +304,11 @@ static void bcm_iproc_i2c_check_slave_status(
>  	u32 val;
>  
>  	val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
> -	val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
> +	/* status is valid only when START_BUSY is cleared after it was set */
> +	if (val & BIT(S_CMD_START_BUSY_SHIFT))
> +		return;
>  
> +	val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
>  	if (val == S_CMD_STATUS_TIMEOUT) {
>  		dev_err(iproc_i2c->device, "slave random stretch time timeout\n");
>  
> @@ -327,70 +320,66 @@ static void bcm_iproc_i2c_check_slave_status(
>  }
>  
>  static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
> -				u32 status)
> +				    u32 status)
>  {
> -	u8 value;
>  	u32 val;
> -	u32 rd_status;
> -	u32 tmp;
> +	u8 value, rx_status;
>  
> -	/* Start of transaction. check address and populate the direction */
> -	if (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_NONE) {
> -		tmp = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> -		rd_status = (tmp >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> -		/* This condition checks whether the request is a new request */
> -		if (((rd_status == I2C_SLAVE_RX_START) &&
> -			(status & BIT(IS_S_RX_EVENT_SHIFT))) ||
> -			((rd_status == I2C_SLAVE_RX_END) &&
> -			(status & BIT(IS_S_RD_EVENT_SHIFT)))) {
> -
> -			/* Last bit is W/R bit.
> -			 * If 1 then its a read request(by master).
> -			 */
> -			iproc_i2c->xfer_dir = tmp & SLAVE_READ_WRITE_BIT_MASK;
> -			if (iproc_i2c->xfer_dir == I2C_SLAVE_DIR_WRITE)
> -				i2c_slave_event(iproc_i2c->slave,
> -					I2C_SLAVE_READ_REQUESTED, &value);
> -			else
> -				i2c_slave_event(iproc_i2c->slave,
> +	/* Slave RX byte receive */
> +	if (status & BIT(IS_S_RX_EVENT_SHIFT)) {
> +		val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> +		rx_status = (val >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> +		if (rx_status == I2C_SLAVE_RX_START) {
> +			/* Start of SMBUS for Master write */
> +			i2c_slave_event(iproc_i2c->slave,
>  					I2C_SLAVE_WRITE_REQUESTED, &value);
> -		}
> -	}
>  
> -	/* read request from master */
> -	if ((status & BIT(IS_S_RD_EVENT_SHIFT)) &&
> -		(iproc_i2c->xfer_dir == I2C_SLAVE_DIR_WRITE)) {
> -		i2c_slave_event(iproc_i2c->slave,
> -			I2C_SLAVE_READ_PROCESSED, &value);
> -		iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> +			val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> +			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> +			i2c_slave_event(iproc_i2c->slave,
> +					I2C_SLAVE_WRITE_RECEIVED, &value);
> +		} else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
> +			/* Start of SMBUS for Master Read */
> +			i2c_slave_event(iproc_i2c->slave,
> +					I2C_SLAVE_READ_REQUESTED, &value);
> +			iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
>  
> -		val = BIT(S_CMD_START_BUSY_SHIFT);
> -		iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> -	}
> +			val = BIT(S_CMD_START_BUSY_SHIFT);
> +			iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
>  
> -	/* write request from master */
> -	if ((status & BIT(IS_S_RX_EVENT_SHIFT)) &&
> -		(iproc_i2c->xfer_dir == I2C_SLAVE_DIR_READ)) {
> -		val = iproc_i2c_rd_reg(iproc_i2c, S_RX_OFFSET);
> -		/* Its a write request by Master to Slave.
> -		 * We read data present in receive FIFO
> -		 */
> -		value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> +			/*
> +			 * Enable interrupt for TX FIFO becomes empty and
> +			 * less than PKT_LENGTH bytes were output on the SMBUS
> +			 */
> +			val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> +			val |= BIT(IE_S_TX_UNDERRUN_SHIFT);
> +			iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> +		} else {
> +			/* Master write other than start */
> +			value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> +			i2c_slave_event(iproc_i2c->slave,
> +					I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +	} else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
> +		/* Master read other than start */
>  		i2c_slave_event(iproc_i2c->slave,
> -			I2C_SLAVE_WRITE_RECEIVED, &value);
> -
> -		/* check the status for the last byte of the transaction */
> -		rd_status = (val >> S_RX_STATUS_SHIFT) & S_RX_STATUS_MASK;
> -		if (rd_status == I2C_SLAVE_RX_END)
> -			iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
> +				I2C_SLAVE_READ_PROCESSED, &value);
>  
> -		dev_dbg(iproc_i2c->device, "\nread value = 0x%x\n", value);
> +		iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> +		val = BIT(S_CMD_START_BUSY_SHIFT);
> +		iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
>  	}
>  
>  	/* Stop */
>  	if (status & BIT(IS_S_START_BUSY_SHIFT)) {
>  		i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP, &value);
> -		iproc_i2c->xfer_dir = I2C_SLAVE_DIR_NONE;
> +		/*
> +		 * Enable interrupt for TX FIFO becomes empty and
> +		 * less than PKT_LENGTH bytes were output on the SMBUS
> +		 */
> +		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> +		val &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
> +		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
>  	}
>  
>  	/* clear interrupt status */
> 
