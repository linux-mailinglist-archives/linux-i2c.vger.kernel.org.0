Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 844DBE3B64
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504146AbfJXSzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:55:43 -0400
Received: from sauhun.de ([88.99.104.3]:44016 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504147AbfJXSzn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:55:43 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id 223FF2C011D;
        Thu, 24 Oct 2019 20:55:41 +0200 (CEST)
Date:   Thu, 24 Oct 2019 20:55:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michael Cheng <ccheng@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Icarus Chau <icarus.chau@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v2 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20191024185540.GF1870@kunai>
References: <1569825869-30640-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Content-Disposition: inline
In-Reply-To: <1569825869-30640-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2019 at 12:14:29PM +0530, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
>=20
> Enable handling of i2c repeated start. The current code
> handles a multi msg i2c transfer as separate i2c bus
> transactions. This change will now handle this case
> using the i2c repeated start protocol. The number of msgs
> in a transfer is limited to two, and must be a write
> followed by a read.
>=20
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>

Patch looks good but doesn't apply for me on top of v5.4-rc4? What was
your base?

Also, I will apply it to for-next (v5.5). If you want it for v5.4, then
please add a Fixes tag.


--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x86sACgkQFA3kzBSg
KbbPMA/8CufaNQxLVkDpAOG3fBebE+n7XkatUJvoVOe+joL7ZdVIR+d1CqXEDZf3
zXuUk/02btaiw9vRkmpUwHOjOT08mF9OWWO6XRxvEdvEStfOsejFmcvUtdnuMMXA
9nX2xp2/KjB83qdFcne9KePbHvOCNLMLCl6GQbc3Ko/jQMTHQqRijkwxTBUhsILn
Njq6taaiiedlHX6/o4vEl1gOPtmxqhXghU2TyOzmIG9fyjssatn+41ri1K0QseG+
1VkMixa074wbtqDp44AypbpuenSYxR4AKfGgQPnPx7b3RpJxhH8bXwEVLxGdSJJh
Sfw+MrGfVouOKQZIGd6IKraa+Zh8AleMvT/l/qf2vwQKfKqMEQ8ehmtVPJwPf/XM
7XMPQeYFu9Leo/3a/KsLUTC31isIeosP/hB+ZOZSKGTWnyw3XD6DYNtJwFSbpQh5
shjRb0GHCwaBRsKJnuX9lsY2tfHdbN4qzGMh2Imctfk3Shy37eeovhsY6QhhiiNl
TR4TnOHx2DwRwgzm921MjLGomJ9w/t4KlczdyJAV+GMC9k4dcShxzdu1/4s8TpHM
fx9/MIqdbc5ZN/xroaO8xyJeHPhNJy80UJ4gXriji8/IsV1dhtwwHvIrRS6QqSTj
DxcC4PpAU+JAu4Z+ny9Q6TVdcY46NyHdgW7hyl+Q+llMHx25gO0=
=rr6Y
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--
