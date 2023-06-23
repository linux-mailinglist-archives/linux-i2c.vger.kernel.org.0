Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEECC73B52A
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjFWKXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjFWKXI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:23:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5A8E75
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:23:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 744CC6196E
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21955C433C8;
        Fri, 23 Jun 2023 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515780;
        bh=pC/lsqHxxmPwphO/ml693Gu4t39DNmpoKFcZmvpILNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pvWq+rGurdxIzg21TYvl2kXZH91mWEFKRXakipxKoDcS/41X6C/3B3JLd3jVTkBCX
         HP/y3XCkwHuOTb2/Lsllleitjj/abTuxfH4FFFm5W7ZZMboZG71aGDuQa1xyVaFvwy
         ea+KV/u+jRVmFCmq57kcqLYMt9PPPCoSwzstJpHlKv1QtahSVLInF6YKCzD9tg2x2Y
         vX8P/J7YT+/bGo+itPiZd3oPQXhDVCqYCbXYJp52CxRLBZ4MKHDv2mxxh2/47FTAAD
         c95IWqE/v7CihfATcn/dJyMtZtbeu/C8dknQLG1AYS6df+OH5AvpwN233+oO5WGvZu
         lZLf3koviUqRQ==
Date:   Fri, 23 Jun 2023 12:22:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 14/15] i2c: busses: uniphier-f: Use devm_clk_get_enabled()
Message-ID: <ZJVygdJ/08V10/1g@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-15-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OtctVSyEejiw4RmG"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-15-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OtctVSyEejiw4RmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:57:01AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>

Applied to for-next, thanks!


--OtctVSyEejiw4RmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVcoEACgkQFA3kzBSg
KbYjtBAAnHXY0zyVGz/mV9GxergdcZN0dniEFdV/GKHSZZXMoPWjMiViw2Pjsy1K
jlP66Y155BdP8ko1EvUaYjfgNhI1n6dxzhfTBfsyDEsIWBtw00QNUtrT+ZV9zs1Y
dWvsiViA/yGkgJG5uGN329g9go/10EQAs9ELv4J2u20b9teDkYpeujF4WXVVn7uJ
mvJSj/f+7EUeRQtricsLaSzj5pVK5MOj/+McyddCZBAXG4y26QMonI6wZsXgEpb7
f89ifuEGcKRk7Hq7d1TDvRDUQFnxRvA+JEv+uJLMIPiVbKchdS4hPc4c2FW6H+yK
BPoOs42gP0JhtR12uCAuJYZs9J5edYSwg90e6uRPPMFzTDOD3bwZCdF5A+ZrVOpF
Fhc3JzbF6f3sdJ1iMxl6U/jMXfLAZ4YE1Z5oYEylGPzQMrdvsN2FfraWrIA7FVQS
rGMWLzd3mgToterSNo7Y0YW2LGxyUe6Jw1ZECyQGbv2yvOcyagRoZXdnS25vYQTL
XK3P0FQnSdxYC5eI/kMRMk1+zckGkLJN/rRPc0GHDGF+yW5wpPFyCii3M2ewQ8Da
Gnl3ASlfdfLVJr8GFHXifHLxOU8r8f1iQ9UqRAR5iFwOzLxqqeCqKCbesLbIlE4B
8bSlV87cpwaT/VJ2TSD2Qt0QjpZoeExUejWGcctpq+R+N9Q0jXs=
=Z8qO
-----END PGP SIGNATURE-----

--OtctVSyEejiw4RmG--
