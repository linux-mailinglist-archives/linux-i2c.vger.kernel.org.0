Return-Path: <linux-i2c+bounces-10753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DEAA80EB
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 15:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95552986760
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1CC25C83A;
	Sat,  3 May 2025 13:57:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D66EEBB
	for <linux-i2c@vger.kernel.org>; Sat,  3 May 2025 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746280671; cv=none; b=jKUo3/PYb2igAownYohK+MyVlRj05ljoqxz54K1mEZHoEULdn31jWDXfH7bDm+54jbOsx5yOgwpDoOmvRUJJuYJPtw/wtuL6GgKsQqmnHr4Osmug+/72iN6ffOoYoZEzX9KBHEEjjhnXeXOBjeL4k9EcmaBHG9wxyLnCH2XO3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746280671; c=relaxed/simple;
	bh=J98gGZ7MEt2xsPz+PHLmunvEX171M0mPUfYGJxv+I48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuTR0JGzATnrDIkRRZWEDRuq0yoZ08mnUh3sDe0rvtuiPcBrbHemDVdg57u9quviErJsfgmA8/8MZu4QS1QLqvJYjTQRNuI2j9sFeSL8/AFjJ6m/Zn3LdM08WoBkuwTEC+Zgp7Q88in6hbiFvBTXNlS+A/YxGzozbeen5kn/36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uBDMc-0002RY-Ie; Sat, 03 May 2025 15:57:10 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uBDMY-000uvn-2L;
	Sat, 03 May 2025 15:57:06 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 431D34074C1;
	Sat, 03 May 2025 13:57:06 +0000 (UTC)
Date: Sat, 3 May 2025 15:57:04 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: a0282524688@gmail.com
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250503-fulmar-of-sexy-upgrade-1184a7-mkl@pengutronix.de>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owoy6lob2v62fbfv"
Content-Disposition: inline
In-Reply-To: <20250423094058.1656204-5-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--owoy6lob2v62fbfv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 23.04.2025 17:40:55, a0282524688@gmail.com wrote:
> From: Ming Yu <tmyu0@nuvoton.com>
>=20
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.
>=20
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>

The destroy functions nct6694_canfd_close() and nct6694_canfd_remove()
are not the exact inverse of their init functions. Se comments inline.

Please fix and add:

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

Feel free to mainline this patch as part of the series outside of the
linux-can-next tree. Better ask the netdev maintainers for their OK, too.

What about transceiver delay compensation for higher CAN-FD bitrates?
How does you device handle these?

