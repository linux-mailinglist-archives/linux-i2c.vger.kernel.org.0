Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BC6460230
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 23:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243915AbhK0Wy2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 17:54:28 -0500
Received: from sauhun.de ([88.99.104.3]:52196 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231691AbhK0Ww1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Nov 2021 17:52:27 -0500
Received: from localhost (p54b33988.dip0.t-ipconnect.de [84.179.57.136])
        by pokefinder.org (Postfix) with ESMTPSA id 186602C009F;
        Sat, 27 Nov 2021 23:49:10 +0100 (CET)
Date:   Sat, 27 Nov 2021 23:49:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 03/15] i2c: acpi: Add i2c_acpi_new_device_by_fwnode()
 function
Message-ID: <YaK14JHgF5KS1Yzg@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B+c7GcSbsVwZbrXV"
Content-Disposition: inline
In-Reply-To: <20211125165412.535063-4-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--B+c7GcSbsVwZbrXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 05:54:00PM +0100, Hans de Goede wrote:
> Change i2c_acpi_new_device() into i2c_acpi_new_device_by_fwnode() and
> add a static inline wrapper providing the old i2c_acpi_new_device()
> behavior.
>=20
> This is necessary because in some cases we may only have access
> to the fwnode / acpi_device and not to the matching physical-node
> struct device *.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--B+c7GcSbsVwZbrXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGitdsACgkQFA3kzBSg
Kba4UA//dAQJdZByu+PraO/AJeiXb5P0B1XSecqdaGFPXLJAPqBEz9WQYMShmcd5
X7jXbMjN6Bms26Qp8SVs4RDhXwl9BGrzZ8M3Ui1LLHbMYR5CEf+VH774fEPQIu73
yyzCY9amwbe53ZaYgCOA1Y7vVf7dJF4pYfZOwDGPIu/QPRsHbsh6z6Ax6rX40AtP
q7vm6/RMusfbFbtYEUUoxgmESapheayMxO50PS2q8jKVTXovP+4PVqXAYMU2HXFA
pdykZTpG/GOuw1hrCciWWpJlabmIaIDnVYJZ/nUBvPkw/MQ2rDk3qJNwl7G7ndkh
hTwdpPNVslh7DqXjBs3bGFrfFwk6QxLUOIfbJ0/vbw7z5aNs0v1vFhtFtcgX47ix
FxGzyLVjojMiD9/GA4zSDnYy/9t1s5W3IWjrz8pTf5hunFz0nJlA1Mjes8FQUXHQ
yhytbzG7ZagSgDkys/Vo0K8GUptohlVh+eabGCSQ4y0bw4bWRhXT8M2W8Ecjssxp
CpDP1y+Q1zM46X0c9ZZcmpp9NPcirg9S8qZkAiDfG/i4nsQihmko9SrhjlLnR8i/
i+WfFKuti/Nw+dp/YmpRjunOWNU5duvWXHXW6XO8KBY7ynPgxnA3dp32k1LfcS4p
Zm67/bmDd9fZC/V0RsB2QPDz2KstjoH/OIAaVJic4QZdeRe0rLg=
=1EJS
-----END PGP SIGNATURE-----

--B+c7GcSbsVwZbrXV--
