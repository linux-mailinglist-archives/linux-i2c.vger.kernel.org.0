Return-Path: <linux-i2c+bounces-8983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D8A0626B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E21C23A6CF8
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B038D1FF1AC;
	Wed,  8 Jan 2025 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqiZlgsO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D371FFC71;
	Wed,  8 Jan 2025 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354720; cv=none; b=gS7yfup7dRUg1fYunin/PnphF5TaDgOdmkIEWlyjLu98EAqmmuukiut985f+YN6dULjQ/Li3VVm93G3NT/Yxc3DUzFjtk6eNEim1f5yWq/hxMy5TaIi8vQ5IW+OXDr8iHJYNCnohFfLbsK/F8al0gH9tHsnE0CKZeoAxVyoH800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354720; c=relaxed/simple;
	bh=k6Z+0WKEJXmeovBAq+TFJIcRZigj9wvC4v6mK9vA43Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJZ7I6jxygoNnDAJnoODXymKo4QKtAvqhyh/KC/raxOpuNLnB62xNLaeqRkM+QG+6+V660DlAkGEVqkfxVl6+nxUeCOZuihd6z75YtYPA7I8oI4QsvFRzWNWmVbo1Mv0KyWTOIZFGcK0qGyu7hWMkUFx6yZjcDCl19k7a5tmhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqiZlgsO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4368a293339so268665e9.3;
        Wed, 08 Jan 2025 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354717; x=1736959517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WRws9/ylcR4hOwgNw+X45UV+mQZ9WqYgAJ9X3IZOQY=;
        b=iqiZlgsOUFRyZ/fVBqt4+Iw/54pIr6PVVhF13Zg3ABXPu8VDkNHYAdX6HdIRisTh/+
         jdnDawix/vM9bCl5nGLIU8kkhgh3z4uXHiqHkHFQk2qFuBmzwsVqV5ZWFxHg6/A30sZ9
         ws9wpGeXJIjDIxmy76QuCcIrQJxHoyFe+sgB5VhQfjx9RA2/oNxosklUba5snhVPmkZE
         MhjaAzQMiJjfw2GrSzHgjw25IgwNbnTWiZ/MoTAADKLC9NhjSRZmeit3TFuHc7xitCEO
         trYwn7E3kcLoAoQ11aM3QocscBATGIe24w512kvLmoOQFVHcFNE15XyQe/rcgP/pUjVp
         AB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354717; x=1736959517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WRws9/ylcR4hOwgNw+X45UV+mQZ9WqYgAJ9X3IZOQY=;
        b=hk5z7Blz19PlAsCheb6aEn8C7V4Uw93XX8XTcBrC2WeHVHGFVq6pK10Rrb/KUzS9Bf
         eTPKxxcmqxZs7Y0L9rMyceY9T4g4oRCdqP5FS9s/ewVzI9SIDQ0mdMXKUFnD4/2kKuIa
         KCC4+NS6098+fFJMvx7euq5WFVAeiIl6tsIA+r5qXxyjfmNGviuBe4WWz5zjgv9T/GKW
         LV/iG/mYO8ku9paZBg+dkc8FpB3IHVloACDvUXrXA6KpDK90k/TCjpi33rd9laCX1vd6
         +7VQf+KtVnvT2fOLJfi9WJxm2b8k/AEmU+fSTkLEF94pQGew/CORjoDGxOvQyhbWz8i/
         EIsw==
X-Forwarded-Encrypted: i=1; AJvYcCU9gGnvuF44Sydb6qp7zsTwbjJjCSdWJuQbmwUPLMHPcepYDW+HGtAddQPxVUyX0Wv8oEJT0yfA8h+bU78=@vger.kernel.org, AJvYcCVwu/Pm4Y4LWL+p7OolEAKdvR+nzmeAhQjwI0meg/49gJClnNCmgJpCMCEbWt2B7YKIQHFFgD9CzFHnyQOc@vger.kernel.org, AJvYcCWRsK8r4kZK504SWDvrhgXihTioQPnPetsXhA6VyUvH5x8ghID7tcNsMVM3GK9E/89vCzocGnT1CCn9@vger.kernel.org, AJvYcCXPPi/XqeF/y+P9hCeaDerju8TFjyOeqCUQcS/Cvb81W8wPATIjHS2bIL5wHHOuty+yeM88mKEitNWC@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDGeZrc51dsq9KhdTTo3l/aTtyeBipWWKmZyK8sAePERDg03Q
	eFU6BcCZQVVnJWd099Qo2n7Gj/COGY3UPWHS4C5K73b+Lj+gQtkYpWiN2w==
X-Gm-Gg: ASbGncsl9GRJiQwac/Kw0r9b3ctO0XL0WNMEUhXVVdGdcUPCyDmo8XUDDoezu47nzjR
	l1eWSP6mfxPUBSZtqyObK5LEF0gJcVAPyoZYHbXrHasERHhWLHXTdVEBmaDI5VdzTiJ8a2Oaj0u
	9ZVG3dBM+ey5TzBnOd9e33Q1rktqiYETdsU89HY/KG42i+hQtet46CJrbGvjhW+/kZ1BF8ci1Xe
	/uhRlW+/zGXJnWMCpp7J023KO6Xf3/uuatvV2vFj+gZPeIGiqtHR/RJSLMY7Ez8XD2qxcWq1lS9
	SUkFxTVvk+qIAUN1H796hy+jovEYShdhhw9H2lB4e74=
