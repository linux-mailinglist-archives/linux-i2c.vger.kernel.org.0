Return-Path: <linux-i2c+bounces-8446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 987BE9EC9D4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 11:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E7C169CE8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6E91EC4C2;
	Wed, 11 Dec 2024 10:00:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F141EC4D8
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733911200; cv=none; b=RrZDWNUgN9OfyuqpuIZm80TJ1+sQwFxucpgdxAvw7926JGw5Mvi+fYOPEESB+c9HwksGPYzvsHBTmJZXe+tj7WW3e1JSzbp8FSRUKSG37wwXFcQgigb+E0ZzjSsn4vCMfVe9FGUjYAJI2cJkJkhmJGzJl3jk7MHiz8TnM/PDJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733911200; c=relaxed/simple;
	bh=lPMSInz+hyHK8+kUVb6/LHY3YB9drKR41i1A3iFWjls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfsioRO6wvHwJlTzVPO9qft1K1tCfDXu5y7FDZPon5CVtZWC0B+GRScN0m29ykOCf27zP6oF3SBNrFzsH9CHwTzwERUrEEpNwCNvwTKvNuQ3qu3LTL2JXlvd+z0rvjxOefVpNaQAiOweJNlm/qBvYa1bCCJcFUEyb8UVhcc8H2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tLJUw-0001lF-QZ; Wed, 11 Dec 2024 10:59:14 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tLJUs-002qAd-1q;
	Wed, 11 Dec 2024 10:59:11 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E268238B647;
	Wed, 11 Dec 2024 09:59:10 +0000 (UTC)
Date: Wed, 11 Dec 2024 10:59:10 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
Message-ID: <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlxqjspgd3gasp7d"
Content-Disposition: inline
In-Reply-To: <20241210104524.2466586-5-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--qlxqjspgd3gasp7d
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
MIME-Version: 1.0

On 10.12.2024 18:45:21, Ming Yu wrote:
> This driver supports Socket CANfd functionality for NCT6694 MFD
> device based on USB interface.

Please use the rx-offload helper, otherwise the CAN frames might be
revived out of order.

