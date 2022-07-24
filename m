Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B77F57F350
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiGXFPL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGXFPJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:15:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1578FC58;
        Sat, 23 Jul 2022 22:15:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A03C460DEA;
        Sun, 24 Jul 2022 05:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B47FC3411E;
        Sun, 24 Jul 2022 05:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658639707;
        bh=OU+/ycy1CnOQTqYsK7MUx1kOos8EDuG20TBa6Smpmt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eLnahQ18t2aVEGJT93soPUPHfapdJbuBS3+mPUKMVwhpOqAFChPbFQN9kuJbOcmd1
         RUTH7sEiZZuTn6+WeqqGBqlQ/9YDqddeMYR+h89hHmGokuwPJHUJQrg1nDKZH+hCk/
         jgElEQoynzh9ACL7VlkqQBLuuOrmVlKDHLR3NURamGJgFY2oltqMPUp8C0nIsBbzBN
         1OFQgd3br5rU/ijN5JlEjO+8rczHLRPzCRLUoE3/0N0wqa2WTnE1Zagep0HkG2D53X
         sS5a5jEka/tdsOOAPAfZa8VllE0sG0qZ7bE6lBoiyTqCMizTaFv5TiYwsfyDO0viaT
         heqNygB2oQcmQ==
Date:   Sun, 24 Jul 2022 07:15:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to
 geni_i2c_abort_xfer()
Message-ID: <YtzVVpvRXV01Cfw+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-3-bjorn.andersson@linaro.org>
 <20220719205054.rdhinuwxgabbsiht@halaneylaptop>
 <20220719205738.j6cxwuogbqtqfjnw@halaneylaptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="erDM4iMZfiqgpfko"
Content-Disposition: inline
In-Reply-To: <20220719205738.j6cxwuogbqtqfjnw@halaneylaptop>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--erDM4iMZfiqgpfko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I guess one more thing, does this patch deserve a Fixes: tag? If so
> might be nice to make NACK not so loud in this patch in case it gets
> backported without the next patch.

I squashed the two patches to keep the NACK behaviour and ease
backporting.


--erDM4iMZfiqgpfko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc1VYACgkQFA3kzBSg
KbajbQ//VwG/3UTIvFNHDsDHePcPqZVaDR+ZigUFAtfgfpjws9umH+R3Aa8KewWJ
3DeJl4kbDfcRMaCeiYYlqvSwXGqRvPEFL26p0x5jDIVOSSPkX3XqN5p8hR69hiib
i3ZOtvMDFNzV/wLsC1KSOTmaeYhR4XsEaZN8O7FHQfiNqFBSXZHiKGN8ofR4ONQ3
I0NIruESqwdzSgZTfEr70Jz/g0JinhSJoFrzqFo4qCknik78Tf6ndIDS74b0WF2q
kCDke/rrGvEcZez7zq4Xe9py6DrV7u1HBmFWze/2+Uw0cJAO0Uma5nGzV5C/5HMQ
XDpSKCFVqskDjLGRBou8KsEMF0gzz+NaOT9palw9EVJ0qfWNLd0CmZRkGwCKJitK
kbXJjxFvRPprdMIs7WSfocjdcPoYWwDCU107IBUhL9pA2veew4I0C9DwpB+Rf2lP
rseca3UqGpMRV1LHewwG91KOLnCnsEHFE2TzaK79N13SQjQPevCuKsxXdEouScGv
iV3zCHOoBOOvRcKrUpGpDYzTXYTsPUje2Qb2/WtzoD8AsqteH/r3vkN0yRCwMzDR
VLpbao5Bi9QWQjNnB8cbiVWq7j7CYDI+l3CifnKg+hrZc0w3bMUbBhug+Z0Z1pdp
VveI4C0aLpmUrsp7NUFtBfpkWmPXQa1KdF+ae6fgzEggN1SwuME=
=7Rv5
-----END PGP SIGNATURE-----

--erDM4iMZfiqgpfko--
