Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CFE3158F5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 22:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbhBIVuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 16:50:11 -0500
Received: from sauhun.de ([88.99.104.3]:33320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233684AbhBIVF7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 16:05:59 -0500
Received: from localhost (p5486c396.dip0.t-ipconnect.de [84.134.195.150])
        by pokefinder.org (Postfix) with ESMTPSA id 731632C04E4;
        Tue,  9 Feb 2021 22:04:13 +0100 (CET)
Date:   Tue, 9 Feb 2021 22:04:10 +0100
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
Message-ID: <20210209210410.GA2380@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20210205132505.20173-3-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> + * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the device's
> + *				      power state during probe and remove

Well, for the functional change, I am happy if the ACPI guys are happy.
The only minor nit for me would be removing the "_FL" snipplet from the
name of the define because I think it is clear enough that this is a
flag. If you need to resend anyhow, maybe it is worth a thought. It is
not a big issue, so anyway:

Acked-by: Wolfram Sang <wsa@kernel.org>

because I assume this will go in via the ACPI tree?


--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAi+MYACgkQFA3kzBSg
Kba6/xAAtMdyI3C2JF5zUtXQxsmy1dTtr0C3ypMSMTb22o36hVCD5m0MrEk1Ism2
FTlAoKDK2RhPjsANQLuDg5GyktNmk0aNX1ucmromKdNfHHnJQcEtKWSDm0lVEyyy
b5RJnv1Zu7zc+Xk5sHKnfidY6YyGXx+HwS8D+w5UNvcTf/dpyhZLIEvn6Dl8tU1E
WRsrMgmXqDVjEUukEr/j/g+ZwqjMfSj1be9hl3yPp29i4qaSmgKygp2i3/4iOC3f
IXMIV/pOEN/rMbRCYeTBBccmsH3u67xXV2XFjHs6G2mMQ7n8ydbpAZjtkcQDh4Df
ZWBzAWdIhtDZBEZ0CiyzcgnSP6QGLtNGfHGUYjuq7Sg8ea7kP1Acm1WHhwXcdvgT
ZCuNSw48Cc8KYTjpJ4amx6HHmhFs/JcOu+j+psGVg3B/s7L3A+uq6iX6vBKgRcQ6
0MS8VT04R+F1Z1UaFlIbidQbp/se2PCaUs7182afHSWnESwtebZ0y2oKwWvnmC6F
/TmC3maOf0a1bUyV6tbAZ6fY5H5zQue+pzhsBfIALgYGe9mQsHDU+W7yklmYTwP8
jxquIbwNqtwaaG0BHiAnCmH2eRIyM/yDDl0RLKqD6m3HSEM3vJaeBS2adzjShXnp
pekggUfypFw/gpc5axQAEHkoGST+/M8g9ekR2EZ8IYdQZc1SVz8=
=10SL
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
