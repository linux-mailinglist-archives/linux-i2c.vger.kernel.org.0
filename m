Return-Path: <linux-i2c+bounces-8771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 571739FD5D4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 17:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EF9E3A35FF
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 16:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C712C1F7570;
	Fri, 27 Dec 2024 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XwcwFryn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24EE27721;
	Fri, 27 Dec 2024 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735315751; cv=none; b=pedlSUOEy97s4wk1PpbdTC8cN2ekVa7tBPS5XdQi7NwdUCwPzl5XL7SsKCoAFjTaUsZClCn5Oo5zL1eOPWxg6j5ccU4mzcqPWwWRohegiTWDtPmTKFi5YSmA7qPFLM7+I18pB4suSR2mgAwWbI66WwRQV0EfugDUMqOBv1nakAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735315751; c=relaxed/simple;
	bh=oOZEqt+Z2qeMcTtoDKsT7b8ufRqLI6A8C1DvR7fPR0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwP75JUdxdUAfxn5qAR0Fl+eMVUEqhEnLJJtrBuhBsIZFHAyURJfOZkGXdBFqts6fDbhB4HOen+nUC6taijtVuBNm3Y0hk++gsvgEoamru93QgYrdVUbgCetYDY3FdTttqyEDBp1AIgeKEsPnTcOYvZ6nKWYMcXGXzrbRe07otY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=XwcwFryn; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id RCkUtUnUQoTrQRCkZtB0Qb; Fri, 27 Dec 2024 16:59:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735315197;
	bh=wbtDrdURyeLdMewCTUbb2ZGKwu+nbx0ZyZyIHZ1nxvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=XwcwFrynltqfF+JsdV+VpxxB5LPD7I27GUPACuWplreB6nN763yM7EtIJsg6nhEdf
	 FCieWTcecsEMa1THkuwxYBtSpw5jrn3tJT+WudAYlW1sHHNI7dNXEo1bgG2POf+SBG
	 c/DvGSwojblEceR438fHlPMWkP/TfuF7bIUi3dUPtO3SxtL5MLVYZH6cMRgHaVkSLZ
	 hRUdgen361pV7iEI2lL3zT1tkIY2iKpT56kTc84Zh953RAnAJQzMPaSj0L/UmRKfvt
	 Chrp8I92de/UMhQy4Njq2SxycglfZj3RhJaBHZnzl/kOu2+TJrdBTDpVqqZQy/n4ST
	 YWrtGAmm8vC0g==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Dec 2024 16:59:57 +0100
