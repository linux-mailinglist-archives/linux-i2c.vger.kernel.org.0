Return-Path: <linux-i2c+bounces-7548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE029AEA70
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 17:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2BB91C22DED
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 15:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972D71EC01B;
	Thu, 24 Oct 2024 15:28:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A44D8DA
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783727; cv=none; b=sMYS4GbzMoaX8yZjCO+AI3iLii7ghtuqQcMAYCeujHUMqIEXSj97AxtbFbHjLGUTmMd1PzguBiak1fakjxf7Z7BJ6uJi/GOqnD4i/4NGZbEZU4cgnoeV1wX9mUBm5kBUUyLqQbkH3Pc4q578eJTFzcLp6RCiOCcTvt6kTzCUQu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783727; c=relaxed/simple;
	bh=LKBaP9w6Uf0ZW0ufuHdlIFhtJcqlyUWbO2EgFOCBNPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrI3V3b1XCVBOb3lz+CF5Gsz0rF1fAh+jqqhUCDaNRGyFGNRBOJ8pLXWR6bF53HZIl7xjRPKrXs5uczEVyXT7YjJ6OagxR5IyjjqFTADZvKoQ8K6G1JVQtqhdRbD423Oa7UgdyNDxL0HGL7kvARiT7dLi3cuQHPGEg6BXDFPN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3zl3-0005Dr-DK; Thu, 24 Oct 2024 17:28:17 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3zl2-000Djr-2N;
	Thu, 24 Oct 2024 17:28:16 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 488FC35DE79;
	Thu, 24 Oct 2024 15:28:16 +0000 (UTC)
Date: Thu, 24 Oct 2024 17:28:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
Message-ID: <20241024-marvellous-brainy-anteater-f61302-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-5-tmyu0@nuvoton.com>
 <20241024-majestic-chowchow-from-wonderland-096eb4-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h6dfqpkeuoasgop3"
Content-Disposition: inline
In-Reply-To: <20241024-majestic-chowchow-from-wonderland-096eb4-mkl@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--h6dfqpkeuoasgop3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
MIME-Version: 1.0

On 24.10.2024 14:12:44, Marc Kleine-Budde wrote:
> Hello,
>=20
> thanks for your contribution. It seems to me that there is no proper
> TX-flow control and I have some questions.
>=20
> On 24.10.2024 16:59:17, Ming Yu wrote:
>=20
> [...]
>=20
> > +static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
> > +					    struct net_device *ndev)
> > +{
> > +	struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > +	struct nct6694 *nct6694 =3D priv->nct6694;
> > +	struct canfd_frame *cf =3D (struct canfd_frame *)skb->data;
> > +	struct net_device_stats *stats =3D &ndev->stats;
> > +	int can_idx =3D priv->can_idx;
> > +	u32 txid =3D 0;
> > +	int i;
> > +	unsigned int echo_byte;
> > +	u8 data_buf[REQUEST_CAN_CMD10_LEN] =3D {0};
> > +
> > +	if (can_dropped_invalid_skb(ndev, skb))
> > +		return NETDEV_TX_OK;
> > +
> > +	/*
> > +	 * No check for NCT66794 because the TX bit is read-clear
> > +	 * and may be read-cleared by other function
> > +	 * Just check the result of tx command.
> > +	 */
>=20
> Where do you check the result of the TX command?
>=20
> > +	/* Check if the TX buffer is full */
>=20
> Where's the check if the TX buffer is full?
>=20
> > +	netif_stop_queue(ndev);
> > +
> > +	if (can_idx =3D=3D 0)
> > +		data_buf[CAN_TAG_IDX] =3D CAN_TAG_CAN0;
> > +	else
> > +		data_buf[CAN_TAG_IDX] =3D CAN_TAG_CAN1;
> > +
> > +	if (cf->can_id & CAN_EFF_FLAG) {
> > +		txid =3D cf->can_id & CAN_EFF_MASK;
> > +		/*
> > +		 * In case the Extended ID frame is transmitted, the
> > +		 * standard and extended part of the ID are swapped
> > +		 * in the register, so swap them back to send the
> > +		 * correct ID.
> > +		 */
> > +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_EFF;
> > +	} else {
> > +		txid =3D cf->can_id & CAN_SFF_MASK;
> > +	}
> > +
> > +	set_buf32(&data_buf[CAN_ID_IDX], txid);
> > +
> > +	data_buf[CAN_DLC_IDX] =3D cf->len;
> > +
> > +	if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) && can_is_canfd_skb(skb)) {
> > +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_FD;
> > +		if (cf->flags & CANFD_BRS)
> > +			data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_BRS;
> > +	}
> > +
> > +	if (cf->can_id & CAN_RTR_FLAG)
> > +		data_buf[CAN_FLAG_IDX] |=3D CAN_FLAG_RTR;
> > +
> > +	/* set data to buf */
> > +	for (i =3D 0; i < cf->len; i++)
> > +		data_buf[CAN_DATA_IDX + i] =3D *(u8 *)(cf->data + i);
> > +
> > +	can_put_echo_skb(skb, ndev, 0, 0);
> > +
> > +	memcpy(priv->data_buf, data_buf, REQUEST_CAN_CMD10_LEN);
> > +	queue_work(nct6694->async_workqueue, &priv->tx_work);
> > +
> > +	stats->tx_bytes +=3D cf->len;
> > +	stats->tx_packets++;
> > +	echo_byte =3D can_get_echo_skb(ndev, 0, NULL);
> > +
> > +	netif_wake_queue(ndev);
>=20
> How do you make sure that the tx_work has finished?
> Once you wake the queue, the xmit function can be called again. If your
> tx_work has not finished, you'll overwrite the priv->data_buf.

Do you get a CAN TX complete message/IRQ from your device?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--h6dfqpkeuoasgop3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaZ4kACgkQKDiiPnot
vG974Qf+LEKGXgXPxMXrYiiOQHJWjs4Mt5jzVCCkFhLgwCl8AQstWmg8VVtGrhlR
8MQ//KYGUjpOgf2HMBzm8tVduk1AlHw4qUpDfn94AzF2bs+r16LSuUK6Kr1xYM6Q
P+XQuSaK3J7/zuPGu9z0zk2i77GN88LCBecdUKHVEbNAIa0LlYHKng/ixeIYFdGY
mpOHQYFkT9kJIzHxFmjd8IqfFWsVUStEvamVz7/ilHigCKo2SseU674xN2MDKIFE
+2YwADjK1B4X4Mjpga9S5Ckf/t6h3kgh5m8K4zGGYjX7jxNcbgMeD0FD0jyIar9l
moJeeldIOCwdGU3wR1vGneNUjJEhlg==
=Ce8N
-----END PGP SIGNATURE-----

--h6dfqpkeuoasgop3--

