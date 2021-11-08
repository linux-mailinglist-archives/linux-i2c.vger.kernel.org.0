Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D6D449E07
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240108AbhKHVZi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237872AbhKHVZh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:25:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8DFC061570
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 13:22:52 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkC6H-0004KQ-FL; Mon, 08 Nov 2021 22:22:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkC6G-0006p8-Ro; Mon, 08 Nov 2021 22:22:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkC6G-0004MH-PY; Mon, 08 Nov 2021 22:22:44 +0100
Date:   Mon, 8 Nov 2021 22:22:26 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        linux-i2c@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
References: <CAP145phj7jEy6tkdFMdW-rzPprMTUckaaSrtrVysE-u+S+=Lcg@mail.gmail.com>
 <20211108185823.GA1101310@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mw6wmmp7wmewxd67"
Content-Disposition: inline
In-Reply-To: <20211108185823.GA1101310@bhelgaas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mw6wmmp7wmewxd67
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

pci_pm_runtime_resume() exits early when the device to resume isn't
bound yet:

	if (!to_pci_driver(dev->driver))
		return 0;

This however isn't true when the device currently probes and
local_pci_probe() calls pm_runtime_get_sync() because then the driver
core already setup dev->driver. As a result the driver's resume callback
is called before the driver's probe function is called and so more often
than not required driver data isn't setup yet.

So replace the check for the device being unbound by a check that only
becomes true after .probe() succeeded.

Thanks to Bjorn Helgaas for the analysis.

