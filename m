Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DBA270B21
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 08:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgISGdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 02:33:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:45080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgISGdA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 19 Sep 2020 02:33:00 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DA0D208B8;
        Sat, 19 Sep 2020 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600497180;
        bh=gHiBNMKJIW/RQejvnWSHZb3ODjAoNw181V1JmBPUzfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wIaS6CjTiioCSZdwoTU5rqW14jIGCv150lXDjRbqwmn3to67qZn1bH1GKetDwPvGI
         AbGLe35VU9QaqUEfBjBTkq5IGLZZgaDT1PbqAVZ49esfqnZUHTWFiGd6h+IxZWJDzx
         lG/SepvF8LrxMtuZrErOK6LIETJe+99/NvBK9u/A=
Date:   Sat, 19 Sep 2020 08:32:54 +0200
From:   <wsa@kernel.org>
To:     "tiantao (H)" <tiantao6@huawei.com>
Cc:     Tian Tao <tiantao6@hisilicon.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: Switch to using the new API kobj_to_dev()
Message-ID: <20200919063254.GA1044@kunai>
Mail-Followup-To: <wsa@kernel.org>, "tiantao (H)" <tiantao6@huawei.com>,
        Tian Tao <tiantao6@hisilicon.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
References: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
 <20200918210911.GF52206@kunai>
 <0f47261e-c80e-a57f-2771-1be5e179a436@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <0f47261e-c80e-a57f-2771-1be5e179a436@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2020 at 09:01:12AM +0800, tiantao (H) wrote:
>=20
>=20
> =E5=9C=A8 2020/9/19 5:09, wsa@kernel.org =E5=86=99=E9=81=93:
> >=20
> > >   static inline struct i2c_client *kobj_to_i2c_client(struct kobject =
*kobj)
> > >   {
> > > -	struct device * const dev =3D container_of(kobj, struct device, kob=
j);
> > > +	struct device * const dev =3D kobj_to_dev(kobj);
> > >   	return to_i2c_client(dev);
> >=20
> > Can't we make this a oneliner then merging the last two lines?
> >=20
> I think two lines have better readability, and if you prefer one line, I =
can
> send v2 to fix that!

I just found d75d53cd571c ("i2c: Fix sparse warning in i2c.h"), so we
should leave the two lines. Thanks!


--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lphIACgkQFA3kzBSg
KbYSXA//cpPe+xjMkaEV4Jn3iBDdNMoEUiiz2PDXXIoqezLSj96ZP0q0/ShN3cZu
FZBeVmQBiJ+KO/by6WPnVlQ6r0Eq6QLNWx3ejS8z7BrglJdpC5vosVB/n7dzY0ML
FUTqLv0QXaE9MTt6BhNV1Sb7HlDm7lJWTmEo7Nm7wTuOhUQMcPzJrWeUbDacOyFz
UM86D2W31fEO3Zl075DVJowrsPJ+MCba7N5vaiEz3oD7nXZHyhTJr81iLxVvMGVI
SryN6TPjPfe+yMjl6OOqZcBuQ3g2TsC/DiTKyURO/FIPnJO9Dl1AIoDJ77/fSxFQ
aq2e7FbneVCZULqANO6nBirFsLvz+qiPPcgI7xJyOh8eAIQJmh35BNg6zp7qol2T
CGeTVAttCJnfFfZgtStD4MFvmYKUeG2iQ0BFTG1p6AzgjUvyZL0q0BYWU1BVuQay
K6eDmGRODLrH8S6ePDMwu4rwD73zg0b//XFTGeajVOFFkQkWUftc9IzF0RDVFZfV
BcDqJgDNILQIPBsFQhtDtngI1ZodlACnwUd//TuN41GZjBSkKZS2VbvfYW8HKEci
B64QQFL7NNT+9sy/z+gF2JEiBiGaSM7oX6MyBFWO8/BNlW6MwXd/yJUTBNPvycpH
pSaoRjO/Z7WFe6g3lqf2gN6zs/viUBwhRayZMeuF92O++3tqI18=
=Ck0B
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
