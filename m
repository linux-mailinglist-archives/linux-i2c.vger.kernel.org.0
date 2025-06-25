Return-Path: <linux-i2c+bounces-11584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F268AE84C0
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 15:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62EF188A40F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8552C2609FA;
	Wed, 25 Jun 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZQOAj3o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D73225E453;
	Wed, 25 Jun 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858075; cv=none; b=jd37D0EkSPb6z+L0QZb3U3NUtLay2NiVAkupjoZ1MSNhf8/ZC7Zb9bdhvL117N8+E2fv4XBFU6D0Bp1qcP5/drut7ym5dD5JsSkwSUcdttjpdyW0ZyNt2sdhmJkwkud+A7Pepqs6HcuU4+ZZnuFKUZ/LTjvxHLCCuVW3QZjCBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858075; c=relaxed/simple;
	bh=nuIeo5FTKFdWM1fm277yaTHa/pCCj2j+dkJIKD2mheU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6HMvKt7Sq9NvQBf0JDEewnJvczk6Hj7uXYvA433RULjkhSyWsRSkMjTjTuaPYXcJ01e6jM48w5UUpCAfo5eFDII26jtPibuCbQvjh4C9Ir9c6UJy9cJBSHzkMjYq1y9QVzKvpQOEZcnNr+u5OKyPfEWtSvTbmXpRhWFpE/T8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZQOAj3o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F5BC4CEEA;
	Wed, 25 Jun 2025 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750858074;
	bh=nuIeo5FTKFdWM1fm277yaTHa/pCCj2j+dkJIKD2mheU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZQOAj3otxX1nkIhoBzKt9Ac2zb+T5lGjmPTimP2eiBXTvl97KF8ZqdcF0xBy99xH
	 xb+i8fwYLW3WyHhJ77OGG7LF8dox6twR0tbBjr8S3Hk3JiZHB3WXr4XfghQc7PQPvu
	 er4ysdpdlCcbx8oFLijH1rLsZ9I+FKlvIMCQo+P9gCHaOqfC+hmL+JZBDMHm7tlY2g
	 p1SZpArR9V0v3HbE0Cw0W2Sw7ZftzXEfYWrDyWK20VTwkiXMZxnhPKfJxwjFtb5BOy
	 R5NSHNpYIPzhM/S3tNlyhJkPhfsB0UPex+1oLAmUAW8dIVHs7P9iIOkjWh0E+LtzAF
	 pwYFquLYGSstA==
Date: Wed, 25 Jun 2025 14:27:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1] i2c: microchip-core: re-fix fake detections w/
 i2cdetect
Message-ID: <20250625-irate-cursive-fa0de9009012@spud>
References: <20250612-jaybird-arrange-53b6200548e9@wendy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OwH4AkRF5o3PjhHF"
Content-Disposition: inline
In-Reply-To: <20250612-jaybird-arrange-53b6200548e9@wendy>


--OwH4AkRF5o3PjhHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:12:49PM +0100, Conor Dooley wrote:
> Introducing support for smbus re-broke i2cdetect, causing it to detect
> devices at every i2c address, just as it did prior to being fixed in
> commit 49e1f0fd0d4cb ("i2c: microchip-core: fix "ghost" detections").
> This was caused by an oversight, where the new smbus code failed to
> check the return value of mchp_corei2c_xfer(). Check it, and propagate
> any errors.
>=20
> Fixes: d6ceb40538263 ("i2c: microchip-corei2c: add smbus support")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Resending cos I think it attempted a send using my korg address on a
> network where that is not possible.

