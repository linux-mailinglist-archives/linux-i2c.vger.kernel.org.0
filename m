Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F55715F8D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 10:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfEGIkG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 04:40:06 -0400
Received: from sauhun.de ([88.99.104.3]:41954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbfEGIkG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 May 2019 04:40:06 -0400
Received: from localhost (p54B332BA.dip0.t-ipconnect.de [84.179.50.186])
        by pokefinder.org (Postfix) with ESMTPSA id 6C28C2C28E9;
        Tue,  7 May 2019 10:40:03 +0200 (CEST)
Date:   Tue, 7 May 2019 10:40:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Chuanhua Han <chuanhua.han@nxp.com>, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, leoyang.li@nxp.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, sumit.batra@nxp.com,
        l.stach@pengutronix.de, peda@axentia.se
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add optional mul-value property to
 binding
Message-ID: <20190507084002.GA25688@kunai>
References: <20190430043242.29687-1-chuanhua.han@nxp.com>
 <20190502205901.GA24224@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20190502205901.GA24224@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 03:59:01PM -0500, Rob Herring wrote:
> On Tue, Apr 30, 2019 at 12:32:40PM +0800, Chuanhua Han wrote:
> > NXP Layerscape SoC have up to three MUL options available for all
> > divider values, we choice of MUL determines the internal monitor rate
> > of the I2C bus (SCL and SDA signals):
> > A lower MUL value results in a higher sampling rate of the I2C signals.
> > A higher MUL value results in a lower sampling rate of the I2C signals.
> >=20
> > So in Optional properties we added our custom mul-value property in the
> > binding to select which mul option for the device tree i2c controller
> > node.
> >=20
> > Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-imx.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c-imx.txt
> > index b967544590e8..ba8e7b7b3fa8 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> > @@ -18,6 +18,9 @@ Optional properties:
> >  - sda-gpios: specify the gpio related to SDA pin
> >  - pinctrl: add extra pinctrl to configure i2c pins to gpio function fo=
r i2c
> >    bus recovery, call it "gpio" state
> > +- mul-value: NXP Layerscape SoC have up to three MUL options available=
 for
> > +all I2C divider values, it describes which MUL we choose to use for th=
e driver,
> > +the values should be 1,2,4.
>=20
> Needs a vendor prefix. I don't find 'value' to add anything nor do I=20
> understand what MUL is.
>=20
> If it is determined by SoC rather than board, then it should perhaps be=
=20
> implied by compatible.

I was wondering the same.


--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzRRF8ACgkQFA3kzBSg
KbbUbRAApE4I45wTxiU40khw2A2mDLGqByh6dKjqeRVRHGsUrLdKN3tptV5pVqgM
LdX5QFuA4Hp1TEkPLhuie+S7y0DfcN1NQEOPtP2ofZFTcMV93MhvZ7W2KEegnbld
RzvlIcqxMHoQgDBsJunkOcZuqUVicSwYETYXsbFGBAMJGTzhZR4Sh2Qt0VNRUmwu
UMFuBqnnhDXBkl7VSeKXDgjctCJnVaiyqj2jnz5HD4eOBtHj7zvPXnSYyMfYhrUL
Z6TXVxdloC6j8noqtORUM4YmlleDepXqp/L2SGRhZ1Qi55XQd6oexxiP7ndDZV0W
WRu3GaJOtXyOQYqeYMkfLbUPn90FkDLCFun1HKPBO07fcX/qWZmZnoXVX2799odV
jofYTj6X0ILs79fIUT8wAUnMCmEgjgPOynl57loP4f8lh6VoWeDAEI1nwCoPxi0l
TKabxPYDHpbT7vFP2eaR7/dXQxb+pgLNMUeqzPpIQ7XnSHrLl+7nrhVDcpzSWTr2
ci6eWscPRJNr/OVa0wd+L4nthna/K89ZApK4zf9aioBTLPZ/EEZscAJ/YuZiJZ2d
ZtwvTt6ewEz6D5OF6vsNjn7FOuqp7CIEhyPqFU+E5SC3iO05TqBhb9w34F5mO2oK
Oswf5Q47JpcE4stdbVJa7ZTUd+P8gfmH+X71qLQzcU3wujem2K4=
=cq07
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
