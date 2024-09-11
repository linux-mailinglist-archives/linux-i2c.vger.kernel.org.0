Return-Path: <linux-i2c+bounces-6559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583C9752AB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FC4B22A26
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C426183092;
	Wed, 11 Sep 2024 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="id9Yc7yC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04D770E8
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726058453; cv=none; b=jLb/Rz4wvyigVFzi3mN459GDoxmjFAR+SASG9owI63/jmkIxrwKf7Oq/a1WB5zHInaHx9DCXnhG1XRSJ7BtpnAdrvljX6lsrzP2Mu0BXWr0RCXUqrVp8njAGoiihNA8olwJVy/SWCrgco5I065VoWBOp0dnXQZsUopWJ+irIBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726058453; c=relaxed/simple;
	bh=+1pBdasWGNk+1Kvgs6A/Tq0yqXTL+ck36VbkzTZ6Zag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+WjxmiKLcRXz87zIOVCDRK2yq2MNRPc+n1dNwh2LraYVlHfrCw/8IMzdk5z9LNdjnCRt3tQ9OuELtGzeHFbknLMytTyJhogek/QKs1UmsjRr8XOZ290dkKllGPcW33wV1zDZhuEJJvC1gBwaiU5g8pjLTSKHAz0aei2W3+9rVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=id9Yc7yC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA2C4CEC5;
	Wed, 11 Sep 2024 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726058452;
	bh=+1pBdasWGNk+1Kvgs6A/Tq0yqXTL+ck36VbkzTZ6Zag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id9Yc7yCQtKfRxmFLNGZHnoqQQ1f9V3iXTK1ScOU8Zn6om+o7at7driqRF9QWa3lZ
	 tN3VndT+XcIDoycwoTXKpd1q9GSuaqjWR3p2N8n3+KYvRxWrFtkWBDA4CLzpLIyLPN
	 6X8SmNtZIE85b08viZbWazF6BV0ILUwskZwQkoGAYP4fjrbk6XbyHbWcYcmzUPk1NI
	 GwCN30NlT/5k+Hv0X+VBsy8k2koGCMg6RmbpP46/FK+wK7GaAbpoVUyHM58YQHZb3j
	 kUMrz1WluzKlgsiNRhhlt/ZrPJ2Fig3vCHmBIUftUqPfijFVJtVtE2omIyLN8+Zhr0
	 sqjFAIBbTPsmA==
Date: Wed, 11 Sep 2024 14:40:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>, 
	"ben-linux@fluff.org" <ben-linux@fluff.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX
 NAKs
Message-ID: <4x5gqlah6dfpbn2ih2gynrfdgxx7pkqyfcd7t3cle62zhyuexk@vhsdz3njvneh>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
 <20231121180855.1278717-2-robert.hancock@calian.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121180855.1278717-2-robert.hancock@calian.com>

Hi Robert,

For some reason this patch and the next was set in patchwork as
"Changes requested" and did not appear in the list of things to
review.

On Tue, Nov 21, 2023 at 06:11:16PM GMT, Robert Hancock wrote:
> Frequently an I2C write will be followed by a read, such as a register
> address write followed by a read of the register value. In this driver,
> when the TX FIFO half empty interrupt was raised and it was determined
> that there was enough space in the TX FIFO to send the following read
> command, it would do so without waiting for the TX FIFO to actually
> empty.
> 
> Unfortunately it appears that in some cases this can result in a NAK
> that was raised by the target device on the write, such as due to an
> unsupported register address, being ignored and the subsequent read
> being done anyway. This can potentially put the I2C bus into an
> invalid state and/or result in invalid read data being processed.
> 
> To avoid this, once a message has been fully written to the TX FIFO,
> wait for the TX FIFO empty interrupt before moving on to the next
> message, to ensure NAKs are handled properly.
> 
> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 71391b590ada..fd623e8ad08a 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -772,14 +772,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>  			goto out;
>  		}
>  
> -		xiic_fill_tx_fifo(i2c);
> -
> -		/* current message sent and there is space in the fifo */
> -		if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >= 2) {
> +		if (xiic_tx_space(i2c)) {
> +			xiic_fill_tx_fifo(i2c);
> +		} else {
> +			/* current message fully written */
>  			dev_dbg(i2c->adap.dev.parent,
>  				"%s end of message sent, nmsgs: %d\n",
>  				__func__, i2c->nmsgs);
> -			if (i2c->nmsgs > 1) {
> +			/* Don't move onto the next message until the TX FIFO empties,
> +			 * to ensure that a NAK is not missed.
> +			 */
> +			if (i2c->nmsgs > 1 && (pend & XIIC_INTR_TX_EMPTY_MASK)) {

can "pend" be both XIIC_INTR_TX_EMPTY_MASK and
XIIC_INTR_TX_HALF_MASK?

Andi

>  				i2c->nmsgs--;
>  				i2c->tx_msg++;
>  				xfer_more = 1;
> @@ -790,11 +793,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>  					"%s Got TX IRQ but no more to do...\n",
>  					__func__);
>  			}
> -		} else if (!xiic_tx_space(i2c) && (i2c->nmsgs == 1))
> -			/* current frame is sent and is last,
> -			 * make sure to disable tx half
> -			 */
> -			xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
> +		}
>  	}
>  
>  	if (pend & XIIC_INTR_BNB_MASK) {
> -- 
> 2.42.0
> 

