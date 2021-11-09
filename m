Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC83544B430
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 21:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244623AbhKIUqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 15:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244597AbhKIUqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 15:46:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B730DC061764
        for <linux-i2c@vger.kernel.org>; Tue,  9 Nov 2021 12:43:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkXy2-0002hN-Eq; Tue, 09 Nov 2021 21:43:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkXy0-0000hG-RY; Tue, 09 Nov 2021 21:43:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkXy0-0002VV-QP; Tue, 09 Nov 2021 21:43:40 +0100
Date:   Tue, 9 Nov 2021 21:43:40 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211109204340.aowatog3jn5hqrag@pengutronix.de>
References: <CAJZ5v0impb8uscbp8LUTBMExfMoGz=cPrTWhSGh0GF_SANNKPQ@mail.gmail.com>
 <20211109200518.GA1176309@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y2ftutqsucx4ohds"
Content-Disposition: inline
In-Reply-To: <20211109200518.GA1176309@bhelgaas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y2ftutqsucx4ohds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 02:05:18PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 09, 2021 at 07:58:47PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Nov 9, 2021 at 7:52 PM Rafael J. Wysocki <rafael@kernel.org> wr=
ote:
> > > On Tue, Nov 9, 2021 at 7:12 PM Bjorn Helgaas <helgaas@kernel.org> wro=
te:
> > > > On Tue, Nov 09, 2021 at 06:18:18PM +0100, Rafael J. Wysocki wrote:
> > > > > On Tue, Nov 9, 2021 at 7:59 AM Uwe Kleine-K=C3=B6nig
> > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> > > > > > > [+cc Greg: new device_is_bound() use]
> > > > > >
> > > > > > ack, that's what I would have suggested now, too.
> > > > > >
> > > > > > > On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-K=C3=B6n=
ig wrote:
> > > > > > > > pci_pm_runtime_resume() exits early when the device to resu=
me isn't
> > > > > > > > bound yet:
> > > > > > > >
> > > > > > > >     if (!to_pci_driver(dev->driver))
> > > > > > > >             return 0;
> > > > > > > >
> > > > > > > > This however isn't true when the device currently probes and
> > > > > > > > local_pci_probe() calls pm_runtime_get_sync() because then =
the driver
> > > > > > > > core already setup dev->driver. As a result the driver's re=
sume callback
> > > > > > > > is called before the driver's probe function is called and =
so more often
> > > > > > > > than not required driver data isn't setup yet.
> > > > > > > >
> > > > > > > > So replace the check for the device being unbound by a chec=
k that only
> > > > > > > > becomes true after .probe() succeeded.
> > > > > > >
> > > > > > > I like the fact that this patch is short and simple.
> > > > > > >
> > > > > > > But there are 30+ users of to_pci_driver().  This patch asser=
ts that
> > > > > > > *one* of them, pci_pm_runtime_resume(), is special and needs =
to test
> > > > > > > device_is_bound() instead of using to_pci_driver().
> > > > > >
> > > > > > Maybe for the other locations using device_is_bound(&pdev->dev)=
 instead
