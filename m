Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336BD689F60
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjBCQfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbjBCQfl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:35:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BA31286F;
        Fri,  3 Feb 2023 08:35:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C8868B82A20;
        Fri,  3 Feb 2023 16:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDC7C433D2;
        Fri,  3 Feb 2023 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442133;
        bh=hQ58v6p/eSEbQYsGli1/mxG6OlGuGGviQKOWLmNLklw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i5gWyRZDXNuHTYr/L3gTFPo1Sz1arTfFu+Gl/bqAq0Norg5LYHbJ0Nj6f7o95paUK
         A39P3BJALaOG25+bYZ6tyas4bq3m1yYwTOEqUGEb/TM7GUtoAgpi8/lJ3wT0wISCZ3
         GA2KI4LSg6Dj0weth/C31BVI7eIr9qyU6Mjjt6X9byqkKVh7z2LeW6gqnftr0tuJVo
         yd9sEt107gC+kMo2vD/iLGS811/Uh4H4gkqyev1vKUw5glEIs19kkicIDDCQkufzgd
         ic1C8XYlgEkBs+dCdB0TjEveIcaBJpTDTciNyv0ETmdF4raPJKYZ9pTjE/ZAC3sus6
         nQVHDt0fJEdGw==
Date:   Fri, 3 Feb 2023 17:35:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 2/9] i2c: xiic: Fix Rx and Tx paths in standard mode
Message-ID: <Y9030UKPcfMZDUa7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-3-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KBBv4OOxOy56buWH"
Content-Disposition: inline
In-Reply-To: <1675330898-563-3-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KBBv4OOxOy56buWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:31PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> repeated start
>=20
> When a combined message request comes from user space, the
> controller has to initiate repeated start sequence. In standard
> mode, this repeated start sequence is corrupted if there is still
> data in the Tx FIFO.
>=20
> So, always make sure that all the bytes are completely transmitted
> out of the FIFO by waiting for TXEMPTY, if the previous message is
> of Tx type.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--KBBv4OOxOy56buWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdN9EACgkQFA3kzBSg
KbZrbw/+IUHduOzXsT6Yght/UhLb1IcuHyRSxmYERJrhDpc4N2r65T3UrqrzA5br
PlZOZRKMqfh/RmfL/L839ykbyAO2NQj2/6tsefTuTkRx2h7gAIYvh30iYCRR67KZ
XPvUDPQmdKmZ0uein52W66JGFPHulI0LXeHSxlIUKjm2jBSZ/iAbrU+/idssS/Z+
Tc2wZrHSZmS7Udveo/cyBp7pyzDjJZCwn0Q/IHED2iIeRDfpOGKF2/IDrTihGV77
vs2mPrDW2tWRdSsF/GYQSwU92ZI7bWorbTTUXr6p20edcGXAst8Zsm4h+bSQO5wz
VV7KBSJrX+oezxqCCVjL488KwO/6OJH7FPaeKK4TOeGNrPw85SyT2u9iJEON0gqx
FGPNAJlWGc+H6JjkqEhEo9Tu8GStTjVJtbXmJIa8rKoCdXiO3l+PXmat8rh1vaQV
VYY/rZGBx1CxN7f54CsrOTkVue/G4Ym4IQ18ruPnPoOCmOzh0BvkOOfWUxTfbHDC
R4KNgPbVxAdkCFwaY5xO0+zAZC2lgh39UWDaIYWntX0ljadV/v+2IEYnXvwEk/6f
vKGW7j/X/GR6TYZqtzrLnDa7wqAY7EtQ9SjUVZbV49eNI0pj5EGE6D6E0ZjY/5Bu
2WvXwcyAL/NI5V/iYGzIzGeFHf2/EXlSRS9w21C8SwPJwR+YXPY=
=ahrS
-----END PGP SIGNATURE-----

--KBBv4OOxOy56buWH--
