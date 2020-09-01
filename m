Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2242587E5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 08:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgIAGLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 02:11:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:55002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgIAGLm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 02:11:42 -0400
Received: from localhost (p5486cc57.dip0.t-ipconnect.de [84.134.204.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9197D208DB;
        Tue,  1 Sep 2020 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598940702;
        bh=BHZMoFSFNu3DyLSpLY+JH8Sz4p7412tz3v9BMUhS3BI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kZnQ6m+Je8wGHdDBeGbBhIuQep+eKm6/I45edosXa2K7pibgqyzwvdOOvRT3YOdUT
         18HsirJD7LMOOFBcIsPgxHedxBGLITAINDlGvIFhftdlW5NjdO3luEx7pZ/rB0BbPx
         RIbKopTH4EG+cO6xSo2Sy1u8iXItmwfl86jVV0hg=
Date:   Tue, 1 Sep 2020 08:11:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Eddie James <eajames@linux.ibm.com>, linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
 I2C device
Message-ID: <20200901061139.GC1148@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-5-eajames@linux.ibm.com>
 <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       ibm-panel@62 {
> > +               compatible =3D "ibm,op-panel";
> > +               reg =3D <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
>=20
> Other users of SLAVE_ADDRESS have included <dt-bindings/i2c/i2c.h> and
> written the reg as follows:
>=20
> reg =3D <(I2C_OWN_SLAVE_ADDRESS | 0x62)>
>=20
> Which obviously has the same result. I'll leave it up to you.

The latter, please.


--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9N5hsACgkQFA3kzBSg
KbaeUg/+IPF4+oUGVypAsLvYprQ0+ZG1JBvtHljVB9iKBaHZqMvhVHeQtSLbdYaQ
jDARAKbg0MG2YDPbzycsWxuvfDvfADKLHmcfGHINUegeOOdL8ECDivbhwGbcp/9n
Lse+AEuEInVhGc/i3R/OL9juyOEa9r+V66GCa2EjzIeaUMQXtRmYC23Laax1h8JI
vwjlAGu46hfyn4/XYKldvn4T72jM4fKtsPoVXlWPjMIh31aj0hgxbJXz79lRELZp
veqwFPOC962XwV7K4pqXZR9lL9YxmxRANk6ycJML+sK/68kWV514MVBGp0Od3cut
5uxLHcYP/afMbn+JRvmfo2QtsPxBfLUqSAJ3e5oiePbQPGuC+T//wFiHzQNm+8J9
9CKHiQbrBK6VmTdEQMMtTVs02lvy/Kwp00yqnPzvZ/xiNtNoF0vLplWxo+uV4KPn
9/3raJctzCFXkWYRAsm52t47MZ6Wmk/IYqZ6kwWMrijA5lVToAJK6RmjtuLsMi+6
21vo7Er+0cDnj2UdSUdqr7MMQrRbs/qg81icmcq/qT/Y2Xmn0GAeMmGqzlPcP4to
PLuIbKSWGcpZIbq4kc7XWRc5xCQt9pMR9hBLr9Gz5uxwI/JnBhf/BoPkVLskiB7+
KwkYK6aacPe7A09JTgpYARDIO2I6p8Rt3JNLIrjhgCitBfjgtyc=
=YXCg
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
