Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A77BA43C4
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 11:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfHaJto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 05:49:44 -0400
Received: from sauhun.de ([88.99.104.3]:36442 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbfHaJto (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 05:49:44 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id 649852C0093;
        Sat, 31 Aug 2019 11:49:41 +0200 (CEST)
Date:   Sat, 31 Aug 2019 11:49:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20190831094940.GA1138@kunai>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190830125626.GC2870@ninjato>
 <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ray,

> > With all the limitations in place, I wonder if it might be easier to
> > implement an smbus_xfer callback instead? What is left that makes this
> > controller more than SMBus and real I2C?
> >=20
>=20
> Right. But what is the implication of using smbus_xfer instead of
> master_xfer in our driver?
>=20
> Does it mean it will break existing functions of the i2c app that our
> customers developed based on i2cdev (e.g., I2C_RDWR)?

If the customers uses I2C_RDWR (and it cannot be mapped to i2c_smbus_*
calls) then this is an indication that there is some I2C functionality
left which the HW can provide. I'd be interested which one, though.

>=20
> 1) Does

Maybe you wanted to describe it here and it got accidently cut off?

Regards,

   Wolfram


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qQrAACgkQFA3kzBSg
KbbmbQ/9E9Ts1/5jZMraYl7CNxsXtWMbdSUWQFyuZDJGvO7UvZz9v7O0Aq9ct/MB
mMb4lMVP4lLM/y1DMpVmoYoqVXyKPXzvMzGzsB0CMCs5e+XCbWKr1yCaDCLv0/Js
HNbEe7PC1fuNz/YklNtYvHEe1LjSxf81lFWoLDFGPZ4FkSDcbUAZQkUfe/VpcKbc
VVhYAQucc6GrBoJ12UMRSWSf3diIkR0CBqKhALZXCnrSLx9cXtTuqA0k7UnN9Piv
qPZs/I20tTu52RCHXTpjnwFpWMLNuswRIoCWcMR6Vl1Ix6v0TB4NiUpMStk4Pw45
KD6hdZSPBtFM4uQ04M7wbVFR634PF4mQx7wts+VjFXBe6rxEASwpIq3dMtxVFWgs
GwZ2tyZDQBT/jqdJi2QyUsKw4UW2R7su3D3+/idNTtoT1JkqwAfsFix283Bcbees
Kmx1W32dzB7p2G0k2vCWmNWx1CI+Mf/K16H0n2ffyD/5t4vCME7kLeIVcqkYNF7l
i98hRkYVJm3iecvg2iVr5/y6a7T/V248YJl59WTs7ycb3wqZJib5hQDOmMKeZbmS
DrKSbdHwlistLsHnatTQxOz8vlHG6ufoAXBy+x3PXs1b+HD21Zh94ugVqgoOHoSm
xqIQaulWFBYVg6xi2y9ZyEPyKo4KEwBBmNFs4eTCPmSgTvKT3lg=
=mcNR
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
