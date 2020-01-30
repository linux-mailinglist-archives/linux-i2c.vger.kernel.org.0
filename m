Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2252514D772
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgA3IYK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:24:10 -0500
Received: from sauhun.de ([88.99.104.3]:46522 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgA3IYK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:24:10 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 775112C0697;
        Thu, 30 Jan 2020 09:24:08 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:24:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 2/3] i2c: cadence: Fix wording in i2c-cadence driver
Message-ID: <20200130082408.GF2208@ninjato>
References: <1578548273-23206-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline
In-Reply-To: <1578548273-23206-1-git-send-email-shubhrajyoti.datta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 11:07:53AM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Michal Simek <michal.simek@xilinx.com>
>=20
> Fix wording based on checkpatch.pl
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!

BTW there is no patch 3/3, neither in patchwork nor in my inbox.


--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4ykqcACgkQFA3kzBSg
KbZPlg//f50RGCN9hDFLHrP+VnRQpsNVju1Z/u8tJ2vyt3RjGpGpEJUeuYEXKCBP
PDpqzFJXPfsUBYCPwPB6ilMqEEphkY+QKXUEs87NpiPSjNR7SBft59MyHi4KIakn
GZjpDaZATwkh4WrbD4qWP2P5HghY6ceFWktYymNqYPeNSgAR3auywNA8FiuSex+k
jONE+34Byq4rfL3wlTmqkKWETVB/9zbEZ8eZ/XMJvogdB5Kpj89G/aQHmm5yg/+p
4dcYKjCOrcDeOt/8MuPbiAuFXmB8TrctpcS+o9udo11pt/uodJwtjJo76E/+AnM+
swaV4ebmD10yW9ZzYIk1bOtnmUVBhD5IYR5/nj97TlGMdiYzt8J5UjFh4ALTYuJN
8WFeb+m8XVoFyIbdMbn2LAnixsg9zGdybu7WeR3Hg145dO6RFAoDiCAs/tvymtRY
D8gUn9ygNEksHe35LNOlzk4Heb5jQct8GLu3Tvcn5IF/IhVhVF1RaF6NXgk9DF6x
PKFvjpscGeecbupJafqzhAZeO0ap3DAfP6nXMHFUrHcdMj0CONykkTJhShKVxYbA
uhHo7Yg41vrDlh2sZBW2uLXfzVjU7/rbUBZv5JPd4yPYmAhU2QF98xYmncJFWtnC
SFRuOqxSLZOGJ/lr2qSt5D7QgmX/F+qaf9Z62XNoL8mggRt5nNM=
=IYE3
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
