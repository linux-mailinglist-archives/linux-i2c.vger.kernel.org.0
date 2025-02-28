Return-Path: <linux-i2c+bounces-9641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF4A497A6
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 11:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB2497A734D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 10:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A5D25F7A9;
	Fri, 28 Feb 2025 10:44:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA9E25D910
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739482; cv=none; b=auMpX14MALzlhoTuAkJ2yRcKmNBnEpLm3hq43Q4dAIUVa7DcUBgxX+Lp1gO54BHh457f6A09bhhTsNbmRwLwNIXO1Fl55RlXFBBCllXJEU4KK/RFVdctog9b4I8066zn3sBqu1GW+X/k5t7/2CtT8E+8lfz25WzKQh3AIXKZ1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739482; c=relaxed/simple;
	bh=SGymLOosT75503bxzdT75ONi/CePYduipW50JwdwV2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSGoQx7CKs5ogLaygPyHfVI41VUrn7orAtCXYZg5tAqDO/CINxfJrTrC4uS3QYJmfS557tYmc2nStoySzTtjwGWvgfafWXJMByyhj9DjQTnZtQwll3S86H6TcDcp5gBASEsen2BvfgRdU7+uvWo4xIl0AZk9kVNRCpiFCj0zgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnxqk-0004De-Uk; Fri, 28 Feb 2025 11:44:10 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnxqk-003HNA-0a;
	Fri, 28 Feb 2025 11:44:10 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id ACB793CE218;
	Fri, 28 Feb 2025 10:44:09 +0000 (UTC)
