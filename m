Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D87623AB1A
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 19:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHCQ7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 12:59:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbgHCQ7u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 12:59:50 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13FE022B40;
        Mon,  3 Aug 2020 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596473988;
        bh=WgAmvHyRfi+SNjh/qSo5b6wyztUNClX+X5paujO9fls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rH9yN7Pxv1BfLEBgBRbtZ4ikEzKTWdU/9rjTFFX/9NxRjzcbuo2VLPHTlV1rbQbs5
         nkfRw+JYZbC4/XHKczbsABrAwPeLT0SwPtR3uhlCNSodD8EyVdmeeOBmHZzK0aPowA
         nMZ7HTVXE2gHynz5+s3Es9Jbvyb9/ARcG0ofAZfA=
Date:   Mon, 3 Aug 2020 18:59:47 +0200
From:   <wsa@kernel.org>
To:     <Codrin.Ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus recovery
Message-ID: <20200803165947.GC1094@kunai>
Mail-Followup-To: <wsa@kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-5-codrin.ciubotariu@microchip.com>
 <20200802170820.GC10193@kunai>
 <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Nice diffstat! I will try using this new functionality with another
> > controller next week.
> >=20
>=20
> Thanks, this would be great! I tested this on a sam9x60, with the HW=20
> feature for the 9 pulses disabled, with a picky audio codec as I2C device.
> Please let me know of the result.

I'll surely let you know.


--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8oQoMACgkQFA3kzBSg
KbaWcQ/+JgYzzs/nM0z1tm5h0VqjfWlc+TctXaM2Acg01EvoDv0u7IAgKTAxBOQd
gd7JUUJAi2CqFn1mUsggVrBWK4JrDmqnXsFVtqYdXvNcaDYVoxSq2KwESm/6v7O7
veeOkRzspMrpJ/0Ytb99kIrYP4iYUviWPKCmDYhcPl18dQrIYbXnWPtw0+9PeKDn
o/uVWIG3EJr5WRIvLhFdC/gmXRdypLW3WS0sxp7SUnu8WNgFxLy0V7Gh8ZM4Kr9F
B2ggatztdudwdMkQ5wg+NxPFt5w9EhvM7d+qbIpo1cboDgKfPMXe7hIr0NijfN8C
UmuHh5viuWCZ8nHmx2SrDrYO4k92N0ReJX/a0Wu6+6PC1+Vy/tzAO76gux89F2jq
tUY86wt7AqO5Oivm7v2E7NdhbcE+yPTctlIujD9t8iPx31KkSXToUVPwp9V5gToO
fx5diAdPMojYbii0MFWXxjnMDz6ClcLS8fXqTfVnbhta0Hgnaaa/tFX5wMi3+uk2
+rxcjDaCGyPAYk4CN2+IWpXdJOXy7rI6VRZPDoEXvJwUfRQp2bbHj5fGnhU0OS8Q
UFRcV7lmSKx9z8Cg2HmGixKA9iYgWZU/oGbsBfrQ2Jb6aTiY9FQW5YPiFf3BhwLf
zx0Hn8pjmjm+5Jr6yoC4hYSXbMOTnKrKS8GqS/xFGn19t9G6SG4=
=SxVt
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
