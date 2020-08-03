Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A2923AAE0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 18:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgHCQtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 12:49:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbgHCQtM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 12:49:12 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76CAE20722;
        Mon,  3 Aug 2020 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596473351;
        bh=0lPd/wMgJt8dlLNjtEupEOMeRb/Ykn4e6kjgWE3bqVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHWYdOZ+rIhOdBKGiQCmQD6wt8cSUDFD7Srlqrnu4nn2hJZl/jwfa2DJIhB/JJi4V
         xkpVflhkidBKwUDt8qdgtLOcuKjzk3IkEdBzEEfvEiLDlnzIXYshWNop80Wtnv4Gbn
         eZNfDfSv41PTtXMrPxdDv0wGGp1m9oh1eZE06usU=
Date:   Mon, 3 Aug 2020 18:49:02 +0200
From:   <wsa@kernel.org>
To:     <Codrin.Ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Re: [RFC PATCH 2/4] i2c: core: add generic I2C GPIO recovery
Message-ID: <20200803164902.GA1094@kunai>
Mail-Followup-To: <wsa@kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-3-codrin.ciubotariu@microchip.com>
 <20200802165446.GA10193@kunai>
 <084249c3-dd2b-a975-6c8d-8045def0293e@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <084249c3-dd2b-a975-6c8d-8045def0293e@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I agree will all your suggestions, except with the removal of if=20
> (bri->recover_bus) . If you agree with this, I can send the next version=
=20
> and remove the RFC.

Yes, sure. That was a brown paper bag thingie from my side. Please go
ahead!


--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8oP/oACgkQFA3kzBSg
KbaMoRAAirR9/u6wXhH119+pMhLm663NExLZqbWyyo7u+F5wP0EYAhwtRQxNAzFn
Bwe7tWlj2fzvXBG9FkBfsqRPrvsrnztPiPamjyJePizZQOeXP9l9s/DmvkgL3WjO
kc4yUF0VTFrR+6uWq//C0p1gPoR6RIg6Vckum4LV38cQAmHPGUHaNuA+paOSjfYZ
3sP3lC1b9Rqv+ZUjGmnGGV1q49RVeaO86hMsMYE9N0RvCLjFkx1iKhNsvS3R0Kcn
HvmF5wVwZEav0VH8mTIAcCG/b2OKgRu95HfUB5m4rZw0D/esXv2OX2kDMpV31owz
NMXLaQMbhXPIH87IXFIIQghOW+nM81hjFP9F+of/r6G00BHA3+n6xghRrtGXzod0
ocWOlDxJtf517Mn2jvKBrX/IdMClQ0HbMfIVe84UbERnR/VxIvYdlLjNTAuY7ZmC
2plknsxMxZBTRkpyb4qB85RU5319qW2+lvxHgrf3VuiGykKwHZvaEon/TIXNj04B
I7VpQ6Y8M8aZRjAFVRSs07dZm7RofzAsteHbQgDPMpow03gCoOEAwIEhHZagB6hy
py3rzrXfeRIf5GvQgPCeEuUZFyqL7AxzZ+opbPtAaqLIWzWXDWyZef5kGVeouiyf
l03Mz/Vu9afBCf5OfL704poIZQbXrp5ztfmHKWIZEQKZ97yJmxA=
=9wBv
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