Date: Fri, 28 Feb 2025 11:44:09 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="om4qtn4a7xgqihlx"
Content-Disposition: inline
In-Reply-To: <20250225081644.3524915-5-a0282524688@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--om4qtn4a7xgqihlx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 25.02.2025 16:16:41, Ming Yu wrote:
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
> @@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) +=3D f81604.o
>  obj-$(CONFIG_CAN_GS_USB) +=3D gs_usb.o
>  obj-$(CONFIG_CAN_KVASER_USB) +=3D kvaser_usb/
>  obj-$(CONFIG_CAN_MCBA_USB) +=3D mcba_usb.o
> +obj-$(CONFIG_CAN_NCT6694) +=3D nct6694_canfd.o
>  obj-$(CONFIG_CAN_PEAK_USB) +=3D peak_usb/
>  obj-$(CONFIG_CAN_UCAN) +=3D ucan.o
> diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nc=
t6694_canfd.c
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
> +	NCT6694_CAN_EVT_ERR_NO_ERROR =3D 0,
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
> +	NCT6694_CAN_EVT_STS_ERROR_ACTIVE =3D 0,
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
> +static inline struct nct6694_can_priv *rx_offload_to_priv(struct can_rx_=
offload *offload)
> +{
> +	return container_of(offload, struct nct6694_can_priv, offload);
> +}
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_nominal_co=
nst =3D {
> +	.name =3D DRVNAME,
> +	.tseg1_min =3D 2,
> +	.tseg1_max =3D 256,
> +	.tseg2_min =3D 2,
> +	.tseg2_max =3D 128,
> +	.sjw_max =3D 128,
> +	.brp_min =3D 1,
> +	.brp_max =3D 511,
> +	.brp_inc =3D 1,
> +};
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_data_const=
 =3D {
> +	.name =3D DRVNAME,
> +	.tseg1_min =3D 1,
> +	.tseg1_max =3D 32,
> +	.tseg2_min =3D 1,
> +	.tseg2_max =3D 16,
> +	.sjw_max =3D 16,
> +	.brp_min =3D 1,
> +	.brp_max =3D 31,
> +	.brp_inc =3D 1,
> +};
> +
> +static void nct6694_can_rx_offload(struct can_rx_offload *offload,
> +				   struct sk_buff *skb)
> +{
> +	struct nct6694_can_priv *priv =3D rx_offload_to_priv(offload);
> +	int ret;
> +
> +	ret =3D can_rx_offload_queue_tail(offload, skb);
> +	if (ret)
> +		priv->ndev->stats.rx_fifo_errors++;
> +}
> +
> +static void nct6694_can_handle_lost_msg(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");

Please make it a netdev_dbg()

> +
> +	stats->rx_errors++;
> +	stats->rx_over_errors++;
> +
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +	if (!skb)
> +		return;
> +
> +	cf->can_id |=3D CAN_ERR_CRTL;
> +	cf->data[1] =3D CAN_ERR_CRTL_RX_OVERFLOW;
> +
> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_frame *frame =3D &priv->rx;
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CAN_MOD,
> +		.cmd =3D NCT6694_CAN_RECEIVE,
> +		.sel =3D NCT6694_CAN_RECEIVE_SEL(ndev->dev_port, 1),
> +		.len =3D cpu_to_le16(sizeof(*frame))
> +	};
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> +	if (ret)
> +		return;
> +
> +	if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {
> +		struct canfd_frame *cfd;
> +
> +		skb =3D alloc_canfd_skb(priv->ndev, &cfd);
> +		if (!skb)

stats->rx_dropped++;

> +			return;
> +
> +		cfd->can_id =3D le32_to_cpu(frame->id);
> +		cfd->len =3D canfd_sanitize_len(frame->length);
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cfd->can_id |=3D CAN_EFF_FLAG;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> +			cfd->flags |=3D CANFD_BRS;
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> +			cfd->flags |=3D CANFD_ESI;
> +
> +		memcpy(cfd->data, frame->data, cfd->len);
> +	} else {
> +		struct can_frame *cf;
> +
> +		skb =3D alloc_can_skb(priv->ndev, &cf);
> +		if (!skb)

stats->rx_dropped++;

> +			return;
> +
> +		cf->can_id =3D le32_to_cpu(frame->id);
> +		cf->len =3D can_cc_dlc2len(frame->length);
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +			cf->can_id |=3D CAN_EFF_FLAG;
> +
> +		if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> +			cf->can_id |=3D CAN_RTR_FLAG;
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
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	*bec =3D priv->bec;
> +
> +	return 0;
> +}
> +
> +static void nct6694_can_handle_state_change(struct net_device *ndev,
> +					    enum can_state new_state)
> +{

I just replied to one of your questions of the last series:

| https://lore.kernel.org/20250228-magic-seahorse-of-abracadabra-f2a402-mkl=
@pengutronix.de

> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct can_berr_counter bec;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +
> +	nct6694_can_get_berr_counter(ndev, &bec);
> +
> +	switch (new_state) {
> +	case CAN_STATE_ERROR_ACTIVE:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> +		if (cf)
> +			cf->data[1] |=3D CAN_ERR_CRTL_ACTIVE;
> +		break;
> +	case CAN_STATE_ERROR_WARNING:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state =3D CAN_STATE_ERROR_WARNING;
> +		if (cf) {
> +			cf->can_id |=3D CAN_ERR_CRTL;
> +			if (bec.txerr > bec.rxerr)
> +				cf->data[1] =3D CAN_ERR_CRTL_TX_WARNING;
> +			else
> +				cf->data[1] =3D CAN_ERR_CRTL_RX_WARNING;
> +			cf->data[6] =3D bec.txerr;
> +			cf->data[7] =3D bec.rxerr;
> +		}
> +		break;
> +	case CAN_STATE_ERROR_PASSIVE:
> +		priv->can.can_stats.error_passive++;
> +		priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
> +		if (cf) {
> +			cf->can_id |=3D CAN_ERR_CRTL;
> +			cf->data[1] |=3D CAN_ERR_CRTL_RX_PASSIVE;
> +			if (bec.txerr >=3D CAN_ERROR_PASSIVE_THRESHOLD)
> +				cf->data[1] |=3D CAN_ERR_CRTL_TX_PASSIVE;
> +			cf->data[6] =3D bec.txerr;
> +			cf->data[7] =3D bec.rxerr;
> +		}
> +		break;
> +	case CAN_STATE_BUS_OFF:
> +		priv->can.state =3D CAN_STATE_BUS_OFF;
> +		priv->can.can_stats.bus_off++;
> +		if (cf)
> +			cf->can_id |=3D CAN_ERR_BUSOFF;

no need for can_free_echo_skb() and netif_stop_queue()

> +		can_free_echo_skb(ndev, 0, NULL);
> +		netif_stop_queue(ndev);

> +		can_bus_off(ndev);
> +		break;
> +	default:
> +		break;
> +	}
> +

if (skb)

> +	nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_handle_state_errors(struct net_device *ndev, u8 =
status)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	if (status =3D=3D NCT6694_CAN_EVT_STS_ERROR_ACTIVE &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_ACTIVE) {
> +		netdev_dbg(ndev, "Error, entered active state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_ACTIVE);
> +	}
> +
> +	if (status =3D=3D NCT6694_CAN_EVT_STS_WARNING &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_WARNING) {
> +		netdev_dbg(ndev, "Error, entered warning state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_WARNING);
> +	}
> +
> +	if (status =3D=3D NCT6694_CAN_EVT_STS_ERROR_PASSIVE &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_PASSIVE) {
> +		netdev_dbg(ndev, "Error, entered passive state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_ERROR_PASSIVE);
> +	}
> +
> +	if (status =3D=3D NCT6694_CAN_EVT_STS_BUS_OFF &&
> +	    priv->can.state !=3D CAN_STATE_BUS_OFF) {
> +		netdev_dbg(ndev, "Error, entered bus-off state\n");
> +		nct6694_can_handle_state_change(ndev, CAN_STATE_BUS_OFF);
> +	}
> +}
> +
> +static void nct6694_can_handle_bus_err(struct net_device *ndev, u8 bus_e=
rr)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	if (bus_err =3D=3D NCT6694_CAN_EVT_ERR_NO_ERROR)
> +		return;
> +
> +	priv->can.can_stats.bus_error++;
> +
> +	skb =3D alloc_can_err_skb(ndev, &cf);

make it: "if (cf)" instead of "if (skb)" then interacting with the "cf".

> +	if (skb)
> +		cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> +
> +	switch (bus_err) {
> +	case NCT6694_CAN_EVT_ERR_CRC_ERROR:
> +		netdev_dbg(ndev, "CRC error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[3] |=3D CAN_ERR_PROT_LOC_CRC_SEQ;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_STUFF_ERROR:
> +		netdev_dbg(ndev, "Stuff error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_ACK_ERROR:
> +		netdev_dbg(ndev, "Ack error\n");
> +		ndev->stats.tx_errors++;
> +		if (skb) {
> +			cf->can_id |=3D CAN_ERR_ACK;
> +			cf->data[2] |=3D CAN_ERR_PROT_TX;
> +		}
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_FORM_ERROR:
> +		netdev_dbg(ndev, "Form error\n");
> +		ndev->stats.rx_errors++;
> +		if (skb)
> +			cf->data[2] |=3D CAN_ERR_PROT_FORM;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ERR_BIT_ERROR:
> +		netdev_dbg(ndev, "Bit error\n");
> +		ndev->stats.tx_errors++;
> +		if (skb)
> +			cf->data[2] |=3D CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
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
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +
> +	stats->tx_bytes +=3D can_rx_offload_get_echo_skb_queue_tail(&priv->offl=
oad,
> +								  0, NULL);
> +	stats->tx_packets++;
> +	netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_can_irq(int irq, void *data)
> +{
> +	struct net_device *ndev =3D data;
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_event *event =3D &priv->event[ndev->dev_port];
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CAN_MOD,
> +		.cmd =3D NCT6694_CAN_EVENT,
> +		.sel =3D NCT6694_CAN_EVENT_SEL(ndev->dev_port, NCT6694_CAN_EVENT_MASK),
> +		.len =3D cpu_to_le16(sizeof(priv->event))
> +	};
> +	irqreturn_t handled =3D IRQ_NONE;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
> +	if (ret < 0)
> +		return handled;
> +
> +	if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> +		nct6694_can_rx(ndev, event->rx_evt);

just for symmetry name rename nct6694_can_rx() to nct6694_can_handle_rx()

> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> +		nct6694_can_handle_lost_msg(ndev);
> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->status) {
> +		nct6694_can_handle_state_errors(ndev, event->status);

I think you should call nct6694_can_handle_state_change() directly and
get rid of the code on nct6694_can_handle_state_errors().

> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> +		nct6694_can_handle_bus_err(ndev, event->err);
> +		handled =3D IRQ_HANDLED;
> +	}

The logic needs to be refined. If there was an IRQ you must say you've
handled it, event if user space doesn't care for bus errors.

The better solution is to disabled event->err related IRQs in the
hardware, if CAN_CTRLMODE_BERR_REPORTING is disabled, so you don't get
an IRQ in the first place.

        if (event->err !=3D NCT6694_CAN_EVT_ERR_NO_ERROR) {
                if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
                        nct6694_can_handle_bus_err(ndev, event->err);
		handled =3D IRQ_HANDLED;
        }

> +
> +	if (event->tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY) {
> +		nct6694_can_tx_irq(ndev);

just for symmetry name rename nct6694_can_tx() to nct6694_can_handle_tx()

> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (handled)
> +		can_rx_offload_threaded_irq_finish(&priv->offload);
> +
> +	priv->bec.rxerr =3D event->rec;
> +	priv->bec.txerr =3D event->tec;
> +
> +	return handled;
> +}
> +
> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_can_priv *priv =3D container_of(work,
> +						     struct nct6694_can_priv,
> +						     tx_work);
> +	struct nct6694_can_frame *frame =3D &priv->tx;
> +	struct net_device *ndev =3D priv->ndev;
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct sk_buff *skb =3D priv->can.echo_skb[0];
> +	static const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CAN_MOD,
> +		.cmd =3D NCT6694_CAN_DELIVER,
> +		.sel =3D NCT6694_CAN_DELIVER_SEL(1),
> +		.len =3D cpu_to_le16(sizeof(*frame))
> +	};
> +	u32 txid;
> +	int err;
> +
> +	memset(frame, 0, sizeof(*frame));
> +
> +	frame->tag =3D NCT6694_CAN_FRAME_TAG(ndev->dev_port);
> +
> +	if (can_is_canfd_skb(skb)) {
> +		struct canfd_frame *cfd =3D (struct canfd_frame *)skb->data;
> +
> +		if (cfd->flags & CANFD_BRS)
> +			frame->flag |=3D NCT6694_CAN_FRAME_FLAG_BRS;
> +
> +		if (cfd->can_id & CAN_EFF_FLAG) {
> +			txid =3D cfd->can_id & CAN_EFF_MASK;
> +			frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> +		} else {
> +			txid =3D cfd->can_id & CAN_SFF_MASK;
> +		}
> +		frame->flag |=3D NCT6694_CAN_FRAME_FLAG_FD;
> +		frame->id =3D cpu_to_le32(txid);
> +		frame->length =3D cfd->len;

frame->length =3D canfd_sanitize_len(cfd->len);

> +
> +		memcpy(frame->data, cfd->data, cfd->len);

memcpy(frame->data, cfd->data, frame->length);

> +	} else {
> +		struct can_frame *cf =3D (struct can_frame *)skb->data;
> +
> +		if (cf->can_id & CAN_EFF_FLAG) {
> +			txid =3D cf->can_id & CAN_EFF_MASK;
> +			frame->flag |=3D NCT6694_CAN_FRAME_FLAG_EFF;
> +		} else {
> +			txid =3D cf->can_id & CAN_SFF_MASK;
> +		}
> +
> +		if (cf->can_id & CAN_RTR_FLAG)
> +			frame->flag |=3D NCT6694_CAN_FRAME_FLAG_RTR;
> +		else
> +			memcpy(frame->data, cf->data, cf->len);
> +
> +		frame->id =3D cpu_to_le32(txid);
> +		frame->length =3D cf->len;
> +	}
> +
> +	err =3D nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> +	if (err) {
> +		netdev_err(ndev, "%s: TX FIFO is full!\n", __func__);

The FIFO should not be full at this time. There also could be an USB
error due to unlug or EMI. I think you should remove this error message.

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
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
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
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> +	const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> +	struct nct6694_can_setting *setting __free(kfree) =3D NULL;
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CAN_MOD,
> +		.cmd =3D NCT6694_CAN_SETTING,
> +		.sel =3D ndev->dev_port,
> +		.len =3D cpu_to_le16(sizeof(*setting))
> +	};
> +	int ret;
> +
> +	setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> +	if (!setting)
> +		return -ENOMEM;
> +
> +	setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> +	setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_MON);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_NISO);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_LBCK);
> +
> +	ret =3D nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> +	if (ret)
> +		return ret;
> +
> +	priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_stop(struct net_device *ndev)

static void

> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY;

As Vincent already pointed out, bring you device into listen only mode.
Please add a comment why you do it, because it cannot be stopped.

> +	netif_stop_queue(ndev);
> +	free_irq(ndev->irq, ndev);
> +	destroy_workqueue(priv->wq);
> +	can_rx_offload_disable(&priv->offload);
> +	priv->can.state =3D CAN_STATE_STOPPED;
> +	close_candev(ndev);
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode m=
ode)
> +{
> +	int ret;
> +
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		ret =3D nct6694_can_start(ndev);

if (ret)
        return ret;

netif_wake_queue(ndev);

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
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	int ret;
> +
> +	ret =3D open_candev(ndev);
> +	if (ret)
> +		return ret;
> +
> +	can_rx_offload_enable(&priv->offload);
> +
> +	ret =3D request_threaded_irq(ndev->irq, NULL,
> +				   nct6694_can_irq, IRQF_ONESHOT,
> +				   "nct6694_can", ndev);
> +	if (ret) {
> +		netdev_err(ndev, "Failed to request IRQ\n");
> +		goto close_candev;
> +	}
> +
> +	priv->wq =3D alloc_ordered_workqueue("%s-nct6694_wq",
> +					   WQ_FREEZABLE | WQ_MEM_RECLAIM,
> +					   ndev->name);
> +	if (!priv->wq) {
> +		ret =3D -ENOMEM;
> +		goto free_irq;
> +	}
> +
> +	ret =3D nct6694_can_start(ndev);
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
> +static const struct net_device_ops nct6694_can_netdev_ops =3D {
> +	.ndo_open =3D nct6694_can_open,
> +	.ndo_stop =3D nct6694_can_stop,
> +	.ndo_start_xmit =3D nct6694_can_start_xmit,
> +	.ndo_change_mtu =3D can_change_mtu,
> +};
> +
> +static const struct ethtool_ops nct6694_can_ethtool_ops =3D {
> +	.get_ts_info =3D ethtool_op_get_ts_info,
> +};
> +
> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> +{
> +	struct nct6694_can_information *info __free(kfree) =3D NULL;
> +	static const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CAN_MOD,
> +		.cmd =3D NCT6694_CAN_INFORMATION,
> +		.sel =3D NCT6694_CAN_INFORMATION_SEL,
> +		.len =3D cpu_to_le16(sizeof(*info))
> +	};
> +	int ret, can_clk;
> +
> +	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> +	if (ret)
> +		return ret;
> +
> +	can_clk =3D le32_to_cpu(info->can_clk);
> +
> +	return can_clk;
> +}
> +
> +static int nct6694_can_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> +	struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_can_priv *priv;
> +	struct net_device *ndev;
> +	int ret, irq, can_clk;
> +
> +	irq =3D irq_create_mapping(nct6694->domain,
> +				 NCT6694_IRQ_CAN0 + cell->id);
> +	if (!irq)
> +		return irq;
> +
> +	ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->irq =3D irq;
> +	ndev->flags |=3D IFF_ECHO;
> +	ndev->dev_port =3D cell->id;
> +	ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> +	ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
> +
> +	priv =3D netdev_priv(ndev);
> +	priv->nct6694 =3D nct6694;
> +	priv->ndev =3D ndev;
> +
> +	can_clk =3D nct6694_can_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret =3D dev_err_probe(&pdev->dev, can_clk,
> +				    "Failed to get clock\n");
> +		goto free_candev;
> +	}
> +
> +	INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +	priv->can.state =3D CAN_STATE_STOPPED;

