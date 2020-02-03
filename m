Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 219B615106D
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 20:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgBCTn0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 14:43:26 -0500
Received: from sauhun.de ([88.99.104.3]:44036 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgBCTn0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Feb 2020 14:43:26 -0500
Received: from localhost (unknown [84.198.244.197])
        by pokefinder.org (Postfix) with ESMTPSA id 99FA72C0799;
        Mon,  3 Feb 2020 20:43:23 +0100 (CET)
Date:   Mon, 3 Feb 2020 20:43:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Lei YU <mine260309@gmail.com>
Subject: Re: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
Message-ID: <20200203194323.GA1281@kunai>
References: <20200123105246.67732e33@endymion>
 <20200123111137.5899fa5a@endymion>
 <20200123110909.GG1105@ninjato>
 <ffac66db-0b58-b832-f6b5-d1a1da7a1da9@lucaceresoli.net>
 <20200203142701.5c1db1ba@endymion>
 <11fd5351-e273-c700-2e6b-2066a5e77798@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <11fd5351-e273-c700-2e6b-2066a5e77798@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> In my opinion we should first document the recommended way. Assuming
> libi2c is the recommended way for all uses it is capable of, that means
> documenting libi2c first.
>=20
> Additionally, before documenting any of them I'd add a preamble similar
> to: "The I2C device can be accessed from user space either using the
> libi2c library or using low-level C functions directly. libi2c is more
> high-level but has limited functionality.". This is so it's clear to the
> reader from the beginning that there are two alternative approaches,
> whose explanation will follow.

This! If we have such a paragraph, then while I still think swapping
makes a bit more sense, the order is not so important to me anymore.


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl44d9YACgkQFA3kzBSg
Kbah8BAAgvenwkzx2VQYrTV9Wa5fwHrEr+rYB8ZFtOTCXyyIR30sxoRTwHJNSPRs
RAMpbAJYPveNhRuYJpuzG22I+NskPynYI7iLOzupSMHadTtIMC/tz+gOB/2cPIeM
+m6bBCvGDSa12ab3mIIsJy3ui0UEekMfF4o906LTldrOa5LR2mBMQ8w/uGG3nUWs
jMAGxqTJYxBotsgOdgCRfhInGspHnu42OchyXjdn7Ay0BnWtVmIffGXTgUEsJjjM
j1LWI0BjGAsKK9iAAdevKoBYPGOE+Epu7Q67lAhcMYY2BAaqoUTrrAvk5g/BiTwg
gSRrCV/8ICkzY5UlQWod6C9hHiunWV3CXyfJz4lu6jPRFDsCWy9MlKDTI0tUdF1Q
51dUzG40G+iFLeYt6u19kHJRPEhRhm5Z75KGXyp7KUEyL8wu9LkNA9rUMOeF+Q6t
a7CkbNsKE+jbJXZrq3gmKuHv1W9y658pZFXBe8QaP40zYwfNIU+WM/voevI5F2VJ
Teh05HdN/FerF6ZZ54FpH8hvhGkASBMyr32WF+acKF07e5GJFC0xTwTvnZXlvs/+
kaTqfhfebUXs//t/D44EOcTcNjT01fozsuYHxYRVsvTcGofku8AlH0vRZrHrrY6s
+uclhbegQh7QGQOjJBv3tlb/4NhSpKuTaIkBRC5XKFL5sVQYDWA=
=P0Bn
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
