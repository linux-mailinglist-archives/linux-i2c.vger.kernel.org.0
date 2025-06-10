Return-Path: <linux-i2c+bounces-11325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D4AD3076
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 040DA3B0740
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F3927FD5F;
	Tue, 10 Jun 2025 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9Xm2lxz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF41D555;
	Tue, 10 Jun 2025 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544383; cv=none; b=dM3Z58Y9Qhe7wJ8RuFnfl2HvjQ+QWI7FLhGHWpaGO6i+Btm7rPnjER8mQfwepFMiTk0FCbITr+cSuqTU2iMZ5fL9sYZCiaHxM+gzfLTV4DtxIeqpcEvchjnDCYhksZXSNKm0ReLZt4SdoY/7ieym3w/nkPV65ZL85MYECaHsZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544383; c=relaxed/simple;
	bh=GxPozG1CZB8z2pXqUGvtMBHxXNvOTKQf740WHBq83/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP6JVK6wuWL995sRx8z8ZmgcSi4ro+4YemuzWvShTrVNjidTGyRtGI+1YPI2Vmz8Kz80E/I7oeBVLr4SZbFeYhfws2OhiziVFgfG9EdUDo+ys3PyY5Eq21/OOXX3nEdoD4FPnxAhZKBvtIOLSFpWpjIaErt+/Uj5TzdazqvhCag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9Xm2lxz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so64864855e9.1;
        Tue, 10 Jun 2025 01:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544380; x=1750149180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XSVka9oJlpR7dCg/+KYidGC8BG6Hl2ojLK4qAZEX05k=;
        b=R9Xm2lxzNMSwAEuCWj/M+/DMlFqCSukoZpwIXB7tQh+esP11PRFT7Zoq2oUVaT+hPE
         w62xRB3qqSxxfe9qasMajhc2dmcrOmvNr0e4ox1YagjZel1vyKkRojT17yGP5N6azugw
         EWouxDyuVm30L1AwrUTS0dUpi54lOIk+ca5OaLXEx7bnSrkJd9w4LlZVu7/UEOXHVwOB
         94XtoNJM0IwP0e2lxZvjTRdGGDyksJ8ITbhUSYUmNJFDOren2Ivobc++ylXh184m0BeW
         21ZleFeWtBWnE0BP9qacCORG9VbADPPz8o7Cufel1VFkOg7tRCWFQ9EM4EkPaa+mDvoW
         WHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544380; x=1750149180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSVka9oJlpR7dCg/+KYidGC8BG6Hl2ojLK4qAZEX05k=;
        b=Uy2f+QnMHVxGkvkSpXyaohGcDdOrzO5uImv3uL+V8L/3fZH/REEOMNiphQUQWU+fWS
         LEYA1WeSl3KyCZhKfi9oWL79EK1vrphgyNSwe95cxzTKkviiARq3oOpNdERrwDRCARmz
         K3T7hHAq+oEkwu9EeFV+Zm8KYaUmGLpMZSbFD/iDZeXrpoj33Sfvwm56XqTVrNszXj3a
         EGwxQ+BZVJg6PQWjDHc2YRg9GGjh/tS/Gqq/vD9AbPBLRxQ6/LZWIAgvo2Hd7FiQqiz0
         vJ8aQKbVhv/aAe/q3A8TNRv2mVbKrBEy1jbYsXXxRybYieq6OCwg0R8w3CJSXtCZmZ0i
         R68w==
X-Forwarded-Encrypted: i=1; AJvYcCVMEYNydiUhRKm+BqRdb1O2c+kWcnqtmybZpQI1WzWgJNOJrYLXmFpu/LeKwt8LcgUOIJV/AuRmwSsA@vger.kernel.org, AJvYcCVNJ1rGBW/kjCIntVulJ1fISLruvKPifCXQOmoI1nZXOIg7+zZNlo8cstE64xGQPp79LDG938zHo01j@vger.kernel.org, AJvYcCW6/RDF2bpdzZSGqc/Yqy/1uN/B+ADWjl2DmOV5dH28LZSYagDMYCEY0C76eebaQTgTkEE2CoA3RzEC7NQO@vger.kernel.org, AJvYcCXjt49zr144lyYbtymenmlAOH6ftCnb4U8lLRKRoyPeaUd4OsSqsVVGBqmtn3s5niGhPaQ0D2mKCQ0HHKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWY1NF2drPxSkHuD516y5Vgs3g2FN17arj4HMapPBfzN0KZCD
	zKhjzch5xMaosMtrlcftk684jWqYFIsX+Bn0GX08u1idvAdHdF8T8Poy
