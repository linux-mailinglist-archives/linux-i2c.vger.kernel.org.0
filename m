Return-Path: <linux-i2c+bounces-2551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF344886DDC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03CC91C2201B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4309946556;
	Fri, 22 Mar 2024 13:51:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CDC46546;
	Fri, 22 Mar 2024 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711115479; cv=none; b=U3Q0jCqa+D2kG5gRHByHApBOo9wupivl3kdKMVcpANaadpQqyvnuMKebrtuOSb54Odj1Hc3J49+1kXKoP7rGLdhP/vx1UYMk106Ryy9hYZ9/8G8muh2d6efPLGGof17bo4Cojwc0zO0iNizUjKsVE5SMiZJVpyvMo3U95g04Tpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711115479; c=relaxed/simple;
	bh=gJSA7zuXFp/oQKTPA7ZyPeuZ3kqzidtPl+lSSYbnKbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+HY6+sprcecnDu77/FeQmC1+GJ8ui2PfTnHSE2nUURueOgvxMYDUJ5edIPOIgi2MgDXkIGZAPYkrDahu0PDvzPYa6s6/gVMpNriiD4iKH2FhTycMLmss2Ji7EBH12r+rRJ+KqcRDGP/dDOHvljJLvmegNzlDSSF500IIxhkdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a9e.versanet.de ([83.135.90.158] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rnfIT-0002tt-Sm; Fri, 22 Mar 2024 14:51:01 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-i2c@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 47/64] i2c: rk3x: reword according to newest specification
Date: Fri, 22 Mar 2024 14:51:00 +0100
Message-ID: <13914065.RDIVbhacDa@diego>
In-Reply-To: <20240322132619.6389-48-wsa+renesas@sang-engineering.com>
References:
 <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-48-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 22. M=E4rz 2024, 14:25:40 CET schrieb Wolfram Sang:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/i2c/busses/i2c-rk3x.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 086fdf262e7b..01febd886bdd 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -28,8 +28,8 @@
>  /* Register Map */
>  #define REG_CON        0x00 /* control register */
>  #define REG_CLKDIV     0x04 /* clock divisor register */
> -#define REG_MRXADDR    0x08 /* slave address for REGISTER_TX */
> -#define REG_MRXRADDR   0x0c /* slave register address for REGISTER_TX */
> +#define REG_MRXADDR    0x08 /* client address for REGISTER_TX */
> +#define REG_MRXRADDR   0x0c /* client register address for REGISTER_TX */
>  #define REG_MTXCNT     0x10 /* number of bytes to be transmitted */
>  #define REG_MRXCNT     0x14 /* number of bytes to be received */
>  #define REG_IEN        0x18 /* interrupt enable */
> @@ -68,8 +68,8 @@ enum {
>  /* REG_IEN/REG_IPD bits */
>  #define REG_INT_BTF       BIT(0) /* a byte was transmitted */
>  #define REG_INT_BRF       BIT(1) /* a byte was received */
> -#define REG_INT_MBTF      BIT(2) /* master data transmit finished */
> -#define REG_INT_MBRF      BIT(3) /* master data receive finished */
> +#define REG_INT_MBTF      BIT(2) /* host data transmit finished */
> +#define REG_INT_MBRF      BIT(3) /* host data receive finished */
>  #define REG_INT_START     BIT(4) /* START condition generated */
>  #define REG_INT_STOP      BIT(5) /* STOP condition generated */
>  #define REG_INT_NAKRCV    BIT(6) /* NACK received */
> @@ -184,7 +184,7 @@ struct rk3x_i2c_soc_data {
>   * @wait: the waitqueue to wait for i2c transfer
>   * @busy: the condition for the event to wait for
>   * @msg: current i2c message
> - * @addr: addr of i2c slave device
> + * @addr: addr of i2c client device
>   * @mode: mode of i2c transfer
>   * @is_last_msg: flag determines whether it is the last msg in this tran=
sfer
>   * @state: state of i2c transfer
> @@ -979,7 +979,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struc=
t i2c_msg *msgs, int num)
>  	/*
>  	 * The I2C adapter can issue a small (len < 4) write packet before
>  	 * reading. This speeds up SMBus-style register reads.
> -	 * The MRXADDR/MRXRADDR hold the slave address and the slave register
> +	 * The MRXADDR/MRXRADDR hold the client address and the client register
>  	 * address in this case.
>  	 */
> =20
> @@ -1016,7 +1016,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, str=
uct i2c_msg *msgs, int num)
>  			addr |=3D 1; /* set read bit */
> =20
>  			/*
> -			 * We have to transmit the slave addr first. Use
> +			 * We have to transmit the client addr first. Use
>  			 * MOD_REGISTER_TX for that purpose.
>  			 */
>  			i2c->mode =3D REG_CON_MOD_REGISTER_TX;
> @@ -1162,8 +1162,8 @@ static u32 rk3x_i2c_func(struct i2c_adapter *adap)
>  }
> =20
>  static const struct i2c_algorithm rk3x_i2c_algorithm =3D {
> -	.master_xfer		=3D rk3x_i2c_xfer,
> -	.master_xfer_atomic	=3D rk3x_i2c_xfer_polling,
> +	.xfer		=3D rk3x_i2c_xfer,
> +	.xfer_atomic	=3D rk3x_i2c_xfer_polling,
>  	.functionality		=3D rk3x_i2c_func,
>  };
> =20
>=20





