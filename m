Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C9D4BB5E0
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 10:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbiBRJpT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 04:45:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233759AbiBRJpR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 04:45:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657F891AE1;
        Fri, 18 Feb 2022 01:45:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0319661CC6;
        Fri, 18 Feb 2022 09:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6849DC340E9;
        Fri, 18 Feb 2022 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645177500;
        bh=LT71l6gwcGH1NnbC9kIG8tjwGrUTGDrTwjaoMyi1uxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZUbmDCEeuGxYM4CR0GkyPvBPp5BNDCuruzagoA+krCxt38WdV2BnZgVYzLsc8gYOm
         /PO5V0eYlXVBHyMGhK2UDUGWcI/fRS9oqXE3S4s38GYqd4bIVf/lZS4uxLijj/d1Pr
         wYSzZI0JgmdoYsm20U46c51H+yq13RoxbDxFAczk2vJrOBJD84MFZgY74A9DP1LagP
         AFyNQEivgBbGgFPSN0Aq5AcY08pL3vmW2oAk+A92Y9RQ3hw9YPnAP2S5nMqTymkB8s
         o+7lOaAToehKx7kF8QaTQNw6sVcFYFGQZQTgvDnwU1tmZyRP+iSZ2AmErZHIGYA1LY
         MymyNTjGU8HFA==
Date:   Fri, 18 Feb 2022 10:44:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     jorcrous@amazon.com
Cc:     linux-arm-msm@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix return value for master_xfer
Message-ID: <Yg9qlwvh08tXDqTv@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, jorcrous@amazon.com,
        linux-arm-msm@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220209210356.2848-1-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5Tqk2YBQNjoACgSM"
Content-Disposition: inline
In-Reply-To: <20220209210356.2848-1-jorcrous@amazon.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5Tqk2YBQNjoACgSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 09:03:56PM +0000, jorcrous@amazon.com wrote:
> From: Jordan Crouse <jorcrous@amazon.com>
>=20
> The master_xfer function is supposed to return the number of messages that
> were processed. Both  geni_i2c_gpi_xfer and geni_i2c_fifo_xfer are
> returning 0 which is being interpeted as a error in the upper layers.
>=20
> Fixes: 8133682618cb ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>

For the record, this patch is not upstream yet and needs to be folded
into the next version of the GPI DMA patch by Vinod.


--5Tqk2YBQNjoACgSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPapcACgkQFA3kzBSg
Kba0tRAAnxde9VTJoRlopJGPtr4GN0tlb1xWoJJcnHEj3rYjSVsjHUvEDSfJ5SgA
PNr4/LjT/R7XhNiBhYPjkfb28/m4JvA3N8ygPKU9zPJOM87O/hKDPrgc5Kr+9I/t
NipCwH0EGTfUbuqRavL0hBHsiclnq1u6ib3+PY/gFCT17l4CVNtJ4Rwx3X3IfB9z
8ixcqQ6uHUlPEj3qJGG9mZUD9bvch57Y53LaCRFvx8SG0VDvlMnHh1uXZSpA+I2Y
kPjjvuuMncAdkZWy7mvU9OTa9gzOs47Fv34GEklrLyt3D0WBpF/3N5JSWS1mNrBt
5KPaBXYBa/JYdP5nlocFT/dl7B4FALQuPzqD4Pcu73pOmGeLBqgm9zFO+5NpihA3
bwQc419am3q6fZAA2Ovxq3PjFN01i5Wbd1dBWVe6ZPDyDVEJ5GVblStTIMKqlKbZ
hNVLeuUJIM+sn2eYXIr1K1z6CqRBE3WwaaFa+BAlbKMSdFSwzmifHW+DAlqGSHLI
OUzhUHjfuP0i+T6wIkNGhuSfHbrEc4SKM3hR7QVwFiJB8YQ0ZKrUNNMSsvt/V2/w
nxPEBomlHELKic+B4cVCUXuhHK2DTt/bKLMdUq3I8iMDrNSi5w1bRQ1ULMd410lf
cO2MLb9F9IKaQaKChN1/t0QNDyZsCuXU31nImUVKGYIt94sD0uo=
=NXEL
-----END PGP SIGNATURE-----

--5Tqk2YBQNjoACgSM--
