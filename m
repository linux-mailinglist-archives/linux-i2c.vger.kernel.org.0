Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71DB182EED
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 12:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgCLLVJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 07:21:09 -0400
Received: from sauhun.de ([88.99.104.3]:41260 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbgCLLVI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 07:21:08 -0400
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
        by pokefinder.org (Postfix) with ESMTPSA id 71E3C2C1ECC;
        Thu, 12 Mar 2020 12:21:06 +0100 (CET)
Date:   Thu, 12 Mar 2020 12:21:06 +0100
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
Message-ID: <20200312112106.GB1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
 <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
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

I will check both instances. Thanks, Geert!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qGyEACgkQFA3kzBSg
Kbacgw//d7BKezsM+cMzwalRi0/ITR5ZQag8QKwqATzh94iB4BvWCJpBTUySYyG3
fcjUNvsnpl8UFfayDD3mld3Xy37lOW3sIp+A9ZGezoaMF9oIrigVUNi+q1SWkJXA
GStzUJnvjm2GKpUMTD5AvmrPCbn7ZxNoSfXQXvCqg2XrJnqggJacVHREqSrfb+iC
H9DhIEZ8yD54zWueE4/Bhf/BFs80DYExVB3U7PDLMoQoS9XJkktOpm1W0WnPn9eH
CCbvUIvjtUpZ7zOLrA+YQcGxDQ+++Br52Lb129PraWCtMFYluwckM9SJYjkye9le
4cFxMeh2hPIko5nmbwqnTPoi260QGCBu1UUb8Xy7A3b+0qzMQQRhBSrZde5xvgzs
5XcN/WNAPlDeRuC+lZy2NrinDZgYxWs9Qt1McLzzgumsUnredKCvokMRndk6dab3
6PTAcUC4kcraiiRwk81w8pIYjcZlSXrjnoRPxCb+8da37ksiJ04gdEvH1iOAV0f+
jqofmXdbXZ7iUrMzk3EZFNK0oDHKeEE4PBpz/AWZAKcA0Em5ZFCpIjhCAmtLclOn
/B6dsuS9YAkKVRwQtyKWm+4aKO4kxiqpUJrcZ93VG+wTGQA8qU6qb4tQL/D59a6m
tIhEVvuks81jRSHZxlsg7aG6zMAEVTWTkuZID+90o7WUU7lDwO8=
=3LQe
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
