Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055C72071F9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jun 2020 13:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390567AbgFXLXz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jun 2020 07:23:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388986AbgFXLXz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jun 2020 07:23:55 -0400
Received: from localhost (p54b3334b.dip0.t-ipconnect.de [84.179.51.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D72F20836;
        Wed, 24 Jun 2020 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592997834;
        bh=b3FSrf++yB9EWr7RoNaTnF5CfwzB4uz45/LhmlThiLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N1hQ23gqRm+dpp1EpzYv+OrNC1GanXX5VZetcyEHmWwMX0BSLs016yImzL202xB1Q
         HkriWQrx7HkVDg4I7EYhztkYzmOybOYf+/XyrbbVwegM8vAZBuy067bHuUqneqOYG/
         UfYfNelP5mqeOMg5jPQfvHaFlYlpB/sIXGdvMBsk=
Date:   Wed, 24 Jun 2020 13:23:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: platdrv: Set class based on dmi
Message-ID: <20200624112349.GA2067@kunai>
References: <20200624091239.802218-1-ribalda@kernel.org>
 <20200624104655.GD3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20200624104655.GD3703480@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 01:46:55PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 24, 2020 at 11:12:39AM +0200, Ricardo Ribalda wrote:
> > Current AMD's zen-based APUs use this core for some of its i2c-buses.
> >=20
> > With this patch we re-enable autodetection of hwmon-alike devices, so
> > lm-sensors will be able to work automatically.
> >=20
> > It does not affect the boot-time of embedded devices, as the class is
> > set based on the dmi information.
>=20
> Hmm... Do we really need to have DMI? I mean wouldn't be safe just always
> provide this to be compatible with HWMON class?

It is not unsafe. Embedded people might complain about increased boot
time whenever a CLASS_HWMON driver scans the addresses it knows.


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7zN8EACgkQFA3kzBSg
KbZYdRAAl/gHJCZbqLjHdJMvv2u0BlBl40pA0PGcnFHVNRotUpKOU1YZu3n5GX6U
i+V3UxeM5pFQJL3frL8MsM8fwufZvbXkZll7uMzW72RfwH2RD2ESGdf0o485UhP/
JDWi07/Y2NeCR/Klvny1+sRfwSC4Au0e/+RZSQ3na2VXaIiT8QuRRmvc5gLpC+0i
O7jcXd98I9xhxVwAlyYHcaYJCjFeVPJQv/dfVGHPJW/Ja5fU9jgtBVpFY+iRgxfD
a08m/7AevK1PDnhaL9tWCNM3FXIgg9+lwuKHG2M4e4yBzzKgQ7wQqHC2P8Iya1/+
kJQd+wR8GfKayJaeeIPYLzvOVnUOeItrP3X83r4iS0gc1zzldotEvcZ7qzjNWbO7
PI0FKFP9E/YXJNDyOeifnyuceQgRQAWyqEk5XoorIH5xvP39EHql5DwCtrBiGyhe
L+0iTN5a5i28E9AfdvHU9RpWwinkHrWyVh6Cb1RCSfFDxaZNtzORexIEm32LfjsK
sI7tMlTtd9C22MXLT60hGualB7Orz8Lt/+cx3yypTIFFmsY8sjolfIMreFvsMZHX
gc8onj+QX0tJWz/ADfcExNUaCmAd1EPY5N96PPlxHQBnVGi3Rqt0EfKJ/DiCCpXR
cwgH9o75YcYzvEwzJjm46HTg+MAV2S3oGS22qRgcMGckfnmk8nI=
=SAEo
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
