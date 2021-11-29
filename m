Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986DC462218
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhK2UZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237072AbhK2UXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:23:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651D7C09CE49;
        Mon, 29 Nov 2021 08:57:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00F55612EB;
        Mon, 29 Nov 2021 16:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F0BC53FC7;
        Mon, 29 Nov 2021 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638205026;
        bh=cljE9tV1lfPSK7XSjLtUKfxaH+Wz78RefRWZpXMeN6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHRvxprJVfhtTmssRXUZSnxn5W+3TBS/HYhGJ0BUbcAkJe1k5AJRfzXVghJAikUto
         POrT6tW9SHvSGrENMKcOC5kOXJRtiR0fQG1pOMekTcyexH7iJNn899GpDnMRZB29aB
         nN3mnOtwrz98IkIC9+tUB3zfB4rS4V88pihCTugOSTKLdB2zrrfTkN842XThyx0a5b
         8vdhUISe8IEnC/DIP+lLT3GWIWgKjKvlXcwqpfxAvAXOIMtH1rscBSSVrcKcJ9LhqP
         8XLw48RwKZWxVjt030kPM23JnYarY/uE8AD0kG6SOVvHXi7oz9MAF04QV5i2Zg0f8d
         y+0psxZkFjkIg==
Date:   Mon, 29 Nov 2021 17:57:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     lakshmi.sowjanya.d@intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
Message-ID: <YaUGX27+jHwQxg48@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        bala.senthil@intel.com, pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p3ajAfGV2Ta1UOrF"
Content-Disposition: inline
In-Reply-To: <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p3ajAfGV2Ta1UOrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 04:05:52PM +0530, lakshmi.sowjanya.d@intel.com wrot=
e:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>=20
> Set optimal HCNT, LCNT and hold time values for all the speeds supported
> in Intel Programmable Service Engine I2C controller in Intel Elkhart
> Lake.
>=20
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Applied to for-next, thanks!


--p3ajAfGV2Ta1UOrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBl8ACgkQFA3kzBSg
KbZZkA//cWu6m2u6mTFtPJUfMEEw6LuT89rXMnblLED3Ht1h89/KppaBd6dwZg+c
hYxzdHvR4vkIdvI927WNmOrjzZdqfB7Cr2bXDjRS4V+F+du1oAvbnu/ANujNfv6d
Zgvy29GPV2mG+ymO45XL0sBrTdX2JP8w3k5OANNfpRah1fXrAcd1F9rw1Z3Uv+5N
rIWp3lbutV7OyT84a7DFQ+bvdvmya/iUQLX+YTiAUror85i5NlcTv+vKPB6VeMNX
qotfyjnAqKvGgN3C/fCwqSlFzmUsmmbFuy4aY98qQRJG4z4sQddl46LlBVgrhRF2
3cEQE79uVatwU4NJWFPHAwk48Ip+q7sJX7Hfuq/rfQJDRvRlD6+c1qJ7Q0HGjwRG
QzL0Bobo5mZe9F0TzEoXSBS8LsIOJ3i77Ko0ESZZChQ3+zZ4zb1KyE5t9pG4Il1g
W+K5yzWn1U23vSuNyDULOCRTg7ULyfB0yhaShGoWGJ9ROzfAfsmEPbefwyAEnXJy
J+XUYTEaqaWhIpKg2UYEjsWffEnciszfUAPdI+FvlFIALW0FuC94DCH3P81cjfyG
SafFbE/103YtvBfcYmUvnD8wh2kvdhMRKWBHQpwvcFfCZQrAQEYyc6UkuVCO51J7
yZlbO5Sz8Qg7gDxPhZQFnYPHNCd0qu/BzzDsXTrH3dzTnPUBy0A=
=W+n9
-----END PGP SIGNATURE-----

--p3ajAfGV2Ta1UOrF--
