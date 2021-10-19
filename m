Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0C94336E8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 15:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhJSNYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 09:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235622AbhJSNX6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 09:23:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 513046137C;
        Tue, 19 Oct 2021 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634649705;
        bh=7fsumYHDliZuLC11v2hwsWrg44f5IwD62fDRzCRuku8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VAUKxfVAvg8SUdJNNnAGoYRxfRZEkx6scwtL8yAlrxqUpn/mvZ6PHOrXhckH8HQxs
         7eMkzyT134ChPKz/BS4WuR60eZ2avvsmMFY75RtD2H/AJjnnWp8IpJoSaXxp/M2DXo
         37oUJT26/muOZrs1pEAD2O5hC8CtsKklU6IeuQ4u71IvJiIY6I8fbV623PV1ReUs3Q
         GjZ3RyBSP0aRe4EyFL4IQR79+KZo8YowWuTn6BMaPwtX4HkG6QKTrwB/blMKq8SHa/
         OPPZAW389PgkDNlgpKIfGwGV7kDhaUVUTOHZCZbr18KXPNVjV+fkb0pUghOZEOrCTZ
         dB7psHbrBgOkA==
Date:   Tue, 19 Oct 2021 14:21:43 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Message-ID: <YW7GZ5E8a6oFJk88@sirena.org.uk>
References: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jQNrwv3AgDa8+rvQ"
Content-Disposition: inline
In-Reply-To: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jQNrwv3AgDa8+rvQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 09:41:25AM +0200, Uwe Kleine-K=F6nig wrote:
> Up to now aic3x_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--jQNrwv3AgDa8+rvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFuxmYACgkQJNaLcl1U
h9AW9Af/TLSSokNc/j9/BxgIdhzcA6Z0KbE4eWBEhdjkYWFmV2B/CgKTAMKsTB1B
eKe2MifxoCMwDu+mjABczEn85v1h6cUvAe67e1RaY06rmYeSUj0/1ms9lr1MwJS1
M8klfCbsQGyKgMpzGzpSOWT4H7/5c5/rwpSfzmyQylecKPBlZhLHGYYY2u5Gacdi
wqQWxbP5cs1F8KsTSoBdKF8nnIyUFPXgOk3SRcecpMhBJMxKDfBt5etVLdJgR3Z0
Pvm7sgnFgG/vKL7asEWYRbIrw+PDtPN6WUskXoMvS3UmXaX8/ValQXqzAw4VHTAj
M3fOCjKA2OzciX3JscFxwKulDlZo4A==
=hEUK
-----END PGP SIGNATURE-----

--jQNrwv3AgDa8+rvQ--
