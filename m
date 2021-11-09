Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4668644A727
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 07:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243401AbhKIHCY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 02:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243389AbhKIHCX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 02:02:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C08C061764
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 22:59:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkL6S-0006o5-Rw; Tue, 09 Nov 2021 07:59:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkL6S-0007ri-3j; Tue, 09 Nov 2021 07:59:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mkL6S-0006Pv-2c; Tue, 09 Nov 2021 07:59:32 +0100
Date:   Tue, 9 Nov 2021 07:59:27 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
        linux-i2c@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] pci: Don't call resume callback for nearly bound devices
Message-ID: <20211109065927.26v6xn7d5yyuxw4h@pengutronix.de>
References: <20211108212226.253mwl4wp7xjckqz@pengutronix.de>
 <20211109025619.GA1131403@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cwmyhnz7b32zl6pa"
Content-Disposition: inline
In-Reply-To: <20211109025619.GA1131403@bhelgaas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cwmyhnz7b32zl6pa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Nov 08, 2021 at 08:56:19PM -0600, Bjorn Helgaas wrote:
> [+cc Greg: new device_is_bound() use]

ack, that's what I would have suggested now, too.

> On Mon, Nov 08, 2021 at 10:22:26PM +0100, Uwe Kleine-K=F6nig wrote:
> > pci_pm_runtime_resume() exits early when the device to resume isn't
> > bound yet:
> >=20
> > 	if (!to_pci_driver(dev->driver))
> > 		return 0;
> >=20
> > This however isn't true when the device currently probes and
> > local_pci_probe() calls pm_runtime_get_sync() because then the driver
> > core already setup dev->driver. As a result the driver's resume callback
> > is called before the driver's probe function is called and so more often
> > than not required driver data isn't setup yet.
> >=20
> > So replace the check for the device being unbound by a check that only
> > becomes true after .probe() succeeded.
>=20
> I like the fact that this patch is short and simple.
>=20
> But there are 30+ users of to_pci_driver().  This patch asserts that
> *one* of them, pci_pm_runtime_resume(), is special and needs to test
> device_is_bound() instead of using to_pci_driver().

Maybe for the other locations using device_is_bound(&pdev->dev) instead
of to_pci_driver(pdev) !=3D NULL would be nice, too?

I have another doubt: device_is_bound() should (according to its
kernel-doc) be called with the device lock held. For the call stack that
is (maybe) fixed here, the lock is held (by __device_attach). We
probably should check if the lock is also held for the other calls of
pci_pm_runtime_resume().

Hmm, the device lock is a mutex, the pm functions might be called in
atomic context, right?

> It's special because the current PM implementation calls it via
> pm_runtime_get_sync() before the driver's .probe() method.  That
> connection is a little bit obscure and fragile.  What if the PM
> implementation changes?

Maybe a saver bet would be to not use pm_runtime_get_sync() in
local_pci_probe()?

I wonder if the same problem exists on remove, i.e. pci_device_remove()
calls pm_runtime_put_sync() after the driver's .remove() callback was
called.

> Maybe we just need a comment there about why it looks different than
> the other PM interfaces?

A comment is a good idea for sure.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cwmyhnz7b32zl6pa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGKHEwACgkQwfwUeK3K
7Amw8gf/UszCbpMZd4Nif+A0PIUE7CV8Uk5cXTWAiOyvw+uYUKC6Z0zpieJGInpX
Vhv3RqJTysGPOQrfv8704K2uPS4IZbhjyFKtR1G5Y4WGfTE5UL8q8m/KVGeNJVFG
rRr68rTStaar6wgMiecqsGKW0BK2rbGk+hS/KAjUW1vyATQD3UThueMGjch4Ner/
YY3JsREE/tWOIx5dZZ0fuFkMD+x4ZVTBbCx35JA3HlTrrKVlcp+EKi2PjyTPLuqI
TuaG7NO5/5x0hl3G0h+HWCNvtOSrGhrixRbUdG4BcBPC0qLXwxXwfLOOTMztlrN5
NCxrJV73lLR52PN0jk0bW2FLX1o3uQ==
=+kYc
-----END PGP SIGNATURE-----

--cwmyhnz7b32zl6pa--
