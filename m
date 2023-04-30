Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE96F27C1
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 07:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjD3FuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 01:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjD3FuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 01:50:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C36E79;
        Sat, 29 Apr 2023 22:50:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8DD560EDE;
        Sun, 30 Apr 2023 05:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39475C433EF;
        Sun, 30 Apr 2023 05:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682833807;
        bh=QMYAxp9NWGDCs3LLQfSUVVXP07rpeyOHDzsWDz+sdtg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gI/WWOTRamIomRJolzCV54MCB1/H05B/9GhlhQ0yBpIBQ0KNG+GvoWl1K3T4pR2WG
         NT/BPlTgT29vhlLB0lp/hVkknzNU5QC5r3LiZ3lrFhUXPnK9C9hjWBarbTMvegskwH
         0KSq1Xw6zftez7pDrYkCEck4hKa9ZOyAtsyPi+gAoK/e/CN7/d7zTHgA+zPmXN92PF
         MIZxwn1AqT9AUqTOHP5h+04Umid/k1MaMnL4/PXAMVUGRHWluIgvidm5xhrJejb+My
         p/ZoEfvmrBZ0NqgJR761NHzfVRB3nuAXwkq//9Ipmr0CbFOraqqQmHal6WzGQNpSKr
         +1OBk4uqF/HXw==
Date:   Sun, 30 Apr 2023 07:50:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v6 RESEND 1/2] i2c: tegra: Fix PEC support for SMBUS
 block read
Message-ID: <ZE4BiLABVUxagMUU@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
 <20230427123915.38199-2-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1F8N9qcHs/oSa7Lb"
Content-Disposition: inline
In-Reply-To: <20230427123915.38199-2-akhilrajeev@nvidia.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1F8N9qcHs/oSa7Lb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 06:09:14PM +0530, Akhil R wrote:
> Update the msg->len value correctly for SMBUS block read. The discrepancy
> went unnoticed as msg->len is used in SMBUS transfers only when a PEC
> byte is added.
>=20
> Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-current, thanks!


--1F8N9qcHs/oSa7Lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmROAYQACgkQFA3kzBSg
Kbbcxg//XcGhRdi6iM/p2IuXbEi9pCpjkL2lA+WIkrNP03iDk6CJDiFE5hJTQl1V
iowBR1+gXts9cqNTiyC2ptCw6S7Vz/gqJSQBdj9WwUZlFeetgY+cGenn4LMbDvJo
hGZ5ZHANl8LRO5pBUAoPZX+d04HTDArdlwzVRof6soqifRz61G5KFbNEy2ay2ijS
OG/Vg9y9rQvJoADfKOpt3UYsT18XEzMqFgQMhh4Fn8TKH0UvXTVw0Dh3JXlz5DVy
kiUMOMevXBkaeuPVQd9LD5U3S/UhtIo1EiT7pAxXlj6VODDIqk4oZ19fV8c0chg3
DNpv0r0fFwBGAw96s61icH0TIZPhOaRyoHF55bsvocxdCsGl7mGKJrDM8OCyQDhW
XtK0GHUCKooBQRHvyI1dgKO4l93WqnyGDaAKtmqk4aJFosKN3l55pIHJXl8BvlOc
Xn+1HNl+ErFLQIwiHldZ2zdlL09BiIYgiCkjcH85spzYi5ZV2BxHXcjs5C4QF0TY
4M68aCLgk0KmJcVLWbEqhqhiGjZs4Qu6iv3whIX0GhFOoPhXcg8HwEgNsLXHu6p6
xpmyv7YIkvBSVYnwsiHaiuYv+sIPw3ZLhsbTUA+umWInFKf/aSJHThe3UrCYsZxH
3GlSYRuzZCwoFw/sunIpmJz83L3VKqB538SvB5fNBY0zLYQlW8g=
=zVkC
-----END PGP SIGNATURE-----

--1F8N9qcHs/oSa7Lb--
