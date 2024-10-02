Return-Path: <linux-i2c+bounces-7190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A998DCF0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 16:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0CD285A3D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FD61D0F65;
	Wed,  2 Oct 2024 14:40:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A711D0F58
	for <linux-i2c@vger.kernel.org>; Wed,  2 Oct 2024 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727880049; cv=none; b=sE8wst0Ylatobh0uCd67XrfkHS4FM9118yomo0Ia2s+y+mjK5xD6yqmIHyt0wc/b+kTm1mXVIpsBry8b60yukkBhAlZF9zMrePgBqpYvXV51WPzhkFe2Mik6ibVF6bZZWbBpm++OOPMWfnJBcvn44FtdooGxFT9zD/M+HQNPMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727880049; c=relaxed/simple;
	bh=cLMM7dqMcazbNJtYgSq5MjOl9AZ/V1cTpLu+ahAamuw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aa/vaOux8cCl0hgDsYo8Lc0uir1Ny0J0F6e9at4Fx1Y3BfaucR0rY5yf5J2+kakyPibaw+6U3/6cepDPyr+xv95jJa3vl0eVBXK4r+WHm4nhn3+jdwky4bWKhF7q4n/XPIv6LPsFgfiv3f1ASFN8NPIACXuE89bsM3z9XXezxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sw0Wn-0004tr-IK; Wed, 02 Oct 2024 16:40:33 +0200
Message-ID: <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master
 mode
From: Lucas Stach <l.stach@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>, o.rempel@pengutronix.de, 
	kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, Stefan Eichenberger
	 <stefan.eichenberger@toradex.com>, linux-i2c@vger.kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Oct 2024 16:40:32 +0200
In-Reply-To: <20241002112020.23913-2-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
	 <20241002112020.23913-2-eichest@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Am Mittwoch, dem 02.10.2024 um 13:19 +0200 schrieb Stefan Eichenberger:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>=20
> According to the i.MX8M Mini reference manual chapter "16.1.4.2
> Generation of Start" it is only necessary to poll for bus busy and
> arbitration lost in multi master mode. This helps to avoid rescheduling
> while the i2c bus is busy and avoids SMBus devices to timeout.
>=20
This is a backward incompatible change, as far as I can see. Until now
the driver would properly handle a multi-mastered bus, without any
specific configuration. Now it requires the new multi-master DT
property to be set, which isn't even documented in the binding to be
understood by this driver.

Are you sure that every single instance of a i.MX i2c bus is only
single mastered?

If this is a worthwhile performance improvement I guess you need to
flip the logic around by adding a new single-master DT property (or
something along those lines), which should go through proper DT binding
review. You can then use this property for boards/busses to opt into
skipping the arbitration lost check.

Regards,
Lucas

> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 98539313cbc97..fbacdfaf6b28e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -216,6 +216,8 @@ struct imx_i2c_struct {
>  	struct i2c_client	*slave;
>  	enum i2c_slave_event last_slave_event;
> =20
> +	bool			multi_master;
> +
>  	/* For checking slave events. */
>  	spinlock_t     slave_lock;
>  	struct hrtimer slave_timer;
> @@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2=
c_imx, int for_busy, bool a
>  	unsigned long orig_jiffies =3D jiffies;
>  	unsigned int temp;
> =20
> +	if (!i2c_imx->multi_master)
> +		return 0;
> +
>  	while (1) {
>  		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> =20
> @@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct=
 *i2c_imx, bool atomic)
>  		return -ETIMEDOUT;
>  	}
> =20
> -	/* check for arbitration lost */
> -	if (i2c_imx->i2csr & I2SR_IAL) {
> +	/* In multi-master mode check for arbitration lost */
> +	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
>  		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> =20
> @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>  		goto rpm_disable;
>  	}
> =20
> +	i2c_imx->multi_master =3D of_property_read_bool(pdev->dev.of_node, "mul=
ti-master");
> +
>  	/* Set up clock divider */
>  	i2c_imx->bitrate =3D I2C_MAX_STANDARD_MODE_FREQ;
>  	ret =3D of_property_read_u32(pdev->dev.of_node,


