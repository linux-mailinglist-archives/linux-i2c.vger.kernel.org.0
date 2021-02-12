Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C96319ABA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 08:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhBLHnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 02:43:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:45514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230172AbhBLHnH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 02:43:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3401E64E65;
        Fri, 12 Feb 2021 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613115740;
        bh=mDFloA0eTOYyX53Zl2vYO4cjU5+oY6jbaFqJKdLrn8k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iF4yp1ZI3UsQ9IKQyr59Sw4z9Fyk6nbpvmZjhtHHKME6GermwN4hozWCNijX1yOxv
         rhlTuMJPbQoU1f++S8mE6XvhxsRI+gygqT63URSqTPUAJfeTbjdxsH63TpQpAVdzCa
         eTUfkmcWU3RblWT5LH5xRFLxNBK0n+SAnICRdk/K0sbDeH/fjCyFfEfz1hoo93MSoz
         IUkPW0dUj5iRq9nEpjJJlrYYElJxsEjWkccEdqg1qKtmhuWzVjFlm/HUr2tptbrN13
         XBMp6CltSI92TBwWiV5vAYE0zlFqfghG+majlCT3ANj1tBYS4L1PevH6/1n2fu9DKa
         TJ1uDSh4zEa5g==
Date:   Fri, 12 Feb 2021 08:42:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Weihang Li <liweihang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxarm@openeuler.org,
        Baruch Siach <baruch@tkos.co.il>,
        Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] i2c: busses: Replace spin_lock_irqsave with spin_lock in
 hard IRQ
Message-ID: <20210212074216.GC1013@ninjato>
References: <1612781317-51815-1-git-send-email-liweihang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <1612781317-51815-1-git-send-email-liweihang@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 06:48:37PM +0800, Weihang Li wrote:
> There is no need to do irqsave and irqrestore in context of hard IRQ.
>=20
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Weihang Li <liweihang@huawei.com>

Applied to for-next, thanks!


--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmMVgACgkQFA3kzBSg
KbaZ0A/+L2beXcHuOvh2ufW2LdB6VEIMn0e5rkwPxPqEcRnAFWsoZrhJxAnb7XmQ
L70IY7jh3jU3ceE/1eGrJC+EgNgwnc2HUUwmGsfKdEzOGZqmworLbRbQfssgqksk
rKrfzWxJ/Wx9CuIuwTzN34py3iFdihduVYK7ZSLJIB50TolwFrcN0K+pswc13JJS
C14M7GFa4PxWc1Kk008lx5tOTPLgPLW4aI8ua1NBWrFPUjj/9suXBJoTwTitXbJ+
35uIrTz/2pM1suCAfD1vpMoNUr75oSn82uQHlRk3mZx5gPsgfnJtJdO4in81q1gU
H0dwQhdOHwSDXFIvwnRylQGBeLooh8cGY343hzE05Y0LzP0y5ofuJ3C7wU9eWzr5
YRCXEG/I3MoxolJCCKBxqp92mkh83jJUlh4++Kbhss7Dtq4IC48cncv1OLkzxYcg
8mLn6Xc8EZgYDo5NU+rcMd9OQBxtmD50lWmSuIfiNyREAok/zUy3Eu6ztGaZNqib
61XJpoZO7sLZl4qj+uNZtXDOJ20El393s+MoZga2U4vi5EkpIAmfvax2u/pODSSh
nQMmap0RfiFtk22g76IBZt0/kTEJ35Wi6xyOwy3XG2RAJLXNRQsh4vIe9wezaSJf
PR+/Kgz1NetKse7QPZpxEm1X9EXYpvEEPVpy0HXOoR7NCOnLYOQ=
=RKAn
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
