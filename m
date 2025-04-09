Return-Path: <linux-i2c+bounces-10238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44674A821F1
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 12:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2221F1757F7
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 10:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3432B25D55F;
	Wed,  9 Apr 2025 10:21:56 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6D25D906
	for <linux-i2c@vger.kernel.org>; Wed,  9 Apr 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194116; cv=none; b=AnnjnG7p/5MXGMJqHGy2fZlyKuSGPpKOXbri2AiayvC6NAGp4RpkKS16+V2az2l+LQpk8X7iFjK1ynqMiBjCTQVkbPpIJA5Z4nIOeUcuy3KIjz0w3/9Bjb0GuipAr1u0Sn6wP8J40UQhVT4DftHHpxKhlTwl+x4lpwyesZKEiCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194116; c=relaxed/simple;
	bh=BuPxUYnAq1u9i+Pfntsfd3gpC2xPAtz600fvbvusAPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQI15v0D8d95BfpTCy3nNbjhLVlEn+W2SOe5Ze8bUUdPJsxYyW6CvyowaOgVnNg5pCgED20501FR2v1EEigSQU97rsIarJcvnB6/2fYLHQiVjp2gEEnXqcoYayeZ+kX+QhKOMGeMH/EB21/1zXIzsz8gWUOe06N2KmejtHMEIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1u2SYY-00050c-Jg; Wed, 09 Apr 2025 12:21:18 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1u2SYV-0045Qy-1o;
	Wed, 09 Apr 2025 12:21:15 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1B3B13F402E;
	Wed, 09 Apr 2025 10:21:15 +0000 (UTC)
Date: Wed, 9 Apr 2025 12:21:13 +0200
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
Subject: Re: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250409-cooperative-elastic-pillbug-672a03-mkl@pengutronix.de>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
 <20250409082752.3697532-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5k6dgg6difxvstba"
Content-Disposition: inline
In-Reply-To: <20250409082752.3697532-5-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--5k6dgg6difxvstba
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

This looks really good now. Some questions and a nitpick inline.

On 09.04.2025 16:27:49, a0282524688@gmail.com wrote:

[...]

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

What does your device do when it goes into bus off? Does it recover itself?

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
> +	if (bus_err =3D=3D NCT6694_CANFD_EVT_ERR_NO_ERROR)
> +		return;

I think this has already been checked nct6694_canfd_irq()

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

[...]

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
> +	setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> +	setting->dbr =3D cpu_to_le32(d_bt->bitrate);
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

What does your device do, if you set the bitrates _and_ the bit timing
parameters? They are redundant.

> +	setting->active =3D NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
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

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5k6dgg6difxvstba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmf2ShYACgkQDHRl3/mQ
kZxkzggAk+mEny64R9vBNPnhs6IO4n463yQ48Kv3K2oTuyjAm9GtSerGtb1Ne0SU
XEh98U+tmHd4IvFrZMcKsYY2dNfDEbEdQyaDoH066x77zxzpP+QCU1AHwmNa5C+v
tUZfb6e29iTqaeyh0agOeYF2t8CB+k7khwYodF6lEvO6ujoV/LdYLCBrXCU1MXZa
hv7XJYKV9COXepICcCw+9s1Vi6M7iyDaBuTmdQiKcPxQIFXoy6dRH36cB6zwNc/8
SBnUsEqpMintdOsIszCwgqFSK8W6yn1G6zmEXb68A6RGXcFOgM+WjwOh760vN6MM
nWU4fVMqvoduPZb0AWYeKjEMtGQraw==
=OeFi
-----END PGP SIGNATURE-----

--5k6dgg6difxvstba--

