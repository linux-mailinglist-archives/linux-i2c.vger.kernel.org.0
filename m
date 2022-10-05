Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96615F5A40
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 20:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiJES6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 14:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiJES6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 14:58:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69EF7FE6E;
        Wed,  5 Oct 2022 11:58:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82E2C6179F;
        Wed,  5 Oct 2022 18:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B16C433D6;
        Wed,  5 Oct 2022 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996326;
        bh=n7O7fuFCNcqKErNMDLiS8KjniuLdjlxnE14HXanVpJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mEuOUSJHKnSj8yMDoRJO4leNAorMhq+cX44wDN02Ub7yqy6PStBRdoHeCSwgxSgKv
         1ugUlW8tJL6w5pgRh8Cq00lfid/2+RFNfatZ+Upn8ONgXV4OG0vszwjTAPG6zMxW2v
         adRVrUYPAgPuo39COZoOdMklyu4qIrQBjPHsYdVXR1G/WzuERacB/UC/h7rSaxdz4w
         qfROncpf5pqFgpzcFCLD/SaKnmppUcJziRveDfLmqwmeiscUw4NyPvSRVtLmz65Z0y
         qPfKzy2E9WitHgBvBATAxyqn9iV0jZ3gvBv2gxrJUm1bI3bl3ik+64E6cpnp1kn721
         rtLsyjakwaasg==
Date:   Wed, 5 Oct 2022 20:58:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: qcom,i2c-cci: Document MSM8226
 compatible
Message-ID: <Yz3T4l1yliN8ZEro@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
 <20221002122859.75525-3-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hYeuC5BGX0gQlldZ"
Content-Disposition: inline
In-Reply-To: <20221002122859.75525-3-matti.lehtimaki@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hYeuC5BGX0gQlldZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 02, 2022 at 03:28:54PM +0300, Matti Lehtim=C3=A4ki wrote:
> MSM8226's Camera Control Interface has one master and 3 clocks.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Applied to for-current, thanks!


--hYeuC5BGX0gQlldZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM90+EACgkQFA3kzBSg
KbY7sw/+OLNnFQanAAmOtnFzGaKVoWegV7Qa/M5fFuLVkqUlYSiBaV6SAa8sJSNV
umDDImz73EKFNWYPVmiw9r0VZlNXKzJjR1qnWbQybHM4WefkSMCpShgquBM1hAxd
XJPQeMKMdxXk2f/AM/jMLBXEKckevymQi3Rra+Tr2Qi9fbKhxRzHbrME4R1xEb0U
J5bF9Kf2F7NreDjQoRiGk3KDyPIK7b1kv5YrHPe8pxSDqpGn+bGwH8hZuC2OaYLN
KLRCGIINrmZu2FKAQPTsmc0IV5PVCIfgAIm2zV1D2lNF6Js60KxQo9g4S6sMRiqF
UBWGQ6FOlC8PmpUCNg6Hg1Y4TylW50lMVNCeDKThwsgVoeMvtzVoX8fmLororheJ
RMcGnhreOaffOeegXQ5/gYFOYBA+xwMEfwav77aOJXL/sCRrqLy7snVWy7wVxZzm
lVUS1pRKh9bMHNd12s3I67egPOJEmiV05eXBHkSIlyqmqnyOp3yZl1XX5PZ+zvWg
sLubdaUhJCl+RzjtjnUvunWvzX298UPjmiNAVWK76vLy2GMPE2ZD858qFx9SpfbS
UfqIW3SJE/AtUSRLcV3o/AaYuvn2yTRjKw+HmRNVZVtJ7Q7dIsIhIDm2je94TXJx
dp8rwzegrpwc76L1cG76gWfRUNT6/OX6y6cYpsNT28ahlXAnbv4=
=+SRQ
-----END PGP SIGNATURE-----

--hYeuC5BGX0gQlldZ--