X-ME-IP: 124.33.176.97
Message-ID: <a25ea362-142f-4e27-8194-787d9829f607@wanadoo.fr>
Date: Sat, 28 Dec 2024 00:59:38 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-5-a0282524688@gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <20241227095727.2401257-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2024 at 18:57, Ming Yu wrote:
> This driver supports Socket CANfd functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/net/can/Kconfig         |  10 +
>  drivers/net/can/Makefile        |   1 +
>  drivers/net/can/nct6694_canfd.c | 826 ++++++++++++++++++++++++++++++++
>  4 files changed, 838 insertions(+)
>  create mode 100644 drivers/net/can/nct6694_canfd.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d63542233c4..b961c4827648 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16729,6 +16729,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
> +F:	drivers/net/can/nct6694_canfd.c
>  F:	include/linux/mfd/nct6694.h
>  
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
> index cf989bea9aa3..130e98ec28a5 100644
> --- a/drivers/net/can/Kconfig
> +++ b/drivers/net/can/Kconfig
> @@ -200,6 +200,16 @@ config CAN_SUN4I
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called sun4i_can.
>  
> +config CAN_NCT6694
> +	tristate "Nuvoton NCT6694 Socket CANfd support"
> +	depends on MFD_NCT6694
> +	help
> +	  If you say yes to this option, support will be included for Nuvoton
> +	  NCT6694, a USB device to socket CANfd controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nct6694_canfd.
> +
>  config CAN_TI_HECC
>  	depends on ARM
>  	tristate "TI High End CAN Controller"
> diff --git a/drivers/net/can/Makefile b/drivers/net/can/Makefile
> index a71db2cfe990..4a6b5b9d6c2b 100644
> --- a/drivers/net/can/Makefile
> +++ b/drivers/net/can/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CAN_JANZ_ICAN3)	+= janz-ican3.o
>  obj-$(CONFIG_CAN_KVASER_PCIEFD)	+= kvaser_pciefd.o
>  obj-$(CONFIG_CAN_MSCAN)		+= mscan/
>  obj-$(CONFIG_CAN_M_CAN)		+= m_can/
> +obj-$(CONFIG_CAN_NCT6694)	+= nct6694_canfd.o
>  obj-$(CONFIG_CAN_PEAK_PCIEFD)	+= peak_canfd/
>  obj-$(CONFIG_CAN_SJA1000)	+= sja1000/
>  obj-$(CONFIG_CAN_SUN4I)		+= sun4i_can.o
> diff --git a/drivers/net/can/nct6694_canfd.c b/drivers/net/can/nct6694_canfd.c
> new file mode 100644
> index 000000000000..94cfff288c14
> --- /dev/null
> +++ b/drivers/net/can/nct6694_canfd.c
> @@ -0,0 +1,826 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
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
> +#define DRVNAME "nct6694-can"
> +
> +/*
> + * USB command module type for NCT6694 CANfd controller.
> + * This defines the module type used for communication with the NCT6694
> + * CANfd controller over the USB interface.
> + */
> +#define NCT6694_CAN_MOD			0x05
> +
> +/* Command 00h - CAN Setting and Initialization */
> +#define NCT6694_CAN_SETTING(idx)	(idx ? 0x0100 : 0x0000)	/* CMD|SEL */
> +#define NCT6694_CAN_SETTING_CTRL1_MON	BIT(0)
> +#define NCT6694_CAN_SETTING_CTRL1_NISO	BIT(1)
> +#define NCT6694_CAN_SETTING_CTRL1_LBCK	BIT(2)
> +
> +/* Command 01h - CAN Information */
> +#define NCT6694_CAN_INFORMATION		0x0001	/* CMD|SEL */
> +
> +/* Command 02h - CAN Event */
> +#define NCT6694_CAN_EVENT(idx, mask)	\
> +	((((idx ? 0x80 : 0x00) |	\
> +	((mask) & 0xFF)) << 8) | 0x02)	/* CMD|SEL */
> +#define NCT6694_CAN_EVENT_ERR		BIT(0)
> +#define NCT6694_CAN_EVENT_STATUS	BIT(1)
> +#define NCT6694_CAN_EVENT_TX_EVT	BIT(2)
> +#define NCT6694_CAN_EVENT_RX_EVT	BIT(3)
> +#define NCT6694_CAN_EVENT_REC		BIT(4)
> +#define NCT6694_CAN_EVENT_TEC		BIT(5)
> +#define NCT6694_CAN_EVENT_MASK          GENMASK(3, 0)
> +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY	BIT(7)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_LOST	BIT(5)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_HALF_FULL	BIT(6)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_IN	BIT(7)	/* Read-clear*/
> +
> +/* Command 10h - CAN Deliver */
> +#define NCT6694_CAN_DELIVER(buf_cnt)	\
> +	((((buf_cnt) & 0xFF) << 8) | 0x10)	/* CMD|SEL */
> +
> +/* Command 11h - CAN Receive */
> +#define NCT6694_CAN_RECEIVE(idx, buf_cnt)	\
> +	((((idx ? 0x80 : 0x00) |		\
> +	((buf_cnt) & 0xFF)) << 8) | 0x11)	/* CMD|SEL */
> +
> +#define NCT6694_CAN_FRAME_TAG_CAN0	0xC0
> +#define NCT6694_CAN_FRAME_TAG_CAN1	0xC1
> +#define NCT6694_CAN_FRAME_FLAG_EFF	BIT(0)
> +#define NCT6694_CAN_FRAME_FLAG_RTR	BIT(1)
> +#define NCT6694_CAN_FRAME_FLAG_FD	BIT(2)
> +#define NCT6694_CAN_FRAME_FLAG_BRS	BIT(3)
> +#define NCT6694_CAN_FRAME_FLAG_ERR	BIT(4)
> +
> +#define NCT6694_NAPI_WEIGHT             32
> +
> +enum nct6694_event_err {
> +	NCT6694_CAN_EVT_ERR_NO_ERROR,
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
> +	NCT6694_CAN_EVT_STS_ERROR_ACTIVE,
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
> +struct __packed nct6694_can_event_channel {
> +	u8 err;
> +	u8 status;
> +	u8 tx_evt;
> +	u8 rx_evt;
> +	u8 rec;
> +	u8 tec;
> +	u8 reserved[2];
> +};
> +
> +struct __packed nct6694_can_event {
> +	struct nct6694_can_event_channel evt_ch[2];
> +};

Remove this intermediate struct...

> +struct __packed nct6694_can_frame {
> +	u8 tag;
> +	u8 flag;
> +	u8 reserved;
> +	u8 length;
> +	__le32 id;
> +	u8 data[64];
> +};
> +
> +union nct6694_can_tx {
> +	struct nct6694_can_frame frame;
> +	struct nct6694_can_setting setting;
> +};
> +
> +union nct6694_can_rx {
> +	struct nct6694_can_event event;

... and instead, dircectly declare the array here:

  	struct nct6694_can_event event[2];

> +	struct nct6694_can_frame frame;
> +	struct nct6694_can_information info;
> +};
> +
> +struct nct6694_can_priv {
> +	struct can_priv can;	/* must be the first member */
> +	struct can_rx_offload offload;
> +	struct net_device *ndev;
> +	struct nct6694 *nct6694;
> +	struct mutex lock;
> +	struct sk_buff *tx_skb;
> +	struct workqueue_struct *wq;
> +	struct work_struct tx_work;
> +	union nct6694_can_tx *tx;
> +	union nct6694_can_rx *rx;
> +	unsigned char can_idx;
> +	bool tx_busy;

tx_busy is only set when the network queue is stopped, right? Isn't it
possible to use netif_tx_queue_stopped() instead of tx_busy?

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
> +	struct nct6694_can_frame *frame = &priv->rx->frame;
> +	struct canfd_frame *cfd;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret = nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_RECEIVE(priv->can_idx, 1),
> +			       sizeof(*frame), frame);
> +	if (ret)
> +		return;
> +
> +	if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {
> +		skb = alloc_canfd_skb(priv->ndev, &cfd);
> +		if (!skb)
> +			return;
> +
> +		cfd->can_id = le32_to_cpu(frame->id);
> +		cfd->len = frame->length;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cfd->can_id |= CAN_EFF_FLAG;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> +			cfd->flags |= CANFD_BRS;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> +			cfd->flags |= CANFD_ESI;
> +
> +		memcpy(cfd->data, frame->data, cfd->len);
> +	} else {
> +		skb = alloc_can_skb(priv->ndev, &cf);
> +		if (!skb)
> +			return;
> +
> +		cf->can_id = le32_to_cpu(frame->id);
> +		cf->len = frame->length;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cf->can_id |= CAN_EFF_FLAG;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> +			cf->can_id |= CAN_RTR_FLAG;
> +
> +		memcpy(cf->data, frame->data, cf->len);
> +	}
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_clean(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	if (priv->tx_skb || priv->tx_busy)
> +		ndev->stats.tx_errors++;
> +	dev_kfree_skb(priv->tx_skb);
> +	if (priv->tx_busy)
> +		can_free_echo_skb(priv->ndev, 0, NULL);
> +	priv->tx_skb = NULL;
> +	priv->tx_busy = false;
> +}
> +
> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> +					struct can_berr_counter *bec)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_event *evt = &priv->rx->event;
> +	u8 mask = NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret = nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_EVENT(priv->can_idx, mask),
> +			       sizeof(*evt),
> +			       evt);
> +	if (ret < 0)
> +		return ret;
> +
> +	bec->rxerr = evt->evt_ch[priv->can_idx].rec;
> +	bec->txerr = evt->evt_ch[priv->can_idx].tec;
> +
> +	return 0;
> +}
> +
> +static void nct6694_can_handle_state_change(struct net_device *ndev,
> +					    u8 status)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	enum can_state new_state = priv->can.state;
> +	enum can_state rx_state, tx_state;
> +	struct can_berr_counter bec;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	nct6694_can_get_berr_counter(ndev, &bec);
> +	can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
> +
> +	if (status & NCT6694_CAN_EVT_STS_BUS_OFF)
> +		new_state = CAN_STATE_BUS_OFF;
> +	else if (status & NCT6694_CAN_EVT_STS_ERROR_PASSIVE)
> +		new_state = CAN_STATE_ERROR_PASSIVE;
> +	else if (status & NCT6694_CAN_EVT_STS_WARNING)
> +		new_state = CAN_STATE_ERROR_WARNING;
> +
> +	/* state hasn't changed */
> +	if (new_state == priv->can.state)
> +		return;
> +
> +	skb = alloc_can_err_skb(ndev, &cf);
> +
> +	tx_state = bec.txerr >= bec.rxerr ? new_state : 0;
> +	rx_state = bec.txerr <= bec.rxerr ? new_state : 0;
> +	can_change_state(ndev, cf, tx_state, rx_state);
> +
> +	if (new_state == CAN_STATE_BUS_OFF) {
> +		can_bus_off(ndev);
> +	} else if (skb) {
> +		cf->can_id |= CAN_ERR_CNT;
> +		cf->data[6] = bec.txerr;
> +		cf->data[7] = bec.rxerr;
> +	}
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_handle_bus_err(struct net_device *ndev, u8 bus_err)
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

