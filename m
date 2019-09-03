Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44031A71F4
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 19:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbfICRui (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 13:50:38 -0400
Received: from sauhun.de ([88.99.104.3]:56536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbfICRui (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 13:50:38 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 9A3702C4F33;
        Tue,  3 Sep 2019 19:50:36 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:50:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: i801: Use iTCO version 6 in Cannon Lake PCH
 and beyond
Message-ID: <20190903175036.GD2171@ninjato>
References: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
 <20190831142402.49736-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline
In-Reply-To: <20190831142402.49736-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2019 at 05:24:02PM +0300, Mika Westerberg wrote:
> Intel Cannon Lake PCH moved the NO_REBOOT bit to reside as part of the
> TCO registers instead so update the i2c-i801 driver so that for Cannon
> Lake and beyond register platform device for iTCO using version 6. The
> affected PCHs are Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and
> Ice Lake.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1up+wACgkQFA3kzBSg
KbaHXw//YNwUSIxnFNZGqgkpGaj/Jw2jt5eX49fje+jqLqOTGRdJ/Xfq15BZX5kD
KyI9mBTn6AQUU5ajtKKpgwq7CmeouTrV7wLCqS2gBmUgMHwqPGmrk/P8RfzNfU9J
XWFMjMMfxNFjy6JkAZravkfymQ7Ul8UqdBpCUEOPwhjbFcxVxC2cvs/jMlGZ2C/P
tF9cl4HYOZr+P5Wp5d3D45VzMcKuhDAx19ud1BOccStFAfyXUMwrqHkQJF+g7GmY
zbUXYPJbF6ifLl6o0WL8nvW9TLhNIqgrSTqtQ9J16dzB3RESclKr7njZmU1boZyn
WUKoCsmln38uPLos4vQfmXSsDMNFhEx/iHVi2E0QBFvJNrmP1qksWpFw3/ZImBRO
MDp66gW5ZRQPAzzQidb+DCDzwauptxq1EyF4a6SI/WIa/McanWfSh2EqwRUS3GJV
qN3b9NI+C2cV+6Tgisyycfm3hPFRmVh2DjlXxPg68tY38E9kAREg++qlaU9s8ZW/
NEEYp0yve5ns7tlQ2dTZw47zWpxjhzTYF0qnVlbUmOGbKfdw4znddrhRuD4xM198
3CYcO0uztw9lLzl+QH6lZWQKgJPyljfiyQ0HP5RTFQy+2IV15iH7A0OPSIUeYaZa
QGcpYBM3+0Bbs1zG7No/OkRSoJOF+PgBrzhB2XZ0eGzY9HMVu50=
=JoWH
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
