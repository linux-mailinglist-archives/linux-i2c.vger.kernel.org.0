Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BCB3909A4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhEYT2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:28:52 -0400
Received: from www.zeus03.de ([194.117.254.33]:43444 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231843AbhEYT2v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HvLGgx0eQepKO1HoTBijMMAUh98E
        WwZW/ZZrK15+eqI=; b=B0k0uW4F1haP2/9rbHKmjg8smqGnObfuI76iijsc8ooO
        gXqrBcAMaeAsS0+SV+Z0BV29QhFXIaNmx5pK1pP5TCIGWdZAIc1RcUM70hM9EfLm
        VQuzF7KbkxM5/MYmCDS+bFZSjyltrBbNtl4yRxf6vTFyXDWzkbnyJohrxsW7UpM=
Received: (qmail 1362255 invoked from network); 25 May 2021 21:27:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2021 21:27:20 +0200
X-UD-Smtp-Session: l3s3148p1@KnS+gyzDdtsgAwDPXxHuAKg5HweM3jRU
Date:   Tue, 25 May 2021 21:27:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: I2C_HISI should depend on ACPI
Message-ID: <YK1Pl/eaJFhZ2f7Q@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <22d124a7f12f2c8b280a9cc7f3b766351c9a8d64.1620119167.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9D1xoyWcCrPVSRBC"
Content-Disposition: inline
In-Reply-To: <22d124a7f12f2c8b280a9cc7f3b766351c9a8d64.1620119167.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9D1xoyWcCrPVSRBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 11:06:32AM +0200, Geert Uytterhoeven wrote:
> The HiSilicon Kunpeng I2C controller driver relies on ACPI to probe for
> its presence.  Hence add a dependency on ACPI, to prevent asking the
> user about this driver when configuring a kernel without ACPI firmware
> support.
>=20
> Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-current, thanks!


--9D1xoyWcCrPVSRBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtT5cACgkQFA3kzBSg
KbY1fhAApAakjaGkBT2VA5O/soAPau6NM5YwHl6x0TjAp5nQX8xoP/IdIDLU3Xqo
5AI+t/RyfdGj+3Bn6y04IrZYkXQmGOMf8q0laIYAP1R/DTcfO+7p9eBkmwoxYr6R
9udNEx3E14b9NOc8UL7gu0eVMJER9ZcrllHiCHmTL1TA2PE5cFqSOpLJKGdfVIPz
DAnkMNlApxsb07da1NkBObAMXm8wX+zD8PajloCxA07LpKNk6Iz/iDuJcU38/NYY
FKl0buQgJvOI5rHimXnvF4yWk9pGFKBiqJ+ZG4w5Rcl0hHXC4r1P73PnEkZHJ2rY
HHHu658/UtDUwEWY692sZYxKUv5sbjCQg3/PMYJrjieovm1tWJimHMN3zrZWiNCJ
/lmWm6p/yBhIVQ+nfBf3Z/DreHXonBnMbVQ+itLHzhBb/otbQc7sHTQDGM1MtUzf
ko0sFM37cW5JKhdieU+Qh1K8dtYMHF45x/EXS2WrAhECQ9PT89p0RxLuYTa3CLPp
HMcbs4NKnBugALar37hOAkuSL7JvPudhPAQHwUvyWVUo04J3wA6MgHSVDKwaizqV
rTzWGXXFL5GsgItCvKvPHJC0R6xpaghjR6lfQb2A9M3jgGgZySLrx98pqX24GhIN
Wya/60U+TBqeoYmpDA7Z+P7x3WIHzl8UeSIIYR+v7uUi6ZKqYSs=
=V9Ve
-----END PGP SIGNATURE-----

--9D1xoyWcCrPVSRBC--
