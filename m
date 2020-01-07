Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26E9132F86
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 20:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgAGTb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 14:31:27 -0500
Received: from sauhun.de ([88.99.104.3]:54282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728307AbgAGTb1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 14:31:27 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id F092A2C05BA;
        Tue,  7 Jan 2020 20:31:25 +0100 (CET)
Date:   Tue, 7 Jan 2020 20:31:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Korsgaard <peter@korsgaard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] i2c: ocores: convert to use i2c_new_client_device()
Message-ID: <20200107193125.GA10117@ninjato>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
 <20200107174748.9616-5-wsa+renesas@sang-engineering.com>
 <87muazjewd.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <87muazjewd.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

a happy new year to you!

>  > Move away from the deprecated API and return the shiny new ERRPTR where
>  > useful.
>=20
>  > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> I didn't follow the discussion, but I don't see any returns anywhere?

Yeah, an ERRPTR is not "useful" here. However, the old API is going to
be removed, so your driver is converted, too.

Happy hacking,

   Wolfram


--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4U3IkACgkQFA3kzBSg
KbZOQw/+KNbdLqPPRk+Teo1q6rmLAezU9VUKrLEycDckg/mvdKEvf7B+sV35KcVW
ACqGYuYq9hzoMV4qi2JT/aX6Q6hVNxKQGBsVRTbtbjzqU3BeDC4P8CpR9trRB4N7
EE5zBQEuIOdQH+F5O0kYC82xIHyQqxBnPPmX9nulKPeckdM/2RXSFs8cZb7gd2CZ
vzTJCdVEQ3bTS1Vp7ugNuEQMtScscbiAfP4szmb4rzMPfEm9LccPHgIMEmTxY2Sb
a8D9c/7xsaA1BQqwN568sfn8zFYYMS0hHFF4kIXkK/4bfYldBb47eNqwoaQjrs63
7VRN9e357C1EA+ylZrJNKp2n1mrr68a5KvJuMLkWAFHNxO01nkib6KbdW9RHgVBa
VuSNRDUgMmdREglrEu68xnFviKZkgPjw4+v0QdBdAkfSkPrF+ZfsxQ/IzxxpQCj4
ipoLlt7ve2KJh61jMSp2xYriawMLq1QjRMdxUl9BAIAYICfvhRFaL+GEMo+WCK/r
UHuSA5ACecxQPdh+C6adTX3tBSJvkwDReWJVWtyoNURZ+ETxKyIIXaki2YPt0kFj
52faoD+ZBRrV43TGtIKldwJg/Ci5KzeoP+2rnuJZeaL0uvPGsqwVXV96Tb9iPcAv
xMyUzzT9cRkO9v4Xd3Pfnx8njSA5OBQR9r/LQem6GDOHoVSe2t8=
=6dcu
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
