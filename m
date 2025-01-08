Return-Path: <linux-i2c+bounces-8985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B8A062D3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 18:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9B13A55B3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 17:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3665F1FF1BB;
	Wed,  8 Jan 2025 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiGZRCkV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C518D;
	Wed,  8 Jan 2025 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355668; cv=none; b=cYHRYxiIdSvQUmVzVmNTMqZdzUXSJZAekfrGUmLZcoMc3l23LpvoQVC04DnoU6OV/Ycg3p5ORqTGJYs8zLfVFP0IAiqCsErck4iBOaym7XtDwnWWnqNUEnObf4agTNSB84mtL7dfu7i1+ne1NdGw8mMlyv+30daLr0c7NlzNeyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355668; c=relaxed/simple;
	bh=RA+33bCtIB+tvkPWgCPkdlHHwm+vEH3cGXJcMmAudRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwfC7IjZ86eJErjJTMQXYF818+P8NxBHlTG9g7oR7rKivo8XZSypE4x75N5zX80Nt5YcrzNBYp0okuanxZdCtfDVMF4tOkZj3QaMlUwTJKB8jfKeb2rrW6tQA9gKoNLtA2SNc+vTOUI6WQMP9s592DS2E1ZxgUNThkP/Cahu3Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiGZRCkV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso363615e9.3;
        Wed, 08 Jan 2025 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736355664; x=1736960464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMbDn25U5i590VeY5P8FryA3U8JVw6i9GkShBlhTLgE=;
        b=EiGZRCkV6PEPEVsl+PBlHqZUnqqG8rRllX33mnX6K7e7yfEwRPfnYQqLc0CRfKsiVY
         3bDNqKCHgA43ajXD0xwv+jtUEoxRvAAJwqbns+fGm9chhbSG2QkMKYwnS9hWP/Vxvk4w
         22fHxtzRn9tkqvplifvytoHaCIrL86e7DPeXIkzaG9MWLV8IoUDZI0igmtkXjCUqlZMJ
         vQa97KzG/92OxY7c7HQl8YraQUMNFK3pNjw9snUURgv+S16f6UMC2d4ndEOedHM1v1GA
         GkWzIZOPp2AF5Fa/MYqvl4WE/v3HwzEx8Vo8yxr2TV8tVvBbFshv0/Xgemfi3U6ZRxUH
         EIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355664; x=1736960464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMbDn25U5i590VeY5P8FryA3U8JVw6i9GkShBlhTLgE=;
        b=cl2PufH44gfXHKu+LModXb11O6wwlkBMIPbyGlnlEttHfp2RqmjHbBoKEUJTMa4sU/
         3yk1adpY2xnaxHMuecSpf3WAzVlyRweClM2rc4oAkqu8kRrJm4tQ8lptNVHn1JduDlwu
         5OOZfuit1oQvazGgdmtCuc/4oBHdr5jJj3ZzNe8Dm5XBwY+hMLVCEhDknj5kluBQ+Gb2
         b2d+JyXf9ogJUVo2gIAqmQh245dVCwytATkcYFzSftXigankv4zgymldow2M23eO+5S7
         rH8vDjOF3Gx8EZvyZvb+yMGW/fvvcyYPKCTRrdN28B8AtKdXH1Ie7PlPNhgsqxWXK+43
         adFw==
X-Forwarded-Encrypted: i=1; AJvYcCUzJRqEYzVrOv4rV736v/yJc52a89Z0wGeT+fhzvgwPd9uTLDpM8pE/2B6kOLkc9u5pfDJR+n33wDqP@vger.kernel.org, AJvYcCWh7GMZf5gJdRLbYH7g+YHFlPaeaRQe/X8Pi/X9nvO21WWkufirE8CVvlXy2j5aJU/4zHd5EL6E7efm/Xk=@vger.kernel.org, AJvYcCWs/qa4Nd9jCEsncAKa7Sp6gyjD4ZQ+LZc2K8N90JvKSDEdfWENzpjdQNG4EnT6N2L8Wy6F1y+mmX46X1WX@vger.kernel.org, AJvYcCXvEuBADe9u/I7NuEsS6WAwUTQbIAV1UtTgHCzZAf/RIijKhgG/8Wqno893MIDwkVF26iImhQP3YbZB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0sQT6Kj43PrdYTm6TVTxD/6Fh5O9SL46e3gD0L1RaaXuZdfsK
	QS9qbp7obC+XAK4ddzanpqwZlrsmpzjTqav28jr2FvU8bBp6tkmI
