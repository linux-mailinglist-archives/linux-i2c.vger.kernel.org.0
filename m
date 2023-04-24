Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734296EC8D8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 11:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjDXJ2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 05:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDXJ2d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 05:28:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E174A9
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 02:28:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE4B761241
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 09:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98D8C433D2;
        Mon, 24 Apr 2023 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682328511;
        bh=3B1Dckgy0KRgggD8xvNxyZmQfhPKuBtrBvKYaOUfCgs=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=VLSXEfG+ftLT9VTy4TxY4GkAe0QSPHECoCiCvRs66fXaD8f5ugEKNWXVlZ9k8YEcn
         aGu0ywkmvaiK2SHW6hOIcOVwkX2v6134W7gEgKm49VqVEKvaHpTmYGcespNouvpil5
         pJ933ff0MIKAzhgYYqqVM/OqizJyFp6blTN61vBh6PxAmmH6SHsxWGLwhND4ndQhKc
         q0rDT6YiYpYWsER5Hm9XNWNQcKoKdWcZOSaM0dpGdL3wln/UWaYnwWo0K1qvhI0cTY
         z0KkRGezDsadGJvbqNECVVe8IrQdJyrlcZuBVXVCWo/pC2T5YzzFjTI9va6POLcG9f
         bOCQYcuhF+c1g==
Date:   Mon, 24 Apr 2023 11:28:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM
 leak on error path
Message-ID: <ZEZLuDhjNRy+mlMz@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230414021022.505291-1-lars@metafoo.de>
 <ZD7I99b3LvdTUJRW@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TpWnmjAzE1uMgTJF"
Content-Disposition: inline
In-Reply-To: <ZD7I99b3LvdTUJRW@shikoro>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TpWnmjAzE1uMgTJF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 06:44:39PM +0200, Wolfram Sang wrote:
> On Thu, Apr 13, 2023 at 07:10:21PM -0700, Lars-Peter Clausen wrote:
> > The cdns_i2c_master_xfer() function gets a runtime PM reference when the
> > function is entered. This reference is released when the function is
> > exited. There is currently one error path where the function exits
> > directly, which leads to a leak of the runtime PM reference.
> >=20
> > Make sure that this error path also releases the runtime PM reference.
> >=20
> > Fixes: 1a351b10b967 ("i2c: cadence: Added slave support")
> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>=20
> Applied to for-current, thanks!

Sorry, I missed 6.3. I'll merge this into my PR for 6.4-rc1.


--TpWnmjAzE1uMgTJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRGS7QACgkQFA3kzBSg
Kba1+RAAjRXL9XSXu/zbyWrr5+/NkxWqS7BxQZjASqnMnToJe8oTg6BgKnx9LiC7
XNpn+E2kR1OWIDOJfSxzkxCSK64niLyRC29hh+1YV19rzGGwf6xX97e0UkJ1NIN4
WfHQLwAbDu1roB29YPUxeKoIP3L5NorINyB5DOg4bh5rQXAgJ4Fv/ovzVJhqcmTp
7nNFrkitKZIPK2ifA9O2xKgU984W/4X0p5S/CJXwMbHblHo8zooX4RI29hJlMMfx
TU4PCfsloZzKGDGutzdCmeSFHjL1aPJxYyQnKsuf4dzDKXqgk1kgH+8sY2p/6wPU
2rfkzPs7qdAove/sya9RQKY7au+h1ER0nq9tIGJC5r8zH4hyxt/jMAEXkx/jgCHJ
oRBCTPsnCdfSPl2yI5e0WJGwX2OslfBW8p6rPT55x1KjYJ4fIv94SmxJPRztelua
+j3QJHJGzNwxCMWPUtAgEEnTsuwqkLaUV50gc7xyZc60IGKks1IVKaiQwJn/oUoO
V5lYst4rhRYh3aVFeIknwOSdQsITGWI2XSGgt4UUWiWMKA+Ep1QE5FPT6JaydI+E
tyRp3c13/ocBK/+H0YiKFuyAPOItbaAd82//ofrgjD489XAkoY6tiXs1ABjsvihF
+bAVBEGWaoyR35FT1zJDeQStu3CgbfPB8C+25c9NuLOcB+9YV4s=
=hN8L
-----END PGP SIGNATURE-----

--TpWnmjAzE1uMgTJF--
