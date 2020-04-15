Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACBD1A9B71
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441185AbgDOKxp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:53:45 -0400
Received: from sauhun.de ([88.99.104.3]:52246 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441183AbgDOKxY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 06:53:24 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id A0ECF2C1FF1;
        Wed, 15 Apr 2020 12:53:07 +0200 (CEST)
Date:   Wed, 15 Apr 2020 12:53:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: regroup documentation of bindings
Message-ID: <20200415105307.GK1141@ninjato>
References: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M0YLxmUXciMpOLPE"
Content-Disposition: inline
In-Reply-To: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M0YLxmUXciMpOLPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 12:51:00PM +0200, Wolfram Sang wrote:
> Some bindings are for the bus master, some are for the slaves.
> Regroup them and give them seperate headings to make it clear.
> Also, remove references to "generic names" which is for nodes and not
> for compatibles.

^ This last sentence is the change since V1. Thanks to Rob for the
suggestion!

>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 66 +++++++++++--------
>  1 file changed, 39 insertions(+), 27 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentatio=
n/devicetree/bindings/i2c/i2c.txt
> index 9a53df4243c6..819436b48fae 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -2,32 +2,26 @@ Generic device tree bindings for I2C busses
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  This document describes generic bindings which can be used to describe I=
2C
> -busses in a device tree.
> +busses and their child devices in a device tree.
> =20
> -Required properties
> --------------------
> +Required properties (per bus)
> +-----------------------------
> =20
>  - #address-cells  - should be <1>. Read more about addresses below.
>  - #size-cells     - should be <0>.
> -- compatible      - name of I2C bus controller following generic names
> -		    recommended practice.
> +- compatible      - name of I2C bus controller
> =20
>  For other required properties e.g. to describe register sets,
>  clocks, etc. check the binding documentation of the specific driver.
> =20
>  The cells properties above define that an address of children of an I2C =
bus
> -are described by a single value. This is usually a 7 bit address. Howeve=
r,
> -flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mar=
k a 10
> -bit address. It is needed to avoid the ambiguity between e.g. a 7 bit ad=
dress
> -of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the sa=
me bus.
> -Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we list=
en to
> -be devices ourselves.
> +are described by a single value.
> =20
> -Optional properties
> --------------------
> +Optional properties (per bus)
> +-----------------------------
> =20
>  These properties may not be supported by all drivers. However, if a driv=
er
> -wants to support one of the below features, it should adapt the bindings=
 below.
> +wants to support one of the below features, it should adapt these bindin=
gs.
> =20
>  - clock-frequency
>  	frequency of bus clock in Hz.
> @@ -73,31 +67,49 @@ wants to support one of the below features, it should=
 adapt the bindings below.
>  	i2c bus clock frequency (clock-frequency).
>  	Specified in Hz.
> =20
> -- interrupts
> -	interrupts used by the device.
> -
> -- interrupt-names
> -	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
> -	other names are	left to individual drivers.
> -
> -- host-notify
> -	device uses SMBus host notify protocol instead of interrupt line.
> -
>  - multi-master
>  	states that there is another master active on this bus. The OS can use
>  	this information to adapt power management to keep the arbitration awake
>  	all the time, for example.
> =20
> -- wakeup-source
> -	device can be used as a wakeup source.
> +Required properties (per child device)
> +--------------------------------------
> +
> +- compatible
> +	name of I2C slave device
> =20
>  - reg
> -	I2C slave addresses
> +	One or many I2C slave addresses. These are usually a 7 bit addresses.
> +	However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
> +	used to mark a 10 bit address. It is needed to avoid the ambiguity
> +	between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
> +	which, in theory, can be on the same bus.
> +	Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we
> +	listen to be devices ourselves.
> +
> +Optional properties (per child device)
> +--------------------------------------
> +
> +These properties may not be supported by all drivers. However, if a driv=
er
> +wants to support one of the below features, it should adapt these bindin=
gs.
> +
> +- host-notify
> +	device uses SMBus host notify protocol instead of interrupt line.
> +
> +- interrupts
> +	interrupts used by the device.
> +
> +- interrupt-names
> +	"irq", "wakeup" and "smbus_alert" names are recognized by I2C core,
> +	other names are	left to individual drivers.
> =20
>  - reg-names
>  	Names of map programmable addresses.
>  	It can contain any map needing another address than default one.
> =20
> +- wakeup-source
> +	device can be used as a wakeup source.
> +
>  Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very fi=
rst
>  interrupt if not using interrupt names) as primary interrupt for the sla=
ve.
> --=20
> 2.20.1
>=20

--M0YLxmUXciMpOLPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W55MACgkQFA3kzBSg
KbZeLQ//YKTxD4ra28XSIXElxOVpIp2Wld7JHfyIeuqVeIg5FoiD9R1O3CaeAWmV
HW0fA7vkiP5RbSCXXODtg5rNjwhZaRW4T1a7V7uw6yMiVtl6SrAJB6/7TQ1GD9Gm
AySbyFEzlI390SNpHYu1q7hCzGTPoQWgjLS/+o5czT7gkax2jT+FktffDMh5LAIx
re0IPQnXSwl994KQCykZ4tf+jb/lN3YrX51WhQidvPIMg1bxbGO4u7y1q18yOkPt
a2CTzVWJjEUW8oYDYg6A2nQpcumYbelYJloLANKa/dVf1XwY8ng/UdoArca/PpfU
IYXPHMUs//yWB9XNlrgWKWeRQeDB6F7kLysQjh7BN9wOKLpdztyjr7NtdIQy0app
Rwq5f1+lDQ0VsWpBYofHBIkW9o99CMStKIW4I8mF/prZPzF9DkkVwL8T/PTHdEGE
/n7cnF3DREmOdlDgaGjrIli4axbTCAQTmNzUwebjJ28AQYIK1tvYznK/Y20CUMrj
YkzDIRfuKzuk5EdXIcCFwrFh2ymhN9A4UoA3SPXw7LTBUfS5AB938cSwgn38moDo
ujZG5VvX3AukAtguUnW0g6zeTb7+jap1MrHpehiFFoPj0M9X2sAk78+xGpEMe/PC
RH1gkykU8j2oPGxL4zrlbMILCMe78YzliRdMjmYSNtH5fssEzd0=
=ZBxA
-----END PGP SIGNATURE-----

--M0YLxmUXciMpOLPE--
