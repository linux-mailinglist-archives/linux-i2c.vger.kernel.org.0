Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4A91F0A9E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jun 2020 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgFGJV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Jun 2020 05:21:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:58654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbgFGJVz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Jun 2020 05:21:55 -0400
Received: from localhost (p5486cb80.dip0.t-ipconnect.de [84.134.203.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D054020663;
        Sun,  7 Jun 2020 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591521715;
        bh=LHu8Je2iFMQ+RisxyR/UI9uRpVWn2Y0Lc1Cp+/YeenY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GGo/ngLpWBFwbICNIUGJIa9T9e6YpPanaIp6t1ghNKY9xEiGJjDP/1LASjkMoMGd9
         bSjsLLAq7wP/10lNqfL+BEhTTPfUiMJdqZH7u1E3eurA/lGQsJpESm5h51GyaS8D5S
         f6gjORQLPBoluzkPHTFxO/bH3rqsbzSxSifcaqmg=
Date:   Sun, 7 Jun 2020 11:21:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] i2c: npcm7xx: Remove unnecessary parentheses
Message-ID: <20200607092150.GA981@ninjato>
References: <20200604153957.GA14839@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20200604153957.GA14839@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 10:39:57AM -0500, Gustavo A. R. Silva wrote:
> Remove unnecessary parentheses around _bus_.
>=20
> This issue was found with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to for-next, thanks!


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7csaoACgkQFA3kzBSg
KbZ34w/9F7glIsi9VLOyKc2V+vuK9byLCo9tK4y7lCQzzwialHHVNqoEMYuLMYCC
CWwJ0JDjG88ys9gCOmCbSaHOPiY52dbFH1QlU3DMQQOEoKHcCrKkoy15gQMbMwXn
R2bEw0D5U65GYc9QtGokQtFUSqfNGQqxY7oEEN1B2A0WtuPeH2PqCSvN7O6YVIte
2q+0RFiyuqFGU/LlPhjkE5F26/T9SvrFKLgRwUzBPTXs/lZM/7pv1F6Ia+okjApR
3WaPR/+IboLAxZ85tbcKzPX4BOr0KhmNS6PSSeeHo+n9fMB4j+nD7/9UQ0YGvHm+
jXfHIfdcZDT3kM1CZaK5G1fJjEUyVe1ixg2uJrWsB4w6nltFazOtyAkp8QbuI9XB
eZEwdYDV+9FHJhhEoDrUMcr3gAc15Wox29t1oqfQfih8zW0xxCevOZfFoPrJE+12
+ZRFrIfBjQzl6gI22wftNYQYZhbQsfiKNqIkDUVx5D1OkXFbO5nnhDVcsEo+NLeT
S2YFu16SLTD/Acjmi0en+NvbQXim++4vr0NmxrmE7pB3LYgUeP0wpRH/ANZHQiV+
YFFPmNCdUnVB64Q1W4TR5ufniXwDmmbGHFHcUeBEP9uhVh7z7ecyWQi4WdpWRyam
oPbxZU2p430+gflPMq5cayRgtHV7n5ey4MMx8uoruQzcUvsyBRI=
=n8mE
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