X-Google-Smtp-Source: AGHT+IFOAuP2DxlOkUhHfua0ESZfFyqN7tsvUHVvwtvQEcyeofqFixLD4+/uROBh/C0pNuDwU1ivcQ==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr3144131f8f.48.1736354716409;
        Wed, 08 Jan 2025 08:45:16 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm53428145f8f.68.2025.01.08.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:45:15 -0800 (PST)
Date: Wed, 8 Jan 2025 17:45:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] i2c: tegra: Add HS mode support
Message-ID: <vdllsl3rbt5xjaew4wzovpo3aoqrn4wvezcvuqfyr3mer6n7on@pkq5q2g43r3n>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qudb7efldaux7ygl"
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-2-kkartik@nvidia.com>


--qudb7efldaux7ygl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] i2c: tegra: Add HS mode support
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:36:16PM +0530, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
>=20
> Add support for HS (High Speed) mode tranfers, which is supported by
> Tegra194 onwards.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 87976e99e6d0..7b97c6d347ee 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>  #define I2C_HEADER_IE_ENABLE			BIT(17)
>  #define I2C_HEADER_REPEAT_START			BIT(16)
>  #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)
>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
> =20
>  #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -220,10 +221,13 @@ struct tegra_i2c_hw_feature {
>  	u32 thigh_std_mode;
>  	u32 tlow_fast_fastplus_mode;
>  	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>  	u32 setup_hold_time_std_mode;
>  	u32 setup_hold_time_fast_fast_plus_mode;
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>  };
> =20
>  /**
> @@ -681,6 +685,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_=
dev)
>  	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>  		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
> =20
> +	/* Write HS mode registers. These will get used only for HS mode*/
> +	if (i2c_dev->hw->has_hs_mode_support) {
> +		tlow =3D i2c_dev->hw->tlow_hs_mode;
> +		thigh =3D i2c_dev->hw->thigh_hs_mode;
> +		tsu_thd =3D i2c_dev->hw->setup_hold_time_hs_mode;
> +
> +		val =3D FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
> +	}
> +
>  	clk_multiplier =3D (tlow + thigh + 2) * (non_hs_mode + 1);
> =20
>  	err =3D clk_set_rate(i2c_dev->div_clk,
> @@ -1178,6 +1194,9 @@ static void tegra_i2c_push_packet_header(struct teg=
ra_i2c_dev *i2c_dev,
>  	if (msg->flags & I2C_M_RD)
>  		packet_header |=3D I2C_HEADER_READ;
> =20
> +	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		packet_header |=3D I2C_HEADER_HS_MODE;
> +

Do we need any kind of checking here? What happens if the requested
frequency is higher than fastmode+ but the device doesn't support the
new high-speed mode? I guess maybe we don't have to care because such
cases won't ever show up because, well, they won't work.

Still, it might be a good idea to be explicit about it and have an extra
check in place (or perhaps a little higher up in the call chain) and
return an error if we're trying to use a frequency that isn't supported
on the chip.

Thierry

>  	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>  		*dma_buf++ =3D packet_header;
>  	else
> @@ -1618,10 +1637,13 @@ static const struct tegra_i2c_hw_feature tegra194=
_i2c_hw =3D {
>  	.thigh_std_mode =3D 0x7,
>  	.tlow_fast_fastplus_mode =3D 0x2,
>  	.thigh_fast_fastplus_mode =3D 0x2,
> +	.tlow_hs_mode =3D 0x8,
> +	.thigh_hs_mode =3D 0x3,
>  	.setup_hold_time_std_mode =3D 0x08080808,
>  	.setup_hold_time_fast_fast_plus_mode =3D 0x02020202,
>  	.setup_hold_time_hs_mode =3D 0x090909,
>  	.has_interface_timing_reg =3D true,
> +	.has_hs_mode_support =3D true,
>  };
> =20
>  static const struct of_device_id tegra_i2c_of_match[] =3D {
> --=20
> 2.43.0
>=20

--qudb7efldaux7ygl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+q5kACgkQ3SOs138+
s6FQvw//T/XBbx6NdhIG5gWh6EAikURgph48cRw/cWUHjvnpGZREMqKPFwPPKiXo
xf87vHZGoHH4TE2Wa1BAr9CbOwRxMpc6NDcfjezUJEIa6SsHwNcpcxmPfVvnLv5p
dEJrjoegngbMxFlnyJul50k/ap90TzdqxWn0CVWjRPFI5YvbdCT+xQia0gUtpwsc
FZHzx40wkoEmUpUeAZMrDf15xe+lXwYtNIr/JrvJpvMVxQunoeMq50wzLYNMfPZa
7zbFwh5GgEXiDFXb3b5cEI+7f/626lDR77yeXmi1om29nGEv7oOA6pO3C0hUKaFd
q56VmyLnSRJ4LiPn/x4lh/Up/jFXykbWVt66fUn6hRJcH3Y7XKl8nzew0sp3IMq+
8HpQY+UUAGURnVRCr/xsxTtPG9Lsl596CJPvGUR+NJak/2YiXK406gsxVa2cL5vH
HXJF006uY/B40usqEmglo4YTuzQro5O+JwyIK40bm79q1cBxpk0o6CU5guIFPKzN
Y1MNnMSrNiIDrPN0T+enxYdtQ84J3DHSq32KZlx3AQhonwnwOV/ufovZRRGfG8r2
BnygLpRMqBgU4KxYrILdVAA8A21AbEgyQuHj5XsBu8weOmUEYDwdKIT/gRxrhf3a
ZxauSlGwZAttseL+TEyAeYTYP25ipdSszqPAuhicAy2Gw/2ke78=
=ID/5
-----END PGP SIGNATURE-----

--qudb7efldaux7ygl--

