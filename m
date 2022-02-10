Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1015A4B145B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 18:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245211AbiBJRgo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 12:36:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245196AbiBJRgn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 12:36:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17912656;
        Thu, 10 Feb 2022 09:36:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5869A61E06;
        Thu, 10 Feb 2022 17:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75037C340EB;
        Thu, 10 Feb 2022 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644514601;
        bh=S+DBYMhzml2rdRZ8qe6N6FvYkLPR/4wbWPBZpkJQWPY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HpazDHtxvWKQTNtnJeIWwT6Y9PXy+cwqAc1lNzJWq9wr3iAuMFHYPgTAvQkfuaoZ8
         SlbzF6WzJUFkgafTasSlg/MeRt2+6ZiY4kHFuatiBJbQAfygszCHYwH0pKQMRYyYEs
         qWqEhe1G8kjHd5zr4My65bX3HZ+UTbFwQNC8IwHQF000dUcdmC6W1jsJYDzMQLoI35
         NYAc4PKcYaGWNvQ7MedgX7PpXEc43tniDzeveNEAsc2tn1mNsET9vx/lYKf5ApENx5
         pHvHGWIw5xYKL6JtdJDgr22jdEakKwokLCWViLmsk0XjGiY6aE936+weV3NioeRkuz
         KPFLP38ABQrxA==
Date:   Thu, 10 Feb 2022 17:36:36 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <YgVNJHTQufLu1sM5@sirena.org.uk>
References: <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper>
 <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk>
 <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
 <YgJoX+Ajgt4dweQJ@sirena.org.uk>
 <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
 <YgUy9KMXocSqnv7b@sirena.org.uk>
 <CAA8EJpqN_T7eAOdLhK-P_0HCuChpE9JhPBg9HVJ=N1kKMbgDjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6y8AuMnUjGem/07b"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqN_T7eAOdLhK-P_0HCuChpE9JhPBg9HVJ=N1kKMbgDjA@mail.gmail.com>
X-Cookie: Only God can make random selections.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6y8AuMnUjGem/07b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2022 at 08:32:09PM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Feb 2022 at 18:45, Mark Brown <broonie@kernel.org> wrote:

> > I would hope it's a temporary thing given the namespace collision
> > issues...

> Which collision? CCI doesn't have a separate vbus power input (and
> probably never will).

That "probably" there is doing some work, and if you're doing something
at the I2C core level (as it seems should be done) it needs to cope with
all possible controllers and devices.

> > Do these controllers actually have a supply called vbus?

> No. It's a separate entity, a regulator-controller pull-up for the bus.
> So far we'd like to hear better suggestions. Using regulator-always-on
> doesn't sound like a good idea, it will increase unnecessary power
> drain.

Please see my suggestions elsewhere in the thread.

--6y8AuMnUjGem/07b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFTSMACgkQJNaLcl1U
h9DTAQf7B+mS4F78wTyCkegv74AJI88EqBTcIife7dRO0VW1+wWVLXfp6HHk3Xrf
Xg4egDtU41b8GPX+Kg179hoDRpFlxWnXxYe1Je9feSI8+SO1rgL/Q2mw26EmXf/+
nO5I1nVs9pxEXIE5IMcp2QVsPMH0Sthp0Rx2Ar+C+VE/1fTI0qHIiKBAhEsYMJN+
OtiJ8K/ITo1Iw2BRtpS9zyzhikg/TYowTmT9wGrsfatix/G4ljv34F1noVPpay9L
yuxi6ESFxDh6VctexLI0xyhoYqMs4Iz7GqoukVYuKoIESwkwEN/ADClOG6GRWZgl
G91VXDAakkPOzGcx+MqBGHskRFHu7A==
=Bgrj
-----END PGP SIGNATURE-----

--6y8AuMnUjGem/07b--
