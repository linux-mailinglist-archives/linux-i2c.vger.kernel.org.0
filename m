Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CB523C7C0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgHEI2n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:28:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgHEI2l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:28:41 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC32722B40;
        Wed,  5 Aug 2020 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596616120;
        bh=ujBWMZVAJmdqs5ewPgjkGJqFBmb33QfCj/WK2zJWHkU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EUCOQmnqJcxoIgcz0/Roq6uWxx4u4h+gCFsDCPWUHgqZL92X/FOHNL2cm03u8Nx73
         V4vJrC+7EGnFLG4mDMgH5/ed+yiwWqO0S74qr0fmHFWji8ksx9IeqVH9B2P0mmx2Km
         eYuTLwBLlblloe9arSD6+LO5rqsrQYlXinl14nIA=
Date:   Wed, 5 Aug 2020 10:28:34 +0200
From:   <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 1/4] dt-binding: i2c: add generic properties for GPIO bus
 recovery
Message-ID: <20200805082834.GA1229@kunai>
Mail-Followup-To: <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
 <20200804095926.205643-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20200804095926.205643-2-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 12:59:23PM +0300, Codrin Ciubotariu wrote:
> The I2C GPIO bus recovery properties consist of two GPIOS and one extra
> pinctrl state ("gpio" or "recovery"). "recovery" pinctrl state is
> considered deprecated and "gpio" should be used instead.
> Not all are mandatory for recovery.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Kept the alphabetical sorting, added a space before '(', took the
liberty to add Rob's review from last version (no significant change
IMO) and applied to for-next, thanks!


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qba0ACgkQFA3kzBSg
KbYFzRAAoERSE5FsXZu9pjxLQo28Wa1tiIn+ioFpBYLXTdY+7JOuBa4aIYeUCPZk
mDCip6vA8xSoS4Gg1agLmKnZ5JxqsJNjEhLFpkq5ATFq9i0i3G2MX/uQAa/miYkf
vamRcT539NoT3eq/4w8lUgdVhpDf1epcABWAHYONFfAFp9RAZhDIuosp09teSS62
xlagvz/F0DrMrEAfqSRSyMbo7kmLZoGG6vR5Z3lssL5ZkoD53wi35XsAmmlnHFUz
BtngTo3aswx5sBdAtz5X/4nUSOHvmcbI1W36XNYOSnQsICcepaRoiqF3HW/iAASR
1y3+sMBqHqhh7IcZCG/XGnXCMQMNW1/yStB9D16rW6w/0HtE18I/RhERMY/C2m4X
DuMnOO0bzBky5y8YAUXwCsHu+dTUSkNAJHtAVXgKLueKZqt1kL5FOHiRre5CVbPn
sF/1LiVqFpsYLjeL814xChwsG4vNWgK/2LgPo+Wvb8q2yAEvZwvf43UlXkQqeqFf
8EmaQaODv0C0/yJJnsXuZbKskSNADY9PNuF3jjOtNbxw+61a4p69z3atCGgm4WPE
i3kM9/kqmtQIHCftWaOvBUtxgXugEyjFeBNaClueE8uBaV7Luqw9fuER731CqOyT
bjBUw/YIVIBBHjBJixh+o9vkY9KHMVRCABxVSpdSNSUxoQYHhl0=
=SBdL
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
