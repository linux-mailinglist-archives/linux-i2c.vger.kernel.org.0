Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F174477EBD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbhLPV12 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:27:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46364 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbhLPV11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:27:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D712618B3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11140C36AE7;
        Thu, 16 Dec 2021 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639690046;
        bh=roRCn3qaIgAz+qMRsuMNOiqFNGEvXnVYLSokoxQ0AAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jJhz9YYqm0zDPPFME9I93sEDkAD8vpQv7PoWy1g+t09T1vQ8NOoqjvDqqFtadwD5A
         WyRAckaINmtpFtDm1Ul7vR+nZAwDSHAFUPSkBu3AIHLtY4jiQNoG3HHL+Q1W7Dbc4m
         rwfw9QFCzm1/UOvynaCebw+f2P9pUHesiF6vmGtbo7vX6DjGQNVBzbuPLsPTW3wgWL
         FYA731+jBimLdWQ5abV8DgFhzW5PGCttyCmjSUroYljuLgiQS2wNY6JPDhypVWz0px
         LEtCmTdPP0YaFGrKmD/vY9xWPlFbAAsMi60fVztNe87sgswVANfhlmEI7BvZRXWk6E
         wyTDIwr8VnlJQ==
Date:   Thu, 16 Dec 2021 22:27:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] i2c: aspeed: Remove unused includes
Message-ID: <YbuvOyAfPyhHqBnJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
References: <20211207141722.440213-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X+pgzo/Zrp64cXoc"
Content-Disposition: inline
In-Reply-To: <20211207141722.440213-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X+pgzo/Zrp64cXoc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 03:17:22PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
> headers are used in the driver, so they can be removed.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--X+pgzo/Zrp64cXoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rzsACgkQFA3kzBSg
KbYwJg//ZjFswbFex8btrmcpOWfau6EiGUnfnrvp4edbVB8Gk2HmWuaNmzRqao+3
B5XvKJVjHek/xmw0MNpXP4PyznPSNY+rvo8uVp0JTjw8fhkfZiOs+bLlZoIuPvZh
lEKNFiyeVAsMDoEyrIDXBjQMz4xbqufnA//3V97OI47wmM2b+ewjlc+7TEFybtze
Y5IQH+gfeGuVOMLH5Akv9Ith1U8/O9WUwskrmMQO+jJFrsgYOYTypikp1J87PIGE
cmuq/T/3EvF1JmnknqbuXUxeTnkW/2f7zyIu+50kxpEiyqE532mp2DhVMMnkcwY8
xt7HNt8pUdq5nliJknwRbhyamjb2X7a+wJkuX/seHWYcdbyr2mbbUWGrhIiXezqJ
YViVbahg70r5OLhWqnBs274hCVmwWbeoWJAYkyqkFoZlb4EHUmrOmC0eEfU9p0Ev
EsCdaZ5Uug04AQqmRUEdaK1urGlmb3zeKFpTIlquRgzfg/rd/Sk5sRSEGAf3dG9d
MOpo6h9fVA8wm7meL0e7i5gIR3UD6iyXNKQ3+EGO2MsemCx6ir+EUcDgoqHfXxDT
CGODIPmpZFEnf0IuMjZFJT+EwQIS7IVFIuEx/cNj+gH4ek/StWyr47CAedJy9KJS
g9iIxQxy3qz2xtC9o+8ouS8n7XdWLauiFD4v8qfMyVLVcafcwb8=
=Vzk6
-----END PGP SIGNATURE-----

--X+pgzo/Zrp64cXoc--
