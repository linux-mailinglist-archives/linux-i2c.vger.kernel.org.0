Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F97D189DF0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 15:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgCROdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 10:33:25 -0400
Received: from sauhun.de ([88.99.104.3]:48226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgCROdY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 10:33:24 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id 039522C097D;
        Wed, 18 Mar 2020 15:33:21 +0100 (CET)
Date:   Wed, 18 Mar 2020 15:33:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
Message-ID: <20200318143321.GB8300@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
 <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_i=
nfo *info)
> > +{
> > +       u32 addr;
> > +       int ret;
> > +
> > +       ret =3D of_property_read_u32(node, "reg", &addr);
>=20
> Perhaps the time is ripe to start considering #address-cells, instead
> of assuming 1, here ...

I think here it is okay because we really want the first entry of the
first tuple.

> > +       of_property_for_each_u32(node, "reg", prop, cur, reg) {
>=20
> ... and especially here, if this code can ever be reused for i3c, which u=
ses 3.

But here I agree. I reimplemented the code to handle it, and it worked
with '#address-cells =3D <2>;' as expected. Here is the diff to this
patch:

@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/sysfs.h>
=20
@@ -75,13 +76,14 @@ static struct i2c_client *of_i2c_register_device(struct=
 i2c_adapter *adap,
 	struct i2c_client *client, *first_client =3D ERR_PTR(-ENOENT);
 	struct i2c_board_info info;
 	bool first_reg =3D true;
-	struct property *prop;
-	const __be32 *cur;
-	u32 reg;
+	unsigned int i =3D 0;
+	const __be32 *prop;
+	u16 reg;
=20
 	pr_debug("register %pOF\n", node);
=20
-	of_property_for_each_u32(node, "reg", prop, cur, reg) {
+	while ((prop =3D of_get_address(node, i++, NULL, NULL))) {
+		reg =3D of_read_number(prop, 1);
 		of_i2c_decode_board_info(node, reg, first_reg, &info);
=20
 		client =3D i2c_new_client_device(adap, &info);

Thanks, Geert! I will send out the new version in a few minutes.


--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5yMS0ACgkQFA3kzBSg
KbYtfRAAil0f+6TG3T06kRnSNoNLPpEoqabj0ip7Vz7+gSloBvl8lszjT7CP//7R
9gnjhLFvr6hPVbC64dzimreCL1JGYUtFOhKDl/pPSA+TrEFEARbOCxIbdhgieFC0
DrSN2Ed+jK7ZRTPdTuT2y6DNf6bbDHo3ihnzd57I2wy6cEsTMdyIJSAnsxfn5QVf
6EKTCLAeBI9hPd3jDB38ICvQ0Vf9/F9lHRZNOQo1hQwSkUbnyyqf26k8kt/VAnm9
Ipcvlz8krmqY2FWnC/FlzhKV5lSc9i7VSZJTQOjtO39RHxRAsOytbzc6erlTp9Pz
V1+Uw8HGIVMbQe1+kpaaJvomxTApQ2HqjTOPTQc/2h9qXUdCdeWFi56oaJzCl7hp
WHCgqmUCfs4a1V75vuHk2Fj3mPMQsvmjiWrvW5Sz5nvto2GTjKsg2m/v6bdabTxk
iMFjwBfQVun1ziMQOad0zycEFF+sBtQafAg4zmS/FAyrhGAVI9YQ57Z93dlk7D1L
YLFvxifo+L5a6/ny1uEL0xrjMoYfiUCTXlySSuywl5dD5jsqBoUWduFXeHo0DezA
Pe/Vht7ChN7WlI3kDt3X+zCVGmf5WnObEJPrzm39gUNjod7UpW39zgoKQWuF4Rpp
JCKxZe174onb36K3lz83DRTkg5v5NU1AdVgwqrKM6RjakOs1aXM=
=Ku4u
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
