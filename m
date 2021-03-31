Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A790D34FD99
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 11:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbhCaJ6m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 05:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234800AbhCaJ6Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 05:58:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37B8D61962;
        Wed, 31 Mar 2021 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617184703;
        bh=8Q1AY7JdoH+Ccf14MEMA3ArldP3X6QQIw2Ci/bJX6aw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkVipl8FKiITCLaNAo5tIYm56VPEtOMwUlt7hG8gOF3dvH7fimr5DIZmuP9marqj1
         /mnjdUnlB9y3y55HwxPhPavT/H616N9jvOTv0QPYR1+KfXHkpmPX69flxznfs6Ms7Z
         2oej7lUKG3GXH4CdWWl4nbLtg9cGeF+/ivj4In+fsPs/HXZluJtTsiTsOcWRsI09Bx
         tgw2F6Ky47a56QPwR5i1/NNSAiNha2WiDSE21hkNHQwDCGWlQT9qHREG0twIzNGPNp
         90YeQi9UCbkiMPC4ttUmzLEwBWGiYw1gE8+9eK5IDbXsYlb6wYKdt2ek853jQtkbTC
         vqMQDKH/XDfMg==
Date:   Wed, 31 Mar 2021 11:58:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210331095820.GA29323@ninjato>
References: <20210318115210.2014204-1-bence98@sch.bme.hu>
 <20210318115210.2014204-3-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20210318115210.2014204-3-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Oh, and are you willing to maintain the driver? If so, please add an
entry to the MAINTAINERS file. Thanks!


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkR7kACgkQFA3kzBSg
KbYvxA//TVMuQ85JEg3VH6wHD5KLvwBecyQ5pOwMbUTo3Io+EIYkqYpxGuC44ovu
r7OI1VfGuZJow4mI+z0XK3OHOZ/eXbVO7zSR3GN5j5rLegzTjoTiqDJEW7UObUN/
DizBz/FJsB02ri1VyZSe/QtPMtk2YDtPRf4k35cXy45ZMwUBJUQssgA49yH/8Ew8
wsOxiA6L0HdMZO2OSzNChnlWnXTl9sJI8nlM9cbvsugIJ3M4OgdL1Muym7K+fxV3
xvOhFpmloRmH9A/VKg+CZ66RmdMgVyu+JYHyYXTtC4Lwc8gg/qb9iUlYEAw97lWK
+ugTO984259osiah66k+diGnynZywuiNs4S0nNJzjb5AQm2crIxHI/LE8EccrI/T
W470Tkk9iMQl3sKXLi9irlCTU1jzNLmdxZpu/UtHSps2SjmKd+bGbBemJduiz4j5
Yq4ut/FZJttp/im9v0+hMtlbSi13Q2ewGhJQ9jrPcW1necetCmdr5oLcDadiIKwF
7uxBJ6oZvzcvTLobjeXGq3nJnVA6UMEykLw/GqESyaAIrIAHPGoLwyfzTh7Po3l+
zqOyYAgp6jmS/ji4orU/MbsNctmuQuRfNJB2LxoQOU4o+ZIp0LMd225lH/G1jm90
faWZQSVgYV43lvQS+0FIeS6GvQWyqtkzc3tmrGAX2pcxraq3dm8=
=4I3s
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
