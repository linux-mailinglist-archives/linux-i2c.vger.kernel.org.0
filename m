Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB8F17F39A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 10:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgCJJag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 05:30:36 -0400
Received: from sauhun.de ([88.99.104.3]:46486 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJJag (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 05:30:36 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 4DC132C1EB6;
        Tue, 10 Mar 2020 10:30:33 +0100 (CET)
Date:   Tue, 10 Mar 2020 10:30:32 +0100
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
Subject: Re: [PATCH v2 1/3] watchdog: iTCO_wdt: Export vendorsupport
Message-ID: <20200310093032.GC1987@ninjato>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200226132122.62805-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <20200226132122.62805-2-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 04:21:20PM +0300, Mika Westerberg wrote:
> In preparation for making ->smi_res optional the iTCO_wdt driver needs
> to know whether vendorsupport is being set to non-zero. For this reason
> export the variable.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Sorry, I missed rc5 but it will be in rc6.

Applied to for-current, thanks!


--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nXjgACgkQFA3kzBSg
KbYiEw/+PGGui8RQv9eIOA32r5X8+rxZpSUc1xxh2VBgtbARvZGtl/1KIPOBAZw3
kGwWQ6Uv9hEPcIQxidiFU4qHVwpYFd5ti5Wk9LWqWsxGvdlQ53G7l2clAmi8HFqG
zilX0o3rqPAsSNA7LsmczUP+cx3CH24zWXuv3ikqfvluYI9EU4sGIyRu7BhOGfxs
8Pw89RA3m65PNW/NljEFmjA9P5tsft+UYmfvqkw/nmdMkU2WmfXfCBdNcbXtzdTg
uH9zdMS5DgzOHt31g1J3KKjYrQ1HetHDUF2pxVMhg1TumWBMuGx3zeg2sMC8FwT2
VWcw3CejWOi6P+DiE3JiB6LGdgehGotsiU5Uwghw27A5p+kBOHVQ10W1f/JCL1WH
P9ur1tN4NPxh//KWu/KuDSoXLev7GMWp4b64VGocyoCjPQArk1IYNc9OawHrsjAJ
hBF/bYRzeErK91RahA6yeTXpb+P01X/cvcyUUjdENQZZsIRJ+4BaUxo781nw9hO5
B+e/hSyRE1e4lw1xhShuKvtbv6UGizWOrQ9y11YleW74+naIhiSjYAnyVWTSa6+z
dM4sqyxNDDROC83Wz6v29pDqwJjzu30jVXy91G9MSFDIcWfar76TwNpkt7VKxds8
uWFEMuOQYKEId3srlJ71ZTbuB25JTpCsu/F6dI7R1yKU7aVBBMs=
=OD0s
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
