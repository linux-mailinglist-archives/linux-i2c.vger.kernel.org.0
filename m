Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C363EF44A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhHQU64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:58:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhHQU64 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:58:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 497DB61008;
        Tue, 17 Aug 2021 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629233903;
        bh=MULqZqcbkPPEtj1jxiY9GUQcWI+Q7NvPV6i8gA9vkMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KqsoF1A96McXQaUBBSDoE58EYMTnnwSO80gtLPeFDipsXz6SsmYBqidgo5ixQ7Qyy
         +pDd4vYp1u+D6I5eS6jseqdQIOWHE6Y7svPFGLgNgbUbPa0UVnH+T2p9h1Xc1gpl0s
         SUtj8kV2vHRQ28y82jUdVjwQBTYdVv1KP7bYApAnJDWCAzUz6pDIrusPIeTNkRGMoA
         gOqdaGnDceqfvPgbWVrX27SurYdXOQAfj+D+cCXHbpDJH3ls8/1DBp5sAWfuRURENX
         wWZKHIX60vLTyjfuWOYRAu6qa7pizZnvNHO9F/Q9X5Fm3klg3B3mEy8tx2lfdQ7TbH
         JLM5C25o3Zi3A==
Date:   Tue, 17 Aug 2021 22:58:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YRwi62E4xYcMyyFi@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
        devicetree@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yoYTdBSMoMh3ORUv"
Content-Disposition: inline
In-Reply-To: <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yoYTdBSMoMh3ORUv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Couldn't you use the "new" probe_new() callback instead which will drop
> > the i2c_device_id? Kieran was interested in such conversions IIRC.
>=20
> It's a bit unrelated to this patch, but I can add another patch to the
> series.
>=20
> While I have your attention, there's a question for you in the cover
> letter :-) Could you please have a look ?

? This was the answer to that question. Unless I misunderstood.



--yoYTdBSMoMh3ORUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcIusACgkQFA3kzBSg
KbZ9bQ/8CTFmW2r/gvHCgQHXKxWam/yxiTxYWOOxpV7x+TIYRv+a7APvCequ7nvH
HunE1bWdmx4VFloBIX5Dc79nUDpInBM/+sRdkUc6JUt1vz8jvQzbzf/ms5x4VZWB
dnTd01p3CRzImMp7vvjNHQq434piYyonjwDNRo3OlIGXbjGBoCbmX/O6PxKiR7X0
yQ9fzGEyJeXr5u0CJt46sTRR9PeSEzH67D/Gxd9SXpT/kSL3ZTalPIyeZVecnvpt
AUBPsGU8JwAuxjN13fSOrdeEdFmc5v9yM+Ia34ZbyP3u7uZZ49/jib7pe1lVkjTQ
1B7AJmRBuEGGMRoGh589CZnbJeq/IUc6lK6lgdsAnnTki1VLEU4ttiqDSIaVVtvJ
t8iznRZ9nELeztWrQ7RTu2rOFY6G0fF/emnqoqJgZqNaIxOk+BNsihC9RXNVRF8Y
ioKVbPA7UeYqr1Zam5pJ/rLdjSiacxX4JOKeB0SOzBi9AG/QSKb/+7P5VF2TB5LR
3yfqIrDMYDrfmAwLfahQ+Ok0LitC2eEpE32A4cTpscd4TrZWDrcoeD2axI6/ofen
WqBZ4T7aPqIEirlQEw2qxmjq7K24ALSvS0Jpv6WCtkNlOQWQtyfv2Az/feZnp1rB
pirrNXtTYB1FwVRpkn3HPE+VF0TyIpLHuq++E/dbG/v/P53WWQg=
=eY49
-----END PGP SIGNATURE-----

--yoYTdBSMoMh3ORUv--
