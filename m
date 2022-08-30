Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2675A6067
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiH3KMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiH3KME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:12:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73D6FB280;
        Tue, 30 Aug 2022 03:07:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3DE20B811B3;
        Tue, 30 Aug 2022 10:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB06C433D7;
        Tue, 30 Aug 2022 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661854072;
        bh=oQl7P4O9Ap7vXrSdH0vy4YGahP+d/7BxwNMNBSPJM68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M9hSQW1vut54sz+8zvDS6zaoGr4sDfZuzMY2gqWJWWyFEJzNrXTmM7q9C6gUzy8fc
         0L+51FzjcYlfTOjkFkkNR0R14JA9nTFQV0v3ZFFxbV9Tuw/3yCed+U1GIeKowp9HJY
         IYC7T0qKi7eMDyKJPbNlf0+E47mr3akaprTBR8CbVh6C9wcO4051YX540QqDxd2gsS
         0hg3k37OxSYqWHVFXezFCEBf13jFxj7pRTiXJvYj3A//DDcRoQA1PeVHqY6ZSeNRJu
         K2lJF3H0jLjWKRXHNlfHASuyrJBseYxxdi7vXxOGCsFrk12FuILxaYbqLfhFE9N2wm
         FnMp5PFTqskIA==
Date:   Tue, 30 Aug 2022 12:07:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V3 3/7] dt-bindings: i2c: i2c-imx-lpi2c: add dmas property
Message-ID: <Yw3hdfEd8VHMMmyY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-4-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uNdzxZ+fY75/S3CA"
Content-Disposition: inline
In-Reply-To: <20220823030215.870414-4-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uNdzxZ+fY75/S3CA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 11:02:11AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX LPI2C has dma capability, so add dmas property
>=20
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next, thanks!


--uNdzxZ+fY75/S3CA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMN4XUACgkQFA3kzBSg
KbYTHA/9EBRN8IIMpix72CjrVX792w6FxYkf6OvV4QZsspi9cg2VRfNqtl8QTtSu
P6to3uFcoW+6WPj0Gvcd/wluVVaH3UCeRZs9YqZpBjTT5REL8AlAT3YQEuoZy33X
c9/JvmWYhpkRVxGWaQOutl9fRtJp6goK0Tu02s6rHFPOjPtgnlHeFiV5YLnhCd/F
6lGPcHB7iOFfKDfoFR2qtxWey6DbgABcihu549CC4k09MVR+QOYuZy9ccNEQ/sQD
Zm5G50ZxoglyoMsRKLnzN6+Us5JFuyGxz9/zOzdhzcBhQBLJqMd74u0sbyFKe5mZ
kqTbiYq2DkLQfSrcdv7+mVcSrfHVBzJUIDQ+g+tiP3vQS/Wb16zXT8PsYBxEEFd1
4ALzG6qMDPnIYvxoN/rifRQgyp+rvJH6OC0cwNwY3pqLhQHfBxm+79E2XLz0j9uW
WDqSZj0EyNr835UpwpMgaPeNYt7IgfpkVGhhoH5Q7Ra83qn6t1yE0HqIttyOgPuf
NnFhs/7kexCG8sCR90iXVad0vgz600BV0tdjV9pXXKS6B/LVyvfRjWRKo5gstZpr
ckHRS7djKGrsQRzywagEhoYl7JtUgce9w5rdM1Wd8r8FcNodCGl0zCXIzsjZ8HOj
UNG9EjGoKhCLzbsCm6rO36ymMepUTcw8jn6VpHcZu2NbxcEg15E=
=pKZe
-----END PGP SIGNATURE-----

--uNdzxZ+fY75/S3CA--
