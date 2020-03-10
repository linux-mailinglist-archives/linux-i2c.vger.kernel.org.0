Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D1817F39D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCJJaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:30:39 -0400
Received: from sauhun.de ([88.99.104.3]:46516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJJaj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:30:39 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id B9DA82C1EC6;
        Tue, 10 Mar 2020 10:30:37 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:30:37 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
Message-ID: <20200310093037.GD1987@ninjato>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200226132122.62805-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <20200226132122.62805-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 04:21:21PM +0300, Mika Westerberg wrote:
> The iTCO_wdt driver only needs ICH_RES_IO_SMI I/O resource when either
> turn_SMI_watchdog_clear_off module parameter is set to match ->iTCO_versi=
on
> (or higher), and when legacy iTCO_vendorsupport is set. Modify the driver
> so that ICH_RES_IO_SMI is optional if the two conditions are not met.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to for-current, thanks!


--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nXj0ACgkQFA3kzBSg
KbYofQ/+KqP/3Y4TZm59APCIx4WgGTFDTGRETE/siFiYssjb44yYTOQ4AR+mxb7w
bv6USsR7aMWc/Mhsuged5Bh6YCcwdQ+35R2dVKLZ8zQro219ppGnd9BtT0/weXYH
20dD9AV5dFGsLypbEYM+cujUJrp9F97lav0Vc8Junpf75ynkL7FPS1bYYcr11xnI
D3rYvsp7TghVeFZ10LnudmlBM7bAxxTX9gi6lDGDzTCvxPhX7kJoK/DvjXfWZN0k
8jiABFtiOLTjfh9gtsjF6BWCQppI8piwSkGRSO0jXEhQDqy1lWj3HXslNr8qP436
oZoL7eu0GWXbGqrry3Wo6U9rdbhf68iZOU16XFJB5oF1xTR7HDuT3+AprYZCewVo
h5IHg5CFb9LFlwVIDXi1LiUZ06O7ORoMH4ZNLSeXQ3eosMdl16WRU/8GFWIPZkhV
1YhtD/7pL/uAZ9jbL1vb+0uv9BPz/OUlI4Qqt+JkN6dgONnc3cM2GHKjVHMCz6rM
Kq8JAMQnRoaCJy2nTUUxwtU71pKfIkBdMVqJSY2o7saLR6w3jxBeLHOO9UpTkvR1
YnakISwbiFkxt1Jk3TKr7KJcaouHg6dnDmgTuyrWdQ/AD7nCNpS/mK5KaDSIulVS
UO18qQT3TYEykTjtggI/UPFtExhPXWxSbcu6b0N7oRnePMxG0pk=
=4+yL
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
