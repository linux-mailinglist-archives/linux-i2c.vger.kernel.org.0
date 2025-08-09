Return-Path: <linux-i2c+bounces-12177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC3B1F4EF
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 16:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D9B118C25B4
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 14:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D8B2BD5B0;
	Sat,  9 Aug 2025 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cGT0VuML"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329E27CCCD;
	Sat,  9 Aug 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754749734; cv=none; b=sN6N6vs78ua6IyyyzQdRt70nddwhDhZfyJ+WgLUwN5HEycMg93IZ3/x6O9Lx0myCTUv47rBDEVy4+OFZOLTCGYHYN2zPJPGmMJK6pUoyZO31gzz5uqR2pyeutm/Q6PkSRmNBUN6KyGN3UK0vllbpelCENT7C8bTN1g7m3XJtsuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754749734; c=relaxed/simple;
	bh=zKatFJGeuZIGFSJHMaYs6h/cqEPIFBt5YMLKr9HUNNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5Yx2z814z59TD19gXY9SwMHSTrU/t9Q6VDe8N8eERPEEyN/KoKwDNGjTVHcwRWWW9mrP71EsKpy7zMrs+00m09KGskQ3yuaG2uKnG+MdWOABxlvTd4Z+T1zG0wrdvF3wyLjGMwy17Gs7jwp9X6hxQas5IdDyOmsr5aUkVDdlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cGT0VuML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2A7C4CEE7;
	Sat,  9 Aug 2025 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754749733;
	bh=zKatFJGeuZIGFSJHMaYs6h/cqEPIFBt5YMLKr9HUNNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGT0VuMLHWl8brg7PQfVRRf2+2vONqokcN9rhE1kiILcfpeqj/ddmsHLvE68v+08L
	 83/P4rscGJ8rKeH6qyY373LgK0P0infnG7HxppLrV2WqvRDHgJHt54qjlSaiswEia7
	 gcIgKBE7uLEiegVIMwaGvml+PrOpNJdcULyxgjro=
Date: Sat, 9 Aug 2025 16:28:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
Message-ID: <2025080947-stoke-movie-ee4d@gregkh>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809102326.6032-2-hansg@kernel.org>

On Sat, Aug 09, 2025 at 12:23:24PM +0200, Hans de Goede wrote:
> +struct usbio_protver {
> +	uint8_t ver;

Nit, but you do this everywhere.  Kernel types are "u8", not "uint8_t",
that's a userspace C type.  Please use the correct ones when writing
kernel code.


> +} __packed;
> +
> +struct usbio_fwver {
> +	uint8_t major;
> +	uint8_t minor;
> +	uint16_t patch;
> +	uint16_t build;

What is the endian of these u16 variables?

> +/* USBIO Packet Header */
> +struct usbio_packet_header {
> +	uint8_t type;
> +	uint8_t cmd;
> +	uint8_t flags;

Are these crossing the user/kernel boundry?  I think so (same with
above), and so shouldn't they use the proper types (__u8)?

> +} __packed;
> +
> +/* USBIO Control Transfer Packet */
> +struct usbio_ctrl_packet {
> +	struct usbio_packet_header header;
> +	uint8_t len;
> +	uint8_t data[] __counted_by(len);

Same here.

> +} __packed;
> +
> +/* USBIO Bulk Transfer Packet */
> +struct usbio_bulk_packet {
> +	struct usbio_packet_header header;
> +	uint16_t len;

Endian-ness of len?

> +	uint8_t data[] __counted_by(len);
> +} __packed;
> +
> +/* USBIO GPIO commands */
> +enum usbio_gpio_cmd {
> +	USBIO_GPIOCMD_DEINIT,
> +	USBIO_GPIOCMD_INIT,
> +	USBIO_GPIOCMD_READ,
> +	USBIO_GPIOCMD_WRITE,
> +	USBIO_GPIOCMD_END

No specific value of these enums?

> +};
> +
> +/* USBIO GPIO config */
> +enum usbio_gpio_pincfg {
> +	USBIO_GPIO_PINCFG_DEFAULT,
> +	USBIO_GPIO_PINCFG_PULLUP,
> +	USBIO_GPIO_PINCFG_PULLDOWN,
> +	USBIO_GPIO_PINCFG_PUSHPULL

Same here, no specific values?

> +};
> +
> +#define USBIO_GPIO_PINCFG_SHIFT 2
> +#define USBIO_GPIO_PINCFG_MASK (0x3 << USBIO_GPIO_PINCFG_SHIFT)
> +#define USBIO_GPIO_SET_PINCFG(pincfg) \
> +	(((pincfg) << USBIO_GPIO_PINCFG_SHIFT) & USBIO_GPIO_PINCFG_MASK)
> +
> +enum usbio_gpio_pinmode {
> +	USBIO_GPIO_PINMOD_INVAL,
> +	USBIO_GPIO_PINMOD_INPUT,
> +	USBIO_GPIO_PINMOD_OUTPUT,
> +	USBIO_GPIO_PINMOD_MAXVAL

And here?

> +};
> +
> +#define USBIO_GPIO_PINMOD_MASK 0x3
> +#define USBIO_GPIO_SET_PINMOD(pin) (pin & USBIO_GPIO_PINMOD_MASK)
> +
> +/*************************
> + * USBIO GPIO Controller *
> + *************************/
> +
> +#define USBIO_MAX_GPIOBANKS	5
> +#define USBIO_GPIOSPERBANK	32
> +
> +struct usbio_gpio_bank_desc {
> +	uint8_t id;
> +	uint8_t pins;
> +	uint32_t bmap;

endian?

> +} __packed;
> +
> +struct usbio_gpio_init {
> +	u8 bankid;
> +	u8 config;
> +	u8 pincount;
> +	u8 pin;

Now you use "u8"  :)

> +} __packed;
> +
> +struct usbio_gpio_rw {
> +	u8 bankid;
> +	u8 pincount;
> +	u8 pin;
> +	u32 value;

endian?

> +} __packed;
> +
> +/* USBIO I2C commands */
> +enum usbio_i2c_cmd {
> +	USBIO_I2CCMD_UNINIT,
> +	USBIO_I2CCMD_INIT,
> +	USBIO_I2CCMD_READ,
> +	USBIO_I2CCMD_WRITE,
> +	USBIO_I2CCMD_END

No specific values?

> +};
> +
> +/************************
> + * USBIO I2C Controller *
> + ************************/
> +
> +#define USBIO_MAX_I2CBUSES 5
> +
> +#define USBIO_I2C_BUS_ADDR_CAP_10B	BIT(3) /* 10bit address support */
> +#define USBIO_I2C_BUS_MODE_CAP_MASK	0x3
> +#define USBIO_I2C_BUS_MODE_CAP_SM	0 /* Standard Mode */
> +#define USBIO_I2C_BUS_MODE_CAP_FM	1 /* Fast Mode */
> +#define USBIO_I2C_BUS_MODE_CAP_FMP	2 /* Fast Mode+ */
> +#define USBIO_I2C_BUS_MODE_CAP_HSM	3 /* High-Speed Mode */
> +
> +struct usbio_i2c_bus_desc {
> +	uint8_t id;
> +	uint8_t caps;
> +} __packed;
> +
> +struct usbio_i2c_uninit {
> +	u8 busid;
> +	u16 config;
> +} __packed;

You are using both types, again, please make everything "u8" and
friends.

And again, endian?  Same for the rest of this .h file.

thanks,

greg k-h


