Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F495A555E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 22:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiH2UMw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 16:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiH2UMv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 16:12:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614087677D;
        Mon, 29 Aug 2022 13:12:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F372060F9D;
        Mon, 29 Aug 2022 20:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8943CC433C1;
        Mon, 29 Aug 2022 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661803970;
        bh=IdZ+uoQ3EC8NwQGLKdf5Zi5eK3XOasnGV90en56Ucfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mKC821qwvXEgbVk5A/LIR1+Wrufo92a6pb2mB7Ut1YC/T0ISSq4Ecf6CMmONuFiMW
         2e+Azq80oG4accfETbXOH0bzUck80RDPrHu8TrQRkv2AXerpg9FkTYkNxm1I5DrrYR
         Geu/EamXR9D0w9RMw/5EBsInZ39l1n5NnP0tFD0lAX5NT8uM1QCKIL8sy45T+39egx
         sKkdq0P7RwisdnOhK9+VwJqepCYxlz9ufBPYjEZZCSNXkIAndEl1BnmXV8TG9z8gHn
         V/PnHN2d2NduJXvzvrRh7XTvnd4y1zhSO79HV2YDXo9tlqyw+okczvDGdep61bxt7l
         6mhO/92SdasaA==
Date:   Mon, 29 Aug 2022 22:12:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
Message-ID: <Yw0dvtRTkW/ISgna@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T0u3L3wlujZ6XOZ/"
Content-Disposition: inline
In-Reply-To: <20220823030215.870414-8-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T0u3L3wlujZ6XOZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 11:02:15AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The current driver only support one clock, however LPI2C requires
> two clocks: PER and IPG.
>=20
> To make sure old dts could work with newer kernel, use bulk clk
> API.
>=20
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next, thanks!


--T0u3L3wlujZ6XOZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMNHb0ACgkQFA3kzBSg
Kbampg//XOxRtSBD8sZTgSXDMiiW5+y0Em8wGArEmm8E7MbTGYf/s9At7mZU6uKA
nDHa5YbysOOgQxiLjsqGKD2pU741aym+wJxVgsxjcWLKCA1WaaZbwsXMS4n4tIKE
B3IIizRGwPo/6DfDlb1+GMtbYJu2AKg06KIFMgHGZP8V5zuOpI9mXTUlRxUZVNAu
RAwsbf3AO0+dxHyn8KBHh6DbC5g4be56VWAPaYXcjab0tWkbPX8TaWV8/Y0kKFns
slKWOWoiPbf7UF5R72BlgOb6nVaQZLJgq8MvhWH8M5L+ZXP0yvCLQSjoY3n7J9zd
LGJh91IBVPdQZWy5SpExa2dhnntDdhk69PQCY+ee9j0iwvOZ4UBvg1DSJLkVTEHG
UJ8z2Ro3P7v7dnlZVWru8zsQfpmjHSXhxS6v6Uaz1ecVR7RxLfaAvtJHHcQ7Fa61
PZ1Tf79095MClX4lgI0ws/ujXMeiPCaXhney7FlkUi6E6UmUe4EhHehiS0zDWHQS
CUsHMr17+UZhT0V4H7LSpgowQ4vSsUhgHHi+n65vEbmbxxWannmL/OZa0QzlruWm
HdDqqzsGyULLtwLVv0zfuFZh4pIeHZYKtleDl6jHDZqZ83PEmgUY4tngikkBxT7Q
LEPrbyKptV+iKPU5k87YKipVPwVgObZs47rhaXMr8R38n96eRnc=
=N3ek
-----END PGP SIGNATURE-----

--T0u3L3wlujZ6XOZ/--
