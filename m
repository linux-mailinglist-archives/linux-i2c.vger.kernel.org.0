Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E1B214443
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGDGIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:08:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgGDGIs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:08:48 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16996206B7;
        Sat,  4 Jul 2020 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593842927;
        bh=GGjkbnJd0OJjv8J/wufgjHaf/6St/TJrcCosu6np+sM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LkljAJerEOwB310ZUiczUhYdOfIct3NA2pCY28KWBezfOx6WsvoO/Hdf5bV1t8kOK
         C80ZLx6nOC1yUsp3ErFm2VyZtRqkkiF35zkjlKYW3f3ovZ+3rRH5etATjHHuJcNzCE
         oXQQSny5W/FE4OdhM69/tv9urYf+Do1CFXJP1wHk=
Date:   Sat, 4 Jul 2020 08:08:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ricardo Ribalda <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: designware: platdrv: Set class based on DMI
Message-ID: <20200704060845.GC1041@kunai>
References: <20200702103321.2092254-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <20200702103321.2092254-1-ribalda@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 12:33:21PM +0200, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
>=20
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
>=20
> It does not affect the boot-time of embedded devices, as the class is
> set based on the DMI information.
>=20
> DMI is probed only on Qtechnology QT5222 Industrial Camera Platform.
>=20
> DocLink: https://qtec.com/camera-technology-camera-platforms/
> Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add supp=
ort for AMD I2C controller"")
> Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AHO0ACgkQFA3kzBSg
Kba2vhAAnfUuiL7C0VB5NB+/FImQRw1ufT1VtYCmMJIoG+CVLvjwAQWApn5RHYDt
JOvRVLninVv9PI/PlfY7j/VEnQvMaAJy616jFtJ2d+iXvOOXvhMW8oNltBEZ7F2H
5uDPVPaaJvtCJwVzWa9KAackYBA1KWFoGJpznihdKieK9Bw+8Os0IjTxRLknGyXO
lUahNjbyQb1eUhQPSFzQhcO8URvj7RC8lIawHl9z+LB3t0GuvHJ4WVYFQwx2yxQl
3mtwjXrwAKfuI1L40kYrGgKu/0qwdka5uNj+TK8aKNzqvZK3HYBGDghDW+puoTEd
KuOTNwvFPVIaQ7BzGlWDo7WZM5YhS0oNyB6F/tqrlp38Y6/x+jtvNRK0sZgtBtlY
vrO7QELGkwkcXBCGicx7UgRoki2PbQkEbaM4GFjsCf9WO96PHQgA6r7Wjb/SWdMA
HTV+biIgR40d85KxEk4NAP3d2SOQEKf9i1mGonvnL40VKz1vs7zCKiWR9ZSIlQ/l
ipihn2ysyJgfaKdqNNh15Y/TUQOKDo7ljJz9IhlByKjxaFIQPHtNGqdEP/zCxQj5
TZ2WoLJxixghScSFfThIQ5OQT9ggA7t4Emtt/qYRxhY1pyTTDsejlJ6BDmfutPB2
rYIrIf1Jg49exDWCT/YO0FcoLHclCILaEYIQFmN/fn1PeU70e8g=
=uc6L
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
