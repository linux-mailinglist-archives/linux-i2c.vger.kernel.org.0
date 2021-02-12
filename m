Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06824319A2A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 08:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBLHTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 02:19:04 -0500
Received: from sauhun.de ([88.99.104.3]:33354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhBLHTD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 02:19:03 -0500
Received: from localhost (p54b333a8.dip0.t-ipconnect.de [84.179.51.168])
        by pokefinder.org (Postfix) with ESMTPSA id 6D6EA2C35BE;
        Fri, 12 Feb 2021 08:18:21 +0100 (CET)
Date:   Fri, 12 Feb 2021 08:18:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 2/7] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20210212071821.GB1013@ninjato>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-3-sakari.ailus@linux.intel.com>
 <20210209210410.GA2380@kunai>
 <20210210222722.GF3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <20210210222722.GF3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm actually renaming this as I2C_DRV_ACPI_WAIVE_D0_PROBE, with similar
> changes to the function names. I opportunistically assume the ack holds
> still. :-)

Rightfully so :)


--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmK70ACgkQFA3kzBSg
KbbDyw//fJKQdFxil/j6shvnsnOzbogbt2Z+Kwyjq3RKah0nPyqcYtoGREdbVQS+
4Bw9XI4C3uFnPCUTiyVwD1ocmKXIwcVuaNoc6bEfbdKdf7ceO8vwEz8XmnRELQPK
74146TA0sCDY6z+/5YeRInceYf4glLITjD2/otft7CZsdYabg4P5lWhf7ct6MIiC
/cNh0OL+eg8U4fM+4uaJSo6QV4GsW2BPHno+LwmJ7XiPHBYY+IYhQnRhw0R6g/XU
GsQNfqLrzUpZXI5zAnU5wpnTjLZqWSlmwqQDE9pAeNzEze4TrvsZTp+pOQSXG786
DpnfBRwc+Wi6vyQObRSt/wdR0XHo7j7sYp2sLKw4vMb5xp8QVL8N7DZu8FMiottF
tIQwGvGsfkR0u4/iQGDLeZYrSUKiHGp3gjJtwklkyu97V/eyFqSz+kqy1F7hIwgC
dzF+43LsQo5R2vpdHLNnTFg7/YUhHVCFoC5V1RgeuMUYI6MazwS2YrAR2zMfIDLo
ZsL9WN+ZgByF+qmfjvvBO8Z33lAPYIf6Nh77KLqyvfXMjt0htojz+AdPlGC9I0ML
MPyrRJIIEq4QkWTWEJFYvKVn4zvQGzq10W3Ju7p496Ae9IgX1nuk5/oIUsLve26i
4dZzhvfX7mhutBQPRdjAVH3iKb4SEUcrBIRAQAawWqeIU8LF3PQ=
=2no6
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
