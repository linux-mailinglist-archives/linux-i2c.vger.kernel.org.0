Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F24B2BF6
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239912AbiBKRoO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:44:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243899AbiBKRoO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:44:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04217CD5;
        Fri, 11 Feb 2022 09:44:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2566B81874;
        Fri, 11 Feb 2022 17:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34644C340E9;
        Fri, 11 Feb 2022 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644601450;
        bh=IFd61jWOlKBQ190XNgHw2fdLqStV+uQ2eTHswDBsREM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4dyTjJij/LtaJepvrIRd/Ixy+uTicK9dehKx9p+sI+mLrNEKvdYHz4W5+a2MosFw
         xRl7P+kL2l0QEWPcbrQlWFE0VGwlH0WFVchCOMJ2EcnqrOLItM1iORRwJBeHd1u/tV
         0iFLm1WEfaIyZ+/P1DUh39tHaUggM4eATditXiwzR2CeV33cbiyj8IEdGnCUsNk4dn
         2NDwERQAVE31Y1g0ZRLkJm0OLNqPElYtMhqxnubtlbr12mzDH5wj07CshJtRT5/eO3
         Z/qVM0aaGp9h55VmZLdXnAA+/41wxXNEXLK+BC9YsoIGVN4VXn5q6zNHmzTIy5lFYI
         6A78umBRKC94w==
Date:   Fri, 11 Feb 2022 18:44:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/9] i2c: qcom-cci: don't put a device tree node before
 i2c_add_adapter()
Message-ID: <YgagZrzAampWcHhj@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T2UmiaJtY/PK3zj1"
Content-Disposition: inline
In-Reply-To: <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T2UmiaJtY/PK3zj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 06:47:03PM +0200, Vladimir Zapolskiy wrote:
> There is a minor chance for a race, if a pointer to an i2c-bus subnode
> is stored and then reused after releasing its reference, and it would
> be sufficient to get one more reference under a loop over children
> subnodes.
>=20
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-current, thanks!


--T2UmiaJtY/PK3zj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGoGYACgkQFA3kzBSg
KbYRoQ/+PCSt6GfLBcyp2o+lHYmjszrs70kqDMK305BWZdG8pqmWn0v+Dq3IamAL
2YIofo4pxEEwa+mJokUlz0tMm/nUNxf7jPFba4X0l4ekCFdEd+0KvGJ0Xh3tVgcr
uPoNcWG/r1Q5DCrB7PwmxEcE4ds/JJGAXwoRqHmDvY45qBChHmR5SaLNxJOGigLW
5MRDGUUL6FO2vx1A3HNFLSUtc0KIyiTGnUECkkFu2MnrsDYmSNPPT8OYKS/W3CPA
rPwz6O0xCjHN4f0dOWZthJ3C7ccBDUbEiG6mE4BmeVvp3xq0XafkM734Gm6i/1mx
7Mw/H6MzOa0f+alJ5mU1DT2fdLxP7O4vc1taOZ9QjmdTxWvfewgTYpDM9EcK/1BP
UBeMZ0GaRcub+ue+sjWHpOanuOhtHdJkl63Tq1O+7FDHZLYlvW/mMcQPcDCUNVyF
kQee78/YxPm9GU0EsVgYWV7UkB9raK/XpaaExZfW9UFC3mHVGvkzWIx6n3NIX9kV
5WRmWvBEUrBpE0JzjslEJLBSVp/Cj/trFnWC9i1h+sHkm7yxd+H6UKczwskMrxAN
P6X7Z81Czfj2ynhBskm1FEpI8zB6Ucob8LsH7EAu6BiCSx/E5IfstA9HLTBgIDF+
QpdytP+2ihocNkXU9oUQKXFJBGauU2prnsSz16yIzdTHNXm8zW8=
=Nb+K
-----END PGP SIGNATURE-----

--T2UmiaJtY/PK3zj1--
