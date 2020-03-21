Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08E218DF44
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Mar 2020 10:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgCUJro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 05:47:44 -0400
Received: from sauhun.de ([88.99.104.3]:33354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgCUJro (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Mar 2020 05:47:44 -0400
Received: from localhost (p54B33C59.dip0.t-ipconnect.de [84.179.60.89])
        by pokefinder.org (Postfix) with ESMTPSA id 4688F2C1ECA;
        Sat, 21 Mar 2020 10:47:41 +0100 (CET)
Date:   Sat, 21 Mar 2020 10:47:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Hao <haokexin@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix the race between the release of i2c_dev
 and cdev
Message-ID: <20200321094740.GB1856@ninjato>
References: <20191011150014.28177-1-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <20191011150014.28177-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 11:00:14PM +0800, Kevin Hao wrote:
> The struct cdev is embedded in the struct i2c_dev. In the current code,
> we would free the i2c_dev struct directly in put_i2c_dev(), but the
> cdev is manged by a kobject, and the release of it is not predictable.
> So it is very possible that the i2c_dev is freed before the cdev is
> entirely released. We can easily get the following call trace with
> CONFIG_DEBUG_KOBJECT_RELEASE and CONFIG_DEBUG_OBJECTS_TIMERS enabled.
>   ODEBUG: free active (active state 0) object type: timer_list hint: dela=
yed_work_timer_fn+0x0/0x38
>   WARNING: CPU: 19 PID: 1 at lib/debugobjects.c:325 debug_print_object+0x=
b0/0xf0
>   Modules linked in:
>   CPU: 19 PID: 1 Comm: swapper/0 Tainted: G        W         5.2.20-yocto=
-standard+ #120
>   Hardware name: Marvell OcteonTX CN96XX board (DT)
>   pstate: 80c00089 (Nzcv daIf +PAN +UAO)
>   pc : debug_print_object+0xb0/0xf0
>   lr : debug_print_object+0xb0/0xf0
>   sp : ffff00001292f7d0
>   x29: ffff00001292f7d0 x28: ffff800b82151788
>   x27: 0000000000000001 x26: ffff800b892c0000
>   x25: ffff0000124a2558 x24: 0000000000000000
>   x23: ffff00001107a1d8 x22: ffff0000116b5088
>   x21: ffff800bdc6afca8 x20: ffff000012471ae8
>   x19: ffff00001168f2c8 x18: 0000000000000010
>   x17: 00000000fd6f304b x16: 00000000ee79de43
>   x15: ffff800bc0e80568 x14: 79616c6564203a74
>   x13: 6e6968207473696c x12: 5f72656d6974203a
>   x11: ffff0000113f0018 x10: 0000000000000000
>   x9 : 000000000000001f x8 : 0000000000000000
>   x7 : ffff0000101294cc x6 : 0000000000000000
>   x5 : 0000000000000000 x4 : 0000000000000001
>   x3 : 00000000ffffffff x2 : 0000000000000000
>   x1 : 387fc15c8ec0f200 x0 : 0000000000000000
>   Call trace:
>    debug_print_object+0xb0/0xf0
>    __debug_check_no_obj_freed+0x19c/0x228
>    debug_check_no_obj_freed+0x1c/0x28
>    kfree+0x250/0x440
>    put_i2c_dev+0x68/0x78
>    i2cdev_detach_adapter+0x60/0xc8
>    i2cdev_notifier_call+0x3c/0x70
>    notifier_call_chain+0x8c/0xe8
>    blocking_notifier_call_chain+0x64/0x88
>    device_del+0x74/0x380
>    device_unregister+0x54/0x78
>    i2c_del_adapter+0x278/0x2d0
>    unittest_i2c_bus_remove+0x3c/0x80
>    platform_drv_remove+0x30/0x50
>    device_release_driver_internal+0xf4/0x1c0
>    driver_detach+0x58/0xa0
>    bus_remove_driver+0x84/0xd8
>    driver_unregister+0x34/0x60
>    platform_driver_unregister+0x20/0x30
>    of_unittest_overlay+0x8d4/0xbe0
>    of_unittest+0xae8/0xb3c
>    do_one_initcall+0xac/0x450
>    do_initcall_level+0x208/0x224
>    kernel_init_freeable+0x2d8/0x36c
>    kernel_init+0x18/0x108
>    ret_from_fork+0x10/0x1c
>   irq event stamp: 3934661
>   hardirqs last  enabled at (3934661): [<ffff00001009fa04>] debug_excepti=
on_exit+0x4c/0x58
>   hardirqs last disabled at (3934660): [<ffff00001009fb14>] debug_excepti=
on_enter+0xa4/0xe0
>   softirqs last  enabled at (3934654): [<ffff000010081d94>] __do_softirq+=
0x46c/0x628
>   softirqs last disabled at (3934649): [<ffff0000100b4a1c>] irq_exit+0x10=
4/0x118
>=20
> This is a common issue when using cdev embedded in a struct.
> Fortunately, we already have a mechanism to solve this kind of issue.
> Please see commit 233ed09d7fda ("chardev: add helper function to
> register char devs with a struct device") for more detail.
>=20
> In this patch, we choose to embed the struct device into the i2c_dev,
> and use the API provided by the commit 233ed09d7fda to make sure that
> the release of i2c_dev and cdev are in sequence.
>=20
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Applied to for-next with stable added, thanks!


--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl514rwACgkQFA3kzBSg
KbbabA/9E4rzINCO447L0wAridoech2/s9k0ZZBhUJBD5UxI2calFgBCDrUY1J94
Qv9wSSKm0bGsYkk0gPtiHR76UUDOYYgBgVHFrsWfRNJs27yolFGqbx35X/gdXIVA
f9HpKggSBMvjXn3nx9iAXzltoXEIw3azHeAu1EnmzZP7iIQS/IQcGJJV57pWKzIr
Fb/57yE9P+zLM1Nep7xSxCGeJdvW85KOZh1mn7FDRaWNwKG/i0E/vAjJ0qPr07Nn
EFiNsckRvtMUVzcbjiIlPrmOmYQKbPjzFEWpbP64JAKu1n9fxk88q8zFw6OM9j3F
r/405xUp2zCLScI06psd+YdxFWufhMe6LEB6n0faNQ21hENRSz73s5cOAv7mcI7Y
KuG14LdAQQcRclHAKZzAQKKUBpiaPAOxO21O+ZkG4ztMqGBEs8jpHWKX8NKRoN6K
JdcWlo5a2o1IG+wj+nDDnai+AR7FIBmeJC0KZnUTJ6AlhaABhARtUeg2rFZZ3rCf
ZVrtFAx3eU1g4gr7e8ODYJKA9bCTOcYg/Okut+Az4rXjNBJyx0J+OwoZNv+MvNwZ
AdQYazJRCwZtTb/qjQgaEVaEkxf3oeNGt+U1rhVWHPuiCy2zIWAeivsz7a1uAaMn
TvtJBXpZmpECGcebUzcj+aK/AHvsjSFHyXzplQVYVGAwJRlIjjg=
=P6xF
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