>=20
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/net/can/Kconfig         |  10 +
>  drivers/net/can/Makefile        |   1 +
>  drivers/net/can/nct6694_canfd.c | 920 ++++++++++++++++++++++++++++++++
>  4 files changed, 932 insertions(+)
>  create mode 100644 drivers/net/can/nct6694_canfd.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a190f2b08fa3..eb5d46825e71 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16548,6 +16548,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
> +F:	drivers/net/can/nct6694_canfd.c
>  F:	include/linux/mfd/nct6694.h
> =20
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
> index cf989bea9aa3..130e98ec28a5 100644
> --- a/drivers/net/can/Kconfig
> +++ b/drivers/net/can/Kconfig
> @@ -200,6 +200,16 @@ config CAN_SUN4I
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called sun4i_can.
> =20
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
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CAN_JANZ_ICAN3)	+=3D janz-ican3.o
>  obj-$(CONFIG_CAN_KVASER_PCIEFD)	+=3D kvaser_pciefd.o
>  obj-$(CONFIG_CAN_MSCAN)		+=3D mscan/
>  obj-$(CONFIG_CAN_M_CAN)		+=3D m_can/
> +obj-$(CONFIG_CAN_NCT6694)	+=3D nct6694_canfd.o
>  obj-$(CONFIG_CAN_PEAK_PCIEFD)	+=3D peak_canfd/
>  obj-$(CONFIG_CAN_SJA1000)	+=3D sja1000/
>  obj-$(CONFIG_CAN_SUN4I)		+=3D sun4i_can.o
> diff --git a/drivers/net/can/nct6694_canfd.c b/drivers/net/can/nct6694_ca=
nfd.c
> new file mode 100644
> index 000000000000..54f20f0681e2
> --- /dev/null
> +++ b/drivers/net/can/nct6694_canfd.c
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/can/dev.h>
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
> +/* Host interface */
> +#define NCT6694_CAN_MOD			0x05
> +
> +/* Message Channel*/
> +/* Command 00h */
> +#define NCT6694_CAN_CMD0_OFFSET(idx)	(idx ? 0x0100 : 0x0000)
> +#define NCT6694_CAN_CTRL1_MON		BIT(0)
> +#define NCT6694_CAN_CTRL1_NISO		BIT(1)
> +#define NCT6694_CAN_CTRL1_LBCK		BIT(2)
> +
> +/* Command 01h */
> +#define NCT6694_CAN_CMD1_OFFSET		0x0001
> +
> +/* Command 02h */
> +#define NCT6694_CAN_CMD2_OFFSET(idx, mask)			\
> +	({ typeof(mask) mask_ =3D (mask);				\
> +	   idx ? ((0x80 | (mask_ & 0xFF)) << 8 | 0x02) :	\
> +		 ((0x00 | (mask_ & 0xFF)) << 8 | 0x02); })
> +
> +#define NCT6694_CAN_EVENT_ERR		BIT(0)
> +#define NCT6694_CAN_EVENT_STATUS	BIT(1)
> +#define NCT6694_CAN_EVENT_TX_EVT	BIT(2)
> +#define NCT6694_CAN_EVENT_RX_EVT	BIT(3)
> +#define NCT6694_CAN_EVENT_REC		BIT(4)
> +#define NCT6694_CAN_EVENT_TEC		BIT(5)
> +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY	BIT(7)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_LOST	BIT(5)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_HALF_FULL	BIT(6)	/* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_IN	BIT(7)
> +
> +/* Command 10h */
> +#define NCT6694_CAN_CMD10_OFFSET(buf_cnt)	\
> +	(((buf_cnt) & 0xFF) << 8 | 0x10)
> +#define NCT6694_CAN_TAG_CAN0		0xC0
> +#define NCT6694_CAN_TAG_CAN1		0xC1
> +#define NCT6694_CAN_FLAG_EFF		BIT(0)
> +#define NCT6694_CAN_FLAG_RTR		BIT(1)
> +#define NCT6694_CAN_FLAG_FD		BIT(2)
> +#define NCT6694_CAN_FLAG_BRS		BIT(3)
> +#define NCT6694_CAN_FLAG_ERR		BIT(4)
> +
> +/* Command 11h */
> +#define NCT6694_CAN_CMD11_OFFSET(idx, buf_cnt)			\
> +	({ typeof(buf_cnt) buf_cnt_ =3D (buf_cnt);		\
> +	   idx ? ((0x80 | (buf_cnt_ & 0xFF)) << 8 | 0x11) :	\
> +		 ((0x00 | (buf_cnt_ & 0xFF)) << 8 | 0x11); })
> +
> +#define NCT6694_CAN_RX_QUOTA		64
> +
> +enum nct6694_event_err {
> +	NCT6694_CAN_EVT_NO_ERROR,
                      ^^^ add _ERR_
> +	NCT6694_CAN_EVT_CRC_ERROR,
> +	NCT6694_CAN_EVT_STUFF_ERROR,
> +	NCT6694_CAN_EVT_ACK_ERROR,
> +	NCT6694_CAN_EVT_FORM_ERROR,
> +	NCT6694_CAN_EVT_BIT_ERROR,
> +	NCT6694_CAN_EVT_TIMEOUT_ERROR,
> +	NCT6694_CAN_EVT_UNKNOWN_ERROR,
> +};
> +
> +enum nct6694_event_status {
> +	NCT6694_CAN_EVT_ERROR_ACTIVE,
                      ^^^ add _STATUS_
> +	NCT6694_CAN_EVT_ERROR_PASSIVE,
> +	NCT6694_CAN_EVT_BUS_OFF,
> +	NCT6694_CAN_EVT_WARNING,
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
> +	__le16 reserved;
u8 reserved[2];
> +	__le32 can_clk;
> +};
> +
> +struct __packed nct6694_can_event {
> +	u8 err1;
> +	u8 status1;
> +	u8 tx_evt1;
> +	u8 rx_evt1;
> +	u8 rec1;
> +	u8 tec1;
> +	u8 reserved1[2];
> +	u8 err2;
> +	u8 status2;
> +	u8 tx_evt2;
> +	u8 rx_evt2;
> +	u8 rec2;
> +	u8 tec2;
> +	u8 reserved2[2];
> +};

