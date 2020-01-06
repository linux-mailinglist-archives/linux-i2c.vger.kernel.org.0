Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5109A1313BE
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgAFOfl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:35:41 -0500
Received: from sauhun.de ([88.99.104.3]:39328 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgAFOfl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:35:41 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 576212C0686;
        Mon,  6 Jan 2020 15:35:39 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:35:39 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Eugen.Hristev@microchip.com, Ludovic.Desroches@microchip.com,
        peda@axentia.se, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: at91: cosmetic formatting of
 compatible list
Message-ID: <20200106143538.GG1290@ninjato>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
 <20191218213716.GA30887@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Content-Disposition: inline
In-Reply-To: <20191218213716.GA30887@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 03:37:16PM -0600, Rob Herring wrote:
> On Mon, 9 Dec 2019 10:19:59 +0000, <Eugen.Hristev@microchip.com> wrote:
> >=20
> > From: Eugen Hristev <eugen.hristev@microchip.com>
> >=20
> > Format the list of compatibles with one compatible per line.
> >=20
> > Suggested-by: Peter Rosin <peda@axentia.se>
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> > Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Applied to for-next, thanks!


--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TRboACgkQFA3kzBSg
KbbclRAAm2+DMARlhfiRHkwpy6DngebAhoTyl6NBSUEMGtj+HDYSWSH9qlskh54q
B8xb/31ICwgLWNN8oszpO2ctFyL+yYWfseLcSBw4FmiMXJ8YYe2j96VHHvyNsx2t
We+lehY+p1K5e3o5PJhoNTrAuv4ZYMd4qAioLr39nqUcxQ5RcTLALvbKkbu6Dsf5
Bw3I/SiuVkFOFEKHpBt2eqPDyuva5ntJ7TSSQaEftGUOyFWED0mh207w0wp9hfOf
+YmAa714rEKAcXqhzXw8qANmRB3MsGwaWlap9bC8Zj3gmwfszrhkD7MIkatkv2rJ
0VlTdk2YAQ+FJqBJGLF5tl9cL40/Sarb0W0Dt/mPRjgwRXKnAUoVEuyC4AD2NouP
4F8TQi+wPxNi/YZ04NuOdOx0aqSIomHjAJMIXMt8RaoYwQ2m8F8II/kbjqQ7LVO0
dWOC/1XRRGboxZLUjz5LQ2w6psvYf8JoOeBT/J3UqTt6sZTI3MpDYsUpvb+Fqiu3
3FRmzRYOEH4obZvDoO2BBqs1RE5hcw582KLO9J+Zqy3LZRJ3oNeCoNR7T3csRywm
q8frEUJyV0Mu5vel2teDPDrPLfgqfi45rL1ogJv/s2NnxXd74jzDl3aF9k29jcF/
Tg0fZCfRkyWA8XLVuAqSfppcEKjF5WcsG480+ubEqSqD15e+cAo=
=mR/+
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