Aren't you missing something here? You are populating a can frame but
you are returning without using it.

> +}
> +
> +static void nct6694_can_tx_irq(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct net_device_stats *stats = &ndev->stats;
> +
> +	guard(mutex)(&priv->lock);
> +	stats->tx_bytes += can_get_echo_skb(ndev, 0, NULL);
> +	stats->tx_packets++;
> +	priv->tx_busy = false;
> +	netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_can_irq(int irq, void *data)
> +{
> +	struct net_device *ndev = data;
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_event *evt = &priv->rx->event;
> +	u8 tx_evt, rx_evt, bus_err, can_status;
> +	u8 mask_sts = NCT6694_CAN_EVENT_MASK;
> +	irqreturn_t handled = IRQ_NONE;
> +	int can_idx = priv->can_idx;
> +	int ret;
> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret = nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				       NCT6694_CAN_EVENT(can_idx, mask_sts),
> +				       sizeof(*evt), evt);
> +		if (ret < 0)
> +			return handled;
> +
> +		tx_evt = evt->evt_ch[can_idx].tx_evt;
> +		rx_evt = evt->evt_ch[can_idx].rx_evt;
> +		bus_err = evt->evt_ch[can_idx].err;
> +		can_status = evt->evt_ch[can_idx].status;
> +	}
> +
> +	if (rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> +		nct6694_can_rx(ndev, rx_evt);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> +		nct6694_can_handle_lost_msg(ndev);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (can_status) {
> +		nct6694_can_handle_state_change(ndev, can_status);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> +		nct6694_handle_bus_err(ndev, bus_err);
> +		handled = IRQ_HANDLED;
> +	}
> +
> +	if (handled)
> +		can_rx_offload_threaded_irq_finish(&priv->offload);
> +
> +	if (tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY)
> +		nct6694_can_tx_irq(ndev);
> +
> +	return handled;
> +}
> +
> +static void nct6694_can_tx(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_frame *frame = &priv->tx->frame;
> +	struct net_device_stats *stats = &ndev->stats;
> +	struct sk_buff *skb = priv->tx_skb;
> +	struct canfd_frame *cfd;
> +	struct can_frame *cf;
> +	u32 txid;
> +	int err;
> +
> +	memset(frame, 0, sizeof(*frame));
> +
> +	if (priv->can_idx == 0)
> +		frame->tag = NCT6694_CAN_FRAME_TAG_CAN0;
> +	else
> +		frame->tag = NCT6694_CAN_FRAME_TAG_CAN1;
> +
> +	if (can_is_canfd_skb(skb)) {
> +		cfd = (struct canfd_frame *)priv->tx_skb->data;
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
> +		cf = (struct can_frame *)priv->tx_skb->data;
> +
> +		if (cf->can_id & CAN_RTR_FLAG)
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_RTR;
> +
> +		if (cf->can_id & CAN_EFF_FLAG) {
> +			txid = cf->can_id & CAN_EFF_MASK;
> +			frame->flag |= NCT6694_CAN_FRAME_FLAG_EFF;
> +		} else {
> +			txid = cf->can_id & CAN_SFF_MASK;
> +		}
> +		frame->id = cpu_to_le32(txid);
> +		frame->length = cf->len;
> +
> +		memcpy(frame->data, cf->data, cf->len);

Don't copy the payload if the frame is a remote frame.

> +		}
	^^^^^^^^

Bad indentation. Did you run script/checkpatch.pl before sending?

> +	err = nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				NCT6694_CAN_DELIVER(1),
> +				sizeof(*frame),
> +				frame);
> +	if (err) {
> +		netdev_err(ndev, "%s: Tx FIFO full!\n", __func__);
> +		can_free_echo_skb(ndev, 0, NULL);
> +		stats->tx_dropped++;
> +		stats->tx_errors++;
> +		netif_wake_queue(ndev);
> +	}
> +}
> +
> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_can_priv *priv = container_of(work,
> +						     struct nct6694_can_priv,
> +						     tx_work);
> +	struct net_device *ndev = priv->ndev;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	if (priv->tx_skb) {
> +		if (priv->can.state == CAN_STATE_BUS_OFF) {
> +			nct6694_can_clean(ndev);
> +		} else {
> +			nct6694_can_tx(ndev);
> +			can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> +			priv->tx_busy = true;
> +			priv->tx_skb = NULL;
> +		}
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
> +	if (priv->tx_skb || priv->tx_busy) {
> +		netdev_err(ndev, "hard_xmit called while tx busy\n");
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	netif_stop_queue(ndev);
> +	priv->tx_skb = skb;
> +	queue_work(priv->wq, &priv->tx_work);
> +
> +	return NETDEV_TX_OK;
> +}
> +
> +static int nct6694_can_start(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +	struct nct6694_can_setting *setting = &priv->tx->setting;
> +	const struct can_bittiming *n_bt = &priv->can.bittiming;
> +	const struct can_bittiming *d_bt = &priv->can.data_bittiming;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	memset(setting, 0, sizeof(*setting));
> +	setting->nbr = cpu_to_le32(n_bt->bitrate);
> +	setting->dbr = cpu_to_le32(d_bt->bitrate);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_MON);
> +
> +	if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
> +	    priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_NISO);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +		setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_LBCK);
> +
> +	ret = nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				NCT6694_CAN_SETTING(priv->can_idx),
> +				sizeof(*setting), setting);
> +	if (ret)
> +		return ret;
> +
> +	priv->can.state = CAN_STATE_ERROR_ACTIVE;
> +
> +	return ret;
> +}
> +
> +static int nct6694_can_stop(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +	netif_stop_queue(ndev);
> +	free_irq(ndev->irq, ndev);
> +	destroy_workqueue(priv->wq);
> +	priv->wq = NULL;
> +	nct6694_can_clean(ndev);
> +	priv->can.state = CAN_STATE_STOPPED;
> +	can_rx_offload_disable(&priv->offload);
> +	close_candev(ndev);
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode mode)
> +{
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		nct6694_can_clean(ndev);
> +		nct6694_can_start(ndev);
> +		netif_wake_queue(ndev);
> +		break;

Nitpick: here, directly return 0...

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;

... and then remove that line.

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
> +	priv->tx_skb = NULL;
> +	priv->tx_busy = false;
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
> +	struct nct6694_can_information *info = &priv->rx->info;
> +	int ret;
> +
> +	ret = nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_INFORMATION,
> +			       sizeof(*info),
> +			       info);
> +	if (ret)
> +		return ret;
> +
> +	return le32_to_cpu(info->can_clk);
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
> +				 NCT6694_IRQ_CAN1 + cell->id);
> +	if (!irq)
> +		return irq;
> +
> +	ndev = alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->irq = irq;
> +	ndev->flags |= IFF_ECHO;
> +	ndev->netdev_ops = &nct6694_can_netdev_ops;
> +	ndev->ethtool_ops = &nct6694_can_ethtool_ops;
> +
> +	priv = netdev_priv(ndev);
> +	priv->nct6694 = nct6694;
> +	priv->ndev = ndev;
> +
> +	priv->tx = devm_kzalloc(&pdev->dev, sizeof(union nct6694_can_tx),
> +				GFP_KERNEL);
> +	if (!priv->tx) {
> +		ret = -ENOMEM;
> +		goto free_candev;
> +	}
> +
> +	priv->rx = devm_kzalloc(&pdev->dev, sizeof(union nct6694_can_rx),
> +				GFP_KERNEL);
> +	if (!priv->rx) {
> +		ret = -ENOMEM;
> +		goto free_candev;
> +	}
> +
> +	can_clk = nct6694_can_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret = dev_err_probe(&pdev->dev, can_clk,
> +				    "Failed to get clock\n");
> +		goto free_candev;
> +	}
> +
> +	devm_mutex_init(&pdev->dev, &priv->lock);
> +	INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +	priv->can_idx = cell->id;
> +	priv->can.state = CAN_STATE_STOPPED;
> +	priv->can.clock.freq = can_clk;
> +	priv->can.bittiming_const = &nct6694_can_bittiming_nominal_const;
> +	priv->can.data_bittiming_const = &nct6694_can_bittiming_data_const;
> +	priv->can.do_set_mode = nct6694_can_set_mode;
> +	priv->can.do_get_berr_counter = nct6694_can_get_berr_counter;
> +
> +	priv->can.ctrlmode = CAN_CTRLMODE_FD;
> +
> +	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK		|
> +				       CAN_CTRLMODE_LISTENONLY		|
> +				       CAN_CTRLMODE_FD			|
> +				       CAN_CTRLMODE_FD_NON_ISO		|
> +				       CAN_CTRLMODE_BERR_REPORTING;
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
> +		goto del_rx_offload;
> +
> +	return 0;
> +
> +del_rx_offload:
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
> +	cancel_work_sync(&priv->tx_work);
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

