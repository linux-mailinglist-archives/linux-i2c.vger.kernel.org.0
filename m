Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D393873B273
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 10:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjFWIO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 04:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbjFWIOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 04:14:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F252114;
        Fri, 23 Jun 2023 01:14:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2BC3619A0;
        Fri, 23 Jun 2023 08:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D017AC433C0;
        Fri, 23 Jun 2023 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687508049;
        bh=SDTjvee9N2CAE/CTKG6FAPz/0RfNcCKI+LSM1re5DH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YB0KFSljZiOmfr29BZAN5N6dBi0CPDPolglHVSNrXtkL7dYPS6HKJXZM+yq8OFXQh
         IeGF5Dyr7kX9DPFUAY/NhPISaF2WxtiUGHun4gI07mPACw7ZaQXB4liB5TpSoz2oYV
         RomMngHjALd5AdfaFmB8CUJDFOo9eqjlOpLe1RZP8b9n+wwRfMLARlH4FVehE3PBK4
         +RNnhwF/4IGthTUHf3TneqtJK3J6YER93tmlheQUdogpwcioq+xsur7TleiOvKjKm2
         OHEH3ujhE4vlASKpFi92UCQyYdhscAK7ZROgd32LlstB3PIcNmW/gNDBgxfzrN0yWS
         dao90FdZHFX+Q==
Date:   Fri, 23 Jun 2023 10:14:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: fix type char overflow issue when
 calculating the clock cycle
Message-ID: <ZJVUTUkTFeRkVvg8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, carlos.song@nxp.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230529080251.3614380-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ALs1mdHqpSviD39J"
Content-Disposition: inline
In-Reply-To: <20230529080251.3614380-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ALs1mdHqpSviD39J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 04:02:51PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
>=20
> Claim clkhi and clklo as integer type to avoid possible calculation
> errors caused by data overflow.
>=20
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied to for-current, thanks!


--ALs1mdHqpSviD39J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVVEkACgkQFA3kzBSg
KbZTiQ//YuISdWs4hJK+4KPXuDRjbdwvXUrCQh2s+l0XBBT5v09eIsClih+eqG0r
tm9xAWUdISmS/6nHfRM8SlxDN6bpDN/r01kkOv/dKD1dkSNo7a7wIU6CA0xVI2Rb
q5ri6ExYHZUU7ItSn91J1NBqe0iIepHgX04KZrMBtUJqpiMfif4eikgEruUCaIUy
C+7IhhLHPa4hejYJX3BWhz5wANkzbT8EY4ikFB5oqpYpuT9zo5GslYo81w9bcjT3
JdFSGv0aDZVdWP0PqR99hF9k6SA9VZ7kEKlMvng5GOcfK/fccnMaJ0naMSmRCcWL
cKAXDoSJZIolUoryrpuCf7M6neXNAbjZjAWv4FATKioO/wq6A944xvPAO+Rj7Tl+
CNdCLN30ox87R+S4bUoZ9O35lf1FlZNtElHfja91K2Uc3fKUkn01mLQbYGr+7Duh
qQO8mvTP8HWlWFqbEMoIDWbT/GW4QkP7yFMXQBhtfoffqTkVkGK4J/6EAs3CHCyA
wfp1lk8SO85eNGsEJh3ku6CJY/B/dI95MfMDE551ICl5c7Gc9Fl7VIneSGpTHkX7
cl1a//BOyoHnNWmWHG9eUPDksY+K8gUWwPfOonTAajDRN/BXEHnx03G2hQGNoWSf
Tgacgwdy0ZgxjQ77n05DgHjjQdgLuuntYNxm8hZd2F9ux8CREtg=
=mcHu
-----END PGP SIGNATURE-----

--ALs1mdHqpSviD39J--
