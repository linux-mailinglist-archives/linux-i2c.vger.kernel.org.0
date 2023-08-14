Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B42377BC90
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjHNPMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbjHNPMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:12:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE7D10C0;
        Mon, 14 Aug 2023 08:12:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A4C163D0A;
        Mon, 14 Aug 2023 15:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3EDC433C8;
        Mon, 14 Aug 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025956;
        bh=TqP1n036qOsgClnEkkjJbC7+SYLXwrxn2SdLyPtbu8w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNcvsOVKoBl+rjTqlej9mUt5dvNE3hGDZcLgTBBHjGFxdXvkz94ED7jzb0AKNP0Y+
         TqT8lPIAlb6Ss9a1m9vZpGOjrXYdVvAKIlVevIRO7XPpl+iU/Owup+c9BPL+pIpgIQ
         LIpdj84J2ezJ55Hprt87VyzWQn9OTAXo24OWiI7VSEPl2noFMTnUky/cls8tW8qx5R
         4iAqtZmm+3Id0tmRwYocoHKfLniZocjra+cIZ7Ccr6aT3pUqKGjX3eR0UzG8zBoHvg
         pkRc91fnSWQiMJBlacjtDJIzmbKOsinIfE2yOSV2OFNeGohCfGBD4C+Xjz2orJ3hp3
         nUKYTTva0DMgw==
Date:   Mon, 14 Aug 2023 17:12:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Michal Simek <michal.simek@amd.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: cadence: Describe power-domains
 property
Message-ID: <ZNpEYgo9EUzXsXnQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@xilinx.com,
        Michal Simek <michal.simek@amd.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <8774dba53cae5508f9f7aa173fbaf814d97898b1.1691047405.git.michal.simek@amd.com>
 <169119887100.1781235.4441400054342220300.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BJwiAtzYNkwpw9eK"
Content-Disposition: inline
In-Reply-To: <169119887100.1781235.4441400054342220300.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BJwiAtzYNkwpw9eK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 05, 2023 at 03:29:11AM +0200, Andi Shyti wrote:
> Hi
>=20
> On Thu, 03 Aug 2023 09:23:31 +0200, Michal Simek wrote:
> > ZynqMP Cadence I2c IP core has own power domain that's why describe it =
as
> > optional property.
> >=20
> >=20
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--BJwiAtzYNkwpw9eK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRGEACgkQFA3kzBSg
KbZoxQ//XdMF1no/Td0duw+OJ+eF/oxZbCWsHMiJSFQTLb2PvfogAA3M+GpboRda
JIcs0ji9Ub5RleWFo3f9JlASUhqOqipDL+yLkkWttIR6kU1PAZxAUZNYAuKgf9jC
GFklXxIhkOv5jy1NaJBuU0UThPgpvrf8lsNBMyh6xmaHBYi1CjWDC1CBtx8GCgXO
G5oNdcg+UHn+p3WR5wvo6xMWCfgBtaHoLB/qHp1TnuxoS+dZ1Vsy7sVWxEUE8ODB
s2YEq6tEybg7o1hYGOmfi0/wcur7d1PitdyY/Qroe9Y6OIsA172rK2Mc3U1Lnuy/
UwQrg+BubQv+L2G3+susS5sD9w7wzQJgErGCB6gv8Hv62bP+nydQEXFKL+uljoxe
oyxa4YSuGaZoqgmWERjcEWZCBwOlgtq79EU0C1DBrAVoDDAKr0ntiw44nWngoycs
F2uaW/ZXvpm0vIzUF884jb0csczWe0ctYKzhQbG8eVliCrzEZlDJSCkH26pL/9yQ
BFvkmKyFGr5vfPomsQMEjLMfODlG2yGsZd4JKm007b3yFK2naHQaMcXFvr4TW7i+
8u4eDymjOt4xgpKEhXdrFy19y+7oSAic0gQEfzW+RLZ7/coYltwNk9T22qsmCKlR
YmknRtj/rp6BT5+OxWCSfeuroT/VZn5E6R5D4ZxnIdYTw5q56T0=
=Y86j
-----END PGP SIGNATURE-----

--BJwiAtzYNkwpw9eK--