> > > > > > of to_pci_driver(pdev) !=3D NULL would be nice, too?
> > > > > >
> > > > > > I have another doubt: device_is_bound() should (according to its
> > > > > > kernel-doc) be called with the device lock held. For the call s=
tack that
> > > > > > is (maybe) fixed here, the lock is held (by __device_attach). We
> > > > > > probably should check if the lock is also held for the other ca=
lls of
> > > > > > pci_pm_runtime_resume().
> > > > > >
> > > > > > Hmm, the device lock is a mutex, the pm functions might be call=
ed in
> > > > > > atomic context, right?
> > > > > >
> > > > > > > It's special because the current PM implementation calls it v=
ia
> > > > > > > pm_runtime_get_sync() before the driver's .probe() method.  T=
hat
> > > > > > > connection is a little bit obscure and fragile.  What if the =
PM
> > > > > > > implementation changes?
> > > > > >
> > > > > > Maybe a saver bet would be to not use pm_runtime_get_sync() in
> > > > > > local_pci_probe()?
> > > > >
> > > > > Yes, in principle it might be replaced with pm_runtime_get_noresu=
me().
> > > > >
> > > > > In theory, that may be problematic if a device is put into a low-=
power
> > > > > state on remove and then the driver is bound again to it.
> > > > >
> > > > > > I wonder if the same problem exists on remove, i.e. pci_device_=
remove()
> > > > > > calls pm_runtime_put_sync() after the driver's .remove() callba=
ck was
> > > > > > called.
> > > > >
> > > > > If it is called after ->remove() and before clearing the device's
> > > > > driver pointer, then yes.
> > > >
> > > > Yes, that is the case:
> > > >
> > > >   pci_device_remove
> > > >     if (drv->remove) {
> > > >       pm_runtime_get_sync
> > > >       drv->remove()                # <-- driver ->remove() method
> > > >       pm_runtime_put_noidle
> > > >     }
> > > >     ...
> > > >     pm_runtime_put_sync            # <-- after ->remove()
> > > >
> > > > So pm_runtime_put_sync() is called after drv->remove(), and it may
> > > > call drv->pm->runtime_idle().  I think the driver may not expect th=
is.
> > > >
> > > > > If this is turned into pm_runtime_put_noidle(), all should work.
> > > >
> > > > pci_device_remove() already calls pm_runtime_put_noidle() immediate=
ly
> > > > after calling the driver ->remove() method.
> > > >
> > > > Are you saying we should do this, which means pci_device_remove()
> > > > would call pm_runtime_put_noidle() twice?
> > >
> > > Well, they are both needed to keep the PM-runtime reference counting =
in balance.
> > >
> > > This still has an issue, though, because user space would be able to
> > > trigger a runtime suspend via sysfs after we've dropped the last
> > > reference to the device in pci_device_remove().
> > >
> > > So instead, we can drop the pm_runtime_get_sync() and
> > > pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
> > > respectively, and add pm_runtine_get_noresume() to pci_pm_init(),
> > > which will prevent PM-runtime from touching the device until it has a
> > > driver that supports PM-runtime.
> > >
> > > We'll lose the theoretical ability to put unbound devices into D3 this
> > > way, but we learned some time ago that this isn't safe in all cases
> > > anyway.
> >=20
> > IOW, something like this (untested and most likely white-space-damaged).
>=20
> Thanks!  I applied this manually to for-linus in hopes of making the
> the next linux-next build.
>=20
> Please send any testing reports and corrections to the patch and
> commit log!
>=20
> commit dd414877b58b ("PCI/PM: Prevent runtime PM until claimed by a drive=
r that supports it")
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Tue Nov 9 13:36:09 2021 -0600
>=20
>     PCI/PM: Prevent runtime PM until claimed by a driver that supports it
>    =20
>     Previously we had a path that could call a driver's ->runtime_resume()
>     method before calling the driver's ->probe() method, which is a probl=
em
>     because ->runtime_resume() often relies on initialization done in
>     ->probe():
>    =20
>       local_pci_probe
>         pm_runtime_get_sync
>           ...
>             pci_pm_runtime_resume
>               if (!pci_dev->driver)
>                 return 0;                          <-- early exit
>               dev->driver->pm->runtime_resume();   <-- driver ->runtime_r=
esume()
>         pci_dev->driver =3D pci_drv;
>         pci_drv->probe()                           <-- driver ->probe()
>    =20
>     Prior to 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of
>     pci_dev->driver"), we took the early exit, which avoided the problem.=
  But
>     2a4d9408c9e8 removed pci_dev->driver (since it's redundant with
>     device->driver), so we no longer take the early exit, which leads to =
havoc
>     in ->runtime_resume().
>    =20
>     Similarly, we could call the driver's ->runtime_idle() method after i=
ts
>     ->remove() method.
>    =20
>     Avoid the problem by dropping the pm_runtime_get_sync() and
>     pm_runtime_put_sync() from local_pci_probe() and pci_device_remove(),
>     respectively.
>    =20
>     Add pm_runtime_get_noresume(), which uses no driver PM callbacks, to =
the
>     pci_pm_init() enumeration path.  This will prevent PM-runtime from to=
uching
>     the device until it has a driver that supports PM-runtime.
>    =20
>     Link: https://lore.kernel.org/r/CAJZ5v0impb8uscbp8LUTBMExfMoGz=3DcPrT=
WhSGh0GF_SANNKPQ@mail.gmail.com
>     Fixes: 2a4d9408c9e8 ("PCI: Use to_pci_driver() instead of pci_dev->dr=
iver")
>     Reported-by: Robert =C5=9Awi=C4=99cki <robert@swiecki.net>
>     Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

I like this, this feels better than my initial suggestion using
device_is_bound().

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y2ftutqsucx4ohds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGK3XkACgkQwfwUeK3K
7AkEMwf/dR6xL6eOWDFAQ8JmjwwRgmPEgGmE5vnPBHye6wRQcfxcwE4SpXyVqgTI
g664Hbe2SrP8rrwU0NklrEhwlX0zQ7IpZhUMbl1KkbkDKZx11+3tfFBGW21bDyFl
lPwT/bK0l6nMzGhFriAbIfmxUPhHedoK0YhYDZz8WNL5vFvRUWvExi6zvCGy0FXE
6dFjJHYga4eLTGkj22+sDiRXRbx0NdpiVGRzDD37sv18AAoMmZe9EM21yKHnhjUC
xxaGqSDYRVpPVJ2ZkbIEqWo/08EfwJL19SGOO1A6fdmlxE+YnpmzzRYKeZVTaxxp
yfvp6hKkjAQ7m8bOOrRScRbuNPdr2Q==
=WTw5
-----END PGP SIGNATURE-----

--y2ftutqsucx4ohds--
