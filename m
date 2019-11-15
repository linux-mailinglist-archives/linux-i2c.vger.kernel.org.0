Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B07FE6A7
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 21:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKOU4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 15:56:44 -0500
Received: from sauhun.de ([88.99.104.3]:43698 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbfKOU4o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Nov 2019 15:56:44 -0500
Received: from localhost (p54B33606.dip0.t-ipconnect.de [84.179.54.6])
        by pokefinder.org (Postfix) with ESMTPSA id 142F62C03E3;
        Fri, 15 Nov 2019 21:56:42 +0100 (CET)
Date:   Fri, 15 Nov 2019 21:56:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        youling 257 <youling257@gmail.com>
Subject: Re: [PATCH v2] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
Message-ID: <20191115205641.GA8973@kunai>
References: <20191113182938.279299-1-hdegoede@redhat.com>
 <20191114204815.GC7213@kunai>
 <c67a085b-8013-ef03-b5b2-431ea64ca97a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <c67a085b-8013-ef03-b5b2-431ea64ca97a@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well it is configuring the bus at a speed where not all devices
> can work, where as there is another speed where all devices do work.
> With that said I'm open to a different wording for the warning. Feel
> free to modify this before you add it to your tree.

Changed the message to "DSDT uses known not-working I2C bus speed %d,
forcing it to %d\n" and applied to for-current, thanks!


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3PEQUACgkQFA3kzBSg
KbZWCA/9GV8vhIAUOBWcnEOCxRGff8hTsxHFRdQo7dydg4JOlGJqK1oXJHZFQXeB
RbUhSl58gPallhC7RUUOXqMfyiZREDrVEbFvIm79Orveqlw1optRd1oocAy3tbif
KyVMRuTZqFtgMhD8E+D5hfoBPTM6u2E9FbbvAE4g78Y1AsjrUDDUq/M2fmrXQAgB
A+luBxBOiqQbBYWBPGNvtj6etTSwh4SGmiPxTDNh++CpzrQcAKU/it5p1SbRAwc+
69pBwZDnmsnHRsYmvjhFdMQPAuKLyGLpae6m8v+xAOBC9JDpmRrLAN3P80W+HkXJ
8BvrJjzdfNunlRvZQFuz3YiWD4XGJmyUhnl5sVvjfFAW1repTC+eG3LAPan9Ft4z
yA4WP99tsSAJgRKBXcNXXpNJPjXCVE/FYGZwGagjA7SK1wT0hWx42N+Hezin++9a
139ax28+BpDVEHqqchNIXMTwYdnGyFupzInTZUgMAn+iyrWLeXNcIw85wWIdjnhO
yivC72pT20fqTnn7cG670kDUTux8iq59mUv37LNwUZ2ub2EgcNUnOqYOSRxkRakf
ZA8OMZr+a8uphBS6aF0LzQMGA1Eus9QqX6XNPknyv3ebk8RZZgPlZGNJjd2fzOds
UHUfRU9XalYm/ucIyNear+pz4nTwmrcYv1A7FqJFPll5nuef4AM=
=FM4c
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
