Return-Path: <linux-i2c+bounces-9968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA73A6BAA8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 13:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8A44603E6
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 12:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B15225A20;
	Fri, 21 Mar 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THHcexEG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B92236E9;
	Fri, 21 Mar 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560089; cv=none; b=pORVogvgjVRa17dUVXXdcga2KfXhk6zarn7EGOY9H3ipuIX5m1pSmR8k6LKPe/EBYOQErOySRigqXXgxBiE/6HVMQBES3QcK5d8MCzGX1fUPig7EyozZTb4BeuoaMo6WLps5RRoHAY/wT1mLo10m6Tp0T+uMrigki+P4JNZ1QFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560089; c=relaxed/simple;
	bh=iUx74DWaXYjl5n37JkB2LEUqfjQfMhzFIo3WtYlEUrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1JfscigWFyugZSgoygbOUQP4nZEsMobgmnVIQ0sq2N3pVlh7r3WYEmPCpzyKC4y/NN+wP+2PWrpG3dlrHrVfjb0faa/1M0Junrt84bwG4AZN+U8IqDIcHflqRbXNg8zPxfKmRwvMIaUIJ7gSPUIeO/cLoyiuk0YVeGxZEWzRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THHcexEG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso12425005e9.3;
        Fri, 21 Mar 2025 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560086; x=1743164886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vKhZ3Y/IQNxI/2SaoTHGSv+w2iMheOqoB17NBzyhBMI=;
        b=THHcexEGu3CsQq///VoMZzvpVphPZLEq8ceayCrs5U6qfK28vckSMMMitUtk8GZmB1
         tLVphqiOzmkArfPeL+cfEzj4Uh80sNR992iBHUbh8WKFIZDevRqEI9WMJaDxzlCVEQ9v
         Q3eulUvs+0s6r5xcDCJo/2U+ak/Yvz0A0HCggNdEtqqbJndLYRyk/zifglH04Itragn7
         uUqZUifCyzqz3MDSyBf1LIDMV6KTq0DYGyMRejvJBwnAewlVuHxHxSqWjOd1iABDdOx8
         CkRhscu3Wx8lKb2UA4T+bcynSc+FMpEWuVBODfy5K7YtgzkrIcDQIbhwvnmCQ10nfdrx
         ugVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560086; x=1743164886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKhZ3Y/IQNxI/2SaoTHGSv+w2iMheOqoB17NBzyhBMI=;
        b=l9wYqujAE4hkP9mz9Wfe+9+Rgcr94nWfvgc867TNxf6vcWgjymnaR5wuSYAirJpNIF
         uCtpFFPy+DvlQ0ppo06bnqQ9kCbdzCwdKkqh5oy1ZpuYAWIxojubTMp4238AglJvYQTC
         eoHrrLPQN257wgzkHa+ehKZAQd+XuQHPSFncvRYGakXA7i8Vd8cYsLqP93N+gBS5ddlU
         TgZuKJ5ZmeulUKNG0XBqnI6WqQCbe5cuNbnDLC4U+4/JCQyrCrWGHYrDChUNw/hMV2JH
         Y1EVTeXOS9MlmsKwQZ4VAM/bqrFMVlupxdk3yvr2zn8RfLR3/hKIOvXINTR0RanVq4Yd
         knjA==
X-Forwarded-Encrypted: i=1; AJvYcCVKOR2g8DlYaAGjaaHYr4vKI9nWDTdo4/Ti+qM1Qlb9eWrhcNRrCniDZWSMI2NwmjeeHVO1kIgEfNYYhh4=@vger.kernel.org, AJvYcCW0+0g17DGp8zPuJtD29lzue9GFKb+sKL6qoy8SSrgYQ2QODYutnNpaq+7JNuTKoUz9Eku2Iij9S8NMJoHQ@vger.kernel.org, AJvYcCWp4zQR0ysymiWkRudk7Sa0N0JtDcnjyjAYFHK/XlkDmPGK5gHOHnMck01K2PYrAq8ZWD7mnV183+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLeMTtFA7LATONJDuXt00m1WWtj7/Ecg4XMbFtnDpA9wJeYpM
	qBZX/FTQw2m0b4hpasDC+Ifto5kn6tNlSFm/FYdUYc2C1z0M05/U
