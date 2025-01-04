Return-Path: <linux-i2c+bounces-8916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54EA0114E
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 01:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BEED3A48FD
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1277B171A7;
	Sat,  4 Jan 2025 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgU7JcGZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C298493;
	Sat,  4 Jan 2025 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735950869; cv=none; b=MvcxqEne6TxukXM+fB4ocx/AnH8pbVrK8IU/bVVhgJx+iSchoCDgMRFbqWFsM7c/RDGowGCcJOruTg+K4Y9dAjwosXpoc4ZFvtI+bWGjb1UKlUcPp+OGlxegUaUe8tUZ1UqgiRU2VMlW61HlLeqduJf2wXwo+1u5yJRMYl6ipJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735950869; c=relaxed/simple;
	bh=JyOjKY01QW89CaP9/VHAV66mQRhkVQ7WCxYyIWeMNYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/kgSkzmuWj+eGpStdJqZtNl1fqvkM99thjZwaatJkm7Oo4NbvQD+f5a5NIVlBu2WcdwX5W7wRpK6IgmTKPCjxU+xRpSQWDuohv8DtwEtJ/EPrEzdNTB3WLBpM/8cHBLQy8P8vmcy09L93BSJA4zMh6Ofcss0MP3Q5w2Z02+JuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgU7JcGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6301DC4CEDD;
	Sat,  4 Jan 2025 00:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735950869;
	bh=JyOjKY01QW89CaP9/VHAV66mQRhkVQ7WCxYyIWeMNYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgU7JcGZROq6/EaqCU/7jbf21jPsAD09TJzcaUu1RH74OPaBJGcjcTIudvAsv+d5g
	 ys6AfxGPwTH0vIrkfGYz1r/QGx59tL8Kro3m12ZPFMq9I2PPI7wD8FoSVFUX6B1jZU
	 D9lXGgktGn5r/5301AYA+rvcQ2ntbxuIuCAHqHm6sgJDfDl2csYdli3osQDyVnOUOZ
	 Ch7gGzpz+N6s9pC6Py4kKIXeX7r8Lv9zrBDsY3m5N9V2AxdTF/Somg9bO613v0y+yO
	 o2st3LHEb6BQhNJAF5kay3zvbDy5mzYK/taPmGuAftvfMi0wZnZe3uMKvVclhrGnSK
	 zkfTovajh3AKA==
Date: Sat, 4 Jan 2025 01:34:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>

Hi Troy,

sorry for having kept this patch unanswered for so long. I had a
quick look and I have a few comments through the lines.

...

> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca

/ca/can/

> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
> +	  Loading this module will enable the I2C functionality for the K1
> +	  platform dynamically, without requiring a rebuild of the kernel.

This last paragraph contains more information than necessary,
please check other similar cases and keep the same format.

(E.g.: "This driver can also be built as a module.  If so, the
module will be called i2c-ali1563.". People know already what
compiling as module means :-)).

>  config I2C_KEBA
>  	tristate "KEBA I2C controller support"
>  	depends on HAS_IOMEM

...

> +/* spacemit i2c registers */
> +#define ICR          0x0		/* Control Register */
> +#define ISR          0x4		/* Status Register */
> +#define ISAR         0x8		/* Slave Address Register */
> +#define IDBR         0xc		/* Data Buffer Register */
> +#define ILCR         0x10		/* Load Count Register */
> +#define IWCR         0x14		/* Wait Count Register */
> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
> +#define IBMR         0x1c		/* Bus monitor register */
> +#define IWFIFO       0x20		/* Write FIFO Register */
> +#define IWFIFO_WPTR  0x24		/* Write FIFO Write Pointer Register */
> +#define IWFIFO_RPTR  0x28		/* Write FIFO Read Pointer Register */
> +#define IRFIFO       0x2c		/* Read FIFO Register */
> +#define IRFIFO_WPTR  0x30		/* Read FIFO Write Pointer Register */
> +#define IRFIFO_RPTR  0x34		/* Read FIFO Read Pointer Register */

Please do use a prefix for all the defines here, e.g. SPACEMINT_

...

> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		i2c->cur_msg = i2c->msgs + i2c->msg_idx;
> +		i2c->msg_buf = i2c->cur_msg->buf;
> +		i2c->err = 0;
> +		i2c->status = 0;
> +		i2c->unprocessed = i2c->cur_msg->len;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (unlikely(time_left == 0)) {

no need for unlikely here.

> +			dev_alert(i2c->dev, "msg completion timeout\n");

dev_alert is a bit too much, please use dev_err instead.

> +			spacemit_i2c_bus_reset(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}

...

> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +	/*
> +	 * send transaction complete signal:
> +	 * error happens, detect master stop
> +	 */
> +	if (likely(i2c->err || (i2c->status & SR_MSD))) {

I don't see a need for likely here.

> +		/*
> +		 * Here the transaction is already done, we don't need any

...

> +	ret = spacemit_i2c_xfer_msg(i2c);
> +	if (unlikely(ret < 0)) {
> +		dev_dbg(i2c->dev, "i2c transfer error\n");
> +		/* timeout error should not be overridden, and the transfer
> +		 * error will be confirmed by err handle function latter,
> +		 * the reset should be invalid argument error.
> +		 */

Please fix the commenting style (refer to
Documentation/process/coding-style.rst).

Besides, please, do not shorten words (err instead of error), we
are not in urge to save comment space. Please reword this comment
to be understood.

> +		if (ret != -ETIMEDOUT)
> +			ret = -EINVAL;

why do we need to change to -EINVAL? Doesn't seem like a good
practice

> +	}
> +
> +	return ret;
> +}

...

> +	spacemit_i2c_disable(i2c);
> +
> +	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))

is unlikely necessary? What if ret has a different value?

Andi

