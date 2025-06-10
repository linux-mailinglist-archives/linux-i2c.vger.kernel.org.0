Return-Path: <linux-i2c+bounces-11320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC50AD2F32
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B146D16EB8C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 07:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B32927A93A;
	Tue, 10 Jun 2025 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9FH3yCM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39421D5B3;
	Tue, 10 Jun 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541796; cv=none; b=TlS/IwcTMWQ0nziFMHJiIJRhMQXO/eKRUSlMfEqpSb4N16+SGjGNwSP19VyaAwSCnx6Xd5Bj/1+RzkWH4PIKu7sZD/m4ghjEaAXzcsH5Bs8yk6ueAkddPZucB03zOlXU216P+iw3bSJ+L7Lr0UgcVxe2U1qaDRRlOg1ZYBpi5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541796; c=relaxed/simple;
	bh=nfATb0do+JllStH5Etn1xFJYpEiIcT5Y3p9a2rkUhPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf6Xb6xvLLJgdesCb+3/yq3jLNPTh1g6BiZlPisL0ldSKnhbXV7h3maIXSAuZh1wSZY82oKawSQ4jOK0mfc6hAgsOg42opPLzC5ZKGJG/bmnkLPM/as+LpYq4liy27XjLSvkRUhrKsvQpYOQ/coYP8rSig9FxpE8h9F3xi5z/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9FH3yCM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45024721cbdso44441215e9.2;
        Tue, 10 Jun 2025 00:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541792; x=1750146592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PO0gqEWs8Vzu467LgAM3K6Au3/PpgTrkswZMrYucAGM=;
        b=Q9FH3yCMhxgAPmvLiSnu1ecvbDawmy+GyBqq6EkO0mhzsOoHYBHkfRsjR5pjzU7xQA
         ZYGDwh+jyEm0xWGxdjKbgmGthbjEw8G7+cDjkNkYchpKuoAf5DN6Pc4xcRVhKuj6tZs5
         Xsh227pzQAcsEGbPRhH0uiDpEyoCdfv+jFj2VIWyk9koEDMrqDJ2RQ39IzNeg0OA2bqy
         bFSKz2pavbkY3X9lmwM43DbAQGxeBTMZwApDoZoVlLO/qZP8U2idQi9QUBy3B0aulMmw
         UoyzlpE4aNzRQTRYRHHXC1IqTnyQsEqp27AMFvZhIATHH+sdf82kcXzI+OWaYbwOVd23
         ZTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541792; x=1750146592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO0gqEWs8Vzu467LgAM3K6Au3/PpgTrkswZMrYucAGM=;
        b=atE8nW5q9YDZAHYjTxphEFDG6LNB74bPIQ5ArKSRHFVUnCz8u8WD7zUkmwhLME7+AZ
         YN+G85yA2B5h9WbIvPtCPJiQ5WqvzLMgsiEJXZL5CjuT3EaK882mAzEeA1fPCJWg3EXV
         fB/egqUtD8a9wIxcI0EbTLMgxu4QdKCTPSTIKew0a/A7MKI5KFj1PeQfA76jbjwBNmem
         nTtKUY2+Mt7V0afKXMFr9hPBf3RrHe6ATAw+H8xjMK6R5YgZYMcE/ml9LldCb/76BcrW
         JVZgxNICWS4bTb1XA/DknWAj33cZmZwYS7tW44J2SOLe0h613MPjpg3O38VMDXmpBuZD
         zSzA==
X-Forwarded-Encrypted: i=1; AJvYcCVRygA2RPbfYEmGiicjLvHIpqTGKZIjMed3N81RjKKB6D1HXT9/gGULpB6bQdaThjCd9wNghYjad2YuC0M=@vger.kernel.org, AJvYcCVcuqzxSv0BsIcR5WB96+Zex1efyKNolXaWtYUE1A3hyikl3Pot/FG+310o4SXcoysrewjZJ3jxuD20@vger.kernel.org, AJvYcCVqF+ErBWu8D5nyq3nMEGMGHaQIsqn6i9t17X9jcG3Q4Lh7hcdbXlKVETB8tacRfATRc8mAySsXVK1l2hYb@vger.kernel.org, AJvYcCVv7XaqFuNlC4NsBdoFypsqOsxrlrH380uISZITlIZep91IamCLGV+wMbRIuhrj8yH9n2MeFWMUeylt@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNeLbgRpu/QwsVSQIrnQtC0C6E78Yf3v61pgRWJC2BV6/ktfM
	iZBHSEb9xARKaQYioJAJWhnlH3J7wHt1R3oPti9MaVqubwqULCpSUqXH
