Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88EE4173DC8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2020 18:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgB1RAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Feb 2020 12:00:36 -0500
Received: from sauhun.de ([88.99.104.3]:59830 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgB1RAg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Feb 2020 12:00:36 -0500
Received: from localhost (p54B3301B.dip0.t-ipconnect.de [84.179.48.27])
        by pokefinder.org (Postfix) with ESMTPSA id 5EB2E2C1F3E;
        Fri, 28 Feb 2020 18:00:34 +0100 (CET)
Date:   Fri, 28 Feb 2020 18:00:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when
 instantiating devices
Message-ID: <20200228170033.GB1130@ninjato>
References: <20200225141229.5424-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <20200225141229.5424-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 03:12:29PM +0100, Wolfram Sang wrote:
> Removing attach_adapter from this driver caused a regression for at
> least some machines. Those machines had the sensors described in their
> DT, too, so they didn't need manual creation of the sensor devices. The
> old code worked, though, because manual creation came first. Creation of
> DT devices then failed later and caused error logs, but the sensors
> worked nonetheless because of the manually created devices.
>=20
> When removing attach_adaper, manual creation now comes later and loses
> the race. The sensor devices were already registered via DT, yet with
> another binding, so the driver could not be bound to it.
>=20
> This fix refactors the code to remove the race and only manually creates
> devices if there are no DT nodes present. Also, the DT binding is updated
> to match both, the DT and manually created devices. Because we don't
> know which device creation will be used at runtime, the code to start
> the kthread is moved to do_probe() which will be called by both methods.
>=20
> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adap=
ter")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D201723
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-current, thanks!


--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ZRzEACgkQFA3kzBSg
KbaKYRAArEKx3JwNEQp6n8EAAguvg0kWe0Jex0jFkCmXjPvaDkffabFrEWUFIIu8
UESwqMz04pzW3T9XdinJYW7098SiwEx+T7NbnQUpw2vlRUP0573lVQvZ0vdGn2Sg
SfaaTKPU2DO2CecjVgHuh0Z3jjym18XuydtoUJIQ3GQkG6AiqvNs8Lo9KtgCBu9b
DKCq7mqygihBerunNH/oZ3Ul6YUKE3jbYXPYzxdMCvupFLbFnYUMDRLUXyIeIMbi
dQOZS7ZNw+WdbUcQCseaevRUgGDhjvj0bjmqllwN6DOZOmYe99yI3HUn7y5KU7Mx
OBKK5RzeR7Nc8CfQ+7KtQXWJ1fwP8t7PJmLZuaZYcJuKX3rT9gNTqRHPfXi2OqG/
ijtVsl20BgrMUuMD6y4RLPN5BoM17KJPji4iqdf85MpNCRhxSbeTHZsK9lpjP5LC
LR2hN56JdSP9yZupQSwnfNBuZi/tR6G3gcix1Uuxzu8c2mFQ3ROwE/vrSSbsrD8o
lpVI9TEbxsA7O4W5tHiG47QfyvvNGapkK2KmssGUEu2tobOInB7B3RRyX3xgybGh
+sy2P0MJnV6l3YLXLR3tnNejJmlGo06S7niQLQan4z4yKaLYZreMveNcX8XjxLJ2
HDjwuM+eQJalSTkMed26011pXb9PA14RMKJHnVVaYAJ7D5BuqSk=
=wDPc
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