Reported-by: Robert =C5=9Awi=C4=99cki <robert@swiecki.net>
Fixes: 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->driver")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
On Mon, Nov 08, 2021 at 12:58:23PM -0600, Bjorn Helgaas wrote:
> [+cc Uwe, Rafael, linux-pm, linux-pci, linux-kernel, beginning of
> thread: https://lore.kernel.org/linux-i2c/CAP145pgdrdiMAT7=3D-iB1DMgA7t_b=
MqTcJL4N0=3D6u8kNY3EU0dw@mail.gmail.com/T/#t]
>=20
> On Mon, Nov 08, 2021 at 05:34:14PM +0100, Robert =C5=9Awi=C4=99cki wrote:
> > > I'm daily-driving the linux from Linus' git (recompiling every day or
> > > two), and yesterday it stopped booting. Below is the dmesg from
> > > pstore.
> > > ...
> >=20
> > This introduced the bug: 0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
> > https://github.com/torvalds/linux/commit/0c5c62ddf88c34bc83b66e4ac9beb2=
bb0e1887d4
>=20
> Thank you very much for the debugging and this report!  This report is
> for i2c, but the problem will affect many drivers.
>=20
> > > <1>[    1.431369][  T447] BUG: kernel NULL pointer dereference,
> > > address: 0000000000000540
> > > <1>[    1.431371][  T447] #PF: supervisor read access in kernel mode
> > > <1>[    1.431375][  T447] #PF: error_code(0x0000) - not-present page
> > > <6>[    1.431378][  T447] PGD 0 P4D 0
> > > <4>[    1.431384][  T447] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > <4>[    1.431388][  T447] CPU: 12 PID: 447 Comm: systemd-udevd
> > > Tainted: G            E     5.15.0+ #91
> > > <4>[    1.431391][  T447] Hardware name: ASUS System Product Name/ROG
> > > CROSSHAIR VIII FORMULA, BIOS 3801 07/30/2021
> > > <4>[    1.431392][  T447] RIP: 0010:i2c_dw_pci_resume+0x8/0x40
> > > [i2c_designware_pci]
> > > <4>[    1.431399][  T447] Code: 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> > > 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00 00 00 00 53 48
> > > 8b 5f 78 48 89 df <ff> 93 40 05 00 00 c6 83 c0 05 00 00 00 5b c3 66 66
> > > 2e 0f 1f 84 00
> > > <4>[    1.431401][  T447] RSP: 0018:ffffb3e740a13ba8 EFLAGS: 00010286
> > > <4>[    1.431403][  T447] RAX: 0000000000000000 RBX: 0000000000000000
> > > RCX: 0000000000000000
>=20
>   $ ./scripts/decodecode < oops
>     22:       53                      push   %rbx
>     23:       48 8b 5f 78             mov    0x78(%rdi),%rbx
>     27:       48 89 df                mov    %rbx,%rdi
>     2a:*      ff 93 40 05 00 00       callq  *0x540(%rbx)             <--=
 trapping instruction
>     30:       c6 83 c0 05 00 00 00    movb   $0x0,0x5c0(%rbx)
>     37:       5b                      pop    %rbx
>     38:       c3                      retq
>=20
>   static int i2c_dw_pci_resume(struct device *dev)
>   {
>     struct dw_i2c_dev *i_dev =3D dev_get_drvdata(dev);
>     int ret;
>=20
>     ret =3D i_dev->init(i_dev);
>     i_dev->suspended =3D false;
>=20
>     return ret;
>=20
> So I think we're trying to call i_dev->init(), which is a NULL
> pointer.
>=20
> > > <4>[    1.431422][  T447]  pci_pm_runtime_resume+0xaa/0x100
> > > <4>[    1.431434][  T447]  __rpm_callback+0x3c/0x100
> > > <4>[    1.431442][  T447]  rpm_callback+0x54/0x80
> > > <4>[    1.431445][  T447]  rpm_resume+0x410/0x700
> > > <4>[    1.431455][  T447]  __pm_runtime_resume+0x45/0x80
> > > <4>[    1.431457][  T447]  pci_device_probe+0xa2/0x140
> > > <4>[    1.431459][  T447]  really_probe+0x1e4/0x400
> > > <4>[    1.431464][  T447]  __driver_probe_device+0xf9/0x180
> > > <4>[    1.431466][  T447]  driver_probe_device+0x19/0xc0
>=20
> I think the problem here is that:
>=20
>   - really_probe() sets dev->driver
>=20
>   - local_pci_probe() calls pm_runtime_get_sync(), which leads to:
>=20
>   - pci_pm_runtime_resume(), which previously skipped the driver's
>     .runtime_resume() method when "pci_dev->driver" as NULL
>=20
>   - after 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of
>     pci_dev->driver") [1], it checks "dev->driver" instead of
>     "pci_dev->driver"
>=20
>   - dev->driver is non-NULL (set by really_probe() above), but at this
>     point pci_dev->driver used to be NULL because local_pci_probe()
>     didn't set it until after after calling pm_runtime_get_sync() (see
>     b5f9c644eb1b ("PCI: Remove struct pci_dev->driver") [2])
>=20
>   - because dev->driver is non-NULL, we call i2c_dw_pci_resume()
>     before i2c_dw_pci_probe(), so the driver init hasn't been done
>=20
> Here's the call tree:
>=20
>     really_probe
>       dev->driver =3D drv;                       # <--
>       call_driver_probe
>         dev->bus->probe
>           pci_device_probe
>             __pci_device_probe
>               pci_call_probe
>                 local_pci_probe
>                   pm_runtime_get_sync
>                     ...
>                     pci_pm_runtime_resume
>   -                   if (!pci_dev->driver)    # 2a4d9408c9e8 ("PCI: Use =
to_pci_driver() instead of pci_dev->driver")
>   +                   if (!to_pci_driver(dev->driver))
>                         return 0
>                       pm->runtime_resume
>                         i2c_dw_pci_resume
>                           i_dev->init()        # <-- NULL ptr deref
>   -                 pci_dev->driver =3D pci_drv  # b5f9c644eb1b ("PCI: Re=
move struct pci_dev->driver")
>                   pci_drv->probe
>                     i2c_dw_pci_probe

I think this analysis is right.

I didn't test this patch, @Robert, maybe you can do this?

Best regards
Uwe

 drivers/pci/pci-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 1d98c974381c..202533654012 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1299,7 +1299,7 @@ static int pci_pm_runtime_resume(struct device *dev)
 	 */
 	pci_restore_standard_config(pci_dev);
=20
-	if (!to_pci_driver(dev->driver))
+	if (!device_is_bound(dev))
 		return 0;
=20
 	pci_fixup_device(pci_fixup_resume_early, pci_dev);
--=20
2.30.2


--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mw6wmmp7wmewxd67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGJlQkACgkQwfwUeK3K
7Amtmwf6Apt1+0GXpaQZGgTdhPON0tOzU7h9hff1tk9nKLDTKJsKTiY2whFPlTmh
CFd++Sddrm4KJXeNgyJmbhTKrGu9MTTR22K+0OBAKzOhj05prkc/k/O58jKPT0Gw
3Cdisp/YEMjD24yVEm2SkXvboocKOgz/OdwK9I1XB5GjakInZWiBNf0d1M8whf5+
0WOYp0r5putvcayWFMwqi5kgbAJYmBUlttl8qJ6+43jxU/0LiooOOfRe3gT9hT3g
uT3t8bM00rKV2YbjfG5bQsfxyhl0Atfbr++36ub9ETbjR2/jNjZSHBSxfgZPZx0x
8gnSGHCpdU2BfDzCNCuzDCBo5NzkFg==
=Ha5a
-----END PGP SIGNATURE-----

--mw6wmmp7wmewxd67--
