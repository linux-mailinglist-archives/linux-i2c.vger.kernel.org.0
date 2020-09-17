Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199E026E769
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 23:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgIQV0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 17:26:54 -0400
Received: from sauhun.de ([88.99.104.3]:37178 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgIQV0y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 17:26:54 -0400
X-Greylist: delayed 515 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 17:26:53 EDT
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id D88CE2C1682;
        Thu, 17 Sep 2020 23:18:16 +0200 (CEST)
Date:   Thu, 17 Sep 2020 23:18:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Call i2c_acpi_install_space_handler() before
 i2c_acpi_register_devices()
Message-ID: <20200917211816.GB18027@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20200909103233.58287-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20200909103233.58287-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 12:32:33PM +0200, Hans de Goede wrote:
> Some ACPI i2c-devices _STA method (which is used to detect if the device
> is present) use autodetection code which probes which device is present
> over i2c. This requires the I2C ACPI OpRegion handler to be registered
> before we enumerate i2c-clients under the i2c-adapter.
>=20
> This fixes the i2c touchpad on the Lenovo ThinkBook 14-IIL and
> ThinkBook 15 IIL not getting an i2c-client instantiated and thus not
> working.
>=20
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1842039
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-current, thanks!


--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9j0pgACgkQFA3kzBSg
KbYbRRAAoZnbHvoTYtpvtr5x9jGLKLGyf7IQqzT4GPWcCWvvYZtVfyQKQ/YmEYXF
MihlYFywPdL7pYGmWZgp8HqGx/+jw8/qNk4U0q6W0Rxfm72XlDpe3W6fqfRl6fbx
eR4uVrsvA4JjkUQAWyWVmREH9oficE7BzjxXtJnSRc23rcwjLVVJxmKGXw75PRZN
OZMwJYL7YnUlCnjMwqxAtmJL7ZE0fgMMDEHNN2XtYwZq/KEmcMQkA0s1yjc1B6yZ
pV0LXGyGC6Xf9t/bvgx4dJYClh5pIiPJtPecHJiXa+qo/1fVE1ps3QgObwmaI8Ju
4ybN9diejSuDc23Pmpiq6z/m2hLpPnNZWhoheECFWZnIRxo162cPdegaCLqKk/rs
uUUYZ2mAIkF4Th15pbBvdXNoAgi13oX2XSWel2OMW9h6g/8KUSHWjc7lbqfvfrhU
/mupr8O6VGmONTAGzYSu/3KmvmPwPCO7TbGQMaVSOwgIMV0BeN9LADJsAwmN+367
NOjCTASyIaP5JKSBAsG8U/GX3z8rLHrhBXacX23I50xdb6Wdjkh0HXLNMLIbJw0F
JaRS8QS8mrW7yN2VNSjerB7q7g3iO7EZHUfzN7B8WzhyE8ma+1mrxEt58tU7raaM
VS0+QQCXs7NNVujEUU7fOTtMCuNNgnW1BCF5SYGTXpx8QqgDKZY=
=u60B
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
