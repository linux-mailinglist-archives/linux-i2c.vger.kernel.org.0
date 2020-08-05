Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734A223C7DC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgHEIgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:36:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgHEIgc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:36:32 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D32D21744;
        Wed,  5 Aug 2020 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596616591;
        bh=rq6tPApAB+dxBpQmJ6x3QrSRVGchYJT6t4pWpmDeeTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rw/Yi6bOhIoSPQ686F+lhFsQCcCekuYkYcOsFIbJr/rfnWdhWEwslRIDaLFYbHpTj
         jmjt35cCrqpUJeGaYKFQorepSa3Z5wz8JVArtZGq9aop1VXQY405AFC2HYm/ZbTmN7
         cxAaMyYiM2my1dK1ZRAQsecKf9uA6MzYqvvSaUj0=
Date:   Wed, 5 Aug 2020 10:36:29 +0200
From:   <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Message-ID: <20200805083629.GB1229@kunai>
Mail-Followup-To: <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200804095926.205643-3-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <20200804095926.205643-3-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 12:59:24PM +0300, Codrin Ciubotariu wrote:
> Multiple I2C bus drivers use similar bindings to obtain information needed
> for I2C recovery. For example, for platforms using device-tree, the
> properties look something like this:
>=20
> &i2c {
> 	...
> 	pinctrl-names =3D "default", "gpio";
> 	pinctrl-0 =3D <&pinctrl_i2c_default>;
> 	pinctrl-1 =3D <&pinctrl_i2c_gpio>;
> 	sda-gpios =3D <&pio 0 GPIO_ACTIVE_HIGH>;
> 	scl-gpios =3D <&pio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 	...
> }
>=20
> For this reason, we can add this common initialization in the core. This
> way, other I2C bus drivers will be able to support GPIO recovery just by
> providing a pointer to platform's pinctrl and calling i2c_recover_bus()
> when SDA is stuck low.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
Applied to for-next, thanks! Two minor change:

> +	/* for pinctrl state changes, we need all the information */
> +	if (!bri->pins_default || !bri->pins_gpio) {
> +		bri->pinctrl =3D NULL;
> +		bri->pins_default =3D NULL;
> +		bri->pins_gpio =3D NULL;
> +	} else {
> +		dev_info(dev, "using pinctrl states for GPIO recovery");
> +	}

I inverted the logic here:

 294         /* for pinctrl state changes, we need all the information */
 295         if (bri->pins_default && bri->pins_gpio) {
 296                 dev_info(dev, "using pinctrl states for GPIO recovery"=
);
 297         } else {
 298                 bri->pinctrl =3D NULL;
 299                 bri->pins_default =3D NULL;
 300                 bri->pins_gpio =3D NULL;
 301         }

I think it is a bit easier to read if the desired path is not in the
else case.


> + * @pins_default: default state of SCL/SDA lines, when they are assigned=
 to the
> + *      I2C bus. Optional. Populated internally for GPIO recovery, if a =
state with
> + *      the name PINCTRL_STATE_DEFAULT is found and pinctrl is valid.
> + * @pins_gpio: recovery state of SCL/SDA lines, when they are used as GP=
IOs.
> + *      Optional. Populated internally for GPIO recovery, if this state =
is called
> + *      "gpio" or "recovery" and pinctrl is valid.

Added "pinctrl" to "state of SCL/SDA" to make it clear.


--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qb40ACgkQFA3kzBSg
KbYZ8A/+IoGrrXtuuVfRr2wWgX3iz5Zj0mVU0fXGVwN0YoGe3OcHNdo6S7f+Pzy/
I1PZcxBBNjC9ffOXPWBxm8QC/HcT6ZHpY+Bs6CEJMFwXraTBDo8n93iZ3F0tpIbi
LpXpYLUSbxG6nw9t9HMyoxwtIx4a0vP0r6RAqzj+DFIXUc4dimmUlTVV4dxpJ5Pm
HcPxS7b+X1X3vKFw721eKQAhZfJW3iqo6gqRCGBPByORmxApG/I3M8de+Jb/7aqg
n+bne+1ULGILn93WyDVHrQ9b6l5Lj+iD9leRqUaeEfnZAv7zMvEmx4UnwFf3OsSE
/HWTxB5YZjjkOOKFGodTtd4iOy0rB2BtRRCnVXR2oF2FdotinYHDhPDF/n0KDpLi
obtYBBh1jozlHxE1Mm1ZK5Db5kgYasjqAzZgXC4q2EIB4aY7GoaUIswts0QbxH/T
Vep/4DNZQCfIRXbiQWVx0ocaKIBGAC/e6GBjz3378MhQ730O6F/iVNacTXFb/MEy
TPRzItlBBRkHQlci0bmymfQPEK6EINwD1IgbaTWYyQy3XXi9RYkiG1Goun6tpolC
VcbQTTkhE+3RSaBwTbcr6CBMp2TWRZW0FVhr6oQT6sKQjMmbD7TDY4uQr+2GdCKR
KJ3mdnILcKHY7WcZMwCVZu7ZCugLmodXEP1kc2bnXw61ONa8VsE=
=WUKN
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
