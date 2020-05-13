Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739581D0FF1
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 12:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbgEMKhe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 06:37:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728258AbgEMKhd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 06:37:33 -0400
Received: from localhost (p5486CF35.dip0.t-ipconnect.de [84.134.207.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDECD206CC;
        Wed, 13 May 2020 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589366253;
        bh=yTQI1s/7UsuNZr7cGYVTsLaccMYW+fDXEPGdcVYJLDY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CdkUv8AuxyDR3KUXDRzwlb10EVHTHlqukgXAgR4IxdMQGSjJ6FVJpkzzeBEJex1rI
         0mhEtfxmV7UpsyOfGYJdJrTe1dgqxW6DSGEntD9Kljt54DOauMOOY2UDArhSwBuow5
         Ta7/8fK/uKhP1XfRtLOTpckvMdJ6HEZwI8Cx+PVE=
Date:   Wed, 13 May 2020 12:37:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: Replace zero-length array with flexible-array
Message-ID: <20200513103727.GD1043@ninjato>
References: <20200507185329.GA14436@embeddedor>
 <20200512104319.GH1393@ninjato>
 <20200512231200.GL4897@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline
In-Reply-To: <20200512231200.GL4897@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If that's not much work for you, then it'd be great if you include
> it for 5.7. :)

No problem, done now!


--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl67zeMACgkQFA3kzBSg
KbbZPxAAo7+q+eAL0LB/GsTlrsRoNvpQv/uQqXBHjbD6gIipPwUZ2/q3t5LqWA8e
9smQqoIrkDV6G0VhtIW7CtKicraK8SrEQTBDZYA8EjxZtF9QTCPG4H/geF34pHAV
9FwJUtkarSK43COXaS+PaBdC7f5onizRMl7UeWtRbZrQre11fRaXLKwrQPqeG3/7
6R5Uo9XnheDaueroUYp+V2pI8BWGWIsTDSW+RgKvZL5RTaYycaVlwf0IVl2lhH8L
W6nXoxOstBohtNBPCGJTlArkpqqQN9oBg037FBFMl1CcB9+swuqeFtUI0k+O6I6n
sl+Iq1nFKpji2CboJVxCDcgFQSAynkRCoRVTueQxhWtCrnEqi6xbDfJTM/KA/Awr
c4hKfCF3WVhaUXyR6pjjuknX2m0yzxgE4SN/tURHlbGne99IdO1HdSovk04dFuUb
wSfX49y1kW6gLPxrDqox354qHHqEhk6Y1gkEBKlGIlw0ebKUq0i7brTofUmlOZI/
VUr9LBQZy5SgnvpFVvqNuUpQxF76RA7pKqlKoGacLSLsnwohvdyGqQXatzD/5fkO
PJXG6tXeXnuQV/If1e4dVtkp6+oZ2KntTn+XLyZB1EvFoWA6OAptHc8HKaAORL5X
wf6vLHZYw+nmtEz/Ioid4XKEvDm/cP8a0nhsgqhFnTNGx/EaqdU=
=vl3U
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
