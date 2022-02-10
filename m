Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325D64B11ED
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 16:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243729AbiBJPpA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 10:45:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239919AbiBJPpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 10:45:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331AE19B;
        Thu, 10 Feb 2022 07:45:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D303CB80E2D;
        Thu, 10 Feb 2022 15:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BA0C340EB;
        Thu, 10 Feb 2022 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644507898;
        bh=tcl66m9Pi0D6zW1GvnbKz/Fb0slEi4cV3BgHGCGw1yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lE97eKgNjYwGCiobK05Z8Ap9Ibw77Zcf+0ANds4J/2F5yD3MCe3nLMe7+pNmMo3Rg
         E2B3Vk7Kp3anyN3d9767DhDjMJzTeZSm2AapNMQT7GgLsyzSkxbRUsECJHg7Gw/hLm
         SxQZEORQcwSOsOkifILpT8X/qUwyhVz8lKXOmaWTlEd4og2GwujiMm10okfprFjFT+
         gGSpy3YneHmax3WcMG4cIlu+tSp4D3QiJj0cZagiGizgKPR+MB+exhlcMKCqT6ULMg
         3XmYA6PIXl3QeyRLMSkYOYaGqrU/JJkSzteZsuijpYAVnfH6hRmfuZt1SYHECxsbMK
         GWIHYybw+FiYA==
Date:   Thu, 10 Feb 2022 15:44:52 +0000
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
Message-ID: <YgUy9KMXocSqnv7b@sirena.org.uk>
References: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper>
 <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper>
 <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk>
 <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
 <YgJoX+Ajgt4dweQJ@sirena.org.uk>
 <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mQu/xDRUKtLiY+XB"
Content-Disposition: inline
In-Reply-To: <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
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


--mQu/xDRUKtLiY+XB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2022 at 06:33:09PM +0300, Dmitry Baryshkov wrote:
> On Tue, 8 Feb 2022 at 16:16, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Feb 07, 2022 at 08:31:30PM +0200, Vladimir Zapolskiy wrote:
> > > On 2/7/22 4:39 PM, Mark Brown wrote:

> > > > The bindings are ABI, it doesn't seem like a good idea to add new ABI as
> > > > a temporary bodge.

> It's not a temporary bodge. The i2c-core piece was reverted, but not
> the mediatek driver code/bindings.
> Vladimir has provided a replacement for the i2c-core code handling the
> vbus-regulator. When thee code will be back, the code from i2c-cci can
> be removed. The bindings will be the same.

I would hope it's a temporary thing given the namespace collision
issues...

> > There's also the option of representing this as a separate thing on or
> > part of the bus.

> 4) (which you have implemented in your patch). Add support for  the
> vbus-supplies property for the I2C CCI controllers.

> This is the option I'd vote for.

Do these controllers actually have a supply called vbus?

--mQu/xDRUKtLiY+XB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFMvMACgkQJNaLcl1U
h9DqOAf+N9eVVB/3/qDiyqVMsc48KOyNdXXFWEsE6h2qGs3a3mdmfMUkPdROdKFF
A8O/S4/xCGJ7KEBbuvP/wrW2cMzkARrucpiMWigjgEUjcvhICOxu41s/7xIhcnHw
BMa/C4uwRgheMOIc48OSqJ4PfPCCxEqouNSeoG/yFKlhe0+vZBt+3hU0rRNs9+5g
eJru40piad67wrY5sBUSly+/PIA5PxmccOhMKYKp08YKJrkaAu2D1yPYoKgJhYwo
N+QRrt0hUnynsI9oP+xm/Jt17FDtk0C9ZynBrMAjTYaIew4v+aPgcRm2xO7qZfbe
BAk9AwzGFg7HdeXUIpwzuGc6PA12Hw==
=yn0h
-----END PGP SIGNATURE-----

--mQu/xDRUKtLiY+XB--
