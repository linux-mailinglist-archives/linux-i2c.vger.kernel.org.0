Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684C42816F6
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Oct 2020 17:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388050AbgJBPo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Oct 2020 11:44:28 -0400
Received: from sauhun.de ([88.99.104.3]:43202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387777AbgJBPo0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Oct 2020 11:44:26 -0400
Received: from localhost (p5486cf7b.dip0.t-ipconnect.de [84.134.207.123])
        by pokefinder.org (Postfix) with ESMTPSA id 648B62C0880;
        Fri,  2 Oct 2020 17:44:23 +0200 (CEST)
Date:   Fri, 2 Oct 2020 17:44:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
Message-ID: <20201002154423.GA16758@ninjato>
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20200928155950.1185-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uli,

On Mon, Sep 28, 2020 at 05:59:50PM +0200, Ulrich Hecht wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

It works, but I have two comments and two questions:

> @@ -581,10 +585,12 @@ static void start_ch(struct sh_mobile_i2c_data *pd,=
 struct i2c_msg *usr_msg,
>  	pd->pos =3D -1;
>  	pd->sr =3D 0;
> =20
> +	if (pd->atomic_xfer)
> +		return;
> +
>  	pd->dma_buf =3D i2c_get_dma_safe_msg_buf(pd->msg, 8);
>  	if (pd->dma_buf)
>  		sh_mobile_i2c_xfer_dma(pd);
> -

This blank line should stay.

=2E..

> +		if (pd->atomic_xfer) {
> +			unsigned long j =3D jiffies + pd->adap.timeout;
> +
> +			time_left =3D time_before_eq(jiffies, j);
> +			while (time_left &&
> +			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
> +				unsigned char sr =3D iic_rd(pd, ICSR);
> +
> +				if (sr & (ICSR_AL   | ICSR_TACK |
> +					  ICSR_WAIT | ICSR_DTE)) {
> +					sh_mobile_i2c_isr(0, pd);
> +					udelay(150);
> +				} else {
> +					cpu_relax();
> +				}

Is it 100% safe to call cpu_relax() that late? Aren't interrupts
disabled? What is waking the CPU again? And where does the value 150us
come from?

> +				time_left =3D time_before_eq(jiffies, j);
> +			}
> +		} else {
> +			/* The interrupt handler takes care of the rest... */
> +			time_left =3D wait_event_timeout(pd->wait,
> +					pd->sr & (ICSR_TACK | SW_DONE),
> +					pd->adap.timeout);
> +
> +			/* 'stop_after_dma' tells if DMA xfer was complete */
> +			i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
> +						 pd->stop_after_dma);
> =20

This blank line can go.

Thanks and regards,

   Wolfram


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl93StMACgkQFA3kzBSg
Kbb33w/9GPAVT09fYkuWTA2zH4eGHNNINK6WemYumZkVbv9sceVmtg08GlgS4Wyh
ASTpKf9lj/m+kd1viiQsYJzmC2IQG7ANozAX5BlUU4jcm4oboc6gLu6Q/My5mxEs
vtunKXEjexrWtsaFkJtbtomFdEMMTkTWSQbGacNoPaa0bOCkErIM9rJgh+7jk6lD
KXCIPuTBK2SbjVo3kXsR8ba1pW0H1v+60wwAzWFNWmH1tXRW2dQlWiarnJdhUQhM
xzu/ZAglhc4A+KJXJlrQZ8GRIqP75+2ZUnFKzhPXl4oUHqiqyOvtSCFCLB1+Hlsl
qSgTrQjxTN38FWSMzlqasWbMV1yOSgqBnl/0DK1vtsH15gDTmCPY6legI7wn49Vk
974cGK1Z2nKPeK6QN+dPzrplpJCtfunKDliZKsa8kUWri6P7CXawdPeiPYf+afrS
s1s3RuUKDO26dF3gzRudBYDoxMX9A3u59+gEkDrylHmXIlmqCvuazedHigObS8hS
uhekWSwKBimIHnslY/soN7Ps9rSyusDpvIclv4MZOHunrdqbCRnzfT7E8bhcDaa3
Ixp2GJzVmcmTu74usHH9HwgtCs8faqcmLuYb9D9QRWewr+CsJ/hN83gyvUFgrg0U
LnMbwfhwYe4cWaOfuLVhRUHImYHfP6iqMbObdJJFjCpRqFFCxWo=
=oEV/
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
