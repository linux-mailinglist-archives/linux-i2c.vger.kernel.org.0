Return-Path: <linux-i2c+bounces-11127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0020AC1F28
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 11:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B28C7B9DA9
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92332236F0;
	Fri, 23 May 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO2S6mFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812391487FE;
	Fri, 23 May 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990935; cv=none; b=YHUnk2879VhpB0Zm7Gs5daDywvLYqr6K37ZVLk2hDHMAd+HJlmK1lndOtGMwZvv2xAkQxRP3f/Khz6bdQGaIPuLD5owkjU3wy2GQ4pSa0FkyBoLpgOpdzd7yuaKE881+rtzJawXgMRHp0pkkN6uSCBQ5c0JyvYdjYBocNbRaB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990935; c=relaxed/simple;
	bh=Dzl9IFdwpkzphmorX3MPHRaZcbXOQp1myGl9QI6CyzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrQR9hbNDmdFuHA1utNBLezAhpPdv6XmxmAHrzUvCnMg2hL6NYJ3naEKykRCGUmDM25JvOVpH/jPQptAtnvE5YI1P6AQ7WmFOYTs90uanNNmaciljnWesxWxg9UJPBzubcGVspzdYpb9/li4Fazkd9ht4h2WztetJAY6wpwwg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO2S6mFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1FEC4CEE9;
	Fri, 23 May 2025 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990934;
	bh=Dzl9IFdwpkzphmorX3MPHRaZcbXOQp1myGl9QI6CyzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO2S6mFSwXeblGzqX9iEYu9fX0ncmNGLIrqWngvPyBmhDg3Wkz0+Fn5khZb5Q30uC
	 IkiYUrP61FOr9UY6lBXWKuob9jj4Ze7Q1Tjj1oh/plV08Hf7nMW4jVJ/7t7IgPl5H7
	 GvFhns9q1gjfpLXQysVyBIcRKHs+b1BjgOCG+VxCyJ6G/IGQnPN5Ami366qNjzS70u
	 mCuddrf7E3vWwhhCMB52hNWRuEw6QHoEstzq6D4FlACW4ROqjkzqQcFmkfQP7RQey9
	 u+fKW6YF0YH5sTWU+r74CBgmDq7g/NCOt+kvc6J3fqVLA/XWTZY+xRhUy33NVUJAoC
	 nPSFhZg41q1Lg==
Date: Fri, 23 May 2025 10:02:07 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v11 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250523090207.GD1378991@google.com>
References: <20250520020355.3885597-1-tmyu0@nuvoton.com>
 <20250520020355.3885597-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520020355.3885597-2-tmyu0@nuvoton.com>

On Tue, 20 May 2025, a0282524688@gmail.com wrote:

> From: Ming Yu <tmyu0@nuvoton.com>
> 
> The Nuvoton NCT6694 provides an USB interface to the host to
> access its features.
> 
> Sub-devices can use the USB functions nct6694_read_msg() and
> nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
> 
> Changes since version 10:
> - Add change log for the patch
> - Fix mfd_cell to MFD_CELL_NAME()
> - Remove unnecessary blank line
> 
> Changes since version 9:
> - Add KernelDoc to exported functions
> 
> Changes since version 8:
> - Modify the signed-off-by with my work address
> - Rename all MFD cell names to "nct6694-xxx"
> - Fix some comments in nct6694.c and in nct6694.h
> 
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> 
> Changes since version 6:
> 
> Changes since version 5:
> - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> - Drop unnecessary macros
> 
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> 
> Changes since version 3:
> - Modify array buffer to structure
> - Fix defines and comments
> - Add header <linux/bits.h> and use BIT macro
> - Modify mutex_init() to devm_mutex_init()
> 
> Changes since version 2:
> 
> Changes since version 1:
> - Implement IRQ domain to handle IRQ demux
> - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API
> - Add command structure
> - Fix USB functions
> - Sort each driver's header files alphabetically
> 
>  MAINTAINERS                 |   6 +
>  drivers/mfd/Kconfig         |  15 ++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 387 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h |  98 +++++++++
>  5 files changed, 508 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h

