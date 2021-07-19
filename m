Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9773CDB02
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jul 2021 17:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244397AbhGSOkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jul 2021 10:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343926AbhGSOju (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Jul 2021 10:39:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D8B561222;
        Mon, 19 Jul 2021 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626707994;
        bh=q8ExU2Wod/ytjh9i+TFwSDbPuXu8hNumWu0xiHeJNG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ghyW3LrAVCjn4w7SiRrjQKkFfoQXva+1WRFG2YQPWtHgXOTPl7O9Ps8D5i1fmmNJo
         O45xAeitzWjwUlfdnp1D5odIE6r4RPk5RwYlufh+OpiH5GHXatcqwouBMJ9G5GfPXu
         03gEhOpknUbDbEdXmmt/ZXBcqnQrwwdVlIgCbMPkanE6gwtUzNtUBtD6ArkkR5naCT
         gwwQl6VLogQO3PNbV4pUxtaIQ50xV8AL0V5phDxyeDjyRH4aCXUNn//MmAUC/xlcOX
         qjHFJOICZL+oiJUnfgenfMVnLI39QxZhtIKFZTh9QHXbo+noTFysiJFZ0uHexm5tAo
         4UDD3qwpNe9lg==
Date:   Mon, 19 Jul 2021 17:19:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <YPWYEx7QJBNzQ6dZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20210608172338.0cf520a1@endymion>
 <YNdIEUpBoToGN7JY@kunai>
 <20210712115823.74149795@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vidu4n66ZDKw+gh4"
Content-Disposition: inline
In-Reply-To: <20210712115823.74149795@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vidu4n66ZDKw+gh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I would have too but patch 1 was submitted by somebody else. I didn't
> want to put more changes in it than was required for committing
> acceptance, so as to respect the original submission.

I see. This is fine, of course. Glad to see the patches upstream!


--vidu4n66ZDKw+gh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD1mA8ACgkQFA3kzBSg
KbZSxw//XsaFWCV6D8ZiJBhBYdCTq/6ivy3ik6r2Ah3+UwqahB7e1t9Re11QB8LD
u7jljlb+gfM77oafUqHx8G6fSZ/DEZF6jJct/xAlCJv3eD0mYFvlVdu/jrHVce73
K9uOPvbTQOx9eK91qT2eFY3b+XR/kldOZXAMJv0CMX3uUz7p5t/nb4Owussr/uPg
qImEEzET3TCq5b68JksKmtrz/AQ7ybraxWB4R3HWneZHxt1BSMg+MtDU/xhccxny
k3jvtjmcv/pBg3h1kNank1S1Rqhx4uvFsG4OJW1jTMAU+7ya7mWsHw1lTygTclQT
m1Y8m367utreuTWozHbJUz94Uk+bdfZQve68PuDaxHVdxm/lDxMBETk0vJziKmcT
WIPeGPbX6c/btEsbeL0OrdOHTGJ8pUOwWIeTkb2N2F1ohZzamFB9GLqy5Sjy12aQ
9yc+X4b06zneLwETJ6yV1B0gsjNtbJs6WyU/B5F/sEyTVTIgCMJ9WPXlJ+kEVcWW
WFVs8AlENdrvweMnkPai+XmJ0tueGvpQY3P042uWKeje3AO1pYM/rxNxcsnL5NH5
wrUayn04WbnULbWm4TXil5pE6tV0/d1ljRx6qCDaEmarnbVgx78zBsSg+L+6KwGJ
Mzl9GllrJ8ik0gIhn1LgWnBLn6Ga9iU7gSoVxsHmgPVZVjM/xyw=
=4cLW
-----END PGP SIGNATURE-----

--vidu4n66ZDKw+gh4--
