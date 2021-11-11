Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A281244DC34
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 20:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbhKKTjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 14:39:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:45564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233406AbhKKTjc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 14:39:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66F5961264;
        Thu, 11 Nov 2021 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636659403;
        bh=RJPmO7S1qEyWbFcN4D+TGaOi6KTGZHLjpY2mxbQiiS0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=h977kP+un846TuTEP3MZTu/0Z9Vt/HOwSls67XeK1T7U/dlD9H9hw0aFlVCWgDtrB
         7M1QU4sJ46qBWIalAVshARbJQ7/I2FWkal88vLegHXIapw6eo4f8xq8adS7+JLEiOY
         J4ez0cmQOBx27Oj4SsVSJPnCO5tk+FP0mwkaCKq0cGc5vSMkzsfVzDzJ480+WGNy9u
         jDlUxNePU+UnDvqZpK2U4jcxRvqSg/+NFN8PVEcLLqb5dtRHMesaQt9R/382rO9B8q
         3/OIkLhySYCqTAfBw7pj1/hvSv5hw3bDokk3OTp7SFAY0PRpKHDLz3LqkvdSLWfrbG
         5qAeoHOhFb81g==
Date:   Thu, 11 Nov 2021 20:36:36 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: Fixes link to I2C specification
Message-ID: <YY1wxH7cR7Ycgveh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104060018.35570-1-deep@fastmail.in>
 <YYWqGyETMgKcIkul@kunai>
 <20211111184307.6ld75ektg6avb3wb@pop-os.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8zJiR3NH9MUTK2Mp"
Content-Disposition: inline
In-Reply-To: <20211111184307.6ld75ektg6avb3wb@pop-os.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8zJiR3NH9MUTK2Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I'd think we should have two links. One to the latest official specs,
> > even though it is behind a login wall. And one to the latest free
> > version. For that, I think the archieve.org address which Wikipedia uses
> > is more stable thant the pololu address from above:
> >=20
> > https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/=
user-guide/UM10204.pdf
> >=20
> > What do you think?
> >=20
> Yes, I agree. Should I update the patch and re-send it?

Yes, please.


--8zJiR3NH9MUTK2Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGNcMAACgkQFA3kzBSg
KbaFGA//Vex3j/rnMJnpcOC6fSPCQBb8H4sHJhyF9c8giF9U4smMiXHCMlOTDjdK
BVoxbKERVp9pILzSZ6Bn07EUxmYr1sCW/TGvV6hFiFjUrh7w3eKa6TwThYM2+VHm
JPIIy2M+M9UUPNuAWHwX2E+PtYD5q78XhFfRTyl9m5BV1jXT1S3aRm2h4LCZ8VTh
x7lajrf7HJR2vjFH4x5EVt2TyjfJmWAJS1SpIXR8KyWmpPkCHaAY1APmqGAGui3X
4MN5Zv6n0rVSNCPv7TZ8opjaEOBRcJAmzANiKzQ01hzWNp+8bDjsRYUcJNFbWfBV
P84frq2qYKu2y+SevpUAauw4eWcMi16+NORyqkipoLpTrEOK7DLQ109z+WIpr2Qw
ejzCiVAg0Qju032ifnNFfHYKogQr90hN42lUKwIwFyXH88gYN8ANjHV2mPNbCLmP
V0bbl89yJSGpcRXXXGpDir2KVu5lV1UFTdYb03L/R7Q0y6UGy0l3D9P9Qw/otT36
jdfeSkXaf0+H8dixKxW9ZNIsh60jQySCn/cdTdZ5aKjVdX7hR/XAemI+M7QntDNF
Qtf80Z7goVqzmjC7sCumbZXtU8Hy+Vs7qBZf6dyuUJVjpJWBiGzBqMTD/Lns4lE8
5i7CE3OviMt8As6Jsw/4S/9yJG/DqGkOa1dzvLCVeQDQ1ECTXmg=
=awWH
-----END PGP SIGNATURE-----

--8zJiR3NH9MUTK2Mp--
