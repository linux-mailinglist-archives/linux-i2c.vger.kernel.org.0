Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0A14AA021
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 20:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbiBDTcz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 14:32:55 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48588 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbiBDTcz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 14:32:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20C2DB83804;
        Fri,  4 Feb 2022 19:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ED5C004E1;
        Fri,  4 Feb 2022 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644003172;
        bh=uTj62FLingKqWAQg9C6R9/t1yTvVZAR768Wmtl4AJL0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SbAGSW52xlz9sQkqgItDjXwZT69TRZFbz4qItHTHUKdpglLkKnguZsF3oIb7qsT4t
         Q4H39hOP2MJcRU2oAtEUUmig/Vf8HjWWkJD8N9WGCmjJ6WqykBNPSZ7/JfOSVCh9uO
         FH2tdYI0CHUGHZniTx0xMX5gKZzAlNWZz/BiU4dCcMGyQ2CrEghH9atNAPJUTUGCCk
         0punO8bs3BRVcmoxLQdtnPcojvF0uWxNeUfClqcKwlMFkRVyPtGSDHlnn61KDyE35u
         tNhJmn7u8he6Cx+8Si11X++NJsbrCZ1RbpAmnTgYaQ+S/I6uEwDCujCStlr9EZ1F9x
         ZPBMxjy0KgWoQ==
Date:   Fri, 4 Feb 2022 19:32:47 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <Yf1/X1rXm4QbyoFN@sirena.org.uk>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper>
 <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lSHQgVPpfOtQnKGc"
Content-Disposition: inline
In-Reply-To: <Yf14LADJ26G9ByZu@ripper>
X-Cookie: Torque is cheap.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lSHQgVPpfOtQnKGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 04, 2022 at 11:02:04AM -0800, Bjorn Andersson wrote:
> On Fri 04 Feb 10:42 PST 2022, Mark Brown wrote:
> > On Fri, Feb 04, 2022 at 10:05:47AM -0800, Bjorn Andersson wrote:

> > > Typically we don't don't mention the bus-supply because it happens to be
> > > pulled up either by io-supply for the block, or by some always-on
> > > regulator in the system.

> > If the bus is being pulled up to some supply other than the supply that
> > the bus is referenced to that doesn't sound like the greatest electrical
> > engineering ever...  without any context it's hard to comment about this
> > particular system.

> That's what the schematics says...

Oh, good.  I forsee no problems here.  Probably this is something that
should be in the I2C core if it's going to be dynamically managed,
though just setting the supply as always on is probably more expedient.

--lSHQgVPpfOtQnKGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH9f14ACgkQJNaLcl1U
h9B6iQf/byV4+e+uFBM6wEtccDusBqTglW0hQhfar5lUjuwIB9B59eKV7EsYb7k5
xKR+Fdi3tesx6q+OJpQZ4VGUfOPM/ISNdfT/tLWimfH6DCNEe1aOZwedHHlogEFP
2uovVtGrJ6KYJAm+yDK+k8PsJZV3HaCxU+ZjrL9Mp8i0W9AcbIMZW5yiABpi7dq2
Whamy9IW1CQmSCfPKU1Jrsx/eXusl+NeahbhqCTqkwxFHjr6yamJCRPS0z6OeN8F
dTkoYfS1eUkUKUFfmtJF6MFztp5UHX/kJGgEdw0qqV35LMtBsYNBG1jmRNEzLtdd
udPtQuWAR3NHMiWHrCM1+Esj5LCTJA==
=UVPL
-----END PGP SIGNATURE-----

--lSHQgVPpfOtQnKGc--
