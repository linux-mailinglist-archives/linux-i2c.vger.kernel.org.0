Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59B034F9AB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhCaHTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233973AbhCaHSz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:18:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DEF861968;
        Wed, 31 Mar 2021 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617175135;
        bh=N2JjB3jNqEmrn0NuKsX95DfSg268p13rhdllb3wldik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wjy46zLz0XIEREnbAeDaBmvBDTxx3EBV9yIgOAqA0HDXtwFj+85m457xFPqwUO16i
         6yqqYg60onx8RaVMa+4yTNkLpex4dAzJF9NBvrCWUsGjHCe5OmUDvQ0iwrtY+m8lqm
         koQjJjrm4ZeYwoNq1Cc/0mWXx6RKxlR3hjtN5l4m8GYOW+on1xGK3vFzji2XYXkx8v
         Oh2NtNtNa2xF3I107g1vfnI406nNtvwFsBSe0109OmXsJ8DnbDzJFVL/6SucuXN+7T
         sEaaL3b0BPXeibEqcXKBTd7zXz1TD9MvXTLtY1RAYoNC3TU+epHiP9T0VleUugV5w1
         KK0PXs1/5di3g==
Date:   Wed, 31 Mar 2021 09:18:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, ywltyut@sina.cn,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v2] I2C: JZ4780: Fix bug for Ingenic X1000.
Message-ID: <20210331071852.GC1025@ninjato>
References: <1616148733-15154-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1616148733-15154-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline
In-Reply-To: <1616148733-15154-2-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 06:12:13PM +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou=
 Yanjie) wrote:
> Only send "X1000_I2C_DC_STOP" when last byte, or it will cause
> error when I2C write operation.
>=20
> Fixes: 21575a7a8d4c ("I2C: JZ4780: Add support for the X1000.")
>=20
> Reported-by: =E6=9D=A8=E6=96=87=E9=BE=99 (Yang Wenlong) <ywltyut@sina.cn>
> Tested-by: =E6=9D=A8=E6=96=87=E9=BE=99 (Yang Wenlong) <ywltyut@sina.cn>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Applied to for-current with updated commit message, thanks!


--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkIlwACgkQFA3kzBSg
Kba/7g/+IZVhVSJWA/1RcD9OjQRJmbGOXo8QkVyU3swFMIyPEqIVHyE8LFDs9De9
ayTZd9+FYDQrEBtyryKSQzmmCBZk3d0WtCQSE7JhK3Mz97RMhh2a6D2x5Jm9FlH0
O+6IV9ba1uCxm+7bT+c4mBwNUZSSWbWWf/mFzfKfMTz8G5/lKmcIdrxitlt80lVW
+mK+IHl1uAvhbaW+vLXS9PAii82vYmzWZYEwCmWoNBR00YIsF+tzUivSdX3BS25S
AHsatMqm7CiZXt6AD6E59si2vYYqmDqh1Ql/hDoNHgz2NmvrYYmdsiCVl07Bx1Qa
vmSzGVA0TM9Cy815ZgxRsdPlEGcv/lCUwMuX+2MC7f/+rasHbB4WBCRZ8cEvgQH9
3u94guNNbzS0CQVJv2pEA+P4C8LJEwpSktrHA3VnHux5Cx1nuVa2/PoX1qh7HZPP
Tijl1X35Jxzlp6/9G4gP/lcfA33FCmYKZABf9p8OB7jlsk7sN7A/k0PXSpme6tU3
/+K8oOpjVJfVnsE+Ux8UN04Z/AbGguxOcew0989EtV4AiW6VHiYyw7KEkUHfPg0K
ZQL1CLx70j7s4gIW4sMyGH2XHTUgBVCM72B+iDSpdOpwuftbikW4Ju4/BLJZ7FmF
BaPn7Z0vPmPQ7kCIB8RUoRxYrOmpXldnaXTrmHXOyE1BWnf2/SM=
=xRou
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