X-Gm-Gg: ASbGncu2Ax48TzbJxvx/1qfSVmJR+yfXR3aHaG+AGEFtQVX2dav2j3kRkVwKuprYG/L
	qJ1wWtmO/0/BnKhv4D2JwH1RhGtPKdcLwBeN9EeRCr2URvyCrF4F4l4M4pT/WQtscq0aapSfT71
	aS9p3Y5QfSUsS0c/jY+0JgKvSyM7+bU0gMVPwmwsLXZt/HXKCNm6t1MPVYlX5icmeMIrWdOkjWz
	sJ6cWORbcrJeLLnqXORb80X/YJKjeVEWNNxLfw04CY5AQeSI9Kh9RtoxRRtbvXluwWsfcpWGRee
	L78GoQvxN+iSkUddMOWB/z2U20mB6kYy3INrKlLeGao=
X-Google-Smtp-Source: AGHT+IEg3BMjAT/zoCVz2PSWu/G+cH0BB8w2rR7jqEXpyFvfgRftx38hHV7sEMYJMa2x6R0QAOtLwg==
X-Received: by 2002:a5d:588a:0:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-38a87304012mr3457384f8f.21.1736355663582;
        Wed, 08 Jan 2025 09:01:03 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm52754390f8f.104.2025.01.08.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:01:02 -0800 (PST)
Date: Wed, 8 Jan 2025 18:01:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: tegra: Add support for SW Mutex register
Message-ID: <evtz6sp74wp2eiefmiefwwo7nffvj3aiz3o3gyrwojtxh4u7bv@hrbrfgedtmzk>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-5-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ody3qd64lqtiphlo"
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-5-kkartik@nvidia.com>


--ody3qd64lqtiphlo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] i2c: tegra: Add support for SW Mutex register
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:36:19PM +0530, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
>=20
> Add support for SW Mutex register introduced in Tegra264 to provide

The spelling is a bit inconsistent. Earlier you referred to this as SW
MUTEX register, which makes sense if that's what it's called. But then
you call it "SW Mutex" register here. If you don't want to refer to it
by the documented name, it should probably be "SW mutex" instead.

> an option to share the interface between multiple firmware and/or

"firmwares"

> Virtual Machines.

"virtual machines" or "VMs"

> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 126 +++++++++++++++++++++++++++++----
>  1 file changed, 111 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index cf05937cb826..a5974af5b1af 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -135,6 +135,11 @@
>  #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
>  #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
> =20
> +#define I2C_SW_MUTEX				0x0ec
> +#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
> +#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
> +#define I2C_SW_MUTEX_ID				9
> +
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> =20
> @@ -202,6 +207,7 @@ enum msg_end_type {
>   *		in HS mode.
>   * @has_interface_timing_reg: Has interface timing register to program t=
he tuned
>   *		timing settings.
> + * @has_mutex: Has Mutex register for mutual exclusion with other firmwa=
res or VM.

"mutex"

>   */
>  struct tegra_i2c_hw_feature {
>  	bool has_continue_xfer_support;
> @@ -228,6 +234,7 @@ struct tegra_i2c_hw_feature {
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
>  	bool has_hs_mode_support;
> +	bool has_mutex;
>  };
> =20
>  /**
> @@ -371,6 +378,99 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev=
, void *data,
>  	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
> =20
> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> +				   u32 reg, u32 mask, u32 delay_us,
> +				   u32 timeout_us)
> +{
> +	void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
> +	u32 val;
> +
> +	if (!i2c_dev->atomic_mode)
> +		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
> +						  delay_us, timeout_us);
> +
> +	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> +						 delay_us, timeout_us);
> +}
> +
> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 val, id;
> +
> +	val =3D i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id =3D FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id !=3D 0)
> +		return 0;
> +
> +	val =3D FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
> +	i2c_writel(i2c_dev, val, I2C_SW_MUTEX);
> +
> +	val =3D i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id =3D FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (id !=3D I2C_SW_MUTEX_ID)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static void tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	/* Poll until mutex is acquired. */
> +	while (tegra_i2c_mutex_trylock(i2c_dev))
> +		cpu_relax();
> +}

Don't we want to use a timeout here? Otherwise we risk blocking the
thread that this runs on if some firmware decides not to release the
mutex.

Also, is the logic not the wrong way around? I.e. trylock returns true
if the hardware mutex was successfully locked, in which case it doesn't
make sense to keep spinning, right? Or do I misunderstand how this
works?

Thierry

> +
> +static void tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 val, id;
> +
> +	val =3D i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id =3D FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (WARN_ON(id !=3D I2C_SW_MUTEX_ID))
> +		return;
> +
> +	i2c_writel(i2c_dev, 0, I2C_SW_MUTEX);
> +}
> +
> +static void tegra_i2c_bus_lock(struct i2c_adapter *adapter,
> +			       unsigned int flags)
> +{
> +	struct tegra_i2c_dev *i2c_dev =3D i2c_get_adapdata(adapter);
> +
> +	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
> +	tegra_i2c_mutex_lock(i2c_dev);
> +}
> +
> +static int tegra_i2c_bus_trylock(struct i2c_adapter *adapter,
> +				  unsigned int flags)
> +{
> +	struct tegra_i2c_dev *i2c_dev =3D i2c_get_adapdata(adapter);
> +	int ret;
> +
> +	ret =3D rt_mutex_trylock(&adapter->bus_lock);
> +	if (ret)
> +		ret =3D tegra_i2c_mutex_trylock(i2c_dev);
> +
> +	return ret;
> +}
> +
> +static void tegra_i2c_bus_unlock(struct i2c_adapter *adapter,
> +				 unsigned int flags)
> +{
> +	struct tegra_i2c_dev *i2c_dev =3D i2c_get_adapdata(adapter);
> +
> +	rt_mutex_unlock(&adapter->bus_lock);
> +	tegra_i2c_mutex_unlock(i2c_dev);
> +}
> +
> +static const struct i2c_lock_operations tegra_i2c_lock_ops =3D {
> +	.lock_bus =3D tegra_i2c_bus_lock,
> +	.trylock_bus =3D tegra_i2c_bus_trylock,
> +	.unlock_bus =3D tegra_i2c_bus_unlock,
> +};
> +
>  static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>  {
>  	u32 int_mask;
> @@ -546,21 +646,6 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *=
i2c_dev)
>  	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
>  }
> =20
> -static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> -				   u32 reg, u32 mask, u32 delay_us,
> -				   u32 timeout_us)
> -{
> -	void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
> -	u32 val;
> -
> -	if (!i2c_dev->atomic_mode)
> -		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
> -						  delay_us, timeout_us);
> -
> -	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> -						 delay_us, timeout_us);
> -}
> -
>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 mask, val, offset;
> @@ -1497,6 +1582,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2=
c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0x0,
>  	.setup_hold_time_hs_mode =3D 0x0,
>  	.has_interface_timing_reg =3D false,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra30_i2c_hw =3D {
> @@ -1521,6 +1607,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2=
c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0x0,
>  	.setup_hold_time_hs_mode =3D 0x0,
>  	.has_interface_timing_reg =3D false,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra114_i2c_hw =3D {
> @@ -1545,6 +1632,7 @@ static const struct tegra_i2c_hw_feature tegra114_i=
2c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0x0,
>  	.setup_hold_time_hs_mode =3D 0x0,
>  	.has_interface_timing_reg =3D false,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra124_i2c_hw =3D {
> @@ -1569,6 +1657,7 @@ static const struct tegra_i2c_hw_feature tegra124_i=
2c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0x0,
>  	.setup_hold_time_hs_mode =3D 0x0,
>  	.has_interface_timing_reg =3D true,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw =3D {
> @@ -1593,6 +1682,7 @@ static const struct tegra_i2c_hw_feature tegra210_i=
2c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0,
>  	.setup_hold_time_hs_mode =3D 0,
>  	.has_interface_timing_reg =3D true,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra186_i2c_hw =3D {
> @@ -1617,6 +1707,7 @@ static const struct tegra_i2c_hw_feature tegra186_i=
2c_hw =3D {
>  	.setup_hold_time_fast_fast_plus_mode =3D 0,
>  	.setup_hold_time_hs_mode =3D 0,
>  	.has_interface_timing_reg =3D true,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw =3D {
> @@ -1644,6 +1735,7 @@ static const struct tegra_i2c_hw_feature tegra194_i=
2c_hw =3D {
>  	.setup_hold_time_hs_mode =3D 0x090909,
>  	.has_interface_timing_reg =3D true,
>  	.has_hs_mode_support =3D true,
> +	.has_mutex =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra264_i2c_hw =3D {
> @@ -1671,6 +1763,7 @@ static const struct tegra_i2c_hw_feature tegra264_i=
2c_hw =3D {
>  	.setup_hold_time_hs_mode =3D 0x090909,
>  	.has_interface_timing_reg =3D true,
>  	.has_hs_mode_support =3D true,
> +	.has_mutex =3D true,
>  };
> =20
>  static const struct of_device_id tegra_i2c_of_match[] =3D {
> @@ -1875,6 +1968,9 @@ static int tegra_i2c_probe(struct platform_device *=
pdev)
>  	i2c_dev->adapter.nr =3D pdev->id;
>  	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
> =20
> +	if (i2c_dev->hw->has_mutex)
> +		i2c_dev->adapter.lock_ops =3D &tegra_i2c_lock_ops;
> +
>  	if (i2c_dev->hw->supports_bus_clear)
>  		i2c_dev->adapter.bus_recovery_info =3D &tegra_i2c_recovery_info;
> =20
> --=20
> 2.43.0
>=20

--ody3qd64lqtiphlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+r0kACgkQ3SOs138+
s6GXfQ//YdwH+YExR0ZSUd8dapqVUOHGZSOJReQyF3JlUfy5q8SddCav7P6Rd8eU
/rhB0ZC9MEF+PmjFwCOOB1UTxUTpjOdOi8d2IcfQ13mTtyC2UmzEvbt86NKOmjHc
GklTJCWoJGTd/RuxclMAemVv+gqBcLzjqFzTdix6pDKza+qPlcJSE7mIen21d+0o
NI7m6NWxDdO4CJuh7xksUJYG2h/1u8J6Hc4yC1wSwgwk/9ZPP/GGJeqXtqPk125Z
VKfS9y0RiMcqyPC5S/G/ofBvnPG85WKV9kxdxuklIJ/pEms69zZPOeCfmNRITCoF
Ya52+aQZJ+9wTsI3ck5ijNuliYRJe1IHbNRWbIKldooUa+GtnxxI3+k7/qmXELmk
/iz9eKOrwEJXAr48pbu5buRZUXW9tn9m7Q/szq4QvKfbojtiLj+ZjF9y5lDCBTW5
OoD6VrLlQKz3fAuBlseIeYJQdKdzdFwMROWS0ezAeG2k46VXS1hft7PCFi3bHb/J
uoRbJIjj75r+YUJSedjRU0I08rhNx/67dts98VNX2LuKrKnY8aBCV0vJk9QQC8OZ
foK5VGs3ck9f6nTuPMl2y5q5jEyWJYuMAkCuD1kpax4g9RMvy0+Ly337Rtd+Ij2O
kCB4+iSBFT5sTuFg/BMrVWip7iqSVYu24fG6NeHS0/ZR8n8O6tU=
=++e7
-----END PGP SIGNATURE-----

--ody3qd64lqtiphlo--

