Return-Path: <linux-i2c+bounces-14056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA2C4DF08
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 13:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B95F3B83A0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 12:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23DF328255;
	Tue, 11 Nov 2025 12:43:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649332471D
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865034; cv=none; b=F9jR7rJguVqX6LC3Hm7F+MKTYziQRUAdZaXT7iGLsKnMP+u28aHC3zkuR6n/+HYpvYfQO/F/KjfIC7GROHER32gIX0Uxm1XT5iPtkngNHc76GBJTvQ74krfwobTKIK66/9md/7OygnjFO2bvrq5fQIVgDDEYzNc2nq0SsNKt3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865034; c=relaxed/simple;
	bh=RYOr3m8WpaE4wWyeNKkvMCSlLs6NHz6cXKgn1dkPwrU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oTGKdK8oMKjkMG73wcK16aRxJt2bDIu8s9O/5ebW4win82pVpA1350+WxfXdGC4Fn7s6s29c7V37NDlKIlk31DGYLp9FJ54JsJQtAZNxtpgszYWe8cL1AMcnybk1WzA1Goo58eMCn+cj0bCTq1PKylHT5YOGnBhIohjhAk45TVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIniu-0003YX-BC; Tue, 11 Nov 2025 13:43:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vInit-008CdV-2g;
	Tue, 11 Nov 2025 13:43:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vInit-000000006lb-36qM;
	Tue, 11 Nov 2025 13:43:47 +0100
Message-ID: <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] i2c: designware-platdrv: complete reset control
 devm conversion
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
 jsd@semihalf.com, 	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 	mika.westerberg@linux.intel.com
Date: Tue, 11 Nov 2025 13:43:47 +0100
In-Reply-To: <20251111114559.3188740-2-a.shimko.dev@gmail.com>
References: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
	 <20251111114559.3188740-1-a.shimko.dev@gmail.com>
	 <20251111114559.3188740-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Di, 2025-11-11 at 14:45 +0300, Artem Shimko wrote:
> The driver still manually calls reset_control_assert() in error paths and
> remove function. This creates inconsistent resource management and misses
> the benefits of full device-managed approach.
>=20
> Register devm_add_action_or_reset() callback after acquiring reset contro=
l
> to handle automatic assertion on probe errors and driver removal. This
> eliminates all manual reset_control_assert() calls while maintaining
> identical reset behavior through automatic devm resource management.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 34 ++++++++++++---------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index c77029e520dc..d334af1d7c6f 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -206,6 +206,13 @@ static void i2c_dw_remove_lock_support(struct dw_i2c=
_dev *dev)
>  		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
>  }
> =20
> +static void dw_i2c_plat_assert_reset(void *data)
> +{
> +	struct dw_i2c_dev *dev =3D data;
> +
> +	reset_control_assert(dev->rst);
> +}
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	u32 flags =3D (uintptr_t)device_get_match_data(&pdev->dev);
> @@ -240,34 +247,34 @@ static int dw_i2c_plat_probe(struct platform_device=
 *pdev)
>  	if (IS_ERR(dev->rst))
>  		return PTR_ERR(dev->rst);
> =20
> +	ret =3D devm_add_action_or_reset(device, dw_i2c_plat_assert_reset, dev)=
;
> +	if (ret)
> +		return ret;
> +

This is already done by patch 1. Drop these hunks and squash the rest
into patch 1:

>  	ret =3D i2c_dw_fw_parse_and_configure(dev);
>  	if (ret)
> -		goto exit_reset;
> +		return ret;
> =20
>  	ret =3D i2c_dw_probe_lock_support(dev);
>  	if (ret) {
>  		ret =3D dev_err_probe(device, ret, "failed to probe lock support\n");
> -		goto exit_reset;
> +		return ret;
>  	}
> =20
>  	i2c_dw_configure(dev);
> =20
>  	/* Optional interface clock */
>  	dev->pclk =3D devm_clk_get_optional(device, "pclk");
> -	if (IS_ERR(dev->pclk)) {
> -		ret =3D dev_err_probe(device, PTR_ERR(dev->pclk), "failed to acquire p=
clk\n");
> -		goto exit_reset;
> -	}
> +	if (IS_ERR(dev->pclk))
> +		return dev_err_probe(device, PTR_ERR(dev->pclk), "failed to acquire pc=
lk\n");
> =20
>  	dev->clk =3D devm_clk_get_optional(device, NULL);
> -	if (IS_ERR(dev->clk)) {
> -		ret =3D dev_err_probe(device, PTR_ERR(dev->clk), "failed to acquire cl=
ock\n");
> -		goto exit_reset;
> -	}
> +	if (IS_ERR(dev->clk))
> +		return dev_err_probe(device, PTR_ERR(dev->clk), "failed to acquire clo=
ck\n");
> =20
>  	ret =3D i2c_dw_prepare_clk(dev, true);
>  	if (ret)
> -		goto exit_reset;
> +		return ret;
> =20
>  	if (dev->clk) {
>  		struct i2c_timings *t =3D &dev->timings;
> @@ -315,8 +322,7 @@ static int dw_i2c_plat_probe(struct platform_device *=
pdev)
>  exit_probe:
>  	dw_i2c_plat_pm_cleanup(dev);
>  	i2c_dw_prepare_clk(dev, false);
> -exit_reset:
> -	reset_control_assert(dev->rst);
> +
>  	return ret;
>  }
> =20
> @@ -338,8 +344,6 @@ static void dw_i2c_plat_remove(struct platform_device=
 *pdev)
>  	i2c_dw_prepare_clk(dev, false);
> =20
>  	i2c_dw_remove_lock_support(dev);
> -
> -	reset_control_assert(dev->rst);
>  }
> =20
>  static const struct of_device_id dw_i2c_of_match[] =3D {

regards
Philipp

