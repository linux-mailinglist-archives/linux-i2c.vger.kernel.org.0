Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C35023AB16
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 18:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgHCQ7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 12:59:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgHCQ7R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 12:59:17 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78B0622B40;
        Mon,  3 Aug 2020 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596473955;
        bh=DqVTfmEqV/Cd46vTFRwbyJjRVKLkVy4VzmMDGHxdDeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zDNggJHg+wW8HizMOFqed5jrz1O7yhNyHY66jfbF9gNNWuCWCccP0bQ7aQf5QBrcu
         Jjfz5XlzXoL0va1gSo7csbJ4QcLDkQmSBicLlb/dw5sDtKa+xk6RNSklE2k9m1k4rT
         zRy7bO1p/sStqAO69VEyefPafi1GDw2c58jJN2I0=
Date:   Mon, 3 Aug 2020 18:59:14 +0200
From:   <wsa@kernel.org>
To:     <Codrin.Ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 3/4] i2c: core: treat EPROBE_DEFER when acquiring
 SCL/SDA GPIOs
Message-ID: <20200803165914.GB1094@kunai>
Mail-Followup-To: <wsa@kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-4-codrin.ciubotariu@microchip.com>
 <20200802170500.GB10193@kunai>
 <15a449fa-d649-846a-e6f2-1540f9581846@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <15a449fa-d649-846a-e6f2-1540f9581846@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This is correct but I think the code flow is/was confusing. Can you drop
> > this 'return' and use 'else if' for the next code block? I think this is
> > more readable.
>=20
> Ok, it makes sense. Should I make a separate patch for this only?

I am fine if this is included in this change.

> One more question, should we keep:
> if (!bri->set_sda && !bri->get_sda) {
> 	err_str =3D "either get_sda() or set_sda() needed";
> 	goto err;
> }
> ?
> Without {get/set}_sda we won't be able to generate stop commands and=20
> possibly check if the bus is free, but we can still generate the SCL=20
> clock pulses.

My gut feeling says we need to keep it. I can't recall the reason now
and want to send out this answer ASAP. Anyhow, this definately would be
a seperate patch. If you really want to, send a patch, and then I have
to think why we still need it ;)

> Ok. Perhaps I should also move the debug print with the registered=20
> adapter after calling i2c_init_recovery().

Yes, makes sense.

> Do you want me to integrate this patch in the previous one?

Nope, please keep it seperate.


--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8oQmIACgkQFA3kzBSg
KbZAwBAAppfK0ya+k9k/yXUrX5Y6knQZb/OpTwELmfjUaWHzhPRzFDfJrjuDb1QM
/ZL+DKK8/NsKLsWv1RSjd5BydPiToyQG+vcKGSBzcxLrXogzuqR4SP81uuwxUBzb
uKyCjQoJg+wYR4wbjAInYtSaygqXfyjkhtJOjtBnn9eXxu0Z/3HojJhTfpREwoss
oIO86EySSKGJ1U5u7uSJD0ghSVjzGgWjilAmXV+JwcKHkl/dRl88ztiri+qzVScw
apychYdxxB2CjTrgS8oV1A1rv3fiPhBOvLs2a6yQ57K5MzY6wdzcb6phrwSA9iFm
aNsmVLOtRiVVCe832EgYmyVMb2PPuuWcwo88jNJ1bawIlLHctqdjngeg/nG/oiRv
bhoy5sy5/Lg5nce7bpWUGovkwr/vCyhe3B6gGX4VmUgHu7ElKhy4Tc0azte5lD3H
nR49oIvZUertN6pX8kx2dZTq6h/Lsc4aFxVoc3tWDFQVaG82L5HohwDW69c8n8QO
1Bwi70uJGjaeGQ2+RVqz8M37Qz3Rk7sfs3N+/a8pxHOY9MrlOANNE3jIN/MSbdc9
n2WUkMP4EPDjBAHyzcmNj7Xx93rt/2cQvfANgnO5N+Z+m7ut0zZnxlVtg3YkhtpH
y1VJXkPg7BCvFCn6xKDa9Dpb7fOGgUVUGdX4yqDXCRbuW5m5Sl0=
=42Sy
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
