Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A030A1F84F7
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 21:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgFMTmY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 15:42:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:55736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbgFMTmX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jun 2020 15:42:23 -0400
Received: from localhost (p5486c936.dip0.t-ipconnect.de [84.134.201.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66A4D20789;
        Sat, 13 Jun 2020 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592077342;
        bh=Y0nUZKpO6R9m396gocd+Bl0IwU3ugpNYW0MEt0NBJgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K0bANh5nYHZOHOO5jAZFdiGlRz8ygTWSjZqDr9vQXXfqE1OAyqcPOwJjTgiMRi1ZX
         M2CAX92kQzXnL/tTIz5j6DFsLTqckxz9pLAf2Lagaxu/JbZcByYN23H6ozJPvbR4cd
         4zBwGykUyXqzELpMAPC+Km3b7VD7pzVS6DmyCfUk=
Date:   Sat, 13 Jun 2020 21:42:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 5/5] i2c: xiic: Only ever transfer single message
Message-ID: <20200613194220.GB6289@kunai>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-5-marex@denx.de>
 <20200613193333.GA6289@kunai>
 <b79cdce5-9eff-411b-e2aa-30365a6bbc3d@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <b79cdce5-9eff-411b-e2aa-30365a6bbc3d@denx.de>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> Transferring multiple messages via XIIC suffers from strange interacti=
on
> >> between the interrupt status/enable register flags. These flags are be=
ing
> >> reused in the hardware to indicate different things for read and write
> >> transfer, and doing multiple transactions becomes horribly complex. Ju=
st
> >> send a single transaction and reload the controller with another messa=
ge
> >> once the transaction is done in the interrupt handler thread.
> >=20
> > Do we still get a repeated start between messages of a transfer? Or will
> > it be a STOP/START combination?
>=20
> Repeated start.

Good. That was my high level question. I'll leave the rest of the review
then for Michal.


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7lLBwACgkQFA3kzBSg
KbbuyA//Vm1vw4CrIxpgZ1y/ZwkkYGQa367go3qRY06uadE3MigcwIADs0EDL7RA
kAzhtf5SbvraSDiqlkDGaPrvy7pO8K/lEAZN+lBqjQy8iqV3tDW+7ANeW9fsSu3P
fJ5Dcluuwx+TBYd5rdkb+8rYPRvekVNDY3nC6iSbNRe43yvh1K2Yfbhwq7/KRhSO
RMt38zW0ny0g0RSZMMqMvwbSHPwckPHK9RukmkqwOLuLivg69Ft1tFO9LcX4qSgQ
bnk7qoXZdRaXvjx5TSdLyhphOHIeAYDwtwGTrUyj2+A6++U5yPVlTMwcETSdQ7u8
wWM0Wrmlh7qyvBXNlWR96MUL+noh+Z2t01NOs9ErArnTXeP2ubbSA3ebldnsXeUL
IIJhmFeiP1a+R7g8ujSa+/MZP9MjfFWzB4nBpsCtTvHNCeqMiTJgi0qzqIMemUgP
bbjlU+5+EOYInTRLCTNvOfMUGPZsKrlDSgRdYIQCDpJXjdzwOC2JJcg3vcyqjt34
wmd+LB1vxHA6yI5aT6u73B5PoS6rQWc+6LfUxpI2xaTXxt/m3SChwhIiB83bYnkO
m8KmVAX6YpsGNTOzRi3DN37EM6PCbTLZWkt+hnG0w4LxjtPQpLG68Vi1f/whNbQf
3bV4w2C7x34PRoFk6T3KQFxEnNu6BB4stp88wO92JrFfRCnI2GU=
=sWZI
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