Create an extra struct that only describes a channel

struct __packed nct6694_can_event_channel {
	u8 err;
	u8 status;
	u8 tx_evt;
	u8 rx_evt;
	u8 rec;
	u8 tec;
	u8 reserved[2];
}

and put an array of 2 into struct __packed nct6694_can_event.

> +
> +struct __packed nct6694_can_xmit {
> +	u8 tag;
> +	u8 flag;
> +	u8 reserved;
> +	u8 dlc;
> +	__le32 id;
> +	u8 data[64];
> +	u8 msg_buf[72];

Why is the message so long? What's in the msg_buf?

> +};
> +
> +struct nct6694_can_priv {
> +	struct can_priv can;	/* must be the first member */
> +	struct net_device *ndev;
> +	struct nct6694 *nct6694;
> +	struct mutex lock;

What does lock protect?

> +	struct sk_buff *tx_skb;
> +	struct workqueue_struct *wq;
> +	struct work_struct tx_work;
> +	unsigned char *tx_buf;
void *
> +	unsigned char *rx_buf;
void *
> +	unsigned char can_idx;
> +	bool tx_busy;

IMHO it makes no sense to have tx_skb and tx_busy

> +};
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
> +static void nct6694_can_clean(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	if (priv->tx_skb || priv->tx_busy)
> +		ndev->stats.tx_errors++;
> +	dev_kfree_skb(priv->tx_skb);
> +	if (priv->tx_busy)
> +		can_free_echo_skb(priv->ndev, 0, NULL);
> +	priv->tx_skb =3D NULL;
> +	priv->tx_busy =3D false;
> +}
> +
> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> +					struct can_berr_counter *bec)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_event *evt =3D (struct nct6694_can_event *)priv->rx_=
buf;
> +	u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_CMD2_OFFSET(priv->can_idx, mask),
> +			       sizeof(struct nct6694_can_event),
> +			       evt);
> +	if (ret < 0)
> +		return ret;
> +
> +	bec->rxerr =3D priv->can_idx ? evt->rec2 : evt->rec1;
> +	bec->txerr =3D priv->can_idx ? evt->tec2 : evt->tec1;
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_handle_lost_msg(struct net_device *ndev)
> +{
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct sk_buff *skb;
> +	struct can_frame *frame;
> +
> +	netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");
> +
> +	stats->rx_errors++;
> +	stats->rx_over_errors++;
> +
> +	skb =3D alloc_can_err_skb(ndev, &frame);
> +	if (unlikely(!skb))
> +		return 0;
> +
> +	frame->can_id |=3D CAN_ERR_CRTL;
> +	frame->data[1] =3D CAN_ERR_CRTL_RX_OVERFLOW;
> +
> +	netif_receive_skb(skb);
> +
> +	return 1;
> +}
> +
> +static void nct6694_can_read_fifo(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv->rx_b=
uf;
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct canfd_frame *cf;
> +	struct sk_buff *skb;
> +	int can_idx =3D priv->can_idx;
> +	u32 id;
> +	int ret;
> +	u8 fd_format =3D 0;
bool - no need to init
> +
> +	guard(mutex)(&priv->lock);
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_CMD11_OFFSET(can_idx, 1),
> +			       sizeof(struct nct6694_can_xmit), xmit);
> +	if (ret < 0)
> +		return;
> +
> +	/* Check type of frame and create skb */
> +	fd_format =3D xmit->flag & NCT6694_CAN_FLAG_FD;
> +	if (fd_format)
> +		skb =3D alloc_canfd_skb(ndev, &cf);
> +	else
> +		skb =3D alloc_can_skb(ndev, (struct can_frame **)&cf);
> +
> +	if (!skb) {
> +		stats->rx_dropped++;
> +		return;
> +	}
> +
> +	cf->len =3D xmit->dlc;

