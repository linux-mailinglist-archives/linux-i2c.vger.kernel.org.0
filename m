Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62301A9979
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895962AbgDOJvG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 05:51:06 -0400
Received: from sauhun.de ([88.99.104.3]:50644 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895955AbgDOJvE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 05:51:04 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id EAF5A2C1F58;
        Wed, 15 Apr 2020 11:51:01 +0200 (CEST)
Date:   Wed, 15 Apr 2020 11:51:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans De Goede <hdegoede@redhat.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 6/7] PM: sleep: core: Rename DPM_FLAG_LEAVE_SUSPENDED
Message-ID: <20200415095101.GF1141@ninjato>
References: <1888197.j9z7NJ8yPn@kreacher>
 <11863688.3RhLv4JJn2@kreacher>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline
In-Reply-To: <11863688.3RhLv4JJn2@kreacher>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:57:49PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Rename DPM_FLAG_LEAVE_SUSPENDED to DPM_FLAG_MAY_SKIP_RESUME which
> matches its purpose more closely.
>=20
> No functional impact.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # for I2C


--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W2QUACgkQFA3kzBSg
KbYLYA//dnjtvhFJWFAsMwE9BkNYmyzOvIsFhJy350O1uwA1j96UNz+9wzWPjHFa
rUERnUkp16CWA7Na2XRCXTyyk22YwRxqg7pUixYLbCEItXS23jsPl/llXrmK2fjA
Nmm6XQZfR8jtJYFJKTemE90E0TNgSKMJ6G/Rlinxxlv6bQFSS5fSeScf/gW+R4q5
wfP+kWWiBxu0sA06TzeHln0CJIk3X+yd7HdkrwrdzUU7np6Zs1nxJ+Fp2BTZ+4VL
RDOMKkKAcrAxNIW1W7qhWVKx3AOy1BJZXyCvIFTYjmbiSCeGH2E5PbyIreiyhVhp
E37t3zlYXu2oCkirgF8qYurtUvZnvji7sYJzqDkrY0i5YUOXgLQG/J31kyZ88Fui
72rWWIPnD6QUZtjo+KvyUtfbk9NhbWTo+/vKVqDo9lJPgwtpMmsmnhKyVPCgOlH8
IDKZa8bDsYn6yjjzCFh1lW0Pa+H2a++mu56K7nKHXw0XlApez2jYw7i4stFPUi4T
HVoTmKVSIJj95JUvkBiliO9b8WOf0xuPgjTvAgkb5Z3vBy3rhVOFu/d3TECeXr1E
oXuBs5c7T2TCh8fNn5HYkFwtY69V3/MjG+tiHAl1a02lxxJ6cZUm8/1X0i0LaiW5
4HX5suaNxl96rgvGaAZF51jYiZITdUGuWirGA3rpBQRTrnujlJI=
=03Jn
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
