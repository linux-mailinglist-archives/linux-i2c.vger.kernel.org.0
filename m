Return-Path: <linux-i2c+bounces-10819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C32AAC115
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E36B21C27188
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7172C262FD3;
	Tue,  6 May 2025 10:14:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFB275113
	for <linux-i2c@vger.kernel.org>; Tue,  6 May 2025 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526470; cv=none; b=Z4fEM7FdX1l97IadNsNpcGiqHDmn7BvTWaYnidTQz3Id22RlXz1DmzVtJlOFPBqSYQo9Lsvn0ZPedD6lnvjqYUl4cSUGDNXczwyYaEXcgo3MJR4SAPABwN7p5Db+y972dxUNEzXZN+Tkyi0S/XxbQEKmyVvdmaFIZVMAmdsZEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526470; c=relaxed/simple;
	bh=WD+ZJ4NtJb45Ch4i+Uiez7RgTZJ1NY8PlVuKx2jh1E4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odX8vrLhoQr0vEqHHU/UmxOjXuh0IEx5z+mJcZbrIUK5IeXZZdW8zYgAzrsw6dIU+IYM3QmCRrjhi1CG42bfCntT9ELvp1e7emjcFsELc3N/lC/D8DruqOSMdDm1BF037a02ZPWj6jjIEWTsDHvsBjhyOmG+5oYY4TJneNwPTxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCFJX-0002sa-Ve; Tue, 06 May 2025 12:14:15 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCFJX-001NTS-2E;
	Tue, 06 May 2025 12:14:15 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCFJX-0005o0-1x;
	Tue, 06 May 2025 12:14:15 +0200
Message-ID: <6da16137350aced4881cd623c27acb4094bf874d.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] i2c: tegra: make reset an optional property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, onor+dt@kernel.org,
 thierry.reding@gmail.com,  jonathanh@nvidia.com, ldewangan@nvidia.com,
 digetx@gmail.com,  linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 06 May 2025 12:14:15 +0200
In-Reply-To: <20250506095936.10687-2-akhilrajeev@nvidia.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
	 <20250506095936.10687-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Di, 2025-05-06 at 15:29 +0530, Akhil R wrote:
> For controllers that has an internal software reset, make the reset
> property optional. This is useful in systems that choose to restrict
> reset control from Linux.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 35 ++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 87976e99e6d0..49b77dcef184 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -134,6 +134,8 @@
>  #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
>  #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
> =20
> +#define I2C_MASTER_RESET_CNTRL			0x0a8
> +
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> =20
> @@ -184,6 +186,9 @@ enum msg_end_type {
>   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface=
 that
>   *		provides additional features and allows for longer messages to
>   *		be transferred in one go.
> + * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL registe=
r which
> + *		provides an alternative to controller reset when configured as
> + *		I2C master
>   * @quirks: I2C adapter quirks for limiting write/read transfer size and=
 not
>   *		allowing 0 length transfers.
>   * @supports_bus_clear: Bus Clear support to recover from bus hang durin=
g
> @@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
> +	bool has_mst_reset;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
>  	bool has_apb_dma;
> @@ -604,6 +610,18 @@ static int tegra_i2c_wait_for_config_load(struct teg=
ra_i2c_dev *i2c_dev)
>  	return 0;
>  }
> =20
> +static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (!i2c_dev->hw->has_mst_reset)
> +		return -EOPNOTSUPP;
> +
> +	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
> +	udelay(1);
> +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode=
;
> @@ -621,8 +639,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_=
dev)
>  	 */
>  	if (handle)
>  		err =3D acpi_evaluate_object(handle, "_RST", NULL, NULL);
> -	else
> +	else if (i2c_dev->rst)
>  		err =3D reset_control_reset(i2c_dev->rst);
> +	else
> +		err =3D tegra_i2c_master_reset(i2c_dev);
> =20
>  	WARN_ON_ONCE(err);
> =20
> @@ -1467,6 +1487,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2=
c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D false,
>  	.has_apb_dma =3D true,
> @@ -1491,6 +1512,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2=
c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D false,
>  	.has_apb_dma =3D true,
> @@ -1515,6 +1537,7 @@ static const struct tegra_i2c_hw_feature tegra114_i=
2c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D true,
> @@ -1539,6 +1562,7 @@ static const struct tegra_i2c_hw_feature tegra124_i=
2c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D true,
> @@ -1563,6 +1587,7 @@ static const struct tegra_i2c_hw_feature tegra210_i=
2c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D true,
> @@ -1587,6 +1612,7 @@ static const struct tegra_i2c_hw_feature tegra186_i=
2c_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
> +	.has_mst_reset =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D false,
> @@ -1611,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra194_i=
2c_hw =3D {
>  	.has_multi_master_mode =3D true,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D true,
> +	.has_mst_reset =3D true,
>  	.quirks =3D &tegra194_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D false,
> @@ -1666,7 +1693,11 @@ static int tegra_i2c_init_reset(struct tegra_i2c_d=
ev *i2c_dev)
>  	if (ACPI_HANDLE(i2c_dev->dev))
>  		return 0;
> =20
> -	i2c_dev->rst =3D devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +	if (i2c_dev->hw->has_mst_reset)
> +		i2c_dev->rst =3D devm_reset_control_get_optional_exclusive(i2c_dev->de=
v, "i2c");
> +	else
> +		i2c_dev->rst =3D devm_reset_control_get_exclusive(i2c_dev->dev, "i2c")=
;

This could just use devm_reset_control_get_optional_exclusive()
unconditionally. If the device tree correctly marked the required
resets as non-optional, DT checks would guarantee that required resets
are present in the device tree.

regards
Philipp