what does xmit->dlc contain? The DLC or the length?

> +
> +	/* Get ID and set flag by its type(Standard ID format or Ext ID format)=
 */
> +	id =3D le32_to_cpu(xmit->id);
> +	if (xmit->flag & NCT6694_CAN_FLAG_EFF) {
> +		/*
> +		 * In case the Extended ID frame is received, the standard
> +		 * and extended part of the ID are swapped in the register,
> +		 * so swap them back to obtain the correct ID.
> +		 */

You comment doesn't match the code.

> +		id |=3D CAN_EFF_FLAG;
> +	}
> +
> +	cf->can_id =3D id;
> +
> +	/* Set ESI flag */
> +	if (xmit->flag & NCT6694_CAN_FLAG_ERR) {
> +		cf->flags |=3D CANFD_ESI;
> +		netdev_dbg(ndev, "ESI Error\n");
> +	}
> +
> +	/* Set RTR and BRS */
> +	if (!fd_format && (xmit->flag & NCT6694_CAN_FLAG_RTR)) {
> +		cf->can_id |=3D CAN_RTR_FLAG;
> +	} else {
> +		if (xmit->flag & NCT6694_CAN_FLAG_BRS)
> +			cf->flags |=3D CANFD_BRS;
> +
> +		memcpy(cf->data, xmit->data, cf->len);
> +
> +		stats->rx_bytes +=3D cf->len;
> +	}
> +
> +	stats->rx_packets++;
> +
> +	netif_receive_skb(skb);
> +}
> +
> +static int nct6694_can_do_rx_poll(struct net_device *ndev, int quota)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_event *evt =3D (struct nct6694_can_event *)priv->rx_=
buf;
> +	int can_idx =3D priv->can_idx;
> +	u32 pkts =3D 0;
> +	u8 mask_rx =3D NCT6694_CAN_EVENT_RX_EVT;
> +	u8 rx_evt;
> +
> +	for (;;) {
> +		scoped_guard(mutex, &priv->lock) {
> +			nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +					 NCT6694_CAN_CMD2_OFFSET(can_idx, mask_rx),
> +					 sizeof(struct nct6694_can_event), evt);
> +
> +			rx_evt =3D can_idx ? evt->rx_evt2 : evt->rx_evt1;
> +		}
> +
> +		if (rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST)
> +			nct6694_can_handle_lost_msg(ndev);
> +
> +		/* No data */
> +		if ((rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) =3D=3D 0)
> +			break;
> +
> +		if (quota <=3D 0)
> +			break;
> +
> +		nct6694_can_read_fifo(ndev);
> +		quota--;
> +		pkts++;
> +	}
> +
> +	return pkts;
> +}
> +
> +static int nct6694_can_handle_lec_err(struct net_device *ndev, u8 bus_er=
r)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	if (bus_err =3D=3D NCT6694_CAN_EVT_NO_ERROR)
> +		return 0;
> +
> +	priv->can.can_stats.bus_error++;
> +	stats->rx_errors++;
> +
> +	/* Propagate the error condition to the CAN stack. */
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +
> +	if (unlikely(!skb))
> +		return 0;
> +
> +	/* Read the error counter register and check for new errors. */
> +	cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> +
> +	switch (bus_err) {
> +	case NCT6694_CAN_EVT_CRC_ERROR:
> +		cf->data[3] =3D CAN_ERR_PROT_LOC_CRC_SEQ;
> +		break;
> +
> +	case NCT6694_CAN_EVT_STUFF_ERROR:
> +		cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> +		break;
> +
> +	case NCT6694_CAN_EVT_ACK_ERROR:
> +		cf->data[3] =3D CAN_ERR_PROT_LOC_ACK;
> +		break;
> +
> +	case NCT6694_CAN_EVT_FORM_ERROR:
> +		cf->data[2] |=3D CAN_ERR_PROT_FORM;
> +		break;
> +
> +	case NCT6694_CAN_EVT_BIT_ERROR:
> +		cf->data[2] |=3D CAN_ERR_PROT_BIT |
> +			       CAN_ERR_PROT_BIT0 |
> +			       CAN_ERR_PROT_BIT1;
> +		break;
> +
> +	case NCT6694_CAN_EVT_TIMEOUT_ERROR:
> +		cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> +		break;
> +
> +	case NCT6694_CAN_EVT_UNKNOWN_ERROR:
> +		cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> +		/*
> +		 * It means 'unspecified'(the value is '0').
> +		 * But it is not sure if it's ok to send an error package
> +		 * without specific error bit.
> +		 */
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	/* Reset the error counter, ack the IRQ and re-enable the counter. */
> +	stats->rx_packets++;
> +	stats->rx_bytes +=3D cf->can_dlc;
> +	netif_receive_skb(skb);
> +
> +	return 1;
> +}
> +
> +static int nct6694_can_handle_state_change(struct net_device *ndev,
> +					   enum can_state new_state)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +	struct can_berr_counter bec;
> +
> +	switch (new_state) {
> +	case CAN_STATE_ERROR_ACTIVE:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> +		break;
> +	case CAN_STATE_ERROR_WARNING:
> +		priv->can.can_stats.error_warning++;
> +		priv->can.state =3D CAN_STATE_ERROR_WARNING;
> +		break;
> +	case CAN_STATE_ERROR_PASSIVE:
> +		priv->can.can_stats.error_passive++;
> +		priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
> +		break;
> +	case CAN_STATE_BUS_OFF:
> +		priv->can.state =3D CAN_STATE_BUS_OFF;
> +		priv->can.can_stats.bus_off++;
> +		can_bus_off(ndev);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* propagate the error condition to the CAN stack */
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +	if (unlikely(!skb))
> +		return 0;
> +
> +	nct6694_can_get_berr_counter(ndev, &bec);
> +
> +	switch (new_state) {
> +	case CAN_STATE_ERROR_WARNING:
> +		/* error warning state */
> +		cf->can_id |=3D CAN_ERR_CRTL;
> +		cf->data[1] =3D (bec.txerr > bec.rxerr) ? CAN_ERR_CRTL_TX_WARNING :
> +							CAN_ERR_CRTL_RX_WARNING;
> +		cf->data[6] =3D bec.txerr;
> +		cf->data[7] =3D bec.rxerr;
> +		break;
> +	case CAN_STATE_ERROR_PASSIVE:
> +		/* error passive state */
> +		cf->can_id |=3D CAN_ERR_CRTL;
> +		cf->data[1] |=3D CAN_ERR_CRTL_RX_PASSIVE;
> +		if (bec.txerr > 127)
> +			cf->data[1] |=3D CAN_ERR_CRTL_TX_PASSIVE;
> +		cf->data[6] =3D bec.txerr;
> +		cf->data[7] =3D bec.rxerr;
> +		break;
> +	case CAN_STATE_BUS_OFF:
> +		/* bus-off state */
> +		cf->can_id |=3D CAN_ERR_BUSOFF;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	stats->rx_packets++;
> +	stats->rx_bytes +=3D cf->can_dlc;
> +	netif_receive_skb(skb);
> +
> +	return 1;
> +}
> +
> +static int nct6694_can_handle_state_errors(struct net_device *ndev,
> +					   unsigned char can_status)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	int work_done =3D 0;
> +
> +	if (can_status =3D=3D NCT6694_CAN_EVT_ERROR_ACTIVE &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_ACTIVE) {
> +		netdev_dbg(ndev, "Error, entered active state\n");
> +		work_done +=3D nct6694_can_handle_state_change(ndev,
> +							     CAN_STATE_ERROR_ACTIVE);
> +	}
> +
> +	if (can_status =3D=3D NCT6694_CAN_EVT_WARNING &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_WARNING) {
> +		netdev_dbg(ndev, "Error, entered warning state\n");
> +		work_done +=3D nct6694_can_handle_state_change(ndev,
> +							     CAN_STATE_ERROR_WARNING);
> +	}
> +
> +	if (can_status =3D=3D NCT6694_CAN_EVT_ERROR_PASSIVE &&
> +	    priv->can.state !=3D CAN_STATE_ERROR_PASSIVE) {
> +		netdev_dbg(ndev, "Error, entered passive state\n");
> +		work_done +=3D nct6694_can_handle_state_change(ndev,
> +							     CAN_STATE_ERROR_PASSIVE);
> +	}
> +
> +	if (can_status =3D=3D NCT6694_CAN_EVT_BUS_OFF &&
> +	    priv->can.state !=3D CAN_STATE_BUS_OFF) {
> +		netdev_dbg(ndev, "Error, entered bus-off state\n");
> +		work_done +=3D nct6694_can_handle_state_change(ndev,
> +							     CAN_STATE_BUS_OFF);
> +	}
> +
> +	return work_done;
> +}
> +
> +static int nct6694_can_poll(struct net_device *ndev, int quota)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_event *evt =3D (struct nct6694_can_event *)priv->rx_=
buf;
> +	int can_idx =3D priv->can_idx;
> +	int work_done =3D 0, ret;
> +	u8 evt_mask =3D NCT6694_CAN_EVENT_ERR | NCT6694_CAN_EVENT_STATUS;
> +	u8 bus_err, can_status;
> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				       NCT6694_CAN_CMD2_OFFSET(can_idx, evt_mask),
> +				       sizeof(struct nct6694_can_event), evt);
> +		if (ret < 0)
> +			return IRQ_NONE;

