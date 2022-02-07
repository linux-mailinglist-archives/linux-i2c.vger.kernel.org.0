Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E35F4AC256
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237968AbiBGPDO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344888AbiBGOj7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:39:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFC9C0401C1;
        Mon,  7 Feb 2022 06:39:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96D4EB8112E;
        Mon,  7 Feb 2022 14:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B541C004E1;
        Mon,  7 Feb 2022 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644244796;
        bh=KEW37Vn+2cncY49KIS7D8oNYHpFzch4EB7d0Q7QeRPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MeGzrROZZMRJg4xl0aSowKugN09rsNvvnbp4X1900GGg3KfcSeEJXtaxZBLCFEkK5
         OK93IOZOvBQNbxwN8yfiSdjcYGyWjYhIt7rZQmzLZ8LFWenpxsyblPuK+95OpW2RQa
         AqcA+6oqCztzfkp5YZlbARZ8vh8jcwTIjb8N+mJjijoQqUmH0aOCuPODb+mVQTFFcl
         S3Mg3ROU+Hyf5/MJuhmLFFMLVI6QdrpLjOUST6oeujlKdGAReo4+UQnmvJIhQKyzAw
         L7JzFeWV3ZkuGXilFg8HxzSkIaL3HymSMxVKteFs6iFX24dvTzws7fi2vNd1HBqAEh
         JUO+Qafukj3Cg==
Date:   Mon, 7 Feb 2022 14:39:51 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <YgEvN0lXXu4lDCN5@sirena.org.uk>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper>
 <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper>
 <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="77v6i4keSC7gNdpP"
Content-Disposition: inline
In-Reply-To: <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
X-Cookie: Never give an inch!
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--77v6i4keSC7gNdpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 04:08:01PM +0200, Vladimir Zapolskiy wrote:
> On 2/4/22 9:32 PM, Mark Brown wrote:

> > Oh, good.  I forsee no problems here.  Probably this is something that
> > should be in the I2C core if it's going to be dynamically managed,
> > though just setting the supply as always on is probably more expedient.

> vbus-supply property has been added recently to another I2C master controller,
> see commit c021087c43c8 ("dt-binding: i2c: mt65xx: add vbus-supply property").

Note that some devices do have supplies that I/O is referenced against
and it's not clear that this isn't what's goin on here.

> It serves right the same purpose, and its handling is going to be done in i2c
> core, however since the latter is not yet completed, I would propose to add
> the property to i2c-bus subnodes of QCOM CCI and its support in the driver,
> later on both the property and its generic support would be better to see in
> i2c core.

The bindings are ABI, it doesn't seem like a good idea to add new ABI as
a temporary bodge.

--77v6i4keSC7gNdpP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIBLzYACgkQJNaLcl1U
h9AZnQf9EBbe+W5UTJ58SN3Gpo0BI23htPJNTI2R5EO1t8pAc7fps33bC4FBr76S
e3GF59XlxIa+y2O+z/7WFenvfBs5YK6GD9a7OK6mFEs1YWDZ21KwqqqAR2FU/44y
vrCys6ppaxHFyzmCb5ZBNpk2uZYj+RI4IadtYECMukVT1/a+HOnqadFmLWH8VGjE
+PSBQKw0uCMr5yQWmsclbWLxo8e9fTvdq75dCwIouZdQtBzpx7xp9xgBdLEnLnQO
+l1dkjjk919CbKOysa7+B7Jhx1ZiOBQE1ee9pAWHD2c09WaDfexAsaMkgeovZt7O
9CFtIDrevwLJ3wdtXKwPNfdRSy/HBQ==
=x0wC
-----END PGP SIGNATURE-----

--77v6i4keSC7gNdpP--