X-Gm-Gg: ASbGncu8TkhWF+IZM7n8vb20i4jIpFkfNOqwCWKuUkLvYLvSoke09f18PMbPkBtCG3G
	TN3w6qG0f+Z+GR3qThkQsZ5/v7JBrXgm2IuUA8WsevIbMV8pPlENe8VSt4lVeQRhXbVOi3MPc2P
	f0LuTHW6GyE4AHg2FucGvnYNNhXzWI6RRfBzDl4Ym72r9j7VmpwpVKnf+ynKaRV2pf5PLV+holv
	xTX+Ye4XS741hj9vwhmpASNdyyHh6btS09m9V9NYNU6+gm9todcx76IMQWpGnncLp6ADtj2oAbN
	tWxpk24xrZl8Gp7YD0XUEvMKNQyRV4Y0K4b7I6dFSOH8pAru3R3dmSspr4VdaTpKect6D1DJwi2
	KB2sSEGRRZglr9Rq/+Jmzawg7IKVkwZTOYD71FNIjAw==
X-Google-Smtp-Source: AGHT+IGLb4p3Lv6/BJqm7ea3HRYWfKinl7KNgUdvidDQWp4CgP3J9p6Du9pXp9p6zTGv45jW+KgDbg==
X-Received: by 2002:a5d:47a5:0:b0:391:3d97:bd33 with SMTP id ffacd0b85a97d-3997f8f9fb9mr3867300f8f.13.1742560086094;
        Fri, 21 Mar 2025 05:28:06 -0700 (PDT)
Received: from orome (p200300e41f4bef00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:ef00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3a10sm2227252f8f.28.2025.03.21.05.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:28:05 -0700 (PDT)
Date: Fri, 21 Mar 2025 13:28:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, andi.shyti@kernel.org, 
	jonathanh@nvidia.com, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Message-ID: <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
References: <20250320132144.34764-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpvgewegqqclwbhg"
Content-Disposition: inline
In-Reply-To: <20250320132144.34764-1-akhilrajeev@nvidia.com>


--tpvgewegqqclwbhg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
MIME-Version: 1.0

On Thu, Mar 20, 2025 at 06:51:44PM +0530, Akhil R wrote:
> For SMBUS block read, do not continue to read if the message length
> passed from the device is '0' or greater than the maximum allowed bytes.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v1->v2: Add check for the maximum data as well.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 87976e99e6d0..049b4d154c23 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap=
, struct i2c_msg msgs[],
>  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
>  			if (ret)
>  				break;
> +
> +			/* Validate message length before proceeding */
> +			if (msgs[i].buf[0] =3D=3D 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX)

I wonder if this can ever happen. Looking at the implementation of the
i2c_smbus_{read,write}_i2c_block_data() functions, they already cap the
length at I2C_SMBUS_BLOCK_MAX.

I suppose some user could be explicitly sending off messages with bad
lengths, but wouldn't it be better to return an error in that case
instead of just aborting silently?

Thierry

> +				break;
> +
>  			/* Set the msg length from first byte */
>  			msgs[i].len +=3D msgs[i].buf[0];
>  			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
> --=20
> 2.43.2
>=20

--tpvgewegqqclwbhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfdW1MACgkQ3SOs138+
s6F99g/+I369Hc9CgbFx+qU0i5hGLPldDIIHDrHNF83zqin3pxlupe0UKLwIKZ/p
Ow38aRmp4pYLz+9X07taZ+amWKo5tQJ35tbpyGY3YxJEBqCXlNLhN9sulZdSpnfi
JvGgTQaQKNga+BMVrmm9zTBA8TELL6w0I7DWg2t7RKPFR+9eyBxctTyuxofTNQhV
f1+kO5bl8I04uW3SdTbMN7uF86WGEInNokfMfScWuGZP4mSJgmzAEjK77gfost63
tXMjMOjJ2wEBjQpAw0FCFDFTpuyXkYWiePfOij8ms3INXWZa4MtK9EnaYjsbkkYY
4hxfYtaOw/qJeGSEMd/2frlwD96Iy1uBq6rCcgEN9v7HOIKDBKr6VrCwUK/wRF/3
x9kFHqpRNsgPaaBY2Xwmm/hsQ13vvZg7gRVFLzW2hj1AQQxSm2h8msVRHPTZXtJH
qPhTpRfaOr2zy0Og+MfMCZ4gkG2TcboPmA37bIoCmSn6bp3w0qYma3U65W1BzoYI
gZ1Keed7cLPX337GeTcOUFgKAfV6cc/3uaHASiaErDU5L1tJu7k9gmcTR8u3prst
iXA+hjKc/xNVD2P/MeCDAM5fXRBLb+G9QyDTMZEoKkKBIEFIH4fVsvoDsHUruOBX
UqsM2fgqFIFMTt3XyxOMpboxcckeawHlJ/p66XXtgs25NzIcz8A=
=t24C
-----END PGP SIGNATURE-----

--tpvgewegqqclwbhg--

