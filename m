Return-Path: <linux-i2c+bounces-9602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0CA4720B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 03:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8393AE743
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 02:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB2517A316;
	Thu, 27 Feb 2025 02:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pClGECZk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-68.smtpout.orange.fr [193.252.22.68])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1424270036;
	Thu, 27 Feb 2025 02:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622720; cv=none; b=hZSRYUDXSb7RC2wRZfIYCWo/3XjdY1qQfW+f+SL+9cQliM2Txut4GIeNb3+0F3SOnLPHuylzt3eYl51c/WosgYkKZue2OQo4E67eFs9G+L+o4iyoV5cPWfAXCCPfLhpQq3Xt3+A3+m5s4B06gCFrkOQgnOkERrfV+rsQ2vx+9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622720; c=relaxed/simple;
	bh=1ok2CRn8wgcKSOYs4gy4dBv5RGzdk0qcTzlZPx/kUvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1ZivEiPSF/rYu8+n9jIZZrMryv3bsd7J2ZCIGV6NIWHodmHMgvoineCIl78weyMTH8ylPAudfOwgC+Kgv5D7iZ4vFrRgoQVl5Bs/qmqvX3kQw2+Ej0EnEdOyusIch4A1bOhxGeBiquO43SwhG7k7o+Gc2wQhxaFVMnXmevKJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=pClGECZk; arc=none smtp.client-ip=193.252.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id nTKVtwEWM4iG7nTKatwVYC; Thu, 27 Feb 2025 03:09:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740622149;
	bh=RBtngAkH0gSdkSr+m+r60iagsmr30/D5qwoGDoVtYWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=pClGECZkxdeAQKHIjwwpO7MyjaEeM2OD44ENikf0bMjCOqTMaGeypKYoYj9+1vXJG
	 aqi4vvgOpc7MrBjtwtsxjNy60/tMxrWqoSRLSK3UULa/vJqOjrMWKpelBy2EE479P4
	 W+/qiG+S7uiQ6mWbcbFeBu9yjQNTqv64c8edHH6lSZM8wj6APFSJvJug/1y5DpoQcy
	 e1/tPo5LUicBLSNwe1MES5nRL5ddlKn47LF9qKlHc1FJk44JKurg/r7chdpYO1ReXi
	 Bi92w/Ec3gKPsGHnv2bDuep+yXY6yi89n9nPYGJhdy3ZO95kUda76c6u/PSpl3ZzLV
	 NaIcSLKqTpnbg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 27 Feb 2025 03:09:09 +0100
X-ME-IP: 124.33.176.97
Message-ID: <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
Date: Thu, 27 Feb 2025 11:08:50 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250225081644.3524915-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ming,

Thanks for the v8. There are a few last things you need to fix. These
are my last comments, so if all of these are addressed, I will give you
my reviewed-by tag in the v9.

