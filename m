Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF986464049
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 22:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240481AbhK3Vh5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 16:37:57 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50168 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbhK3Vh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 16:37:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA754B81CDD;
        Tue, 30 Nov 2021 21:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35EBC53FC7;
        Tue, 30 Nov 2021 21:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638308075;
        bh=EjqY+xao/N0w4YyL0AFwlOKFCQVzfzBGrREPqscN2vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eVPWPgwJ64rE1LnwjUgKXvBrW9ZePstPxr97gBiFBJLA5EXFTb6cNKsBmvip7Z8yU
         yUf/stVVw0w2eUsO9BV2mNYjRkC19SbGkwdjj2+UYNLReVRKyxKFl4TnUFFN0BbUAT
         Wyi8ggRBO5uz/loFwHKB1wbdVSRrxoczvNHKxYn+41+kX5prA9sOMhrapFz94EuIWk
         r6O+b2xxy3mH1hDUNYHWXZaB/YPnsPUPDIuLg9fsc7m419JSDNRFVa6tSzbLlgDsyY
         k5g8pChYiftnKKpP46CFxER3UAouD6wGyAn+RyqxlDlzWX0L+OonCuwnYWY8/vZWHF
         UuCsuRSGwiehQ==
Date:   Tue, 30 Nov 2021 22:34:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        bala.senthil@intel.com, pandith.n@intel.com
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
Message-ID: <YaaY4EEzSzvxYb39@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        bala.senthil@intel.com, pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
 <YaUGX27+jHwQxg48@kunai>
 <YaXrkJbsktXFAgFJ@smile.fi.intel.com>
 <YaZIFTHCGb5dLM2f@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmDvLBOUWEJZfX8g"
Content-Disposition: inline
In-Reply-To: <YaZIFTHCGb5dLM2f@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZmDvLBOUWEJZfX8g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Applied to for-next, thanks!
> >=20
> > Oh l=C3=A0 l=C3=A0! Can we revert these, please?

Okay, both reverted. Thanks for the heads up!

> I rather add a comment there that these tables in the driver shouldn't
> be spread and expanded anymore (at least by Intel).

Please do.


--ZmDvLBOUWEJZfX8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGmmN0ACgkQFA3kzBSg
KbY1ow/+Nn93X7WRQ1pDjeUMFwJKYeU+6DpQTEsQLaGK0KrRws/iFlH/UhMGYFBh
kXpbOooblKCagQImhIdZnrBJZkqn8jqQYYhFhaH6tyuEr54bQpiQYreBBcC5LXvv
1M3BWUvIhoxXYZ5KBTLEj9BAAME+bQwojTTKqIncnB1Oz8Rq9psabooYAbC3cyxP
eoffXBzG0Y5VkXFEFHPyU+hzFuEI+rRuJIYCZTcSbgO5la3D9UJVW8qhAHmXlzZL
BJWmLOAvucYJekOifT9kGyw5HzWCOOxbx7XrsYdWT2b6HP3C6hQ2VB23h+YM6AZQ
g1J15mgdE56L/LgyYsFWqSYj1gT4Q30Azqx9+SaSgD5/8Xk7qCy08OFvxPEI0EX9
q6k9nva0OMDFF3M6trrA02gLPOOdu+wg8LuWg9QELNd9S+TBCnxMz8Pb89sZODMd
DAQcCSgtKbKCzXNeQLs6jrDjqd/S3t0kL2eEm8jbekHGTXY6ewSH+SBNd4Hy63o6
unCDtDK2sD3IiSLG6QhfqEGL2xClD6XMlQTVZgoHWJ2mCOHOyOq1h71OlXgC5yg3
nMkKfOOVw5t212ZPqKDIxtAlMLGSuFq0MD9rinxGrokj7WTol5Cy2dqDp8zelrof
KimPDt1+BB80gxnPEKUf1dn+LTjzsvBXwbv4SATX7xWaSTbvYzQ=
=/Iq2
-----END PGP SIGNATURE-----

--ZmDvLBOUWEJZfX8g--
