Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966F539364D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhE0Teq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:34:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234187AbhE0Ten (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:34:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F9096124B;
        Thu, 27 May 2021 19:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622143989;
        bh=zJ0Poo9fQrYedBcdGQkfLIoW3zdHCoyHuqth3Q8U460=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fBqzNktYq5lkaJ6Ovt+LiAroRv+Nfi1tv+dZplmLj4r8jzcpMs9JxCYFNAcP29rQl
         ornBf/DDVN4UIxPIgPmS1JFcAm8kl59PxRoNZwvLuLHOQN4/Xnfic3ywgQU9e3m0Md
         dSBb4PLnVyLu5TuVvIEozb/a3YDPIqbLVDKDeSRmfYXcRdyz3K7tuVsDCqvGC5ycLn
         zvHWaUttX5Oz93Th6ZsjhWnnW67PM6CJH0Hu8HZAk1wO+XztWmy4B5vKJpjOn4z7xO
         7T8iw8ruCSK4m0F95WE/FWArgXLbhPqwuEHjn8SRZF4KKa10w/jiTIU0sZ8E3hiaqI
         Q3QOH+2XUeVPA==
Date:   Thu, 27 May 2021 21:33:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 08/16] i2c: busses: i2c-eg20t: Fix 'bad line' issue and
 provide description for 'msgs' param
Message-ID: <YK/z8o86kCE2ghUD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SkWKZY6NMJB/6A9i"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-9-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SkWKZY6NMJB/6A9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:57PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-eg20t.c:151: warning: bad line:                  =
        PCH i2c controller
>  drivers/i2c/busses/i2c-eg20t.c:369: warning: Function parameter or membe=
r 'msgs' not described in 'pch_i2c_writebytes'
>=20
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--SkWKZY6NMJB/6A9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv8/IACgkQFA3kzBSg
KbY9Fg/+LB64xvDNkWPopQnwtPnu91na9S6Z+CmtnCs9AUsIgOZApaOj+r8buupF
NAEPWtbFKoWGIItskoQQA9MgPXv1ahGaCcH4vqOky0mfC+B0PJ6wuXnLEMXKySyA
Lz1akDTvgwLsYnbhr2xlzMvcBzV8OAfIDPza8o7W/uj9FTgBuJsr8fyhnDgx7YmB
yvQnZqwTdE/wM88tb+/DvDji1DO7+vDCKbc7/plmOv9VdTSdKQLeo3tzOGUlmsqW
aqKsGZg/5JPTEOEpttOR6pCtEUix26Ub/+bWCznxsZPmnN5MfD/ofUH/97Bavwld
oAmnosEa9EPO8X+MCcoFNidNbwx0aEc6VTnlxSlQYWLlTSkjINep1hO8VNPrTwvX
/4GEO1msnFKoTuFDqwjLhBnp4LhNxfhFP2IDLyfWKdoFkEh8VVLS/TxHdszPbnpE
W5ieFulOqcQaENdxb/tggSq/k1k6OrRDwVzeW4FpqRuWBNA13BqPKmk6Wc26y507
0R4dR0l376VilwS0udrAkrVX6m6FhysZlXr1lMLnZPfCLYsvv5oxijrC8OEWau9r
8xxNcb/KU6rnEpQ4HOXDejo9vCE6aG7ZF3gIbVudKXpeMKgh6FCt/S/DdK60K6l0
ca6VmgA5f5n0Qeo8LhS5BHgBXYV3m7NllptAKVjqJcn+aVKNIzY=
=SNeE
-----END PGP SIGNATURE-----

--SkWKZY6NMJB/6A9i--
