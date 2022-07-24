Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552BF57F35E
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbiGXFkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiGXFkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:40:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A689A65FA;
        Sat, 23 Jul 2022 22:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B8F460EE0;
        Sun, 24 Jul 2022 05:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C0DC3411E;
        Sun, 24 Jul 2022 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658641221;
        bh=t4FWUrXdqefs3/+bLfHCQYXgPYvCB3PaAlPZKcdTHtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rtzEvI4lxxTlq2MRIXPXSI3cHN4NmLwqJ8/XM7JC5Nk2uDrzJUK53CpUXT6ILwuQr
         DMrGxeIJumgc00Tf7x1J40CwV3zCQZ/szA2ZX7HYuiko751GjFzlcwljEhbMyhetx5
         hZRIIZj6j9V0+bXBH2QsYm1vmv14lcTyf4y7c/ZF2/MiTKDb5Am87/bPv3b3eYt7BS
         qBpEF0oGCUJE1ursGkMWOwTwMRxgcDCOmuroLQj6GHWk6xq6k+6yf3ZH9nE4EhgU8b
         hYd8WA724bWSAOXJHlXbkPlD4mx5QoT1vA2++oPNJf06XzSjc2rC2McVWw5n0FZXmk
         EF1WULp8Qib8A==
Date:   Sun, 24 Jul 2022 07:40:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     XU pengfei <xupengfei@nfschina.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drivers: remove unnecessary (void*) conversions.
Message-ID: <YtzbQZKJk+qS9PMs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        XU pengfei <xupengfei@nfschina.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220629060952.4749-1-xupengfei@nfschina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2GERJrjg9Ux05BCE"
Content-Disposition: inline
In-Reply-To: <20220629060952.4749-1-xupengfei@nfschina.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2GERJrjg9Ux05BCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 02:09:52PM +0800, XU pengfei wrote:
> remove unnecessary void* type casting.
>=20
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>

Correct, but $subject really needs to contain the subsystem and the
driver. "drivers:" is way too generic. Check 'git log' to see how
subsystems prefer their $subjects.


--2GERJrjg9Ux05BCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc2z0ACgkQFA3kzBSg
KbaG+Q/+L4PLUQNV+YZlES9fc5aEuXMVNvXi7+5/+H54JyxN5brEVNTt3QAKdUWv
ohyPWep5SYx3q/9zCRy1MwDbIroMwc5/faa17CqN1QFXRHniXgZlXpOKDiKAWof/
2UANBQvgvTTzQeDFOOoKDGrXv9khYTM+13a13X20b1CXLhf8zTPEcRW4W0sLqbXc
xb/et4C4n6K/LbAt9al5n4dodMPI3+CjkVTeR7y18D8rOd957IbvSUeP3ZvcTN4G
nsiP73hrPamSU14W0wwlUjiX2jh2l1eVXAOVYICs3eggDSi/jSjcnzkHg4JI71RK
qvPHRFtsJvQHJqvyL4NNZVMfFmqLS5pVnli6RH28sKrrccjSpKKeBFdxrFv76t1Y
zXfYsh0ZV/zjpdJJgplnrfJHJDAibRYR7lb9l/YXNJY2dYuBtkz40p61gwpwjQrM
yq7DxE+znsc7iF2THpMWUFlP/Q67uzmhcA9Rve+Si2WWwETDJsj/pqYE14197jC2
BlQUrs5jS6WFe18EKoGoFtTBQGPkWdH2AQLkWDCtGA2Tww7ga6s80ZptPak2Op/6
MI1dRrD5ZICboEsdR2dhPygzTvwPCE/+ixgUJVDFAjZruTWaw37xamU75WTvN3G/
vXpx/MfwVB6KBnu4EZ2NTn2KfU10dbOFAUpJcF3wz1ZU31Vps8E=
=iKpK
-----END PGP SIGNATURE-----

--2GERJrjg9Ux05BCE--
