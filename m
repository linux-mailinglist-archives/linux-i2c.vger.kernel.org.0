Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B384A02FD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345188AbiA1ViW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351565AbiA1Vhl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 16:37:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7207AC061714;
        Fri, 28 Jan 2022 13:37:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C07FAB826FE;
        Fri, 28 Jan 2022 21:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C791BC340E7;
        Fri, 28 Jan 2022 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643405853;
        bh=R+Q6eh/Eo5YhcURqSA1GIHIoTBiBBkzzXbRVGgnkcds=;
        h=Date:From:To:Cc:Subject:From;
        b=Ko9eqru+xslWUM6l4TVKkq0H8vKPm1/TJYqFh34hvlXP1CJkLLGJ2DqiiPTbdZbhR
         LvNfWwqcCtWyqQr4ep1RYxE0mTR8qI2Re99D9w3D5RWIIjLSkvX3RHgHCOtZomYUaM
         thkNkCCWZ4+I806oxLwXIAL+c7OqF8TeGU3DuQRBJQ76W2gYID/Fl0Fkgvtj1F89k0
         Z/WlXGtIfrEsXnWEUZcvlqVvLVU0ES3la/JzxAs9uYjurqvSvPoyxDs6LhPT4JCATv
         xhpjWF6tD3jRWMgv0vjTPN3nPpEhon7P0YskGsMaAlK9AX7M1Gx4sgtJY5u15AjuP4
         GF2XK7CNw4vxw==
Date:   Fri, 28 Jan 2022 22:37:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PULL REQUEST] immutable branch "i2c-alert-for-acpi-20220128"
Message-ID: <YfRiGR3AT8tzyweG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0CTTa1tr2HhYkIae"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0CTTa1tr2HhYkIae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rafael,

here is an immutable branch containing the patches to support SMBus
Alert with ACPI. Maybe you need it.

Thanks,

   Wolfram


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/alert-for-acpi

for you to fetch changes up to a263a84088f689bf0c1552a510b25d0bcc45fcae:

  i2c: smbus: Use device_*() functions instead of of_*() (2022-01-28 21:56:34 +0100)

----------------------------------------------------------------
Akhil R (3):
      device property: Add fwnode_irq_get_byname
      docs: firmware-guide: ACPI: Add named interrupt doc
      i2c: smbus: Use device_*() functions instead of of_*()


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (3):
      (Rev.) i2c: smbus: Use device_*() functions instead of of_*()
      (Rev.) docs: firmware-guide: ACPI: Add named interrupt doc
      (Rev.) device property: Add fwnode_irq_get_byname

 Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
 drivers/base/property.c                           | 29 +++++++++++++++++
 drivers/i2c/i2c-core-base.c                       |  2 +-
 drivers/i2c/i2c-core-smbus.c                      | 11 ++++---
 drivers/i2c/i2c-smbus.c                           |  5 +--
 include/linux/i2c-smbus.h                         |  6 ++--
 include/linux/property.h                          |  1 +
 7 files changed, 82 insertions(+), 11 deletions(-)

--0CTTa1tr2HhYkIae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0YhUACgkQFA3kzBSg
KbYw1RAAjUV+Pj4oKA2AvFU7FdD5ZjkB9+GB5uQmdHkTRGF30g43QyXyIHfmlMFS
4KQrKya4W6JDnOIPUn70n+kMKLIX5+Sgt7D10Y2BHWTL/1czVtR0NvWCvbjH82RT
+pcJZBW031gUuBBo77QU0/Qr9lJM0rLHS1qElWPKDUN93wSbZ282OCbh+DptxpGT
L9sDi2n6tScs42P/WG/nMYw2vy5+Tf8w2q3kW1f2J8yuk33n/o5ZRnLgwtCgLHFi
z9E29uJdIhGU5ONKgd6/3jAMa6zmzwPvEMLL0ZZ9IuDvE0oL2KmLzC6hcpXVc3lL
k1E4eSCMKUS4dgolQfc7VAkFnvp+M+2dX7LeO9zUii5o+R96HT/aykaOgn+sEvo6
HSLaAueEunY62khzup5uVwD0GQjv0tSmQhhEAbVPV/GBpl/n7ehtqYlmjnzY8LNM
p/6XzLPof1uQs8C3f8o5nnGuEl9PU/IrcGAgCnbm0Y5eWw2fqMlQPgqvr3nLdj2R
mhuu6NDorYezgUGMqqkCbqVsqRvMjWZkhT+wOkKh/LY1048X02L9LzhtVAm/zSc/
ZqFqnQbwFbke2TgbqozLZaIk20jLPKWwxDGMIeKx6/8Vcht+z31UnwoR3uD0cW5m
VQ+N1CJRKdgfqgFyGGDnBFKJLXTbovbhrRA75JSJiQ0Es6mlwcY=
=3pxa
-----END PGP SIGNATURE-----

--0CTTa1tr2HhYkIae--