[...]

I was just going to fix this up for you when I applied the set, but
seeing as it looks like you have to re-submit anyway ...

> +static const struct usb_device_id nct6694_ids[] = {
> +	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00)},

You need a space before the '}'.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +
> +static struct usb_driver nct6694_usb_driver = {
> +	.name		= "nct6694",
> +	.id_table	= nct6694_ids,
> +	.probe		= nct6694_usb_probe,
> +	.disconnect	= nct6694_usb_disconnect,
> +};
> +module_usb_driver(nct6694_usb_driver);
> +
> +MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> new file mode 100644
> index 000000000000..5e172609be3f
> --- /dev/null
> +++ b/include/linux/mfd/nct6694.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 USB transaction and data structure.
> + */
> +
> +#ifndef __MFD_NCT6694_H
> +#define __MFD_NCT6694_H
> +
> +#define NCT6694_VENDOR_ID	0x0416
> +#define NCT6694_PRODUCT_ID	0x200B
> +#define NCT6694_INT_IN_EP	0x81
> +#define NCT6694_BULK_IN_EP	0x02
> +#define NCT6694_BULK_OUT_EP	0x03
> +
> +#define NCT6694_HCTRL_SET	0x40
> +#define NCT6694_HCTRL_GET	0x80
> +
> +#define NCT6694_URB_TIMEOUT	1000
> +
> +enum nct6694_irq_id {
> +	NCT6694_IRQ_GPIO0 = 0,
> +	NCT6694_IRQ_GPIO1,
> +	NCT6694_IRQ_GPIO2,
> +	NCT6694_IRQ_GPIO3,
> +	NCT6694_IRQ_GPIO4,
> +	NCT6694_IRQ_GPIO5,
> +	NCT6694_IRQ_GPIO6,
> +	NCT6694_IRQ_GPIO7,
> +	NCT6694_IRQ_GPIO8,
> +	NCT6694_IRQ_GPIO9,
> +	NCT6694_IRQ_GPIOA,
> +	NCT6694_IRQ_GPIOB,
> +	NCT6694_IRQ_GPIOC,
> +	NCT6694_IRQ_GPIOD,
> +	NCT6694_IRQ_GPIOE,
> +	NCT6694_IRQ_GPIOF,
> +	NCT6694_IRQ_CAN0,
> +	NCT6694_IRQ_CAN1,
> +	NCT6694_IRQ_RTC,
> +	NCT6694_NR_IRQS,
> +};
> +
> +enum nct6694_response_err_status {
> +	NCT6694_NO_ERROR = 0,
> +	NCT6694_FORMAT_ERROR,
> +	NCT6694_RESERVED1,
> +	NCT6694_RESERVED2,
> +	NCT6694_NOT_SUPPORT_ERROR,
> +	NCT6694_NO_RESPONSE_ERROR,
> +	NCT6694_TIMEOUT_ERROR,
> +	NCT6694_PENDING,
> +};
> +
> +struct __packed nct6694_cmd_header {
> +	u8 rsv1;
> +	u8 mod;
> +	union __packed {
> +		__le16 offset;
> +		struct __packed {
> +			u8 cmd;
> +			u8 sel;
> +		};
> +	};
> +	u8 hctrl;
> +	u8 rsv2;
> +	__le16 len;
> +};
> +
> +struct __packed nct6694_response_header {
> +	u8 sequence_id;
> +	u8 sts;
> +	u8 reserved[4];
> +	__le16 len;
> +};
> +
> +union __packed nct6694_usb_msg {
> +	struct nct6694_cmd_header cmd_header;
> +	struct nct6694_response_header response_header;
> +};
> +
> +struct nct6694 {
> +	struct device *dev;
> +	struct irq_domain *domain;
> +	struct mutex access_lock;
> +	struct mutex irq_lock;
> +	struct urb *int_in_urb;
> +	struct usb_device *udev;
> +	union nct6694_usb_msg *usb_msg;
> +	unsigned char *int_buffer;
> +	unsigned int irq_enable;
> +};
> +
> +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
> +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

