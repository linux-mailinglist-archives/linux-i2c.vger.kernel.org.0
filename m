Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7746562A374
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 21:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbiKOUxR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 15:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238534AbiKOUxJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 15:53:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E7B30544;
        Tue, 15 Nov 2022 12:53:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4201617C1;
        Tue, 15 Nov 2022 20:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17C4C433C1;
        Tue, 15 Nov 2022 20:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668545587;
        bh=xix7qGSZe5Jl75liUDWPNa2To8YhX6K5xaN0+29LycA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jcDE2u79xGa6akEBQHAP2LtAacwlyFZb5F4HipKkJeJeuB1MqKyXax3PL2hQPbFeP
         nD6ZFhNWF00ECB6W6BDZLFXWoHz8d2gutvXa4bViaMWE4P29JI850znFObL3lN3h/n
         jeikIwf3Cst6L71l6BcgVxjIk9Bg8mLONyQ9h+I4MAM42ZTAD+loH7HUyz0epbXBXI
         3HxribkLH0DdIKjoQ4FuuuJjvrxyLZSIzcGUMZJGJJ6tZLEphQPQniy5awO24DOPpA
         LFwjQj97bBiF44JNZPUZ+qrmmypneqPmQS7uEVCODFHAPJcuWQoy4HNfLt1cvEAS2n
         Fvz3O/SzX20Jg==
Date:   Tue, 15 Nov 2022 21:53:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 09/13] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Message-ID: <Y3P8MNxuGnsUMtCy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-10-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P9ojcTZHksKM/pfV"
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-10-waynec@nvidia.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P9ojcTZHksKM/pfV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 08:40:49PM +0800, Wayne Chang wrote:
> Remove the property ccgx,firmware-build as we have added well-known
> regex cypress,firmware-build.
>=20
> Signed-off-by: Wayne Chang <waynec@nvidia.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--P9ojcTZHksKM/pfV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNz/DAACgkQFA3kzBSg
KbYXCA/+JyumlhvdQelQ+1dRI1Iz7WsTCLrStJKUFlyj8JcxlGeR9Rg9KGjpf/Go
/7VhPqydV67ZBElkxgagTg7eCqDFu6kQo2AYURxQaT+oAOtWkCSGXeeaIxpUNBxj
PHJ7mmGmzTDsz+xRyNvYXqUYHBvXiCqz6ntnAz+DWNuah3wGPlBzVPlNWSPAwG4b
v0w780R5psx2pUSyNEwVIE3v3TrdG3BrcBpvCDycKx2ygAkKSvk9tvpn+8iAbxft
MUV6zvugS86t1aBQfsAE61Jhjw0pncaAW6GrfKyzU0kUx3mMQEave8f7kqmoAdap
+0EWOQ2yIwDe9dwRw2o3qs8XIYJDMmSboDmyyblbPnUJJo9wvcuY5D56ExVXyKs/
KXR+VK1aJCVS6XLKI5LnlO8H/0dSXgWgQpU5WqJ0uXo+t3l45NOgWZI64yOW15D5
SZJWKbJu4ULGAOr+hEcs6UpdVaREQYZmL7WqOGXsEJonxaw2j5GkKblVsIrASsma
JESKRN1iN50Omv5BdRTaw7meu+2N/cyDzoQrWsYXPga8OFVOtf9oi/EjxbcuEh16
2cmct2z6TSMuxr9DwtEMhZrFMdruSZrVYZevqBv3zni3yf2SsBjLX6s3eqkqK3FK
FdbFSaNvy63nDBJm+gXLpTqROtadqtcTLqMNmhc5EDzXjlN2v1M=
=XGbU
-----END PGP SIGNATURE-----

--P9ojcTZHksKM/pfV--
