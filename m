Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F9D605140
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiJSUYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiJSUYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:24:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA801C25FF;
        Wed, 19 Oct 2022 13:24:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E7FCB825E4;
        Wed, 19 Oct 2022 20:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88748C433D6;
        Wed, 19 Oct 2022 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666211044;
        bh=cCILwvDcwIgTYkwNHwES8Ev68kTYaFfHYaLNe158ib4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMnsLSrsZtYj0BS6fy7F2r7AeJJsG0EY+x4g2B3ZxvFABxNmeDXYMk2NIHno5odJM
         85qPOzpUef011xb/ept6SDNpII5Wlv4FnGvAdPSJKcQE04K9QUPDIb7XVbmLS9D4VX
         gHRgKKvQYUXyG5WDSA3i9w4r+8ya/ruzDajHaFi/rFuwd+EiIudSP2nlDfx/Kvl8dW
         nfma2XdwQOAEK8Iuf4NNd9Sp1rI+9eZQp/F7DZYQ7MkVUmY0Q9BpwdE2scU2+VjI05
         4Cf6NswUegMUhYSYds5/TVBjkPOsrqatnL41233vHCcjdB9P/1fAyRSvDKxh3tY5bH
         Ghp7ut5JQ3vNA==
Date:   Wed, 19 Oct 2022 22:24:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: core: support no-detect property
Message-ID: <Y1Bc4AjlZPs512Ao@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220429130749.3032462-1-vincent.whitchurch@axis.com>
 <20220429130749.3032462-2-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jGRgju90hTLJOk0F"
Content-Disposition: inline
In-Reply-To: <20220429130749.3032462-2-vincent.whitchurch@axis.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jGRgju90hTLJOk0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2022 at 03:07:49PM +0200, Vincent Whitchurch wrote:
> If the devicetree specifies the no-detect property (documented in
> dt-schema [0]) for the I2C bus, we know that there are no other devices
> on the bus other than the ones listed in the devicetree, so avoid
> calling drivers' detect callbacks and wasting time looking for devices
> which do not exist.

Setting 'classes' in the adapter struct to 0 (actually to
'I2C_CLASS_DEPRECATED' for a while) is not good enough? Or do you need
class based instantiation on some busses?


--jGRgju90hTLJOk0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQXOAACgkQFA3kzBSg
KbYcjA/+POKwJXKclHSpoOvafCd+yQvQU3RAwBHUJmcLftsHxdkub0FOH/g/bECi
J3jr1SkKGA3Fgt9lNkfmuZbO5Z3DFIwevneGWL1ftWomspQGhFvzlcCvScSJCQkO
TJzB2+bHIoQrwTG/IJuPNrKRTlA5JgkXZVqIcMtp0Al3KatT2vi4yeays8jTQPU5
RWfb19E2SvVOEBkUxWzd9Y76yrtQIuFxLhyLXT3FEa1Q5Gd5/HC51vcGZoM6uzL4
erGgaSZ7Hm1IcOC+MMKu5dLePpIflbOghMwTGfxtlpJR5SNtKF1RTxJk2u9dIPCt
3Ycoc9Wpk1TOM9VNN386GvCVg8CL2Mzen3nveCHs+32IX0N1Ab1JrnaP6V4gq52t
7fnAdAbhv/fvtmckc6DS0KdhSDMtaCA6fQ+tzRs6HlQ70RG3ml+Y+ffhYny40RLI
Njpz8rrCPw6dbkGpekZFgB3J34iNO4twHKr2imvBPw+hqGrRHIMwZXzwihHAiSoS
NgYcYqxWCj9oPLuP7iWZHj59a1J++3LWsueoiV+kIPhRsoFE2mqijGkUNGFOda0j
1ZydqXUCJ+PPceGY28ABuBhmtIUmkRbgCfD6cp0LqJyCDthez4vsOA7bEPQm8kPW
SlGGY1Tc/FacQ+Yzf1jeHeVfqxe2tzybSFQzEc8l4Bm2jSSVIR8=
=401U
-----END PGP SIGNATURE-----

--jGRgju90hTLJOk0F--