X-Gm-Gg: ASbGncvqtS/QZ6uakVbQbzvhxMqQwJeR/1dVv+jCbmnawfb/ieP/P5o19cou4wkG32b
	lS7qUT9gPIaX0GvpVufHeUSNb4rBg+4t+95RUamO6WqVTeDG+rVtlrk4QfGQlKIb8yJeE1X1uam
	RFTpLGHL8+yFd8mxbMXZcRB6nyjaXkVr2jHQh/a6ufeVVyfnNxEItjF4XSnUt1WHUL1EiXHEi/O
	JDVXwys4mHGcnC2rKY8s0KUkld7Jd1PW1HGTPMEhc8M2LjfojiXNAoHgV8nOk9BXksb2lyZtNJ3
	5+to1r0GP0DteGMWXUwOXU8/jBP5W6u5cXeaSjDHxpGmkRu+gobI8uswz1u2kBUuZPaiFN7zssK
	S1o13uXHfRYCbEjhgvZT74TFwPlsv7hgScu/gyJwC+bplRoVI
X-Google-Smtp-Source: AGHT+IGn/Hs9WO3edOqBOBfGO9l1/LqLxOvSvzRyNdb+vPEMVgktC0EwzD3B/udi68fWwnJpAMEM6g==
X-Received: by 2002:a05:600c:5295:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-4531de718f9mr13831345e9.18.1749541791951;
        Tue, 10 Jun 2025 00:49:51 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm130786285e9.10.2025.06.10.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:49:49 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:49:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
Message-ID: <wgpcfddybwgdt4ggllooh35iukid24urb7mrbrcd5egs4blqyv@hty6js2piqug>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-5-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7qnlsttyegljuf7w"
Content-Disposition: inline
In-Reply-To: <20250609093420.3050641-5-kkartik@nvidia.com>


--7qnlsttyegljuf7w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 03:04:19PM +0530, Kartik Rajput wrote:
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs.
>=20
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v2 -> v3:
> 	* Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
> 	  use readl and writel APIs instead of i2c_readl and i2c_writel
> 	  which use relaxed APIs.
> 	* Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
> v1 -> v2:
> 	* Fixed typos.
> 	* Fix tegra_i2c_mutex_lock() logic.
> 	* Add a timeout in tegra_i2c_mutex_lock() instead of polling for
> 	  mutex indefinitely.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 137 +++++++++++++++++++++++++++++----
>  1 file changed, 122 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index d0b6aa013c96..dae59e9e993b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -137,6 +137,14 @@
> =20
>  #define I2C_MASTER_RESET_CNTRL			0x0a8
> =20
> +#define I2C_SW_MUTEX				0x0ec
> +#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
> +#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
> +#define I2C_SW_MUTEX_ID				9

Maybe this should contain some sort of suffix to denote which ID this
is? Maybe I2C_SW_MUTEX_ID_CCPLEX?

