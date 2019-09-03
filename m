Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D78A7201
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 19:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfICRyv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 13:54:51 -0400
Received: from sauhun.de ([88.99.104.3]:56602 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728967AbfICRyv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 13:54:51 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 7FE0F2C4F2F;
        Tue,  3 Sep 2019 19:54:49 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:54:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-i2c@vger.kernel.org, tglx@linutronix.de,
        Benjamin Rouxel <benjamin.rouxel@uva.nl>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: exynos5: Remove IRQF_ONESHOT
Message-ID: <20190903175449.GF2171@ninjato>
References: <20190813115555.10542-1-bigeasy@linutronix.de>
 <20190813115555.10542-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Content-Disposition: inline
In-Reply-To: <20190813115555.10542-2-bigeasy@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:55:54PM +0200, Sebastian Andrzej Siewior wrote:
> The drivers sets IRQF_ONESHOT and passes only a primary handler. The IRQ
> is masked while the primary is handler is invoked independently of
> IRQF_ONESHOT.
> With IRQF_ONESHOT the core code will not force-thread the interrupt and
> this is probably not intended. I *assume* that the original author copied
> the IRQ registration from another driver which passed a primary and
> secondary handler and removed the secondary handler but keeping the
> ONESHOT flag.
>=20
> Remove IRQF_ONESHOT.
>=20
> Reported-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> Tested-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Krzysztof, are you okay with this change?

> ---
>  drivers/i2c/busses/i2c-exynos5.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-ex=
ynos5.c
> index e4e7932f78000..e7514c16b756c 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -791,9 +791,7 @@ static int exynos5_i2c_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	ret =3D devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> -				IRQF_NO_SUSPEND | IRQF_ONESHOT,
> -				dev_name(&pdev->dev), i2c);
> -
> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
>  	if (ret !=3D 0) {
>  		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
>  		goto err_clk;
> --=20
> 2.23.0.rc1
>=20

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uqOgACgkQFA3kzBSg
KbaGlQ/7BEFy1vEAZSvrqzwrVBJF2nJNPh5EPZT/p29f/7DuVYhD6bPpKkTtf4Nl
QwKMNq/Ad0BxBumSobB4j+lDBVfUUDXSzUr5u5bBwhSgz9UdT8veylBhDweSyQrJ
nth6TjquvrFw2ipzxOnWQlK/Zab8z0rY3JW0so6kgkg1RcIhzBVcCiLcCiCHJqBY
mNyQWnmhQeXfWN/9IMMDNfs9xrtm716hXJ4XxRh0nHgfINIYiVM/3SyNmuq5sMm9
3Is9KvxJSqzx3w3SvY5Qz/bvyv8Tl4JH3aLCVDg6Qs9BrwMPpcG1Zr3dqCK4CbHY
1lk4tllo55fwNOH59SXsrvgUZ3vb6GNsHGgBdvV4G7z/DiR6VymlwOFctzv3mJOU
N7zm4+V3LdeByx+i4AImTyCFcLDqGXyKnFWACpCQY+CdMuWq8wCkOaQ5DH1mifKe
ZOYQw106uWt3BPHTCtSs3Vf57rD8lSmr8zvfbU38ewrFOelfVIPibCMbeclxoQem
JbFPERpZ69kdH2fFdQ9tNql5Y7WKKypP+snwCLjphYWcnlShkOhpmMrtlvGsM5D1
/nVIk9VLjrE4Emj5ikY3MqGiSM2wMJn/FZgeNLgsmgGJo1bYbdQzwF14w7UiD4Ea
Z0ek0fsDNwWCauaKWCn4pw47AiHAtg+XVkntpg76j5PS2/zsL/s=
=9Ykt
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
