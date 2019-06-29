Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290275AA66
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfF2L3Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:29:25 -0400
Received: from sauhun.de ([88.99.104.3]:32778 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2L3Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 07:29:25 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id 531C32C047A;
        Sat, 29 Jun 2019 13:29:22 +0200 (CEST)
Date:   Sat, 29 Jun 2019 13:29:22 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mika.westerberg@linux.intel.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v7 0/6] I2C IRQ Probe Improvements
Message-ID: <20190629112921.GE1685@kunai>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline
In-Reply-To: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 04:02:56PM +0100, Charles Keepax wrote:
> This series attempts to align as much IRQ handling into the
> probe path as possible. Note that I don't have a great setup
> for testing these patches so they are mostly just build tested
> and need careful review and testing before any of them are
> merged.
>=20
> The series brings the ACPI path inline with the way the device
> tree path handles the IRQ entirely at probe time. However,
> it still leaves any IRQ specified through the board_info as
> being handled at device time. In that case we need to cache
> something from the board_info until probe time, which leaves
> any alternative solution with something basically the same as
> the current handling although perhaps caching more stuff.

Ehrm, I somehow lost the cover-letter from v8, so I am replying here.
Sorry for the noise.

So, since all patches have the review from Mika and Andy (thanks!), I
applied v8 now to for-next. I had a glimpse, too, and thought it was
ready to go. But I didn't really review myself, I trust you guys. Thank
you, Charles, for your efforts working on this one!


--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XS40ACgkQFA3kzBSg
KbaMYA/+PjsJLq8bemY+KXXj66YNG2qLcNss3uXlAq0Czj2/IE1VSN0S/N86Zccn
+QtDfmfIdpCqqAzs0N0D6N7pr4olIcrUlbz/FFLg4v0Dtn8ybYTT9QPDK6zAOrSq
cTUBJjNVcMhENVby9rXISu/uwr09Cq1C7chdZlYeq/etaDFgJEclr/U4aZrnjTJ1
JMzD6/CWn0d2OkUKCjdFvGtDDbrxRNnCOXMuEM3fkqyR3Usg28kMqr9NhMxJe3jg
0CO5DgpeVTwAaGeyrKsGhNxcbpgw0u4Dr4i9tkV6F3hea/1fKshy/DuMZ5o46q19
Qn1F4L7XlsE5ATLHpw6QXgZ/ZY8CRW3XJ3r5p0E5M9PVlb2hyKb8qygK8/yaOuMt
g2c96OSh2fQpz7X4FdLTjRfwX9Qz4q2uAOUIckq1TzyTkqqs83MliX6r5P6l6WfT
+rAqqJcBaIgZE9K91EFyhq0wTasyfSH0Cl11gMOE0DFUG8Wxp0o8uTpUwA1HIAT6
W9T24bkyyqcK4fPclCwT0NhTAqaHOStu3Zi5F7M4htiXvjQwE+qEW5WZ5MW09PPf
dfPvqm9g6xfyPkdQcaZEL7KMaBvGHjlDbt5+5wcqerdKqJsOELkD/Huq4R09ym7w
0qZxWB2aLRaDn1M88KJ5komdYV6NC13QPTh1t8OonctwizFOAuY=
=dIfh
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