propagate the error

> +
> +		if (can_idx) {
> +			bus_err =3D evt->err2;
> +			can_status =3D evt->status2;
> +		} else {
> +			bus_err =3D evt->err1;
> +			can_status =3D evt->status1;
> +		}
> +	}
> +
> +	/* Handle bus state changes */
> +	work_done +=3D nct6694_can_handle_state_errors(ndev, can_status);
> +
> +	/* Handle lec errors on the bus */
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
> +		work_done +=3D nct6694_can_handle_lec_err(ndev, bus_err);
> +
> +	/* Handle RX events */
> +	work_done +=3D nct6694_can_do_rx_poll(ndev, quota - work_done);
> +	return work_done;
> +}
> +
> +static void nct6694_can_tx_irq(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +
> +	guard(mutex)(&priv->lock);
> +	stats->tx_bytes +=3D can_get_echo_skb(ndev, 0, NULL);
> +	stats->tx_packets++;
> +	priv->tx_busy =3D false;
> +	netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_can_irq(int irq, void *data)
> +{
> +	struct net_device *ndev =3D data;
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_event *evt =3D (struct nct6694_can_event *)priv->rx_=
buf;
> +	int can_idx =3D priv->can_idx;
> +	int ret;
> +	u8 mask_sts =3D NCT6694_CAN_EVENT_TX_EVT;
> +	u8 tx_evt;
> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				       NCT6694_CAN_CMD2_OFFSET(can_idx, mask_sts),
> +				       sizeof(struct nct6694_can_event), evt);
> +		if (ret < 0)
> +			return IRQ_NONE;
> +
> +		tx_evt =3D can_idx ? evt->tx_evt2 : evt->tx_evt1;
> +	}
> +
> +	if (tx_evt) {
> +		nct6694_can_tx_irq(ndev);
> +	} else {
> +		ret =3D nct6694_can_poll(ndev, NCT6694_CAN_RX_QUOTA);
> +		if (!ret)
> +			return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int nct6694_can_start(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_setting *setting =3D (struct nct6694_can_setting *)p=
riv->tx_buf;
> +	const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> +	const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	memset(priv->tx_buf, 0, sizeof(struct nct6694_can_setting));
> +	setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> +	setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_MON);
> +
> +	if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
> +	    priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_NISO);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_LBCK);
> +
> +	ret =3D nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> +				NCT6694_CAN_CMD0_OFFSET(priv->can_idx),
> +				sizeof(struct nct6694_can_setting), setting);
> +	if (ret < 0)
> +		return ret;
> +
> +	priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_stop(struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	netif_stop_queue(ndev);
> +	free_irq(ndev->irq, ndev);
> +	destroy_workqueue(priv->wq);
> +	priv->wq =3D NULL;
> +	nct6694_can_clean(ndev);
> +	priv->can.state =3D CAN_STATE_STOPPED;
> +	close_candev(ndev);
> +
> +	return 0;
> +}
> +
> +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode m=
ode)
> +{
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		nct6694_can_clean(ndev);
> +		nct6694_can_start(ndev);
> +		netif_wake_queue(ndev);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
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
> +	priv->tx_skb =3D NULL;
> +	priv->tx_busy =3D false;
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
> +	close_candev(ndev);
> +	return ret;
> +}
> +
> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> +					  struct net_device *ndev)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +
> +	if (priv->tx_skb || priv->tx_busy) {
> +		netdev_err(ndev, "hard_xmit called while tx busy\n");
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	if (can_dev_dropped_skb(ndev, skb))
> +		return NETDEV_TX_OK;

please drop first

> +
> +	netif_stop_queue(ndev);
> +	priv->tx_skb =3D skb;
> +	queue_work(priv->wq, &priv->tx_work);
> +
> +	return NETDEV_TX_OK;
> +}
> +
> +static void nct6694_can_tx(struct net_device *ndev, struct canfd_frame *=
cf)
> +{
> +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv->tx_b=
uf;
> +	u32 txid =3D 0;
> +
> +	memset(xmit, 0, sizeof(struct nct6694_can_xmit));
> +
> +	if (priv->can_idx =3D=3D 0)
> +		xmit->tag =3D NCT6694_CAN_TAG_CAN0<;
> +	else
> +		xmit->tag =3D NCT6694_CAN_TAG_CAN1;
> +
> +	if (cf->can_id & CAN_EFF_FLAG) {
> +		txid =3D cf->can_id & CAN_EFF_MASK;
> +		/*
> +		 * In case the Extended ID frame is transmitted, the
> +		 * standard and extended part of the ID are swapped
> +		 * in the register, so swap them back to send the
> +		 * correct ID.

You comment doesn't match the code.

> +		 */
> +		xmit->flag |=3D NCT6694_CAN_FLAG_EFF;
> +	} else {
> +		txid =3D cf->can_id & CAN_SFF_MASK;
> +	}
> +
> +	xmit->id =3D cpu_to_le32(txid);
> +	xmit->dlc =3D cf->len;
> +
> +	if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&

No need to check ctrlmode

> +	    can_is_canfd_skb(priv->tx_skb)) {
> +		xmit->flag |=3D NCT6694_CAN_FLAG_FD;
> +		if (cf->flags & CANFD_BRS)
> +			xmit->flag |=3D NCT6694_CAN_FLAG_BRS;
> +	}
> +
> +	if (cf->can_id & CAN_RTR_FLAG)
> +		xmit->flag |=3D NCT6694_CAN_FLAG_RTR;

