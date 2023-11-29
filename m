Return-Path: <linux-i2c+bounces-523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F057FCB6B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 01:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A025B21662
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 00:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A464A1878;
	Wed, 29 Nov 2023 00:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujwKHO23"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C01863
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 00:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD2CC433C8;
	Wed, 29 Nov 2023 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701218146;
	bh=CEyKgl9exP4XEknYN9UDsJmLxQMgn2xe10MjBsA+2Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujwKHO23grlfzlnd0pvsWiou2vfCGyav3Rf2RrCygDfh2jSoPPcv9jNDzJRo9tP3S
	 H/Om4NjxC0ZIYNEmNoJSXekdmoT9sno3LV82jwmo3Wm4MnLi/14WEzzDq8Z1A+Gr3B
	 4GhSvp3i7COC2HRpAXHDGwrkyMPM5p6jOfewEyRPPgbloX4NRFp+ZOsnTfHiI2DzCK
	 TX05jGApV4o6HvJPeU3nJsrycy/4lreBoQf7OM+nVtsmSxC2RCBrBypqXEuh4XhPJX
	 Vt2iZ6WMcKqAA2hlgoWhnYZ/OgLsv1iGofep+vnd5mt5jMePKIHY/H8hat/HJ76GgK
	 Of3wVqe1InEjw==
Date: Wed, 29 Nov 2023 01:35:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Message-ID: <20231129003542.jfhhotebweb3uwyb@zenone.zhora.eu>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-2-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128075236.2724038-2-quan@os.amperecomputing.com>

Hi Quan,

On Tue, Nov 28, 2023 at 02:52:35PM +0700, Quan Nguyen wrote:
> Under normal conditions, after the last byte is sent by the Slave, the
> TX_NAK interrupt is raised.  However, it is also observed that
> sometimes the Master issues the next transaction too quickly while the
> Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
> last byte of the previous READ_PROCESSED state has not been ack’ed.
> This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
> and RX_DONE interrupt of the next coming transaction from Master. The
> Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
> ignores the TX_NAK, causing complaints such as
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
> 0x00000086, but was 0x00000084"
> 
> This commit adds code to handle this case by emitting a SLAVE_STOP event
> for the TX_NAK before processing the RX_DONE for the coming transaction
> from the Master.
> 
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v2:
>   + Split to separate series [Joel]
>   + Added the Fixes line [Joel]
>   + Revised commit message [Quan]
> 
> v1:
>   + First introduced in
> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 28e2a5fc4528..79476b46285b 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  
>  	/* Slave was requested, restart state machine. */
>  	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> +			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +		}

this is a duplicate of a later "if (...)" satement. What is the
need for having them both?

Andi

>  		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>  		bus->slave_state = ASPEED_I2C_SLAVE_START;
>  	}
> -- 
> 2.35.1
> 

