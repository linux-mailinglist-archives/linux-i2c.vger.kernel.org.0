Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA434B1535
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 19:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245693AbiBJS1A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 13:27:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245677AbiBJS06 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 13:26:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6AF10EA;
        Thu, 10 Feb 2022 10:26:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8D41FB826AC;
        Thu, 10 Feb 2022 18:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AC7C004E1;
        Thu, 10 Feb 2022 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644517616;
        bh=ziAbJxhqad1AAWAHbpJ5j1Jn4qM+noPapkkTXNMaXnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nsJR1SuklYUYhDWvbjKzujQWJbmqykAb0FTHYAvdTLTGzCq2B/jgpLPzPDtt13Dr3
         cRr27gSRDssWbnUIF38ilh0NflpVfMxxSYhqZ46uAicY3A2R0UMw3EA/aZmi8dGjnq
         4grvXUPt6686Y3oXFq9Sxl8Jvl89rqoy8/AflKyhb49oBWmmxfNB5cY7m5oe9bprv4
         glCn1QedSFgujTYIh/Eo5UO8uGnuvFgv1TGC5tIWSGB96PkHiYggKdFGNeWBHe/PMv
         V7tI0Wbg5UghWrR1mNdh188oKx21vv/CZXrurupuxoe0pKobFveFxLOl4wLrTPwCFI
         TftdoAFZvsAog==
Date:   Thu, 10 Feb 2022 18:26:50 +0000
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
Message-ID: <YgVY6t4OknBR6ySW@sirena.org.uk>
References: <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk>
 <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
 <YgJoX+Ajgt4dweQJ@sirena.org.uk>
 <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
 <YgUy9KMXocSqnv7b@sirena.org.uk>
 <CAA8EJpqN_T7eAOdLhK-P_0HCuChpE9JhPBg9HVJ=N1kKMbgDjA@mail.gmail.com>
 <YgVNJHTQufLu1sM5@sirena.org.uk>
 <CAA8EJprrhame0zG4=4cFF7PBS0c9synjStLBingk58y7EJfV6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jE/kXnN9f5u27+DW"
Content-Disposition: inline
In-Reply-To: <CAA8EJprrhame0zG4=4cFF7PBS0c9synjStLBingk58y7EJfV6w@mail.gmail.com>
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


--jE/kXnN9f5u27+DW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2022 at 09:21:42PM +0300, Dmitry Baryshkov wrote:

> Please excuse me. I missed the e-mail suggesting to move support for
> that into the core level.

No problem.

> I'd second a request to handle the adapter->bus_regulator in the core code.
> Would you be ok with the 'external-sda-scl-supply' property? Would you
> demand that it's completely handled by the core layer (including DT
> parsing) or should we let a driver parse the DT property?

I'm not super worried about how it's implemented so long as the binding
is good for the long term - if doing it in a driver helps get things
done that's fixable later on without breaking ABI.

--jE/kXnN9f5u27+DW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFWOoACgkQJNaLcl1U
h9DLEAf/cuojzCUaelKlfbfBuyhldDUpryJpj4g+FQhgAUHPkhlsuJ74H/9Zjouj
zDGmrpMZGN0sOcwcfCyKbtbLHwQkXqLmDrI1Ju7SqRDmjIEsUE+05tioG8GZ+LCs
rbwn9rgc83CnhCJ2Bfc6Ccz2pnAagxMX1kyKrgpxqAe3XONpwfz8xppPoZvpdwke
0dMOdxifMh3LEN+BNFaG4bbUL6YCyWPtuGv3wyh5SWs6SgND2VFVpaNdn2Bt9K1r
IMpngWl7rdZYQXwjpdAAKGOukS07VlSqO/7Y8Vh75/TaJTPUY/IPSvloxWfSIkHY
HqbK48AX9fUP1CRq+U9YDGrOF4lxlg==
=LTYj
-----END PGP SIGNATURE-----

--jE/kXnN9f5u27+DW--