> +
> +/* SW mutex acquire timeout value in milliseconds. */
> +#define I2C_SW_MUTEX_TIMEOUT			25
> +
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> =20
> @@ -210,6 +218,7 @@ enum msg_end_type {
>   * @has_interface_timing_reg: Has interface timing register to program t=
he tuned
>   *		timing settings.
>   * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
> + * @has_mutex: Has mutex register for mutual exclusion with other firmwa=
res or VMs.
>   */
>  struct tegra_i2c_hw_feature {
>  	bool has_continue_xfer_support;
> @@ -237,6 +246,7 @@ struct tegra_i2c_hw_feature {
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
>  	bool has_hs_mode_support;
> +	bool has_mutex;
>  };
> =20
>  /**
> @@ -380,6 +390,108 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_de=
v, void *data,
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

The move of this function seems unnecessary.

> +
> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg =3D tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val =3D readl(i2c_dev->base + reg);
> +	id =3D FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id !=3D 0 && id !=3D I2C_SW_MUTEX_ID)
> +		return 0;
> +
> +	val =3D FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
> +	writel(val, i2c_dev->base + reg);
> +
> +	val =3D readl(i2c_dev->base + reg);
> +	id =3D FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (id !=3D I2C_SW_MUTEX_ID)
> +		return 0;
> +
> +	return 1;
> +}

Do we need some sort of locking around these? Or is this always
guaranteed to be called from a locked region already?

> +
> +static void tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int num_retries =3D I2C_SW_MUTEX_TIMEOUT;
> +
> +	/* Poll until mutex is acquired or timeout. */
> +	while (--num_retries && !tegra_i2c_mutex_trylock(i2c_dev))
> +		usleep_range(1000, 2000);

Maybe this can be rewritten to be easier on the eye? Something like:

	while (--num_retries) {
		if (tegra_i2c_mutex_trylock(i2c_dev))
			break;

		usleep_range(1000, 2000);
	}

looks a bit easier to follow. It may also be better to change this to a
properly timed loop. As it is, the usleep_range() can take anywhere from
1 to 2 ms, so effectively I2C_SW_MUTEX_TIMEOUT 25 can be 50 ms long. I'm
sure that doesn't matter all that much, but it's a bit of an ambiguous
specification. So I think we should either be precise with a timed loop
if we specify the timeout in milliseconds or we should not pretend that
we care about the specific time and rename the variable to something
like I2C_SW_MUTEX_RETRIES instead. I prefer the timed loop variant, and
I think there's ways you can use helpers from linux/iopoll.h to achieve
this (i.e. use the generic read_poll_timeout() with
tegra_i2c_mutex_trylock as op parameter and passing i2c_dev as args).

> +
> +	if (!num_retries)
> +		dev_warn(i2c_dev->dev, "timeout while acquiring mutex, proceeding anyw=
ay\n");
> +}

I take it there's no way to refuse operations since there's no return
value for this function? I wonder if it's the right interface for this,
then. If there's no mechanism to enforce the lock in hardware, then we
must somehow respect it in software. Proceeding even after failing to
acquire the lock seems like a recipe for breaking things.

Also, this looks slightly wrong. What if the trylock succeeds on the
last retry? num_retries will have been decremented to 0 at that point,
so we'll see the warning even if it did succeed.

Thierry

--7qnlsttyegljuf7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH45cACgkQ3SOs138+
s6EGRBAAhTqSV01iYAznZGbTxr9fpe7ojsCNjw0SD6DYCUA8KgomudDP7jalmbg8
9ZYJpteuoUs1Jj+NhVBgQ3QraWf2JgblyKRU9Ng7Ykzbmq1JhAr7o7o13Gw4jc15
H0odWTXYOYYH4A0jlm5VQ+QNdoy/eRtuZ/q+jw0U0vk6QtB0mbZZNk0NCGzBFqCS
K2G32h6tXJDU48LZqSPjDF359KZ83b0TvCs29wozc0ZV8xt+h3LMGlrwuoziCfg5
OeKCBVnhC2hg+QPvLrXv3v4rWtxcO39zSPHf0Rg7P3abgOQyS+NFi39gmKDQVIux
l26SG+WqyjbB1OCw4RnCwVIXsxR47pIG0/Wh823OqFEvf9ElSOSE97swkbK07bPf
IXCbrk5Z79yam/gHjAVozqj9WgZgRmb5TtCcgxf6w2n0JyNQ9c7XZfl7vEwuJBke
h6Oa1BxzYN91OywqwAXwUhG5FzbuSYEAC6gCTdkWhI7Sgly5RYZ41dbmADFPBwcS
LmXHxSCkOrvV2OK5N87/VUdfOANyoCV4L0MEfN5Ne48Fw3LMZa6tai+besRivR/T
9hKr0IvA1AKT7t6K1dc3gAZLYFPnEtA9DIRFrHsb4e4LHdyMHVFAncSwMgH9XEJf
WUK4YHZTBTS5cS3asEAzfqpUeq5ugNn1anoYnL+DTmG1ygDUPNg=
=iCLr
-----END PGP SIGNATURE-----

--7qnlsttyegljuf7w--