you can move this into the !can_is_canfd_skb branch of the if

> +
> +	memcpy(xmit->data, cf->data, cf->len);
> +
> +	nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			  NCT6694_CAN_CMD10_OFFSET(1),
> +			  sizeof(struct nct6694_can_xmit),
> +			  xmit);
> +}
> +
> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_can_priv *priv =3D container_of(work,
> +						     struct nct6694_can_priv,
> +						     tx_work);
> +	struct net_device *ndev =3D priv->ndev;
> +	struct canfd_frame *cf;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	if (priv->tx_skb) {
> +		if (priv->can.state =3D=3D CAN_STATE_BUS_OFF) {
> +			nct6694_can_clean(ndev);
> +		} else {
> +			cf =3D (struct canfd_frame *)priv->tx_skb->data;
> +			nct6694_can_tx(ndev, cf);
> +			priv->tx_busy =3D true;
> +			can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> +			priv->tx_skb =3D NULL;
> +		}
> +	}
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
> +	struct nct6694_can_information *info =3D (struct nct6694_can_informatio=
n *)priv->rx_buf;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> +			       NCT6694_CAN_CMD1_OFFSET,
> +			       sizeof(struct nct6694_can_information),
> +			       info);
> +	if (ret)
> +		return ret;
> +
> +	return le32_to_cpu(info->can_clk);
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
> +				 NCT6694_IRQ_CAN1 + cell->id);
> +	if (!irq)
> +		return -EINVAL;

