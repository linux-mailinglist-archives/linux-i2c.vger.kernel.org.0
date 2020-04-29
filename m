Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF9D1BD69D
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 09:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgD2HyB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 03:54:01 -0400
Received: from sauhun.de ([88.99.104.3]:53636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbgD2HyB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Apr 2020 03:54:01 -0400
Received: from localhost (p54B330EB.dip0.t-ipconnect.de [84.179.48.235])
        by pokefinder.org (Postfix) with ESMTPSA id 3F6972C08B2;
        Wed, 29 Apr 2020 09:53:59 +0200 (CEST)
Date:   Wed, 29 Apr 2020 09:53:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     ryan_chen <ryan_chen@aspeedtech.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Message-ID: <20200429075357.GA1957@kunai>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 11:37:37AM +0800, ryan_chen wrote:
> In AST2600 there have a slow peripheral bus between CPU
>  and i2c controller.
> Therefore GIC i2c interrupt status clear have delay timing,
> when CPU issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write
>  clear at i2c ISR.
>=20
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

v0? is it a prototype?

And is there maybe a Fixes: tag for it?

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 07c1993274c5..f51702d86a90 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -603,6 +603,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *=
dev_id)
>  	/* Ack all interrupts except for Rx done */
>  	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>  	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_remaining =3D irq_received;
> =20
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -645,9 +646,11 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void =
*dev_id)
>  			irq_received, irq_handled);
> =20
>  	/* Ack Rx done */
> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
> +	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>  		writel(ASPEED_I2CD_INTR_RX_DONE,
>  		       bus->base + ASPEED_I2C_INTR_STS_REG);
> +		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	}
>  	spin_unlock(&bus->lock);
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
> --=20
> 2.17.1
>=20

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6pMo4ACgkQFA3kzBSg
KbbntRAAs++ZnC+iCmSLY5Q3M4OON+jEs3K4ZhdSuNgzbZsLaWVt5Cx7cCjT/JDi
988C8kzysPKL8Cknlqyv4GBus0cCPwylvFZGHWXdot89RmG4stjYb3JbaV+Qm9Ov
8bCKE8xEWEHyYFFEgreqtLbEFCnHCNf7TnX21b8+L6E988R1AE7r5qIFCTuK1/4/
hrNCRmEoXYLp0pSDC6BuAgJvayrewlTkvCfnBVv39FzN95ghtC21cC73I6SKfDat
qxCyKy1x++V6n03sprTFgc8MCqOpYu6rIgFKm94NSltyJWaRAZKY1vd/Pzj7D0Oc
UPhtu7ldQAbllMAZmMutCDf8m0ek+Ob4jHF+DQKqq2E8MQZs35RxrNnDYzFOLm7r
NISJkGAZ6ZmC3lmyH1t1GRxZls5RfqpUJuVFIke07C4eSO7r6y9rWoOOhzMYJERC
cQuG05T6fcJRGx35/h9GHbcb9+kafQXXRaM65H4aEPKBjbtDbyC8j9PT5WGTRFwS
kS0iSZ5XnSiCccMv33mJqgotV9yPTaVHstupHCnI7K77MH0b7l4Ni1Q7DAnR0cE/
7mhN81qc04aqCi4+Zi1PtWRKMBcgvdX9QmHQnt2KYc7kSmgD9gy454O1NOIbA97S
c1UOGjbptbrnl1VaH9/o0SldOXlHGdNzkzspFGAhk/5ioC8I2oE=
=hr47
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
