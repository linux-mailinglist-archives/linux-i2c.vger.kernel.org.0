Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794B430722F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhA1JAM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:00:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:49334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhA1JAL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:00:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EDCB64D9A;
        Thu, 28 Jan 2021 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611824456;
        bh=0L3aHlbV9lGw/pwOLtUtCbTsuwnYQQ6OL1z4Tf1UkSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kB1wCwOZLoPTen+92GJbcpkCz6Jti3sicvzQdRYpS5aL1gBN/XQAT6L7Dks/fNDUb
         bbu8z/tbap7g7kAEy0m3cs+ttQaA+QgEETmvsPluXeW3EluF5clx7KNgoeiCrSp+nP
         deWUfFXHvod5gsc7FMrd5SogzahQmdzIL8fRJqoOWkgzfcMlzPE64uBeWfmfNjJNSu
         0MWRUIps9xo+VY70lp1I1RBTp56RF9VM8rvogU1e2mWIasogQwJqgIBOH2wf/dlxXT
         bYtE9RKwJL4DcrkQvgIgVRVOZH9512UCEHxoUy4OwkB19nScMbJeuswWn9Aa/mTz0S
         Lu1uXCa3/ZXTw==
Date:   Thu, 28 Jan 2021 10:00:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20210128090053.GE963@ninjato>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
 <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
 <CAJZ5v0hUELtKc9CK=z47XQvSAAx=wTWvoVwP-PaMqugaXaCgZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hUELtKc9CK=z47XQvSAAx=wTWvoVwP-PaMqugaXaCgZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > There's a real danger of a memory leak, as the function name sounds very
> > similar to dev_name() or acpi_dev_name() and those don't allocate
> > memory. I'm not sure what a better name would be, but given that this
> > function is only used in patch 6/7 and not in the I2C subsystem itself,
> > I wonder if we should inline this kasprintf() call in the caller and
> > drop this patch.
>=20
> IMO if this is a one-off usage, it's better to open-code it.

Sounds reasonable to me, too.


--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASfUUACgkQFA3kzBSg
KbY9PRAAjVQXWyde1sa4VM3SZZiem5T6eY2LSnbYh9L717+Npfw3qTdRvsWN0klU
1+ZO5n3IkqvbY3/N70ONHrw1kvhC+u+8CvPMN+sBZqrCLApC0E1CEnL1WzqgjIRf
7qpzTOv20TCb5REdvBj2FBPoCd3jdBWBfYUvR3SmbQBhSYo4m8EutoYiBw35cjUy
P6lV52Z6bUb9KW+iUUNnqBNqGPyWN6sELoh9t4H8BvTfavaXUZjotFt00PdJV0Ya
KBLfanATBa9iwH7BZr2jUNpgDZHMQHnHY/bmFvPFc7exd+trCSjJiFg/SxOWh9HV
uUSg25rj699WMJq67QQleo1RVnTkM5uG3vtUa3cQssxp3fCsnvCNvY7xB24APHJx
foJqDMCICM4YnUIkAOsIenwzxL3kptt5mD95qzRKUI8+ENY07QjQOEnp3BhLcJIQ
vE0CVEGZ/nlhxciaXt+5KkOgDNkQ/zbazYSKhRJ0i7NtAGuL1ageey/x9b32+xi5
zQcEChNhfWOVPdaW95jZRaM/hAHyRB/em35So7tmw3AllrUIWscXk22xS+o2N0Ur
kTEK5JEUeXz3/oNcYIQSc+mClHINxq8k65Fy34bWBRv5ZFXOvpMMIR6Ayzzvj9Xd
p8ZNIoPeRclQ6557C0nGGgiTo1+o7/YPQMo/J4utGGRoB9NhK18=
=9VIP
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
