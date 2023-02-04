Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F89068A8B8
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 08:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbjBDHE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 02:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbjBDHEw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 02:04:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301833EC59;
        Fri,  3 Feb 2023 23:04:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD5D960691;
        Sat,  4 Feb 2023 07:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2374C433D2;
        Sat,  4 Feb 2023 07:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675494262;
        bh=JN93OI468Pq5vFrv67NUsNRkkIKDhT/nw+2BHNcWjl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j8BtA73v2+I7jXyr2alef2JqWE0EeIkZzxY/WsUNPw2kSRpleZbHS7C073bAIZ2hD
         AAVc4DK1wvrVyUvUvLaQ/R0Xm01aX4xerWwX77GLL/DqHjrBjHCAY0V0jnHetMlp5H
         UbUMBK/to77cJO3rMG4zMVjAmcnEvNyMV2pqsclmypwk2nsxXuEmY33yORYQDjUvf7
         2J+Qv6yfpWC2Jc7fGjiu2mxeGeCpjT6I5ndtz8QBuf7sTMBHKKYbGD5SxOAWtS7aLB
         X3NnVZTWNn0IYr0uNGGcrDbViitQb5gaKxPpZgOI7zitwxjPXiDqsaQfQoPZ61+fAq
         /HkfI1txHvDaw==
Date:   Sat, 4 Feb 2023 08:04:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to
 linux/soc/qcom/geni-se.h
Message-ID: <Y94DcuAIe4kuhMXP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OrII+0Os16jN/lnY"
Content-Disposition: inline
In-Reply-To: <20230203210133.3552796-1-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OrII+0Os16jN/lnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 01:01:32PM -0800, Elliot Berman wrote:
> Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
>=20
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--OrII+0Os16jN/lnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPeA24ACgkQFA3kzBSg
KbYPew/9HfpmkSdGzIZ6cHygo1EIyP/lzY7ml5kSwt1VinA0plVn9fOGoONJgNYf
YV6ZK5tofsNwK18mwhAqQjjAFr6BAlG/G1z1TCgomIj6kqGaVZMIKDuIcZGtFaCA
4fuWAXi4Sb8MR/7gBfu+r4K/dRDi6byoTSsp32O1yfu2pl3dO+a9DHZCTBVumMHp
nfopYoR1w4qQkNbXmaIev15pxojqxfm/lanTjq3peyu7KIllxgMU+DlyGcoAJaCo
An7cqk30w0i+hw5ZEf7pq1y1wKjMfI0kNovtBH0WhEu27b+1IHjrnYpqG62E8WGk
1oe7R5Mb+iHoVZzhPTiUcarJc1sUuh8MM1knYuuGITj2w0TqTAQUWiWSWDx3q5nn
XEoVDhJHcZ14kv2J1QI0ZgXEHnYKDu2nUDUz29LPuEoEFoy5pMrxCLvKzZevoK/0
8cK/aYATxicSl1D+DE+Veq+ViOW6dMY1ljYHZ7Rzqp+dEukDS6v+Md97rdaqo6Z8
jqEkPMFSGTEWAYFVNIyPrsuwh+w4nDIoxfJRuavuVPfCRpxW4s0Ry3Nk/0tNOyyJ
SJ9fRUQqkw3QPBCgWcauHHDdVGnpRhfuLh8pYvQVUx0lC/qGGh9blxn3HrQIsdL9
M0BcwfbrXJC6UKjgg8N5PTkrhGsPGXr+Cvt8ZQ3+Q8o2G37MYic=
=JgIb
-----END PGP SIGNATURE-----

--OrII+0Os16jN/lnY--