> ---
>  MAINTAINERS                         |   1 +
>  drivers/net/can/usb/Kconfig         |  11 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 814 ++++++++++++++++++++++++++++
>  4 files changed, 827 insertions(+)
>  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 751b9108524a..ee8583edc2d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17364,6 +17364,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
>  F:	drivers/mfd/nct6694.c
> +F:	drivers/net/can/usb/nct6694_canfd.c
>  F:	include/linux/mfd/nct6694.h
> =20
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
> index 9dae0c71a2e1..759e724a67cf 100644
> --- a/drivers/net/can/usb/Kconfig
> +++ b/drivers/net/can/usb/Kconfig
> @@ -133,6 +133,17 @@ config CAN_MCBA_USB
>  	  This driver supports the CAN BUS Analyzer interface
>  	  from Microchip (http://www.microchip.com/development-tools/).
> =20
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
> index 000000000000..9cf6230ffb7d
> --- /dev/null
> +++ b/drivers/net/can/usb/nct6694_canfd.c
> @@ -0,0 +1,814 @@
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
> +#define DEVICE_NAME "nct6694-canfd"
> +
> +/* USB command module type for NCT6694 CANfd controller.
> + * This defines the module type used for communication with the NCT6694
> + * CANfd controller over the USB interface.
> + */
> +#define NCT6694_CANFD_MOD			0x05
> +
> +/* Command 00h - CAN Setting and Initialization */
> +#define NCT6694_CANFD_SETTING			0x00
> +#define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
> +#define NCT6694_CANFD_SETTING_ACTIVE_CTRL2	BIT(1)
> +#define NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP	BIT(2)
> +#define NCT6694_CANFD_SETTING_CTRL1_MON		BIT(0)
> +#define NCT6694_CANFD_SETTING_CTRL1_NISO	BIT(1)
> +#define NCT6694_CANFD_SETTING_CTRL1_LBCK	BIT(2)
> +#define NCT6694_CANFD_SETTING_NBTP_NTSEG2	GENMASK(6, 0)
> +#define NCT6694_CANFD_SETTING_NBTP_NTSEG1	GENMASK(15, 8)
> +#define NCT6694_CANFD_SETTING_NBTP_NBRP		GENMASK(24, 16)
> +#define NCT6694_CANFD_SETTING_NBTP_NSJW		GENMASK(31, 25)
> +#define NCT6694_CANFD_SETTING_DBTP_DSJW		GENMASK(3, 0)
> +#define NCT6694_CANFD_SETTING_DBTP_DTSEG2	GENMASK(7, 4)
> +#define NCT6694_CANFD_SETTING_DBTP_DTSEG1	GENMASK(12, 8)
> +#define NCT6694_CANFD_SETTING_DBTP_DBRP		GENMASK(20, 16)
> +
> +/* Command 01h - CAN Information */
> +#define NCT6694_CANFD_INFORMATION		0x01
> +#define NCT6694_CANFD_INFORMATION_SEL		0x00
> +
> +/* Command 02h - CAN Event */
> +#define NCT6694_CANFD_EVENT			0x02
> +#define NCT6694_CANFD_EVENT_SEL(idx, mask)	\
> +	((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
> +
> +#define NCT6694_CANFD_EVENT_MASK		GENMASK(5, 0)
> +#define NCT6694_CANFD_EVT_TX_FIFO_EMPTY		BIT(7)	/* Read-clear */
> +#define NCT6694_CANFD_EVT_RX_DATA_LOST		BIT(5)	/* Read-clear */
> +#define NCT6694_CANFD_EVT_RX_DATA_IN		BIT(7)	/* Read-clear*/
                                                                    ^^
add a space

> +
> +/* Command 10h - CAN Deliver */
> +#define NCT6694_CANFD_DELIVER			0x10
> +#define NCT6694_CANFD_DELIVER_SEL(buf_cnt)	\
> +	((buf_cnt) & 0xFF)
> +
> +/* Command 11h - CAN Receive */
> +#define NCT6694_CANFD_RECEIVE			0x11
> +#define NCT6694_CANFD_RECEIVE_SEL(idx, buf_cnt)	\
> +	((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
> +
> +#define NCT6694_CANFD_FRAME_TAG(idx)		(0xC0 | (idx))
> +#define NCT6694_CANFD_FRAME_FLAG_EFF		BIT(0)
> +#define NCT6694_CANFD_FRAME_FLAG_RTR		BIT(1)
> +#define NCT6694_CANFD_FRAME_FLAG_FD		BIT(2)
> +#define NCT6694_CANFD_FRAME_FLAG_BRS		BIT(3)
> +#define NCT6694_CANFD_FRAME_FLAG_ERR		BIT(4)
> +
> +#define NCT6694_NAPI_WEIGHT			32
> +
> +enum nct6694_event_err {
> +	NCT6694_CANFD_EVT_ERR_NO_ERROR =3D 0,
> +	NCT6694_CANFD_EVT_ERR_CRC_ERROR,
> +	NCT6694_CANFD_EVT_ERR_STUFF_ERROR,
> +	NCT6694_CANFD_EVT_ERR_ACK_ERROR,
> +	NCT6694_CANFD_EVT_ERR_FORM_ERROR,
> +	NCT6694_CANFD_EVT_ERR_BIT_ERROR,
> +	NCT6694_CANFD_EVT_ERR_TIMEOUT_ERROR,
> +	NCT6694_CANFD_EVT_ERR_UNKNOWN_ERROR,
> +};
> +
> +enum nct6694_event_status {
> +	NCT6694_CANFD_EVT_STS_ERROR_ACTIVE =3D 0,
> +	NCT6694_CANFD_EVT_STS_ERROR_PASSIVE,
> +	NCT6694_CANFD_EVT_STS_BUS_OFF,
> +	NCT6694_CANFD_EVT_STS_WARNING,
> +};
> +
> +struct __packed nct6694_canfd_setting {
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
> +struct __packed nct6694_canfd_information {
> +	u8 tx_fifo_cnt;
> +	u8 rx_fifo_cnt;
> +	u8 reserved[2];
> +	__le32 can_clk;
> +};
> +
> +struct __packed nct6694_canfd_event {
> +	u8 err;
> +	u8 status;
> +	u8 tx_evt;
> +	u8 rx_evt;
> +	u8 rec;
> +	u8 tec;
> +	u8 reserved[2];
> +};
> +
> +struct __packed nct6694_canfd_frame {
> +	u8 tag;
> +	u8 flag;
> +	u8 reserved;
> +	u8 length;
> +	__le32 id;
> +	u8 data[CANFD_MAX_DLEN];
> +};
> +
> +struct nct6694_canfd_priv {
> +	struct can_priv can;	/* must be the first member */
> +	struct can_rx_offload offload;
> +	struct net_device *ndev;
> +	struct nct6694 *nct6694;
> +	struct workqueue_struct *wq;
> +	struct work_struct tx_work;
> +	struct nct6694_canfd_frame tx;
> +	struct nct6694_canfd_frame rx;
> +	struct nct6694_canfd_event event[2];
> +	struct can_berr_counter bec;
> +};
> +
> +static inline struct nct6694_canfd_priv *rx_offload_to_priv(struct can_r=
x_offload *offload)
> +{
> +	return container_of(offload, struct nct6694_canfd_priv, offload);
> +}
> +
> +static const struct can_bittiming_const nct6694_canfd_bittiming_nominal_=
const =3D {
> +	.name =3D DEVICE_NAME,
> +	.tseg1_min =3D 1,
> +	.tseg1_max =3D 256,
> +	.tseg2_min =3D 1,
> +	.tseg2_max =3D 128,
> +	.sjw_max =3D 128,
> +	.brp_min =3D 1,
> +	.brp_max =3D 512,
> +	.brp_inc =3D 1,
> +};
> +
> +static const struct can_bittiming_const nct6694_canfd_bittiming_data_con=
st =3D {
> +	.name =3D DEVICE_NAME,
> +	.tseg1_min =3D 1,
> +	.tseg1_max =3D 32,
> +	.tseg2_min =3D 1,
> +	.tseg2_max =3D 16,
> +	.sjw_max =3D 16,
> +	.brp_min =3D 1,
> +	.brp_max =3D 32,
> +	.brp_inc =3D 1,
> +};
> +
> +static void nct6694_canfd_rx_offload(struct can_rx_offload *offload,
> +				     struct sk_buff *skb)
> +{
> +	struct nct6694_canfd_priv *priv =3D rx_offload_to_priv(offload);
> +	int ret;
> +
> +	ret =3D can_rx_offload_queue_tail(offload, skb);
> +	if (ret)
> +		priv->ndev->stats.rx_fifo_errors++;
> +}
> +
> +static void nct6694_canfd_handle_lost_msg(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	netdev_dbg(ndev, "RX FIFO overflow, message(s) lost.\n");
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
> +	nct6694_canfd_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_canfd_handle_rx(struct net_device *ndev, u8 rx_evt)
> +{
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_canfd_frame *frame =3D &priv->rx;
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_RECEIVE,
> +		.sel =3D NCT6694_CANFD_RECEIVE_SEL(ndev->dev_port, 1),
> +		.len =3D cpu_to_le16(sizeof(*frame))
> +	};
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> +	if (ret)
> +		return;
> +
> +	if (frame->flag & NCT6694_CANFD_FRAME_FLAG_FD) {
> +		struct canfd_frame *cfd;
> +
> +		skb =3D alloc_canfd_skb(priv->ndev, &cfd);
> +		if (!skb) {
> +			stats->rx_dropped++;
> +			return;
> +		}
> +
> +		cfd->can_id =3D le32_to_cpu(frame->id);
> +		cfd->len =3D canfd_sanitize_len(frame->length);
> +		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
> +			cfd->can_id |=3D CAN_EFF_FLAG;
> +		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_BRS)
> +			cfd->flags |=3D CANFD_BRS;
> +		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_ERR)
> +			cfd->flags |=3D CANFD_ESI;
> +
> +		memcpy(cfd->data, frame->data, cfd->len);
> +	} else {
> +		struct can_frame *cf;
> +
> +		skb =3D alloc_can_skb(priv->ndev, &cf);
> +		if (!skb) {
> +			stats->rx_dropped++;
> +			return;
> +		}
> +
> +		cf->can_id =3D le32_to_cpu(frame->id);
> +		cf->len =3D can_cc_dlc2len(frame->length);
> +		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
> +			cf->can_id |=3D CAN_EFF_FLAG;
> +
> +		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_RTR)
> +			cf->can_id |=3D CAN_RTR_FLAG;
> +		else
> +			memcpy(cf->data, frame->data, cf->len);
> +	}
> +
> +	nct6694_canfd_rx_offload(&priv->offload, skb);
> +}
> +
> +static int nct6694_canfd_get_berr_counter(const struct net_device *ndev,
> +					  struct can_berr_counter *bec)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +
> +	*bec =3D priv->bec;
> +
> +	return 0;
> +}
> +
> +static void nct6694_canfd_handle_state_change(struct net_device *ndev, u=
8 status)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	enum can_state new_state, rx_state, tx_state;
> +	struct can_berr_counter bec;
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	nct6694_canfd_get_berr_counter(ndev, &bec);
> +	can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
> +
> +	new_state =3D max(tx_state, rx_state);
> +
> +	/* state hasn't changed */
> +	if (new_state =3D=3D priv->can.state)
> +		return;
> +
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +
> +	can_change_state(ndev, cf, tx_state, rx_state);
> +
> +	if (new_state =3D=3D CAN_STATE_BUS_OFF) {
> +		can_bus_off(ndev);
> +	} else if (cf) {
> +		cf->can_id |=3D CAN_ERR_CNT;
> +		cf->data[6] =3D bec.txerr;
> +		cf->data[7] =3D bec.rxerr;
> +	}
> +
> +	if (skb)
> +		nct6694_canfd_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_canfd_handle_bus_err(struct net_device *ndev, u8 bus=
_err)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct can_frame *cf;
> +	struct sk_buff *skb;
> +
> +	priv->can.can_stats.bus_error++;
> +
> +	skb =3D alloc_can_err_skb(ndev, &cf);
> +	if (cf)
> +		cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> +
> +	switch (bus_err) {
> +	case NCT6694_CANFD_EVT_ERR_CRC_ERROR:
> +		netdev_dbg(ndev, "CRC error\n");
> +		ndev->stats.rx_errors++;
> +		if (cf)
> +			cf->data[3] |=3D CAN_ERR_PROT_LOC_CRC_SEQ;
> +		break;
> +
> +	case NCT6694_CANFD_EVT_ERR_STUFF_ERROR:
> +		netdev_dbg(ndev, "Stuff error\n");
> +		ndev->stats.rx_errors++;
> +		if (cf)
> +			cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> +		break;
> +
> +	case NCT6694_CANFD_EVT_ERR_ACK_ERROR:
> +		netdev_dbg(ndev, "Ack error\n");
> +		ndev->stats.tx_errors++;
> +		if (cf) {
> +			cf->can_id |=3D CAN_ERR_ACK;
> +			cf->data[2] |=3D CAN_ERR_PROT_TX;
> +		}
> +		break;
> +
> +	case NCT6694_CANFD_EVT_ERR_FORM_ERROR:
> +		netdev_dbg(ndev, "Form error\n");
> +		ndev->stats.rx_errors++;
> +		if (cf)
> +			cf->data[2] |=3D CAN_ERR_PROT_FORM;
> +		break;
> +
> +	case NCT6694_CANFD_EVT_ERR_BIT_ERROR:
> +		netdev_dbg(ndev, "Bit error\n");
> +		ndev->stats.tx_errors++;
> +		if (cf)
> +			cf->data[2] |=3D CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	if (skb)
> +		nct6694_canfd_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_canfd_handle_tx(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct net_device_stats *stats =3D &ndev->stats;
> +
> +	stats->tx_bytes +=3D can_rx_offload_get_echo_skb_queue_tail(&priv->offl=
oad,
> +								  0, NULL);
> +	stats->tx_packets++;
> +	netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_canfd_irq(int irq, void *data)
> +{
> +	struct net_device *ndev =3D data;
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_canfd_event *event =3D &priv->event[ndev->dev_port];
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_EVENT,
> +		.sel =3D NCT6694_CANFD_EVENT_SEL(ndev->dev_port, NCT6694_CANFD_EVENT_M=
ASK),
> +		.len =3D cpu_to_le16(sizeof(priv->event))
> +	};
> +	irqreturn_t handled =3D IRQ_NONE;
> +	int ret;
> +
> +	ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
> +	if (ret < 0)
> +		return handled;
> +
> +	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_IN) {
> +		nct6694_canfd_handle_rx(ndev, event->rx_evt);
> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_LOST) {
> +		nct6694_canfd_handle_lost_msg(ndev);
> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->status) {
> +		nct6694_canfd_handle_state_change(ndev, event->status);
> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->err !=3D NCT6694_CANFD_EVT_ERR_NO_ERROR) {
> +		if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
> +			nct6694_canfd_handle_bus_err(ndev, event->err);
> +		handled =3D IRQ_HANDLED;
> +	}
> +
> +	if (event->tx_evt & NCT6694_CANFD_EVT_TX_FIFO_EMPTY) {
> +		nct6694_canfd_handle_tx(ndev);
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
> +static void nct6694_canfd_tx_work(struct work_struct *work)
> +{
> +	struct nct6694_canfd_priv *priv =3D container_of(work,
> +						       struct nct6694_canfd_priv,
> +						       tx_work);
> +	struct nct6694_canfd_frame *frame =3D &priv->tx;
> +	struct net_device *ndev =3D priv->ndev;
> +	struct net_device_stats *stats =3D &ndev->stats;
> +	struct sk_buff *skb =3D priv->can.echo_skb[0];
> +	static const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_DELIVER,
> +		.sel =3D NCT6694_CANFD_DELIVER_SEL(1),
> +		.len =3D cpu_to_le16(sizeof(*frame))
> +	};
> +	u32 txid;
> +	int err;
> +
> +	memset(frame, 0, sizeof(*frame));
> +
> +	frame->tag =3D NCT6694_CANFD_FRAME_TAG(ndev->dev_port);
> +
> +	if (can_is_canfd_skb(skb)) {
> +		struct canfd_frame *cfd =3D (struct canfd_frame *)skb->data;
> +
> +		if (cfd->flags & CANFD_BRS)
> +			frame->flag |=3D NCT6694_CANFD_FRAME_FLAG_BRS;
> +
> +		if (cfd->can_id & CAN_EFF_FLAG) {
> +			txid =3D cfd->can_id & CAN_EFF_MASK;
> +			frame->flag |=3D NCT6694_CANFD_FRAME_FLAG_EFF;
> +		} else {
> +			txid =3D cfd->can_id & CAN_SFF_MASK;
> +		}
> +		frame->flag |=3D NCT6694_CANFD_FRAME_FLAG_FD;
> +		frame->id =3D cpu_to_le32(txid);
> +		frame->length =3D canfd_sanitize_len(cfd->len);
> +
> +		memcpy(frame->data, cfd->data, frame->length);
> +	} else {
> +		struct can_frame *cf =3D (struct can_frame *)skb->data;
> +
> +		if (cf->can_id & CAN_EFF_FLAG) {
> +			txid =3D cf->can_id & CAN_EFF_MASK;
> +			frame->flag |=3D NCT6694_CANFD_FRAME_FLAG_EFF;
> +		} else {
> +			txid =3D cf->can_id & CAN_SFF_MASK;
> +		}
> +
> +		if (cf->can_id & CAN_RTR_FLAG)
> +			frame->flag |=3D NCT6694_CANFD_FRAME_FLAG_RTR;
> +		else
> +			memcpy(frame->data, cf->data, cf->len);
> +
> +		frame->id =3D cpu_to_le32(txid);
> +		frame->length =3D cf->len;
> +	}
> +
> +	err =3D nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> +	if (err) {
> +		can_free_echo_skb(ndev, 0, NULL);
> +		stats->tx_dropped++;
> +		stats->tx_errors++;
> +		netif_wake_queue(ndev);
> +	}
> +}
> +
> +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> +					    struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
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
> +static int nct6694_canfd_start(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> +	const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> +	struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_SETTING,
> +		.sel =3D ndev->dev_port,
> +		.len =3D cpu_to_le16(sizeof(*setting))
> +	};
> +	int ret;
> +
> +	setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> +	if (!setting)
> +		return -ENOMEM;
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_NISO);
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +		setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_LBCK);
> +
> +	/* Disable clock divider */
> +	setting->ctrl2 =3D 0;
> +
> +	setting->nbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NSJ=
W,
> +					       n_bt->sjw - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NBRP,
> +					       n_bt->brp - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG2,
> +					       n_bt->phase_seg2 - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG1,
> +					       n_bt->prop_seg + n_bt->phase_seg1 - 1));
> +
> +	setting->dbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DSJ=
W,
> +					       d_bt->sjw - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DBRP,
> +					       d_bt->brp - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG2,
> +					       d_bt->phase_seg2 - 1) |
> +				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG1,
> +					       d_bt->prop_seg + d_bt->phase_seg1 - 1));
> +
> +	setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
> +			  NCT6694_CANFD_SETTING_ACTIVE_CTRL2 |
> +			  NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
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
> +static void nct6694_canfd_stop(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_SETTING,
> +		.sel =3D ndev->dev_port,
> +		.len =3D cpu_to_le16(sizeof(*setting))
> +	};
> +
> +	/* The NCT6694 cannot be stopped. To ensure safe operation and avoid
> +	 * interference, the control mode is set to Listen-Only mode. This
> +	 * mode allows the device to monitor bus activity without actively
> +	 * participating in communication.
> +	 */
> +	setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> +	if (!setting)
> +		return;
> +
> +	nct6694_read_msg(priv->nct6694, &cmd_hd, setting);
> +	setting->ctrl1 =3D cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
> +	setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1;
> +	nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> +
> +	priv->can.state =3D CAN_STATE_STOPPED;
> +}
> +
> +static int nct6694_canfd_close(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +

make this inverse to nct6694_canfd_open()

> +	netif_stop_queue(ndev);
> +	can_rx_offload_disable(&priv->offload);
> +	nct6694_canfd_stop(ndev);
> +	free_irq(ndev->irq, ndev);
> +	destroy_workqueue(priv->wq);
> +	close_candev(ndev);
> +	return 0;
> +}
> +
> +static int nct6694_canfd_set_mode(struct net_device *ndev, enum can_mode=
 mode)