propagate error value

> +
> +	ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->irq =3D irq;
> +	ndev->flags |=3D IFF_ECHO;
> +	ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> +	ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
> +
> +	priv =3D netdev_priv(ndev);
> +	priv->nct6694 =3D nct6694;
> +	priv->ndev =3D ndev;
> +
> +	priv->tx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> +				    sizeof(unsigned char), GFP_KERNEL);

devm_kzalloc()
> +	if (!priv->tx_buf) {
> +		ret =3D -ENOMEM;
> +		goto free_candev;
> +	}
> +
> +	priv->rx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> +				    sizeof(unsigned char), GFP_KERNEL);
devm_kzalloc()

> +	if (!priv->rx_buf) {
> +		ret =3D -ENOMEM;
> +		goto free_candev;
> +	}
> +
> +	can_clk =3D nct6694_can_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret =3D -EIO;

propagate the error value, don't overwrite it

move the dev_err_probe() here.

> +		goto free_candev;
> +	}
> +
> +	mutex_init(&priv->lock);
> +	INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +	priv->can_idx =3D cell->id;
> +	priv->can.state =3D CAN_STATE_STOPPED;
> +	priv->can.clock.freq =3D can_clk;
> +	priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_const;
> +	priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_const;
> +	priv->can.do_set_mode =3D nct6694_can_set_mode;
> +	priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> +
> +	priv->can.ctrlmode =3D CAN_CTRLMODE_FD;
> +
> +	priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK		|
> +				       CAN_CTRLMODE_LISTENONLY		|
> +				       CAN_CTRLMODE_FD			|
> +				       CAN_CTRLMODE_FD_NON_ISO		|
> +				       CAN_CTRLMODE_BERR_REPORTING;
> +
> +	platform_set_drvdata(pdev, priv);
> +	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> +
> +	ret =3D register_candev(priv->ndev);
> +	if (ret)
> +		goto free_candev;
> +
> +	return 0;
> +
> +free_candev:
> +	free_candev(ndev);
> +	return dev_err_probe(&pdev->dev, ret, "Probe failed\n");