On 25/02/2025 at 17:16, Ming Yu wrote:
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/net/can/usb/Kconfig         |  11 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 799 ++++++++++++++++++++++++++++
>  4 files changed, 812 insertions(+)
>  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1327e7a6e507..8aa611504172 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16925,6 +16925,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
> +F:	drivers/net/can/usb/nct6694_canfd.c
>  F:	include/linux/mfd/nct6694.h
>  
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
> index 9dae0c71a2e1..759e724a67cf 100644
> --- a/drivers/net/can/usb/Kconfig
> +++ b/drivers/net/can/usb/Kconfig
> @@ -133,6 +133,17 @@ config CAN_MCBA_USB
>  	  This driver supports the CAN BUS Analyzer interface
>  	  from Microchip (http://www.microchip.com/development-tools/).
>  
> +config CAN_NCT6694
> +	tristate "Nuvoton NCT6694 Socket CANfd support"
> +	depends on MFD_NCT6694
> +	select CAN_RX_OFFLOAD
> +	help
> +	  If you say yes to this option, support will be included for Nuvoton
> +	  NCT6694, a USB device to socket CANfd controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nct6694_canfd.
> +
>  config CAN_PEAK_USB
>  	tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
>  	help
> diff --git a/drivers/net/can/usb/Makefile b/drivers/net/can/usb/Makefile
> index 8b11088e9a59..fcafb1ac262e 100644
> --- a/drivers/net/can/usb/Makefile
> +++ b/drivers/net/can/usb/Makefile
> @@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) += f81604.o
>  obj-$(CONFIG_CAN_GS_USB) += gs_usb.o
>  obj-$(CONFIG_CAN_KVASER_USB) += kvaser_usb/
>  obj-$(CONFIG_CAN_MCBA_USB) += mcba_usb.o
> +obj-$(CONFIG_CAN_NCT6694) += nct6694_canfd.o
>  obj-$(CONFIG_CAN_PEAK_USB) += peak_usb/
>  obj-$(CONFIG_CAN_UCAN) += ucan.o
> diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
> new file mode 100644
> index 000000000000..d97fce5cdf32
> --- /dev/null
> +++ b/drivers/net/can/usb/nct6694_canfd.c
> @@ -0,0 +1,799 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/can/dev.h>
> +#include <linux/can/rx-offload.h>
> +#include <linux/ethtool.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/platform_device.h>
> +
> +#define DRVNAME "nct6694_canfd"
> +
> +/* USB command module type for NCT6694 CANfd controller.
> + * This defines the module type used for communication with the NCT6694
> + * CANfd controller over the USB interface.
> + */
> +#define NCT6694_CAN_MOD			0x05
> +
> +/* Command 00h - CAN Setting and Initialization */
> +#define NCT6694_CAN_SETTING		0x00
> +#define NCT6694_CAN_SETTING_CTRL1_MON	BIT(0)
> +#define NCT6694_CAN_SETTING_CTRL1_NISO	BIT(1)
> +#define NCT6694_CAN_SETTING_CTRL1_LBCK	BIT(2)
> +
> +/* Command 01h - CAN Information */
> +#define NCT6694_CAN_INFORMATION		0x01
> +#define NCT6694_CAN_INFORMATION_SEL	0x00
> +
> +/* Command 02h - CAN Event */
> +#define NCT6694_CAN_EVENT		0x02
> +#define NCT6694_CAN_EVENT_SEL(idx, mask)	\
> +	((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
> +
> +#define NCT6694_CAN_EVENT_MASK		GENMASK(5, 0)
> +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY	BIT(7)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_LOST	BIT(5)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_IN	BIT(7)	/* Read-clear*/
> +
> +/* Command 10h - CAN Deliver */
> +#define NCT6694_CAN_DELIVER		0x10
> +#define NCT6694_CAN_DELIVER_SEL(buf_cnt)	\
> +	((buf_cnt) & 0xFF)
> +
> +/* Command 11h - CAN Receive */
> +#define NCT6694_CAN_RECEIVE		0x11
> +#define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)	\
> +	((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
> +
> +#define NCT6694_CAN_FRAME_TAG(idx)	(0xC0 | (idx))
> +#define NCT6694_CAN_FRAME_FLAG_EFF	BIT(0)
> +#define NCT6694_CAN_FRAME_FLAG_RTR	BIT(1)
> +#define NCT6694_CAN_FRAME_FLAG_FD	BIT(2)
> +#define NCT6694_CAN_FRAME_FLAG_BRS	BIT(3)
> +#define NCT6694_CAN_FRAME_FLAG_ERR	BIT(4)
> +
> +#define NCT6694_NAPI_WEIGHT		32
> +
> +enum nct6694_event_err {
> +	NCT6694_CAN_EVT_ERR_NO_ERROR = 0,
> +	NCT6694_CAN_EVT_ERR_CRC_ERROR,
> +	NCT6694_CAN_EVT_ERR_STUFF_ERROR,
> +	NCT6694_CAN_EVT_ERR_ACK_ERROR,
> +	NCT6694_CAN_EVT_ERR_FORM_ERROR,
> +	NCT6694_CAN_EVT_ERR_BIT_ERROR,
> +	NCT6694_CAN_EVT_ERR_TIMEOUT_ERROR,
> +	NCT6694_CAN_EVT_ERR_UNKNOWN_ERROR,
> +};
> +
> +enum nct6694_event_status {
> +	NCT6694_CAN_EVT_STS_ERROR_ACTIVE = 0,
> +	NCT6694_CAN_EVT_STS_ERROR_PASSIVE,
> +	NCT6694_CAN_EVT_STS_BUS_OFF,
> +	NCT6694_CAN_EVT_STS_WARNING,
> +};
> +
> +struct __packed nct6694_can_setting {
> +	__le32 nbr;
> +	__le32 dbr;
> +	u8 active;
> +	u8 reserved[3];
> +	__le16 ctrl1;
> +	__le16 ctrl2;
> +	__le32 nbtp;
> +	__le32 dbtp;
> +};
> +
> +struct __packed nct6694_can_information {
> +	u8 tx_fifo_cnt;
> +	u8 rx_fifo_cnt;
> +	u8 reserved[2];
> +	__le32 can_clk;
> +};
> +
> +struct __packed nct6694_can_event {
> +	u8 err;
> +	u8 status;
> +	u8 tx_evt;
> +	u8 rx_evt;
> +	u8 rec;
> +	u8 tec;
> +	u8 reserved[2];
> +};
> +
> +struct __packed nct6694_can_frame {
> +	u8 tag;
> +	u8 flag;
> +	u8 reserved;
> +	u8 length;
> +	__le32 id;
> +	u8 data[CANFD_MAX_DLEN];
> +};
> +
> +struct nct6694_can_priv {
> +	struct can_priv can;	/* must be the first member */
> +	struct can_rx_offload offload;
> +	struct net_device *ndev;
> +	struct nct6694 *nct6694;
> +	struct workqueue_struct *wq;
> +	struct work_struct tx_work;
> +	struct nct6694_can_frame tx;
> +	struct nct6694_can_frame rx;
> +	struct nct6694_can_event event[2];
> +	struct can_berr_counter bec;
> +};
> +
> +static inline struct nct6694_can_priv *rx_offload_to_priv(struct can_rx_offload *offload)
> +{
> +	return container_of(offload, struct nct6694_can_priv, offload);
> +}
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_nominal_const = {
> +	.name = DRVNAME,
> +	.tseg1_min = 2,
> +	.tseg1_max = 256,
> +	.tseg2_min = 2,
> +	.tseg2_max = 128,
> +	.sjw_max = 128,
> +	.brp_min = 1,
> +	.brp_max = 511,
> +	.brp_inc = 1,
> +};
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_data_const = {
> +	.name = DRVNAME,
> +	.tseg1_min = 1,
> +	.tseg1_max = 32,
> +	.tseg2_min = 1,
> +	.tseg2_max = 16,
> +	.sjw_max = 16,
> +	.brp_min = 1,
> +	.brp_max = 31,
> +	.brp_inc = 1,
> +};
> +
> +static void nct6694_can_rx_offload(struct can_rx_offload *offload,
> +				   struct sk_buff *skb)
> +{
> +	struct nct6694_can_priv *priv = rx_offload_to_priv(offload);
> +	int ret;
> +
> +	ret = can_rx_offload_queue_tail(offload, skb);
> +	if (ret)
> +		priv->ndev->stats.rx_fifo_errors++;
> +}
> +
> +static void nct6694_can_handle_lost_msg(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct net_device_stats *stats = &ndev->stats;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");
> +
> +	stats->rx_errors++;
> +	stats->rx_over_errors++;
> +
> +	skb = alloc_can_err_skb(ndev, &cf);
> +	if (!skb)
> +		return;
> +
> +	cf->can_id |= CAN_ERR_CRTL;
> +	cf->data[1] = CAN_ERR_CRTL_RX_OVERFLOW;
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_frame *frame = &priv->rx;
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_RECEIVE,
> +		.sel = NCT6694_CAN_RECEIVE_SEL(ndev->dev_port, 1),
> +		.len = cpu_to_le16(sizeof(*frame))
> +	};
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> +	if (ret)
> +		return;
> +
> +	if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {
> +		struct canfd_frame *cfd;
> +
> +		skb = alloc_canfd_skb(priv->ndev, &cfd);
> +		if (!skb)
> +			return;
> +
> +		cfd->can_id = le32_to_cpu(frame->id);
> +		cfd->len = canfd_sanitize_len(frame->length);
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cfd->can_id |= CAN_EFF_FLAG;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> +			cfd->flags |= CANFD_BRS;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> +			cfd->flags |= CANFD_ESI;
> +
> +		memcpy(cfd->data, frame->data, cfd->len);
> +	} else {
> +		struct can_frame *cf;
> +
> +		skb = alloc_can_skb(priv->ndev, &cf);
> +		if (!skb)
> +			return;
> +
> +		cf->can_id = le32_to_cpu(frame->id);
> +		cf->len = can_cc_dlc2len(frame->length);
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cf->can_id |= CAN_EFF_FLAG;
> +
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> +			cf->can_id |= CAN_RTR_FLAG;
> +		else
> +			memcpy(cf->data, frame->data, cf->len);
> +	}
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> +					struct can_berr_counter *bec)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	*bec = priv->bec;
> +
> +	return 0;
> +}
> +
> +static void nct6694_can_handle_state_change(struct net_device *ndev,
> +					    enum can_state new_state)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct can_berr_counter bec;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	skb = alloc_can_err_skb(ndev, &cf);
> +
> +	nct6694_can_get_berr_counter(ndev, &bec);
> +
> +	switch (new_state) {
> +	case CAN_STATE_ERROR_ACTIVE:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state = CAN_STATE_ERROR_ACTIVE;
> +		if (cf)

Set the CAN_ER_CRTL flag:

		if (cf) {
			cf->can_id |= CAN_ERR_CRTL;
			cf->data[1] |= CAN_ERR_CRTL_ACTIVE;
		}

> +			cf->data[1] |= CAN_ERR_CRTL_ACTIVE;
> +		break;
> +	case CAN_STATE_ERROR_WARNING:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state = CAN_STATE_ERROR_WARNING;
> +		if (cf) {
> +			cf->can_id |= CAN_ERR_CRTL;

Set the CAN_ERR_CNT flag when you populate cf->data[6] and cf->data[7]:

			cf->can_id |= CAN_ERR_CRTL | CAN_ERR_CNT;

> +			if (bec.txerr > bec.rxerr)
> +				cf->data[1] = CAN_ERR_CRTL_TX_WARNING;
> +			else
> +				cf->data[1] = CAN_ERR_CRTL_RX_WARNING;
> +			cf->data[6] = bec.txerr;
> +			cf->data[7] = bec.rxerr;
> +		}
> +		break;
> +	case CAN_STATE_ERROR_PASSIVE:
> +		priv->can.can_stats.error_passive++;
> +		priv->can.state = CAN_STATE_ERROR_PASSIVE;
> +		if (cf) {
> +			cf->can_id |= CAN_ERR_CRTL;

Set the CAN_ERR_CNT flag when you populate cf->data[6] and cf->data[7]:

			cf->can_id |= CAN_ERR_CRTL | CAN_ERR_CNT;

> +			cf->data[1] |= CAN_ERR_CRTL_RX_PASSIVE;
> +			if (bec.txerr >= CAN_ERROR_PASSIVE_THRESHOLD)
> +				cf->data[1] |= CAN_ERR_CRTL_TX_PASSIVE;
> +			cf->data[6] = bec.txerr;
> +			cf->data[7] = bec.rxerr;
> +		}
> +		break;
> +	case CAN_STATE_BUS_OFF:
> +		priv->can.state = CAN_STATE_BUS_OFF;
> +		priv->can.can_stats.bus_off++;
> +		if (cf)
> +			cf->can_id |= CAN_ERR_BUSOFF;
> +		can_free_echo_skb(ndev, 0, NULL);
> +		netif_stop_queue(ndev);> +		can_bus_off(ndev);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_handle_state_errors(struct net_device *ndev, u8 status)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	if (status == NCT6694_CAN_EVT_STS_ERROR_ACTIVE &&
> +	    priv->can.state != CAN_STATE_ERROR_ACTIVE) {
> +		netdev_dbg(ndev, "Error, entered active state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_ACTIVE);
> +	}
> +
> +	if (status == NCT6694_CAN_EVT_STS_WARNING &&
> +	    priv->can.state != CAN_STATE_ERROR_WARNING) {
> +		netdev_dbg(ndev, "Error, entered warning state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_WARNING);
> +	}
> +
> +	if (status == NCT6694_CAN_EVT_STS_ERROR_PASSIVE &&
> +	    priv->can.state != CAN_STATE_ERROR_PASSIVE) {
> +		netdev_dbg(ndev, "Error, entered passive state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_PASSIVE);
> +	}
> +
> +	if (status == NCT6694_CAN_EVT_STS_BUS_OFF &&
> +	    priv->can.state != CAN_STATE_BUS_OFF) {
> +		netdev_dbg(ndev, "Error, entered bus-off state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_BUS_OFF);
> +	}
> +}
> +
> +static void nct6694_can_handle_bus_err(struct net_device *ndev, u8 bus_err)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	if (bus_err == NCT6694_CAN_EVT_ERR_NO_ERROR)
> +		return;
> +
> +	priv->can.can_stats.bus_error++;
> +
> +	skb = alloc_can_err_skb(ndev, &cf);
> +	if (skb)
> +		cf->can_id |= CAN_ERR_PROT | CAN_ERR_BUSERROR;
> +
> +	switch (bus_err) {
> +	case NCT6694_CAN_EVT_ERR_CRC_ERROR:
> +		netdev_dbg(ndev, "CRC error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_STUFF_ERROR:
> +		netdev_dbg(ndev, "Stuff error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[2] |= CAN_ERR_PROT_STUFF;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_ACK_ERROR:
> +		netdev_dbg(ndev, "Ack error\n");
> +		ndev->stats.tx_errors++;
> +		if (skb) {
> +			cf->can_id |= CAN_ERR_ACK;
> +			cf->data[2] |= CAN_ERR_PROT_TX;
> +		}
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_FORM_ERROR:
> +		netdev_dbg(ndev, "Form error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[2] |= CAN_ERR_PROT_FORM;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_BIT_ERROR:
> +		netdev_dbg(ndev, "Bit error\n");
> +		ndev->stats.tx_errors++;
> +		if (skb)
> +			cf->data[2] |= CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	if (skb)
> +		nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_tx_irq(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct net_device_stats *stats = &ndev->stats;
> +
> +	stats->tx_bytes += can_rx_offload_get_echo_skb_queue_tail(&priv->offload,
> +								  0, NULL);
> +	stats->tx_packets++;
> +	netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_can_irq(int irq, void *data)
> +{
> +	struct net_device *ndev = data;
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);> +	struct nct6694_can_event *event = &priv->event[ndev->dev_port];
> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_EVENT,
> +		.sel = NCT6694_CAN_EVENT_SEL(ndev->dev_port, NCT6694_CAN_EVENT_MASK),
> +		.len = cpu_to_le16(sizeof(priv->event))
> +	};
> +	irqreturn_t handled = IRQ_NONE;
> +	int ret;
> +
> +	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
> +	if (ret < 0)
> +		return handled;
> +
> +	if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> +		nct6694_can_rx(ndev, event->rx_evt);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> +		nct6694_can_handle_lost_msg(ndev);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (event->status) {
> +		nct6694_can_handle_state_errors(ndev, event->status);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> +		nct6694_can_handle_bus_err(ndev, event->err);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (event->tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY) {
> +		nct6694_can_tx_irq(ndev);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (handled)
> +		can_rx_offload_threaded_irq_finish(&priv->offload);
> +
> +	priv->bec.rxerr = event->rec;
> +	priv->bec.txerr = event->tec;
> +
> +	return handled;
> +}
> +
> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_can_priv *priv = container_of(work,
> +						     struct nct6694_can_priv,
> +						     tx_work);
> +	struct nct6694_can_frame *frame = &priv->tx;
> +	struct net_device *ndev = priv->ndev;
> +	struct net_device_stats *stats = &ndev->stats;
> +	struct sk_buff *skb = priv->can.echo_skb[0];
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_DELIVER,
> +		.sel = NCT6694_CAN_DELIVER_SEL(1),
> +		.len = cpu_to_le16(sizeof(*frame))
> +	};
> +	u32 txid;
> +	int err;
> +
> +	memset(frame, 0, sizeof(*frame));
> +
> +	frame->tag = NCT6694_CAN_FRAME_TAG(ndev->dev_port);
> +
> +	if (can_is_canfd_skb(skb)) {
> +		struct canfd_frame *cfd = (struct canfd_frame *)skb->data;
> +
> +		if (cfd->flags & CANFD_BRS)
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_BRS;
> +
> +		if (cfd->can_id & CAN_EFF_FLAG) {
> +			txid = cfd->can_id & CAN_EFF_MASK;
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_EFF;
> +		} else {
> +			txid = cfd->can_id & CAN_SFF_MASK;
> +		}
> +		frame->flag |= NCT6694_CAN_FRAME_FLAG_FD;
> +		frame->id = cpu_to_le32(txid);
> +		frame->length = cfd->len;
> +
> +		memcpy(frame->data, cfd->data, cfd->len);
> +	} else {
> +		struct can_frame *cf = (struct can_frame *)skb->data;
> +
> +		if (cf->can_id & CAN_EFF_FLAG) {
> +			txid = cf->can_id & CAN_EFF_MASK;
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_EFF;
> +		} else {
> +			txid = cf->can_id & CAN_SFF_MASK;
> +		}
> +
> +		if (cf->can_id & CAN_RTR_FLAG)
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_RTR;
> +		else
> +			memcpy(frame->data, cf->data, cf->len);
> +
> +		frame->id = cpu_to_le32(txid);
> +		frame->length = cf->len;
> +	}
> +
> +	err = nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> +	if (err) {
> +		netdev_err(ndev, "%s: TX FIFO is full!\n", __func__);
> +		can_free_echo_skb(ndev, 0, NULL);
> +		stats->tx_dropped++;
> +		stats->tx_errors++;
> +		netif_wake_queue(ndev);
> +	}
> +}
> +
> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> +					  struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	if (can_dev_dropped_skb(ndev, skb))
> +		return NETDEV_TX_OK;
> +
> +	netif_stop_queue(ndev);
> +	can_put_echo_skb(skb, ndev, 0, 0);
> +	queue_work(priv->wq, &priv->tx_work);
> +
> +	return NETDEV_TX_OK;
> +}
> +
> +static int nct6694_can_start(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	const struct can_bittiming *d_bt = &priv->can.data_bittiming;
> +	const struct can_bittiming *n_bt = &priv->can.bittiming;
> +	struct nct6694_can_setting *setting __free(kfree) = NULL;> +	const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_SETTING,
> +		.sel = ndev->dev_port,
> +		.len = cpu_to_le16(sizeof(*setting))
> +	};
> +	int ret;
> +
> +	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
> +	if (!setting)
> +		return -ENOMEM;
> +
> +	setting->nbr = cpu_to_le32(n_bt->bitrate);
> +	setting->dbr = cpu_to_le32(d_bt->bitrate);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_MON);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_NISO);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_LBCK);
> +
> +	ret = nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> +	if (ret)
> +		return ret;
> +
> +	priv->can.state = CAN_STATE_ERROR_ACTIVE;
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_stop(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	priv->can.ctrlmode = CAN_CTRLMODE_LISTENONLY;

Hmmm, when Marc asked you to put the device in listen only mode, I think
he meant that you set it on the device side (i.e. flag
NCT6694_CAN_SETTING_CTRL1_MON) and not on the driver side. If you set
CAN_CTRLMODE_LISTENONLY flag, that will be reported in the netlink
interface. So you should not change that flag.

But before that, did you check the datasheet? Don't you have a device
flag to actually turn the device off (e.g. sleep mode)?

> +	netif_stop_queue(ndev);
> +	free_irq(ndev->irq, ndev);
> +	destroy_workqueue(priv->wq);
> +	can_rx_offload_disable(&priv->offload);
> +	priv->can.state = CAN_STATE_STOPPED;
> +	close_candev(ndev);
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode mode)
> +{
> +	int ret;
> +
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		ret = nct6694_can_start(ndev);
> +		if (!ret && netif_queue_stopped(ndev))
> +			netif_wake_queue(ndev);
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static int nct6694_can_open(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	int ret;
> +
> +	ret = open_candev(ndev);
> +	if (ret)
> +		return ret;
> +
> +	can_rx_offload_enable(&priv->offload);
> +
> +	ret = request_threaded_irq(ndev->irq, NULL,
> +				   nct6694_can_irq, IRQF_ONESHOT,
> +				   "nct6694_can", ndev);
> +	if (ret) {
> +		netdev_err(ndev, "Failed to request IRQ\n");
> +		goto close_candev;
> +	}
> +
> +	priv->wq = alloc_ordered_workqueue("%s-nct6694_wq",
> +					   WQ_FREEZABLE | WQ_MEM_RECLAIM,
> +					   ndev->name);
> +	if (!priv->wq) {
> +		ret = -ENOMEM;
> +		goto free_irq;
> +	}
> +
> +	ret = nct6694_can_start(ndev);
> +	if (ret)
> +		goto destroy_wq;
> +
> +	netif_start_queue(ndev);
> +
> +	return 0;
> +
> +destroy_wq:
> +	destroy_workqueue(priv->wq);
> +free_irq:
> +	free_irq(ndev->irq, ndev);
> +close_candev:
> +	can_rx_offload_disable(&priv->offload);
> +	close_candev(ndev);
> +	return ret;
> +}
> +
> +static const struct net_device_ops nct6694_can_netdev_ops = {
> +	.ndo_open = nct6694_can_open,
> +	.ndo_stop = nct6694_can_stop,
> +	.ndo_start_xmit = nct6694_can_start_xmit,
> +	.ndo_change_mtu = can_change_mtu,
> +};
> +
> +static const struct ethtool_ops nct6694_can_ethtool_ops = {
> +	.get_ts_info = ethtool_op_get_ts_info,
> +};
> +
> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> +{
> +	struct nct6694_can_information *info __free(kfree) = NULL;
> +	static const struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_INFORMATION,
> +		.sel = NCT6694_CAN_INFORMATION_SEL,
> +		.len = cpu_to_le16(sizeof(*info))
> +	};
> +	int ret, can_clk;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> +	if (ret)
> +		return ret;
> +
> +	can_clk = le32_to_cpu(info->can_clk);
> +
> +	return can_clk;
> +}
> +
> +static int nct6694_can_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell = mfd_get_cell(pdev);
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_can_priv *priv;
> +	struct net_device *ndev;
> +	int ret, irq, can_clk;
> +
> +	irq = irq_create_mapping(nct6694->domain,
> +				 NCT6694_IRQ_CAN0 + cell->id);
> +	if (!irq)
> +		return irq;
> +
> +	ndev = alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->irq = irq;
> +	ndev->flags |= IFF_ECHO;
> +	ndev->dev_port = cell->id;
> +	ndev->netdev_ops = &nct6694_can_netdev_ops;
> +	ndev->ethtool_ops = &nct6694_can_ethtool_ops;
> +
> +	priv = netdev_priv(ndev);
> +	priv->nct6694 = nct6694;
> +	priv->ndev = ndev;
> +
> +	can_clk = nct6694_can_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret = dev_err_probe(&pdev->dev, can_clk,
> +				    "Failed to get clock\n");
> +		goto free_candev;
> +	}
> +
> +	INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +	priv->can.state = CAN_STATE_STOPPED;

Marc asked you to remove this line during the v7 review.

> +	priv->can.clock.freq = can_clk;
> +	priv->can.bittiming_const = &nct6694_can_bittiming_nominal_const;
> +	priv->can.data_bittiming_const = &nct6694_can_bittiming_data_const;
> +	priv->can.do_set_mode = nct6694_can_set_mode;
> +	priv->can.do_get_berr_counter = nct6694_can_get_berr_counter;
> +	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
> +		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> +		CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> +
> +	ret = can_rx_offload_add_manual(ndev, &priv->offload,
> +					NCT6694_NAPI_WEIGHT);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
> +		goto free_candev;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> +
> +	ret = register_candev(priv->ndev);
> +	if (ret)
> +		goto rx_offload_del;
> +
> +	return 0;
> +
> +rx_offload_del:
> +	can_rx_offload_del(&priv->offload);
> +free_candev:
> +	free_candev(ndev);
> +	return ret;
> +}
> +
> +static void nct6694_can_remove(struct platform_device *pdev)
> +{
> +	struct nct6694_can_priv *priv = platform_get_drvdata(pdev);
> +
> +	unregister_candev(priv->ndev);
> +	can_rx_offload_del(&priv->offload);
> +	free_candev(priv->ndev);
> +}
> +
> +static struct platform_driver nct6694_can_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
> +	},
> +	.probe		= nct6694_can_probe,
> +	.remove		= nct6694_can_remove,
> +};
> +
> +module_platform_driver(nct6694_can_driver);
> +
> +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-can");


Yours sincerely,
Vincent Mailhol


