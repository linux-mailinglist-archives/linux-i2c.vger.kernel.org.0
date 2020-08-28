Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF1D2554C2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 09:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgH1HCu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 03:02:50 -0400
Received: from sauhun.de ([88.99.104.3]:51400 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgH1HCu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 03:02:50 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        by pokefinder.org (Postfix) with ESMTPSA id 563732C0209;
        Fri, 28 Aug 2020 09:02:47 +0200 (CEST)
Date:   Fri, 28 Aug 2020 09:02:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     ext-jaakko.laine@vaisala.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] i2c: xiic: Change code alignment to 1 space only
Message-ID: <20200828070239.GA1343@ninjato>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
 <20200827144848.12107-2-ext-jaakko.laine@vaisala.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20200827144848.12107-2-ext-jaakko.laine@vaisala.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 05:48:46PM +0300, ext-jaakko.laine@vaisala.com wrot=
e:
> From: Jaakko Laine <ext-jaakko.laine@vaisala.com>
>=20
> Alignment removed and replaced with 1 space only to
> reduce need for future alignment changes affecting multiple
> lines, when new variables are added.
>=20
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IrAsACgkQFA3kzBSg
KbZ31w/9GGW5T+ipqtTssU/wz2WbsMpOLLlBkok43rMdkfASLZDvo0TvY1WPqP+C
CnIqsn/xB2Se8fhA8C0DssbIF45oiUVhlAF5vkq8iqATrBIzbearUsKa5Sa2uhgE
kUKqH2Wp8AE4/AcOS+8RopL5b8tpuSQW+Ps8bSl1GfDNIPFEXJLlCjJw4Q5KnDM3
F3R2mgTYUzeS9lcaiiH+Ocm5+qYddzS9Qv2z3NjH0zSRQJDex926MxAxDh/aA6fE
BJPT9TtD/4EGbvJmR0fIDcDo3iomlPvKlA8JkCNMBvcpF8YIRZacSCHNPn9LNU6T
UkohYNdMlWw9M8aOqMfuQLYKYUXeLz5DsZoh7nCRZoOZ0AH3maBLXFB5oQJYZTd+
rjkhn1WPYfFo1h+z7cp7GIjjv8MvDhWcbuHLpDBQyKIp7xoE6zmmzSuKTn9iOt3R
MTuzeu7cRe8LwhP6BXNeX22rcLdUBLE5rACU/Iud9hACrJQmVhaFmfCGKIgKF9Qn
f2lOZot0eUDB5tjbH+u1xSuBXsifiKm/7HNF3pVry19UkxjxdRxdh92lgOoG82OZ
GZUR3uZ5q1BxcjNjZAG8X8nictW2qLhm2aSQOiVR57oUwzk2K8Lk9g3oebJgXuBF
e4V3t70VaqFbCipM9loqnmO3HQ43CKrIqZnKoErcEvcZzbx1QOU=
=BCrd
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