Move the dev_err_probe() with an appropriate error message to where the
error occurs. If malloc fails, the kernel already prints for you, so
here it's only nct6694_can_get_clock() only.

> +}
> +
> +static void nct6694_can_remove(struct platform_device *pdev)
> +{
> +	struct nct6694_can_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	cancel_work_sync(&priv->tx_work);
> +	unregister_candev(priv->ndev);
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
> --=20
> 2.34.1
>=20
>=20
>=20

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--qlxqjspgd3gasp7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdZYmsACgkQKDiiPnot
vG8uPQf/aiTANGAlqyR/AoQ9pYWX9ONF3PPJsTFuVkCtypgl+uSCM67PfluLjRcZ
yZ5aYKILPcdvRteoOS3s4ZuhlFXX8co+WnJpAqc+Vo2u9A7R5OVL09pFSRCRjWro
6O0t6faXjpMhpMk64yVm4hDM7eT+vGOBH7hX7EC6P3lVfISbhMzz9hvlD++Wc2w7
KaWVtNUT5PAXvqEc2LX8190vdm2NKLBSPXTLqTUabFEzowNbyxG0+OtRdMJLhXtD
Mzlm/E+QstKblOO9Rw5Z/NMUkk6EkcfUNAJvUhYjQxjdJ/5e0Wsr/NunlMvuOFCJ
Af+e1f/aibkyzliCrShaVWdRGja+Gw==
=CamM
-----END PGP SIGNATURE-----

--qlxqjspgd3gasp7d--

