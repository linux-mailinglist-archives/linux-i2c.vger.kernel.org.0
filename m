Return-Path: <linux-i2c+bounces-9940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E4A6A3E6
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111A9189C70F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 10:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFC422423D;
	Thu, 20 Mar 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpF866/S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CA1EE7B7;
	Thu, 20 Mar 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467453; cv=none; b=ejtnIhIFFfVmTntEo/yBCokOYgOBeRhQA6kyqyIkftIF6yHO49hhyazmPEGIlAlUCALZEpckhmOiHa9YhLd0/H0l7NpB1x03rHMic9VNilFUfeWuce9mDyxeP962Lj6vd+R9IOwrZsExeLDzbzyLajzFtlDdsEQPB5OML/VaKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467453; c=relaxed/simple;
	bh=Y9b+mSHTwsKdUGdmjh8TjyWYyihJZEsdMgomT69U1WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMjtcSMf/2DMEUrpm9en53p1RIPDvJo/BakpeXtuP6w9ebUaUXBcq05VpssbqODcNsKbBi17Uzy5YUE6ptvdXip8TCPGYFDByD4x9UY5ttp6vj7FFEVRDpe3/yAZl3hCigqt4LD8SoOYPq7f5KGARb6yKkf4vuzxQ4+3vdZI6ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpF866/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB98C4CEDD;
	Thu, 20 Mar 2025 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742467453;
	bh=Y9b+mSHTwsKdUGdmjh8TjyWYyihJZEsdMgomT69U1WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpF866/S2QRFGOp8XVWwnVYZpxOIXxXbrIRB9zQaRYwn56r5mVjAGSgXNsC7D1Err
	 Jvj66DGpwo4QM+Ul1JF7P2A2oM0ElUyo96QmGGhZpOw0fOPkLR9RdL4L7hg3pSlCl7
	 5sTzFGLB0aWTIpnZEWfN00fQrRGyrVvUr2iiJ6qXo0GAWoxFPNDzk53ZFAGrdh2kP6
	 oLZio8LRo/bBfUycmCdU3N+dotwyJxCgFXJdu7cdQQO1EU3Yw4O3QAqUTb2JUvS+i3
	 zT3+P4jpPecTjG66ot3xW7vSlQ0RLUoq2+NFtEuSGa0VhcV0Lr/SMQ0O9cJgylWur9
	 blAvU+SL2zRyQ==
Date: Thu, 20 Mar 2025 11:44:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/2] i2c: atciic100: add Andes I2C driver support
Message-ID: <neeqqifb3urhtchaqowa6pkq3s3v3xwzlz4bujmiuq7tsvhz4i@a3v4vbxqozgr>
References: <20250207021923.2912373-1-ben717@andestech.com>
 <20250207021923.2912373-3-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207021923.2912373-3-ben717@andestech.com>

Hi Ben,

I glanced throught the patch and looks OK, just few things with
little importance. Please, do not forget to run checkpatch.pl
before sendint the patch.

Once you send a v2, I will read it more carefully.

...

> +	if (status & ATCIIC100_STATUS_CMPL) {
> +		/* Write 1 to clear all status */
> +		writel(ATCIIC100_STATUS_W1C, i2c->base + ATCIIC100_STATUS_REG);
> +
> +		i2c->xfer_done = true;
> +		if (status & ATCIIC100_STATUS_ADDR_HIT)
> +			i2c->addr_hit = true;
> +
> +		/* For the last read, retrieve all remaining data in FIFO. */
> +		while (i2c->buf_len--)
> +			*i2c->buf++ = readl(i2c->base + ATCIIC100_DATA_REG);
> +

please, remove this blank space here

> +	}
> +
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +}

...

> +static int atciic100_xfer_wait(struct atciic100 *i2c, struct i2c_msg *msg)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Set the data count.
> +	 * If there are 256 bytes to be transmitted/received, write 0 to the
> +	 * data count field.
> +	 */
> +	val = readl(i2c->base + ATCIIC100_CTRL_REG) |
> +	      (i2c->buf_len & ATCIIC100_CTRL_DATA_CNT);

please checkt the alignment here.

> +	/* Set the transaction direction */
> +	if (msg->flags & I2C_M_RD)
> +		val |= ATCIIC100_CTRL_DIR;
> +	else
> +		val &= ~ATCIIC100_CTRL_DIR;

...

> +/* I2C may be needed to bring up other drivers */
> +static int __init atciic100_init_driver(void)
> +{
> +	return platform_driver_register(&atciic100_platform_driver);
> +}
> +subsys_initcall(atciic100_init_driver);
> +
> +static void __exit atciic100_exit_driver(void)
> +{
> +	platform_driver_unregister(&atciic100_platform_driver);
> +}
> +module_exit(atciic100_exit_driver);

can you please use module_platform_driver()?

Andi

> +
> +MODULE_AUTHOR("Ben Zong-You Xie <ben717@andestech.com>");
> +MODULE_DESCRIPTION("Andes ATCIIC100 I2C bus adapter");
> +MODULE_LICENSE("GPL");
> +
> -- 
> 2.34.1
> 

