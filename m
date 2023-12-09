Return-Path: <linux-i2c+bounces-707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E980B654
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 21:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F291C20866
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 20:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CD81A5A8;
	Sat,  9 Dec 2023 20:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/4uchdK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA5182BE
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 20:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D95C433C8;
	Sat,  9 Dec 2023 20:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702154702;
	bh=+7qwKc+g6O9nPYHObVhq00UWcOt2oMbcUuD1ls3YUTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/4uchdKtwypNWRTa301WpvfdXEMmFakt5eog88JUDkRhczMX02e3rBBWNEwlx6jg
	 PxtES+X9BVhyAsugIobcqBW8v+Y+EUd1b46dg2QTmBNxvZcHYXf5CrmyWPsJUbK+J6
	 inuDB4VU2hVdI8Zvgc+Rh9hR0GrAcXt0Jq2mxUubAy7rzs0aWFKylmRRpgmQliSB14
	 yZNL8vhb+wq9yb7WJeyTEJVfFYEZ0bF0Kup+mBXqrErjRnHSe3d9IblX19xyWi2r/k
	 XnxKG81bLPX5jty4mlhRlHrV28YTlmPt/PHuy8Y26qhk5OKchvN6Lpk6cWZH6TZDTi
	 BUZNlNoGDhOxw==
Date: Sat, 9 Dec 2023 21:44:55 +0100
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
Subject: Re: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Message-ID: <20231209204455.jxize3muvx7hhpos@zenone.zhora.eu>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-3-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208033142.1673232-3-quan@os.amperecomputing.com>

Hi Quan,

[...]

> -	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +	/*
> +	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
> +	 * start receiving or sending new data, and this may cause a race condition
> +	 * as the irq handler has not yet handled these irqs but is being acked.
> +	 * Let's ack them late at the end of the irq handler when those are truly processed.
> +	 */
> +	irq_ack_last = ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK;
> +	writel(irq_received & ~irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);

I like Andrews suggestion of having irq_ack_last as a define that
is already negated, instead of negating it in the writel, which
makes it a bit difficult to read.

Besides, ack_last, as a name is not very meaningful, I'd rather
call it irq_ack_rx_tx (or something similar).

But I'm not going to block it for this, up to you if you want to
send a new version.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