please remove CAN_STATE_STOPPED, it's not needed

> +	priv->can.clock.freq =3D can_clk;
> +	priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_const;
> +	priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_const;
> +	priv->can.do_set_mode =3D nct6694_can_set_mode;
> +	priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> +	priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> +		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> +		CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;

Does your device run in CAN-FD mode all the time? If so, please use
can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supported
and remove CAN_CTRLMODE_FD from ctrlmode_supported.

> +
> +	ret =3D can_rx_offload_add_manual(ndev, &priv->offload,
> +					NCT6694_NAPI_WEIGHT);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
> +		goto free_candev;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> +
> +	ret =3D register_candev(priv->ndev);
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
> +	struct nct6694_can_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	unregister_candev(priv->ndev);
> +	can_rx_offload_del(&priv->offload);
> +	free_candev(priv->ndev);
> +}
> +
> +static struct platform_driver nct6694_can_driver =3D {
> +	.driver =3D {
> +		.name	=3D DRVNAME,
> +	},
> +	.probe		=3D nct6694_can_probe,
> +	.remove		=3D nct6694_can_remove,
> +};
> +
> +module_platform_driver(nct6694_can_driver);
> +
> +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-can");

There should be no need for the module alias.

Marc

> --
> 2.34.1
>
>
>

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--om4qtn4a7xgqihlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfBk3YACgkQDHRl3/mQ
kZyG4QgAhLUT2dkUBVj7TAtiH9c82LlEhGjEJpyPjneARhOL2iwvJnOtA4xc4Dap
zbySCXeQFu6nV9nspclIsvMtBZgBKpm7t1xC1i4DU3Cm4bIV4EWnikDbDTRxfnwQ
N4PS2EEVu7dlDY10nnvtwtxwll4t7lavhs5KfKUNaM0NYBM/DVc9C6tl1n6fPgsk
diVXI8i33AUGgaQPm3W/J4H3nGTs2KiNiip2YfvTDCWthHliOuRkZRcaLVaKG+I7
PekVC2YE9thJy9KIfsOzgQ8U/hZUKuppftPg0H10mNOn6u8DU1t4ADXk1ezcfk64
Nsed+50Jz2po2bkT+Dt06LycgqL5cQ==
=vWpe
-----END PGP SIGNATURE-----

--om4qtn4a7xgqihlx--

