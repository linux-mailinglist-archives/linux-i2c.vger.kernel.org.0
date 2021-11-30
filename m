Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D787462F99
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 10:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhK3Jb3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbhK3Jb2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 04:31:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFFBC061574;
        Tue, 30 Nov 2021 01:28:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7B09B817F2;
        Tue, 30 Nov 2021 09:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D2BC53FC1;
        Tue, 30 Nov 2021 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638264487;
        bh=TgTB+HvwgE1K6uTIqH5Mm8brLfCpRDbgZBQvLIL6PNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MabxmVv7aCXsEKQFvEeVFu97DbMxV/cvLNON0JOyB10fQ2cSbY1H5b97NOouaVYrJ
         5e7mDIWn/sh7BskppfifvCT0mM2B/hRW8cbCoyfM2dW0VyQQdO4ZfUsfAdxLRfkloQ
         YMGnelqkifHMhiKAmDw807yLfEAy5lxOpEdyuUUmmy/YSEjI2NH7MQEZaGeDTE8Rvs
         P7hjLSfnYdbz+Bhwr0OpsR1BzOu5QR1h8ogwlXzW7kVugNvFxwbvqwkAI6GlQsmXbw
         87w+uQTOBEng266LTV5B+4et2tzlsN4w03iuGWe+pZVUgV/JLpzp24IhoMLoBfF2C9
         V8BsBD+3Pf4xQ==
Date:   Tue, 30 Nov 2021 10:28:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 4/4] i2c: stm32f7: use proper DMAENGINE API for
 termination
Message-ID: <YaXupH+h2PU+YUlA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-5-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9BKR1twofcV34c05"
Content-Disposition: inline
In-Reply-To: <1632151292-18503-5-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9BKR1twofcV34c05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:32PM +0200, Alain Volmat wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async.  Here, we use dmaengine_terminate_sync in
> i2c_xfer and i2c_smbus_xfer handlers and rely on
> dmaengine_terminate_async within interrupt handlers
> (transmission error cases).
> dmaengine_synchronize is added within i2c_xfer and i2c_smbus_xfer handler
> to finalize terminate started in interrupt handlers.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--9BKR1twofcV34c05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7qQACgkQFA3kzBSg
Kba9bxAAnolHWrz96xTiK4AAyN69kypXX4qth+xsvFARDQpkOIv02CFxNE877QgF
8RsfYdvGMPb7fvB5gBebN8o15gETECfW6YCNRI++V6GtO2XqbjcDFv5dfP/X7Gmf
WTM2uh3efg2yMq9C6gVDPWStys1ZumDxZadMPSN1I78N0On3ySkLepBZWDHgi2jh
LA5PnsyCCosTF9a7zWTet+sWzsxFxcnwb83QAnv8B27BXUeH+9Z0KWaS7HYV8kP/
vyPZ5KhkqDwLn/xELfJEjvPcVnOX3BWUEo7QoI1RkrRFhjdf8cooRvgqKfnJ9de+
+xwpNgeEW948YKQcapM4m6p+/CsUWwBW5eXmzh5rkSF5ZfFk/skj2DZR77Xo288w
F0/Ar1BqbVDai6jSuKgigSoPhLajIY8W0tw2U6EzB3E/gINtUZ/GwMtI7S8Iucbc
VE4Bmirx16B5cr9ki9lhFJa1Pg5qUYNBS/tIlqHcGiXFUf+iE/Qq0KfPjNQZ59xP
nN1oTeWHGHdHq/Jx4vs9PA/opRKt1eSgvHs5vV/bYPcWxjb5WhibzDx96KPGCOwo
dduUZxp5lcbBgTMPc8ihXV/YjVR2olHOIM5KwKa9EGE6aiNnyAdH7ZcQ6ZIhEFuu
LVvmvvCjmSr3Xhz8zTRddi+Z6MtqiVnSSWUFEI4oBm/p1+mjMbQ=
=ZOXV
-----END PGP SIGNATURE-----

--9BKR1twofcV34c05--
