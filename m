Return-Path: <linux-i2c+bounces-9453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA6A351A5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 164C03AE34B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E650275403;
	Thu, 13 Feb 2025 22:51:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677CD2753F3
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487079; cv=none; b=nl/XEjRjSA9rBi8MjUuLTVFzSwt6lVeQrnl81my13EqwOQ0Sh3tfBHkPb5+5b5PNNElCTtnC3MuQFDeC2rNKemd0Y9i/vV6qKrAnNe/O6p51KPrDfUMg1Xwk9m7wG63pGAbeeVBccV6iJMmkQRUa0k8qM9Pf/1HuNHsx7cGjAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487079; c=relaxed/simple;
	bh=ZQiJI6r35L8re7VmaSmuwT9/cCtn0u60zuPKAx+YoYI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWACxd8aqsIBdbwCVhbauOS9/vUr51D0wvnjtpKcOrW5BdT/YwqGszsWq8h7QhCIppt0buCR9j7pzv1O1s7aVCy2yPaq9YLekQWqlm3QEwcHaTmoMGI8abl7IywTCzF7N0FwRTbHCnEmcQT4ZhO+cijqnhJAsfVqzOP/qqg3Yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id de340431-ea5c-11ef-9d70-005056bd6ce9;
	Fri, 14 Feb 2025 00:50:06 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 14 Feb 2025 00:50:05 +0200
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v10 2/2] i2c: octeon: Add block-mode i2c operations
Message-ID: <Z653HU3WnvapYb0x@surfacebook.localdomain>
References: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
 <20241010025317.2040470-3-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010025317.2040470-3-aryan.srivastava@alliedtelesis.co.nz>

Thu, Oct 10, 2024 at 03:53:16PM +1300, Aryan Srivastava kirjoitti:
> Add functions to perform block read and write operations. This applies
> for cases where the requested operation is for >8 bytes of data.
> 
> When not using the block mode transfer, the driver will attempt a series
> of 8 byte i2c operations until it reaches the desired total. For
> example, for a 40 byte request the driver will complete 5 separate
> transactions. This results in large transactions taking a significant
> amount of time to process.
> 
> Add block mode such that the driver can request larger transactions, up
> to 1024 bytes per transfer.
> 
> Many aspects of the block mode transfer is common with the regular 8
> byte operations. Use generic functions for parts of the message
> construction and sending the message. The key difference for the block
> mode is the usage of separate FIFO buffer to store data.
> 
> Write to this buffer in the case of a write (before command send).
> Read from this buffer in the case of a read (after command send).
> 
> Data is written into this buffer by placing data into the MSB onwards.
> This means the bottom 8 bits of the data will match the top 8 bits, and
> so on and so forth.
> 
> Set specific bits in message for block mode, enable block mode transfers
> from global i2c management registers, construct message, send message,
> read or write from FIFO buffer as required.
> 
> The block-mode transactions result in a significant speed increase in
> large i2c requests.

...

> +/**
> + * octeon_i2c_hlc_block_comp_read - high-level-controller composite block read
> + * @i2c: The struct octeon_i2c
> + * @msgs: msg[0] contains address, place read data into msg[1]
> + *
> + * i2c core command is constructed and written into the SW_TWSI register.
> + * The execution of the command will result in requested data being
> + * placed into a FIFO buffer, ready to be read.
> + * Used in the case where the i2c xfer is for greater than 8 bytes of read data.

> + * Returns 0 on success, otherwise a negative errno.

Please, validate the kernel-doc properly. This has a warning.

> + */
> +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
> +{
> +	int len, ret = 0;
> +	u64 cmd = 0;
> +
> +	octeon_i2c_hlc_enable(i2c);
> +	octeon_i2c_block_enable(i2c);
> +
> +	/* Write (size - 1) into block control register */
> +	len = msgs[1].len - 1;
> +	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
> +
> +	/* Prepare core command */
> +	cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;

> +	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;

Can you, please, remove 10-bit address "support" from the driver to avoid false
impression that it works. I haven't found any evidence that the upper 3 bits
are being anyhow used in it.

> +	/* Send core command */
> +	ret = octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
> +	if (ret)
> +		return ret;
> +
> +	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
> +	if ((cmd & SW_TWSI_R) == 0)
> +		return octeon_i2c_check_status(i2c, false);
> +
> +	/* read data in FIFO */
> +	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
> +				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
> +	for (int i = 0; i < len; i += 8) {
> +		u64 rd = __raw_readq(i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
> +		/* Place data into msg buf from FIFO, MSB onwards */
> +		for (int j = 7; j >= 0; j--)
> +			msgs[1].buf[i + (7 - j)] = (rd >> (8 * j)) & 0xff;

Use proper put_unaligned_be64() / put_unalined_le64() depending on what you
need. No reinveted wheels, please.

> +	}
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}

...

> +/**
> + * octeon_i2c_hlc_block_comp_write - high-level-controller composite block write
> + * @i2c: The struct octeon_i2c
> + * @msgs: msg[0] contains address, msg[1] contains data to be written
> + *
> + * i2c core command is constructed and write data is written into the FIFO buffer.
> + * The execution of the command will result in HW write, using the data in FIFO.
> + * Used in the case where the i2c xfer is for greater than 8 bytes of write data.
> + *
> + * Returns 0 on success, otherwise a negative errno.

Same issue with the kernel-doc.

> + */
> +static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
> +{
> +	bool set_ext = false;
> +	int len, ret = 0;
> +	u64 cmd, ext = 0;
> +
> +	octeon_i2c_hlc_enable(i2c);
> +	octeon_i2c_block_enable(i2c);
> +
> +	/* Write (size - 1) into block control register */
> +	len = msgs[1].len - 1;
> +	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
> +
> +	/* Prepare core command */
> +	cmd = SW_TWSI_V | SW_TWSI_SOVR;
> +	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;

Same issue with 10-bit address.

> +	/* Set parameters for extended message (if required) */
> +	set_ext = octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
> +
> +	/* Write msg into FIFO buffer */
> +	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
> +				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
> +	for (int i = 0; i < len; i += 8) {
> +		u64 buf = 0;
> +		/* Place data from msg buf into FIFO, MSB onwards */
> +		for (int j = 7; j >= 0; j--)
> +			buf |= (msgs[1].buf[i + (7 - j)] << (8 * j));

Same issue with unaligned accesses, use get_unaligned_*64().

> +		octeon_i2c_writeq_flush(buf, i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
> +	}
> +	if (set_ext)
> +		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
> +
> +	/* Send command to core (send data in FIFO) */
> +	ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
> +	if (ret)
> +		return ret;
> +
> +	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
> +	if ((cmd & SW_TWSI_R) == 0)
> +		return octeon_i2c_check_status(i2c, false);
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}


-- 
With Best Regards,
Andy Shevchenko



