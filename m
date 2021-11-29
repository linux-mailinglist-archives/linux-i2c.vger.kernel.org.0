Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33994613E8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 12:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbhK2LgJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 06:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242121AbhK2LeJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 06:34:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A20C0698C8;
        Mon, 29 Nov 2021 02:44:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9A4D1B80E58;
        Mon, 29 Nov 2021 10:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB1CC004E1;
        Mon, 29 Nov 2021 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638182691;
        bh=xSycSCHun7nvgriSFuoyHqvSFKVs/MsbAmwoC5vWqnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOfzDwwzDcoYazx28YwA5+GZ9vv4ksBNwIVTY+wzyo6pTm/WgK68j9HWsGHhRwd72
         NzlFNpTfwtWKOhAw3YHBlRUlchqUgCIIs+LyuzTzWDgK/PkgAdThDxenCSPRz3LBp2
         JsRCxPi1onFM1GF7z5ffPXfgND+eQO7yd00KuCsVMFuMCK6fJEPmzZB/TJ7aVEf1mZ
         iFw6VB1qQMhhCC1pEDkVdhfAB4zT8AOSBht0yaMtdAMZk/qe1rWmJLEg+FsC1f5qqs
         e2X+OVWGsk/N73qa3cV44O3kRsxa060iAPsx4AHEcCVEWCEMBlGwTvRBlz669D2Vnz
         1qDbRA0fQToGw==
Date:   Mon, 29 Nov 2021 11:44:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tobias Schramm <t.schramm@manjaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] i2c: rk3x: disable and reenable I2C after timeouts to
 fix stuck low SDA
Message-ID: <YaSvIDfF5YVArOa+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
References: <20210826174632.91887-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Li5gp6QIDsdtTJv"
Content-Disposition: inline
In-Reply-To: <20210826174632.91887-1-t.schramm@manjaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Li5gp6QIDsdtTJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 07:46:32PM +0200, Tobias Schramm wrote:
> Previously the SDA line sometimes remained stuck low after timeouts
> rendering the I2C bus unusable. Testing has shown that disabling and
> reenabling the I2C peripheral after sending the stop condition seems to
> unstick SDA reliably.
> Disable and reenable the I2C controller on timeout after sending stop
> condition to unstick SDA.

Does it also help to not send STOP? This looks a bit like a hack which
went into the driver somehow. The proper solution might be to remove the
STOP and add proper i2c_bus_recovery at the beginning of a transfer.

>=20
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 819ab4ee517e..fc330cc3686a 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1108,6 +1108,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter=
 *adap,
>  			val |=3D REG_CON_EN | REG_CON_STOP;
>  			i2c_writel(i2c, val, REG_CON);
> =20
> +			/*
> +			 * Sometimes SDA remains stuck low after timeouts.
> +			 * Disable and reenable the I2C peripheral to unstick
> +			 * SDA.
> +			 */
> +			val &=3D ~REG_CON_EN;
> +			i2c_writel(i2c, val, REG_CON);
> +			val |=3D REG_CON_EN;
> +			i2c_writel(i2c, val, REG_CON);
> +
>  			i2c->state =3D STATE_IDLE;
> =20
>  			ret =3D -ETIMEDOUT;
> --=20
> 2.31.1
>=20

--6Li5gp6QIDsdtTJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkryAACgkQFA3kzBSg
KbbtDA//exD7rdAgLU3RKa0p5TYvpLXxYJpx9MKUCjJVtSTMYaam83u0Yl/LyaDk
fAi3Il8MY/3muqVMp2iukHzqi+QLJftgC/bBR35xuCGXX3O13C3ER5Jcq51yV5YC
4GIKIU4gHywMhT1E++OGbZMcurhlazpHTYkmAz7YjdFEf50ws3DajzotLJgbZ2Cy
XhxTtWOTop4TpjEc59rRhpWZ6+sTITTwMzLng0hMBSYYQrgOohq8UzPy4xxBFUe/
R+zsM8EtjiBkRLwZ+zjm3DzS6RlSsPKMKs5IszW2E/Q1/uDlHBwiPGUxC+W70wL9
BVzR2p7hzSaUwwUNfKCruahJnXA370GFnnpPT9nzqBbKb3/uJZloD03q1k/1pN3V
Fr6YEnomd4UGFehNYWKNy5vFzYQ0PGfxmH8J6qpFU1ud43WYFHXuMWZnzOKhnYyo
aYZGWiMDC/pjTKEaUqq0LLObTLaHoMmXbFNdo6gfYR+pndqkrjxMq4FTz3mucHXk
ikNuDt9zRQf49MlF4O61R3WBeE/SYsmS3pHOF/KlrcyOdBwaLUb7nMqquDmsMiK0
nc06whPerE0fO06divCwcPz047FlAA0YGStkLwRsvCiqWSSa3awjZxCE68mDx6ai
2OpA+1bPIIXxm7zYKE0Cny0IZXJPg2totOkEjozXcnSN4LY/UA8=
=vtQV
-----END PGP SIGNATURE-----

--6Li5gp6QIDsdtTJv--