> +{
> +	int ret;
> +
> +	switch (mode) {
> +	case CAN_MODE_START:
> +		ret =3D nct6694_canfd_start(ndev);
> +		if (ret)
> +			return ret;
> +
> +		netif_wake_queue(ndev);
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static int nct6694_canfd_open(struct net_device *ndev)
> +{
> +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> +	int ret;
> +
> +	ret =3D open_candev(ndev);
> +	if (ret)
> +		return ret;
> +
> +	can_rx_offload_enable(&priv->offload);
> +
> +	ret =3D request_threaded_irq(ndev->irq, NULL,
> +				   nct6694_canfd_irq, IRQF_ONESHOT,
> +				   "nct6694_canfd", ndev);
> +	if (ret) {
> +		netdev_err(ndev, "Failed to request IRQ\n");
> +		goto close_candev;

nitpick: rename to can_rx_offload_disable

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
> +	ret =3D nct6694_canfd_start(ndev);
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
> +static const struct net_device_ops nct6694_canfd_netdev_ops =3D {
> +	.ndo_open =3D nct6694_canfd_open,
> +	.ndo_stop =3D nct6694_canfd_close,
> +	.ndo_start_xmit =3D nct6694_canfd_start_xmit,
> +	.ndo_change_mtu =3D can_change_mtu,
> +};
> +
> +static const struct ethtool_ops nct6694_canfd_ethtool_ops =3D {
> +	.get_ts_info =3D ethtool_op_get_ts_info,
> +};
> +
> +static int nct6694_canfd_get_clock(struct nct6694_canfd_priv *priv)
> +{
> +	struct nct6694_canfd_information *info __free(kfree) =3D NULL;
> +	static const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D NCT6694_CANFD_MOD,
> +		.cmd =3D NCT6694_CANFD_INFORMATION,
> +		.sel =3D NCT6694_CANFD_INFORMATION_SEL,
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

return le32_to_cpu(info->can_clk);

> +
> +	return can_clk;
> +}
> +
> +static int nct6694_canfd_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> +	struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_canfd_priv *priv;
> +	struct net_device *ndev;
> +	int ret, irq, can_clk;
> +
> +	irq =3D irq_create_mapping(nct6694->domain,
> +				 NCT6694_IRQ_CAN0 + cell->id);
> +	if (!irq)
> +		return irq;
> +
> +	ndev =3D alloc_candev(sizeof(struct nct6694_canfd_priv), 1);
> +	if (!ndev) {
> +		ret =3D -ENOMEM;
> +		goto dispose_irq;
> +	}
> +
> +	ndev->irq =3D irq;
> +	ndev->flags |=3D IFF_ECHO;
> +	ndev->dev_port =3D cell->id;
> +	ndev->netdev_ops =3D &nct6694_canfd_netdev_ops;
> +	ndev->ethtool_ops =3D &nct6694_canfd_ethtool_ops;
> +
> +	priv =3D netdev_priv(ndev);
> +	priv->nct6694 =3D nct6694;
> +	priv->ndev =3D ndev;
> +
> +	can_clk =3D nct6694_canfd_get_clock(priv);
> +	if (can_clk < 0) {
> +		ret =3D dev_err_probe(&pdev->dev, can_clk,
> +				    "Failed to get clock\n");
> +		goto free_candev;
> +	}
> +
> +	INIT_WORK(&priv->tx_work, nct6694_canfd_tx_work);
> +
> +	priv->can.clock.freq =3D can_clk;
> +	priv->can.bittiming_const =3D &nct6694_canfd_bittiming_nominal_const;
> +	priv->can.data_bittiming_const =3D &nct6694_canfd_bittiming_data_const;
> +	priv->can.do_set_mode =3D nct6694_canfd_set_mode;
> +	priv->can.do_get_berr_counter =3D nct6694_canfd_get_berr_counter;
> +	priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> +		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> +		CAN_CTRLMODE_FD_NON_ISO;
> +
> +	ret =3D can_set_static_ctrlmode(ndev, CAN_CTRLMODE_FD);
> +	if (ret)
> +		goto free_candev;
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
> +dispose_irq:
> +	irq_dispose_mapping(irq);
> +	return ret;
> +}
> +
> +static void nct6694_canfd_remove(struct platform_device *pdev)
> +{
> +	struct nct6694_canfd_priv *priv =3D platform_get_drvdata(pdev);
> +	struct net_device *ndev =3D priv->ndev;
> +
> +	unregister_candev(ndev);
> +	irq_dispose_mapping(ndev->irq);
> +	can_rx_offload_del(&priv->offload);
> +	free_candev(ndev);

Make the order inverse to the nct6694_canfd_probe() function.

> +}
> +
> +static struct platform_driver nct6694_canfd_driver =3D {
> +	.driver =3D {
> +		.name	=3D DEVICE_NAME,
> +	},
> +	.probe		=3D nct6694_canfd_probe,
> +	.remove		=3D nct6694_canfd_remove,
> +};
> +
> +module_platform_driver(nct6694_canfd_driver);
> +
> +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.34.1

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--owoy6lob2v62fbfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgWIK0ACgkQDHRl3/mQ
kZwv9Af+L+XJLdCErHZzBhoXvJCEvCULTPK+CvYRCgE6s4dAqqKt05eWQM6pjADL
nv6PpgRopgb2MD69FA4ro7s0iNaFizGREHqBoYnS77YhjIqRZm+cWg5JjN0i3lWg
ig6dFAuVhFZ15+d1VuMUffXQIScl/atJMIn3sgrxDtP6qUMFyVw96X/cWlEDs819
Hy+u9Me2B06nqH1/EeVdD6UjSLLGdCNQKiJeasmjd0sN6GICYJasNNfg0zk7zTyq
eVJsWwvRGJdQVSobKDXTY1bQs84g4TprjhRkhkRmIbycek0d758RKddLF59AI3qy
toOzj2sjOvvMvm+Cd3C9A53YzY9Czg==
=KUnp
-----END PGP SIGNATURE-----

--owoy6lob2v62fbfv--

