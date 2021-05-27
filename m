Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F10393644
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhE0Tbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:31:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235246AbhE0Tbp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:31:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1231F613DC;
        Thu, 27 May 2021 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622143811;
        bh=Z6vtBnx7XTJ1qQER9ZLUyQBxpo58K1580IBnPSDFhq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YYqgw+i25ks2nzMWsujW07Y1cRCnEBDmiNgjbxTAgj7Yons8yvAoPWwhSGUFBB9Ij
         PjPH/yIZ5RrXNBqE0U75L5+XXtsbP1k+VoD8L5bEGuXrQ7Zdyr7/MtTkOsrUMRSIrW
         gPq0vAVzCFOHOJ4+MWnmVbKBIN/qagNYEWseZVFQ3ibJqT2SvIe/OlIeROODBMFF7F
         rqy6pJD58FrqKMEq4TRQKnzAWJWuZDgQxCxoFeojAqEtElghzXWQw2ADSRemGh7cc0
         z4djYeOicsA+4xc2xsSThO77WHHzCQI4EaeKbLfE5rsQfJBFn05UP0kPOM4jsivW2I
         gtFz1hkd/YY+g==
Date:   Thu, 27 May 2021 21:30:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 02/16] i2c: muxes: i2c-arb-gpio-challenge: Demote
 non-conformant kernel-doc headers
Message-ID: <YK/zP7gbCObHAf3N@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Doug Anderson <dianders@chromium.org>, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QlywBVltIvrCSeeo"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QlywBVltIvrCSeeo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:51PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function paramet=
er or member 'muxc' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function paramet=
er or member 'chan' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function paramet=
er or member 'muxc' not described in 'i2c_arbitrator_deselect'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function paramet=
er or member 'chan' not described in 'i2c_arbitrator_deselect'
>=20
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--QlywBVltIvrCSeeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv8z8ACgkQFA3kzBSg
KbYXIg//VHHf6cuN1PhG9Of0Byn+YHL0+SARgT1YRowj0eQ0sDUtLCtFxSuahVw7
K9HGTR4L2lRYrW8+Ei+3SURMvwqgO89jfbYR7/r22AvjlryIjOCyTfR9f4asmK2Z
RGch4IFersQrf/pANKqXncwGuGdlEClCpWV7NeeCESu/VF0IU9p/IZarCsUAlcdB
hp2VWEdl+dZ1zDCKO+d1UN9rRkaG3SakUX+ySxkLCAbXIzdKP5/NwZLMBNkkd6u/
zVcsogy1i1KS4af6ueyGryae0Oe8o5xMnkeoWITYClkVLvzx7pWZj7qILObB78AE
kC7U29AduTth+DiaLuzB9I8VAkj9vvutydd4/a9EwNBk7mRgnucQZe92mQKqUbsY
YbEpz/mQck6lnzPv0rgaOkT3ODZgqGJJ9KfBag6poVvf4xyEhy6GLSzLeCL4eim6
uEygNEEzivngNrj2E6Kl/t0A/SBJUCpgjjjzQLYH/KacVmBxB2EKNehGmvU5nOfF
dca7OpltDcByKIyyhcRY1mkqUw0HJOGRC93RLFaPf2qZ4RCZqJXrmJUNGWvnQWur
7JREFVuAMrmjxEvWn5cAAZrBhtQg0F9wK96+HVpn6zz8lIJxYGcLIpFq9D3sF4rx
EeQfkw7qFj/Bw0lUN7EbOQjKJowHX3tDklMGnWzgFb7Xl/TCak0=
=NHdN
-----END PGP SIGNATURE-----

--QlywBVltIvrCSeeo--
