Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0D33EF43B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhHQUo6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:44:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234827AbhHQUo5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:44:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 974DD6023E;
        Tue, 17 Aug 2021 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629233063;
        bh=jenxdlwuv8KbA36CMOiq/pND/A9001wiHZjzZzHp/hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NYdDSPH+gVMmcxOQ4wmF37Mv7S75mRIVyHQmostdPYhw037RtFvUPDkUwBhD9GpbZ
         NbKvoqziNO/eiZIPED/Mu9nXWr2ENJubPFuzgtraw/hIErooayo3DumdrsnlJDYdHY
         2iANWmhBQqWgsg/zOPRjN9lPyfv6E4v7XJuwA1a0i2eyFPq8n7i7uXSUJTi2K1GpGR
         OW3faYxdnZ3n3cukLA41Us0cO1396UC+ioTwXoAMIEI98sf2CpONDZCRHcEtiZdoes
         HLcZp9rWpwE/k53r2kNfEinQyt30zTq16H1Rhysw/wWsK/5aT06eKl9Mm7JNqjAKVm
         Kysgs/+WBnlxw==
Date:   Tue, 17 Aug 2021 22:44:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YRwfpOuyVEstwsza@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
        devicetree@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bSLA9Xlk/h7hJBea"
Content-Disposition: inline
In-Reply-To: <20210724154308.55afb03c@jic23-huawei>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bSLA9Xlk/h7hJBea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > When matching an OF device, the match mechanism tries all components of
> > the compatible property. This can result with a device matched with a
> > compatible string that isn't the first in the compatible list. For
> > instance, with a compatible property set to
> >=20
> >     compatible =3D "ti,dac081c081", "ti,dac5571";
> >=20
> > the driver will match the second compatible string, as the first one
> > isn't listed in the of_device_id table. The device will however be named
> > "dac081c081" by the I2C core.
> >=20
> > This causes an issue when identifying the chip. The probe function
> > receives a i2c_device_id that comes from the module's I2C device ID
> > table. There is no entry in that table for "dac081c081", which results
> > in a NULL pointer passed to the probe function.
> >=20
> > To fix this, add chip_id information in the data field of the OF device
> > ID table, and retrieve it with of_device_get_match_data() for OF
> > devices.
> >=20
> > Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Interesting problem that I hadn't previously realised could happen.
>=20
> One request though, can we use device_get_match_data() here rather than
> the of specific version?  Include property.h as well for that.
>=20
> That should allow the same issue with compatible to work correctly when
> using PRP0001 based ACPI methods.=20
> https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/acpi/bus.c#L891
> Will result in acpi_of_device_get_match_data() being called which will
> match to the of_device_id table.

Couldn't you use the "new" probe_new() callback instead which will drop
the i2c_device_id? Kieran was interested in such conversions IIRC.


--bSLA9Xlk/h7hJBea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcH6AACgkQFA3kzBSg
Kbah8w/+NkTSt52U4e5c47zS8FCRLjUAvqttde7RahDWQf2aLgXeeN8u4EYLKXrU
9hW5saYFQYH1jvpqTnJbDXDqqf2+LDbUGIauJo3K2WYKXRQdzK0yPoJRErSnB3jl
K9jexLleJmloXSO2lz5u+Cgfbu2aiZ1b9+09JOcXBi4nchIGdMynBoC5ZoTNDjPw
5/e7T8o7tcdRpIkbgcOZB5a20+HeH3f7TnGnKslTiXj0PylrmRUgloYAJWbi9mFI
A1QIN+jMaIEN373015vx/CfUrgB1EMgSX5Xo8VPb6GBXOf3KNGRSk4Lxr4ib2i+U
uZdfEGVFt4g2eheSyRIT4B0OkDcye3xVjTu4imX7q6nnP+IUymWONFi9vLWtl8O/
eE4+ubpSct5d37jR9v6/LzpH9i8v3HE1UcnQmXpaft++i6caeoMZiDWiebviKdsT
8O+c+GuOk8oDxu79KOtuDaBc68aPKMkJFeQMMPKGKQ91pgE6I9aZsShXIbl2X8tU
j5ONhZ+nGxvWUhNsdj8QtskpAb3bE+2SkEa7JCBg/pKF6v+6aqleCv/jxOJuWChW
OekZKDAzZMQvv4pOJTuASeLAu8+0Z7I1ZXAVKwx/b3+Q4KXezdXjQBvc3O+ppC+b
rpOdjkJB9X4KbnnRDVC9PJKfJNhEPeVVngunzZw4a/MHkQsMIiY=
=vjMH
-----END PGP SIGNATURE-----

--bSLA9Xlk/h7hJBea--
