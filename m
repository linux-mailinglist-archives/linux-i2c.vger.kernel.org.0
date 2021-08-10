Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E0D3E8473
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 22:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhHJUjv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 16:39:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:42124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhHJUjv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 16:39:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3045B606A5;
        Tue, 10 Aug 2021 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628627968;
        bh=ArJpWlNM7aA1oipskJEw+fGlWP1KWDKZ3lA7wMgPlnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G2ELcrTCmrYeEed2Z4eGnx3dwpQAxzYf7odqWW4Mc952e+8gYa/gKIkw0dWEyXj7c
         LPG/RY8O8v61sx+3dw5CxzxceJLbSkACP9JbsP41t3Gmg7jw/STcWTLvezMPjEfN2p
         HpQfXtTMa4yXJArloAPIZ1OkW7tKYcu3l3blHSttNmPHwqiEjR6XK9kk2fb9wq8emx
         5xMpdAs0Swp4AjeTxSsuwmh1UIHT6MQHs6sWCKg2HXvOGS3R9ayX4Qs7MCOYtlpRTg
         zPLXXZhuPdSdCDom6/g8D8bVwcgheRSbYkvFBnshqARJySU8bo+Jv1ethp5onWrX0D
         foZqSSm/qyGYA==
Date:   Tue, 10 Aug 2021 22:39:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 3/9] i2c: i801: Remove not needed debug message
Message-ID: <YRLj/hF3bX1qsxWf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <a9fc0601-bff9-7a0b-92d1-68489b1476d2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xiMQ/kAyubHHHlcY"
Content-Disposition: inline
In-Reply-To: <a9fc0601-bff9-7a0b-92d1-68489b1476d2@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xiMQ/kAyubHHHlcY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:14:08PM +0200, Heiner Kallweit wrote:
> If a user is interested in such details he can enable smbus tracing.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks! Waiting for further reviews for the
following patches now.


--xiMQ/kAyubHHHlcY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES4/0ACgkQFA3kzBSg
Kba7og//V7a56G38RyXFmu+vSbioKALUMF/yD6j7usF/XDZYVE4GhCMVcXXIkfUQ
U7sgTPd7iMucQAL7zfSolcUOF4cGNbF69Y2Y4mlpVGQETPLeHrSpgXbxZKGCmdOq
+xP1TMjF4+3M7VF11r+F7eYdXa/2fFe/brpry5jvAeW8GIierkdGMsDKo/V+QlbN
344hE/SvLTDVnPoyMxs3wE4pkzwNRB9m8pV3X/JPn/4lCfONf49SDl0OF4kIOFO+
PsJ6o3d1EM9DkyvZD7mQeAdPTco/nft9DItJ9unvPVDA1fh8l1/E/KkQ9/d0Q5h3
xNUarKouM5YW+grgJfYr6jDd4lE/qcmlIz/csYrLP+HBml5+6cgtSH/fUkESXdgV
XAOMeYEDGo2vPIktWl1qvh0ocPR0wdd/BVtEUw8dvO5VuAycwcdSMNfff9KuxPAt
Yc4gIlJrdRfSwfPk/Oktf7B8mc0hKf63YD7rjUUzLkyeMaDkNNH7HAU73D7E1twQ
P5asOHMr/AWz96EusXT4vN9KSdRUf1wigKncIaO+auN7rCJmF2V0k5fp19yGmVzR
wn2Dq8/m2Ng+ijHhcAjIk9NO/6WGYJn6vfB4tJVhffOdDBolvdpuVMsr3HX+qLwP
kcU80R3yyQTbb8Bslzv+6yT+NuyFFqUHq3vx5z0BBX+/kVQDjB0=
=oEEW
-----END PGP SIGNATURE-----

--xiMQ/kAyubHHHlcY--
