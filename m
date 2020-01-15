Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009BE13CDE5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 21:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbgAOUOf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 15:14:35 -0500
Received: from sauhun.de ([88.99.104.3]:41324 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729061AbgAOUOf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 15:14:35 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id D3AB02C39C2;
        Wed, 15 Jan 2020 21:14:32 +0100 (CET)
Date:   Wed, 15 Jan 2020 21:14:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2 2/3] i2c: xiic: defer the probe if clock is not found
Message-ID: <20200115201432.GH23789@ninjato>
References: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
 <87adb91cc1a459dc6d523ed2c28123330ab6e49d.1578569758.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cfJ13FhsvNR/yOpm"
Content-Disposition: inline
In-Reply-To: <87adb91cc1a459dc6d523ed2c28123330ab6e49d.1578569758.git.shubhrajyoti.datta@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 05:07:59PM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>
>=20
> It's not always the case that clock is already available when i2c
> driver get probed at the first time, e.g. the clock is provided by
> clock wizard which may be probed after i2c driver. So let's defer
> the probe when devm_clk_get() call fails and give it chance to
> try later.
>=20
> Signed-off-by: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--cfJ13FhsvNR/yOpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fcqgACgkQFA3kzBSg
KbYixA//VC8thayXidbWu2rIU9BLn/RlqjeSt6ldi1yzk1CgNuLY11ynCI0pLD4B
+Zm5pKjuScmhXzUg5w83bVhJtGRZzky7uA0nVkfSEFfDbe/9KAi6JW7jT9tODfNW
jdy3WT7ZcPH+l41Vw+x2amgxmXOxgLSBwZmMG/bJmgzumuhgzm3SocrnMmQ8NdRt
ApHw2o0o4pVHZQvjslqRo3RfwcqZSDQHezJ6EqRJKjh1wwcB8Zgbep6YiorLWPSD
E0ZegTe18VtuPkiWEZdhVXkaeo6+K/+BAepBA/nOIueEYM+WpUOW2vC8q6OI7xEM
Tdf259cHHe+1jI5KFvi5cp5SCDVfB4vzF7dNZOanFEg4NvU59Vt3evOxuhTur1m6
GCKRNZlSFhpEqrdWboDMOtfCXHFy9KY63cST0sRCqTbh1iB36Tgb9nvuPAd6Fgx6
BUgnHrFY5My3C0C/0nOPcxOY36BT4/ge6e37igq8X61r3xTglW+c3PSoRMZimRW/
U8T742lbxvUl8wLN2067eOSke+wj0znbeJlPca/afGY4/eNmIO0qp4KdFWKViGr4
UBQYhLAiZQz3JesQrhYGAcsKzYxEv0bpoleJp/nzbimC/v/8ZYa8O0yC2wJmDGJE
Y9IGWETEJ0GaVtedKJlRovJXomUYnVyUfjKNQA9d+XxAhWix6SU=
=q8TF
-----END PGP SIGNATURE-----

--cfJ13FhsvNR/yOpm--
