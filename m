Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AEB4B2BFF
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242919AbiBKRpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:45:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352280AbiBKRpa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:45:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B55CFE;
        Fri, 11 Feb 2022 09:45:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CDDE61CEC;
        Fri, 11 Feb 2022 17:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AE4C340E9;
        Fri, 11 Feb 2022 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644601527;
        bh=GOd1F78K249wFhBvQfvObAQ9UZFmCeEmB1JZk8fpuNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IK+IASOfem7cLVD/Voz5Uc7HYRP3JAZlHbn0QBX345tL4FtYhk4O1QV2NHR6muYpg
         m9W37nkOrBmfWM/RVRG5McZzuvatEQHgjPB9Vgze94ofqMhAO7fkwMJM06cI/kYVat
         kjsZl1evvWnVzF8g0u10lcQ++EMRRwR+Fs+sCWkMF9qdWcWyx3uc1axK40VPXsvcUv
         8XeGCDCDs54YFe478lNhQhnq2oius/GTvLsqKZmQq2kNtVSx4IVnOr+G2hm0sASM4a
         s02iBxHzxec3hw2GXqzU4areq5/1f/t2XBUkTEpWvFxnTXfnJpqEYbbBqfPAfiVQeP
         YbmFf0MAfUCtQ==
Date:   Fri, 11 Feb 2022 18:45:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Message-ID: <YgagqG+SclUtLNBJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
 <Yf1rnkvfMGOHEeP+@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dy9dU6LGSZ9Lforw"
Content-Disposition: inline
In-Reply-To: <Yf1rnkvfMGOHEeP+@ripper>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dy9dU6LGSZ9Lforw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Fixes like this should either come first in the series, or be sent on
> their own, as it could be merged without considering the remainder of
> the series

True. Luckily, I found the two fixes and applied them.


--Dy9dU6LGSZ9Lforw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGoKgACgkQFA3kzBSg
KbYF+g//cTgpDd9MaJmeFVbxuc2l5cVR+9DkYVPKg20Cam03tU8j+/KORb5Dz2b1
TvPmuHndyut457XyQdLcim6n9vCKb2uadM9B+n6CVdLwJ1VPFgBh3ljkfwroFPJB
qrtZ7hP6WcyZG3Q7zm+LCnmZcspQGUPPtdPJMcBfLHUfPPhmWPNi2xGp4zhIL3bY
ST0jf1Yxas0Q7+KLk6L5d+30yifTgZy2xkhhU+PY3joJYtWnJWFB29lAzc/2s/fV
cSyx83P4SPk/LgG/cjjhtb25a2DneTiSagOFw3W2EBBF+kpYvCPDjf/UOOOwzikD
jv+Bn+X6aJar2b6OQJ63chAt+CGuLJt0XvcIMVgrmsd0+BV2KcwcsvQf+dNP8h3i
K/CbviYqjjIxl7MNYSMwLYY/3byNtLQ/fAiA+aXtFLQDHXCAH3PCYIWoE5wSMTEQ
PuNK0gF2zkiu5eOgCLoacMdv4uzKmTcR93I3alPMGRZRMx6sfRpRVsLRz7wpRVF2
pnj5EEM/ik3WwQiHWiPdLpKMJtb6OrZxVcdjqkAeiRkN3WssbUayX/WixQBoFiCm
ToMonhaJ9fX6u/FBoxZGDBrbEFUly5idwRLADx3ulv7hUBpkOPu0kGBYe8qYaNci
6WD3Of82wR6H2fEFMAcwBP/4Dv/4+FSOKWKV8t6BNVppbZ+1ZVE=
=OAJG
-----END PGP SIGNATURE-----

--Dy9dU6LGSZ9Lforw--
