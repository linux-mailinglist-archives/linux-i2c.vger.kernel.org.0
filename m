Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F2F1F881F
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgFNJbn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:31:43 -0400
Received: from sauhun.de ([88.99.104.3]:53300 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNJbn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 05:31:43 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        by pokefinder.org (Postfix) with ESMTPSA id C8C0F2C05DF;
        Sun, 14 Jun 2020 11:31:32 +0200 (CEST)
Date:   Sun, 14 Jun 2020 11:31:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200614093131.GD2878@kunai>
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
In-Reply-To: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 09:33:11PM +0200, Ulrich Hecht wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, Uli! Works fine here. Really nice to finally being able to
reboot now without WARNings.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Some review comments:


> @@ -366,7 +369,7 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_=
data *pd)
> =20
>  static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
>  {
> -	unsigned char data;
> +	unsigned char data =3D 0;

Please rebase against i2c/for-next. 'data' is gone since recently.

> -static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
> -			      struct i2c_msg *msgs,
> -			      int num)
> +static int xfer(struct sh_mobile_i2c_data *pd, struct i2c_msg *msgs, int=
 num)

'xfer' is too generic IMO. '__sh_mobile_i2c_xfer' maybe?

> -	pm_runtime_get_sync(pd->dev);
> +	if (!pd->atomic_xfer)
> +		pm_runtime_get_sync(pd->dev);

This was a small surprise to me. I assume RPM is disabled that late?
But can we be sure the clock is on, then?

> +		if (pd->atomic_xfer) {
> +			unsigned long j =3D jiffies + pd->adap.timeout;
> +
> +			timeout =3D 1;
> +			while (!time_after(jiffies, j) &&

To avoid the negation, maybe 'time_before_eq(...)'?

> +			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
> +				unsigned char sr =3D iic_rd(pd, ICSR);
> +
> +				if (sr & (ICSR_AL   | ICSR_TACK |
> +					  ICSR_WAIT | ICSR_DTE)) {
> +					sh_mobile_i2c_isr(0, pd);
> +					udelay(150);
> +				} else
> +					cpu_relax();

Braces for else block.

> +			}
> +
> +			if (time_after(jiffies, j))
> +				timeout =3D 0;

Uhh, 'timeout' should have been named 'time_left' back then. Then, this
all would be more readable and we could do here:

	time_left =3D time_before_eq(...);

and avoid both 'timeout' assignments above.

> +static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
> +			      struct i2c_msg *msgs,
> +			      int num)
> +{
> +	struct sh_mobile_i2c_data *pd =3D i2c_get_adapdata(adapter);
> +
> +	pd->atomic_xfer =3D false;


Maybe move this above to the xfer function ...

> +	return xfer(pd, msgs, num);


=2E.. and have here only:

	return __sh_mobile_i2c_xfer(adapter, msgs, num, false);

But yeah, this is bike-shedding. I don't mind much.

>  static const struct i2c_algorithm sh_mobile_i2c_algorithm =3D {
> -	.functionality	=3D sh_mobile_i2c_func,
> -	.master_xfer	=3D sh_mobile_i2c_xfer,
> +	.functionality		=3D sh_mobile_i2c_func,
> +	.master_xfer		=3D sh_mobile_i2c_xfer,
> +	.master_xfer_atomic	=3D sh_mobile_i2c_xfer_atomic,

Just convert to a single space before the '=3D'.

All the best,

   Wolfram


--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7l7nMACgkQFA3kzBSg
KbY+IA//URtUK50ZFWfVncEynBlLxygtPLvoDTCc5SHEtQc8fV3p1dib3Yj2sbaI
jVJc+8+n8T52j4jT9cmTT/bpAcGThpofQ5NwA2QDY4NPBJ31VFRINqIbxX+hKN3V
s3fSttAQCvW7LgkA5ru2ZgW2MrUXzQgeTfzqQLFV/ffc+mOyaWkR9B1qhHFN1S+d
GORH4p1SPZBZeT3xru7KitXC2SJwm1XqTAhmLcQmc2hizwtncjxwX2rD5DpPUG0m
FpCMvwKok2eDitpb/KrEiJdeuBI7hydOapjL6KM+H80aP4UiJXYxmzhFTmemJi9a
EFkjMfYX1uwWV6EPZrhzR7uUMTav7hmuw7TUO6pWlbY7R/EZxA3ZGRVRxQDc723I
7VqFm4QImB0r24MAQXoDWQ2U/QGJOrpc8IroG9b4FLjxZEMAcAX3maSMRLaFVzTu
6r+bgupq78a8uxujsxb0GDNcJXAB6tmzHY7NzjAuFxpoMU9Xni1X1PjQazzb2aNI
dLdfnAfgyMNxrPfeq3WMne5T74YZ7iu2tEc3+LP23Jd9SfojoluG7LYIhWmoS2Au
ukzWfvrHyVkUrGHcgBo2VznE8G6SENcQ8saRCgGVXw+Wcpx8Yj4F2OsUd3OElnlQ
9DQBc0QNiaD3vh96h8qSity9C8T6/VBSNXf6IREI9P3QXDGKpxM=
=u5Qi
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