X-Gm-Gg: ASbGncuRerwnajc8JiNUxGn6eqZjtcZF+HzLzKNY1c2zu44JQxOSv2pU6MvRu2+6+pT
	YEztsZzoCxn7/E0z5lV5zfFfAvvotRYXV8R6XcMhhJ3QCx8zfa15513gT2lEqgK4/nPvk0THrWU
	vml18ee3cz3Knx0dP0JZKiSgVqch/kyvyUf1cR57uTn6Ho5qthIIXCKHVV23+GzNMQklvV9WsBn
	VnFqZCeHHdgWb7sFyrZFSBD7FZc3pCCRGk8p1CReDwIe9iPnVFDBbV4vkfBntBQl2u4QyhUk/Y9
	z7wDTkgzVzChgmkw4mu2qvkvDdkD9Iw+F1C6WdG4sYtI9py+YKXKN18UG9Es0y4qEh7/uCj1FYu
	xLF6EOqBCuOQcW9dYJzX3zp6axq9xfspL5WY1q+WVc8id/1ge
X-Google-Smtp-Source: AGHT+IFxMEiDZAZjiWh6OKaFOvLOGCaKHNJM6DCI4Vjs8zfgGbyngmI3cFwsh/pnB/BT3WfAfjXQRQ==
X-Received: by 2002:a05:600c:5295:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-4531de718f9mr15496145e9.18.1749544379381;
        Tue, 10 Jun 2025 01:32:59 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm11607688f8f.76.2025.06.10.01.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:32:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:32:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <cs7polavxoyphttd4uuzb63eguayc5zrd6l6tvyq5nbizpkq2r@g6qvgewu2d2d>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
 <20250603153022.39434-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="treicxcu6kbo7pul"
Content-Disposition: inline
In-Reply-To: <20250603153022.39434-2-akhilrajeev@nvidia.com>


--treicxcu6kbo7pul
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 09:00:21PM +0530, Akhil R wrote:
> For controllers that has an internal software reset, make the reset
> property optional. This is useful in systems that choose to restrict
> reset control from Linux.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v3->v4: No change
> v2->v3: No change
> v1->v2:
>   * Call devm_reset_control_get_optional_exclusive() unconditionally.
>   * Add more delay based on HW recommendation.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 87976e99e6d0..22ddbae9d847 100644
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
>   * @supports_bus_clear: Bus Clear support to recover from bus hang during
> @@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
> +	bool has_mst_reset;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
>  	bool has_apb_dma;
> @@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct teg=
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
> +	udelay(2);
> +
> +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
> +	udelay(2);
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_=
dev)
>  	 */
>  	if (handle)
>  		err =3D acpi_evaluate_object(handle, "_RST", NULL, NULL);

How is the internal reset handled on ACPI? Does the _RST method do the
internal reset?

Thierry

--treicxcu6kbo7pul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH7bgACgkQ3SOs138+
s6HdZRAAnhujjzWpAquHyf6+WinvqVKo6WkTVmd8n9dKR0GF6bpOXjWsXD4td2aQ
JqGsPONKg3tOXPgO9O2LYQmCKFLWs777/piGIGXy0iddzVMItyoMOTiVkvKnLfCG
52eIT/5RBjSBPIy2qZ1QrxIskyRw+HShjjlmSHphZDKQqUp47T8lUxG13MJVPX2Z
9spyhkpPwMeDeS6Jjv6dAWljhUDf27hLjppxMI1HNjSPmKhYbEJxyDKLQRI/a86S
MKevinR/MCkj632QOadQIk6LfU9nxBj6Y4kZ2NGD51oaHfJOZXfYPnTnE9gu2Mwg
R8qjs/PqgTil8zSfZkjHiNrtemBxk5dEXleFgh7EENHna149z56+92B37rqeqw1w
X83coo6YWZkiBwniH8cYsHytFHDSVcMroYIxYA8zTEE/srbV9bdVTncky2seGJff
GZIYHJx8ed4e3mG44Adjfk+0hrF78kPnB+BWutPrCxma4waMd+ruKvcQ3oY8ltQg
bvMGsgICLcMUgj4RYCyE/MPjnRyHq5doph5uf0yZ0Cwg5Xou5zNbeuVuF49/3b5k
Ly84BPXbvjwJjr9/OqUrDdRjejUkprXeIXP3IJSWyLY9xGEVseKdO/OSf2zvB+/v
SOEUtrMrKeooTjOZXhrZWdDnEdcwkIe5dlQPvzywb4vGS2MTj4I=
=8pL6
-----END PGP SIGNATURE-----

--treicxcu6kbo7pul--