Seemingly this patch has exposed an issue that causes a hang that was
not noticed previously:
# cd /sys/bus/iio/devices/iio\:device0
# cat *
VDDREG_IBUS_1
0
[   92.178899] ------------[ cut here ]------------
[   92.178921] WARNING: CPU: 0 PID: 291 at kernel/workqueue.c:2496 __queue_=
delayed_work+0xb4/0xbe
[   92.178981] Modules linked in: pac1934 industrialio autofs4
[   92.179024] CPU: 0 UID: 0 PID: 291 Comm: cat Not tainted 6.12.22 #1
[   92.179045] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[   92.179055] epc : __queue_delayed_work+0xb4/0xbe
[   92.179081]  ra : mod_delayed_work_on+0x4a/0xa6
[   92.179107] epc : ffffffff8002b2f0 ra : ffffffff8002b3ba sp : ffffffc600=
863b70
[   92.179122]  gp : ffffffff812d6068 tp : ffffffe5a5bc24c0 t0 : 0000000000=
000000
[   92.179136]  t1 : 000000000000ff00 t2 : ffffffff80c01210 s0 : ffffffc600=
863b90
[   92.179150]  s1 : ffffffe5a2aa7568 a0 : 0000000000000040 a1 : ffffffe5a2=
054000
[   92.179164]  a2 : ffffffe5a2aa7568 a3 : 0000000000003a98 a4 : 0000000000=
000000
[   92.179178]  a5 : ffffffff8002b1fa a6 : 0000000000000000 a7 : 0000000000=
000000
[   92.179191]  s2 : 0000000000000040 s3 : ffffffe5a2054000 s4 : 0000000000=
003a98
[   92.179205]  s5 : 0000000000000000 s6 : ffffffc600863c5c s7 : ffffffc600=
863c58
[   92.179219]  s8 : 0000000000400cc0 s9 : fffffffffffff000 s10: 000000007f=
fff000
[   92.179233]  s11: ffffffe5a2806128 t3 : 0000000000ff0000 t4 : 0000000000=
000000
[   92.179247]  t5 : 0000000000000000 t6 : 0000000000000000
[   92.179258] status: 0000000200000100 badaddr: 0000000000000000 cause: 00=
00000000000003
[   92.179273] [<ffffffff8002b2f0>] __queue_delayed_work+0xb4/0xbe
[   92.179302] [<ffffffff8002b3ba>] mod_delayed_work_on+0x4a/0xa6
[   92.179331] [<ffffffff01375980>] pac1934_read_raw+0xba/0x1fc [pac1934]
[   92.179392] [<ffffffff0134942e>] iio_read_channel_info+0xae/0xc4 [indust=
rialio]
[   92.179704] [<ffffffff80442fde>] dev_attr_show+0x14/0x46
[   92.179748] [<ffffffff8020ca3e>] sysfs_kf_seq_show+0x6c/0xe2
[   92.179788] [<ffffffff8020b15c>] kernfs_seq_show+0x18/0x20
[   92.179814] [<ffffffff801bc1ca>] seq_read_iter+0xd0/0x328
[   92.179844] [<ffffffff8020b634>] kernfs_fop_read_iter+0xfa/0x15c
[   92.179871] [<ffffffff8018e128>] vfs_read+0x1aa/0x25a
[   92.179895] [<ffffffff8018e998>] ksys_read+0x5a/0xcc
[   92.179915] [<ffffffff8018ea1e>] __riscv_sys_read+0x14/0x1c
[   92.179936] [<ffffffff807662f8>] do_trap_ecall_u+0x1ac/0x1d8
[   92.179981] [<ffffffff8076e3ba>] handle_exception+0x146/0x152
[   92.180018] ---[ end trace 0000000000000000 ]---
(The issue was detected on an internal 6.12 based branch, but the
content there is identical to what's in mainline + this patch).

Obviously adding the check for an error here doesn't cause there to be
problems with a transfer, only actually report problems that have
occurred. I have not yet been able to reproduce this on my setup, but
the reporter saw the issues going away when they disabled hardware smbus
support and used software emulation instead.

I don't know if this has any bearing on applying the patch, but I wanted
to mention it for reasons that should be apparent. I'm looking into the
issue still and hope to figure out what's going wrong.

Cheers,
Conor.

>=20
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Andi Shyti <andi.shyti@kernel.org>
> CC: linux-i2c@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/i2c/busses/i2c-microchip-corei2c.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/bus=
ses/i2c-microchip-corei2c.c
> index 492bf4c34722c..a4611381c4f0b 100644
> --- a/drivers/i2c/busses/i2c-microchip-corei2c.c
> +++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
> @@ -435,6 +435,7 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter=
 *adap, u16 addr, unsigned
>  	u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
>  	u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
>  	int num_msgs =3D 1;
> +	int ret;
> =20
>  	msgs[CORE_I2C_SMBUS_MSG_WR].addr =3D addr;
>  	msgs[CORE_I2C_SMBUS_MSG_WR].flags =3D 0;
> @@ -505,7 +506,10 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapte=
r *adap, u16 addr, unsigned
>  		return -EOPNOTSUPP;
>  	}
> =20
> -	mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
> +	ret =3D mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
> +	if (ret)
> +		return ret;
> +
>  	if (read_write =3D=3D I2C_SMBUS_WRITE || size <=3D I2C_SMBUS_BYTE_DATA)
>  		return 0;
> =20
> --=20
> 2.49.0
>=20

--OwH4AkRF5o3PjhHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFv5VwAKCRB4tDGHoIJi
0g30AQCU22r84j3D16J5ZdcdjugND92z28I5yMbCnW88Nyg5AQEA96TQIqQOSelb
gfZWsWujZCPOYz1VPrO7i3nZzmEPfww=
=qtS6
-----END PGP SIGNATURE-----

--OwH4AkRF5o3PjhHF--

