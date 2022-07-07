Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA01E56AD07
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 22:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbiGGUyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 16:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbiGGUyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 16:54:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095F719281;
        Thu,  7 Jul 2022 13:54:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD317B823F8;
        Thu,  7 Jul 2022 20:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAC7C3411E;
        Thu,  7 Jul 2022 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657227246;
        bh=uQAyobK6yKXVb4BXuOxq/raZz11LUeChS71KkW7tWKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ieL1U9MW2ZG6Zv85PHOylr8gVwMe0JYSNKpjdTc2fxOtsilWrZDRYJ5samyxz8eMJ
         YNpy5kewnJfc7pSx+MOLMeGPtFUrd4KQNvg6C7ofLeMyfBipw9k6R8r8KKmmIqxBCH
         BrxmdpTAjpcLJE3iEnP6CkvGPycJT4YmR6rHhJhJfq8/HtO5AFOa6ZDNFekbZreKr1
         h6C4gggsdcxvXxQbt3VOZwqihyJ+dF64MUAeq/BCdGsOU5I7Qd6PwPCPKBe/FijmlH
         EAToCVao1vBlCZhm2IbhIEI7ETzaLtKUCYNUty9rnnHVS3g/01kQi58LZarh99dtDg
         pHAoZKfljkwmA==
Date:   Thu, 7 Jul 2022 22:54:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Daire.McNamara@microchip.com
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsdH6oDsW6Dn7zl+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Daire.McNamara@microchip.com
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
 <YsXhyB9GrfUQjy4n@shikoro>
 <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Pqu5MabrEmHzPoQ"
Content-Disposition: inline
In-Reply-To: <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Pqu5MabrEmHzPoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Already upstream :)
> Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml

Oops, I only checked commits in master..next :D Thanks for the heads up!


--/Pqu5MabrEmHzPoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHR+oACgkQFA3kzBSg
KbaXbA//boPXkya367wWNavYryeCbB8fwgD6sVybTUWCPgTSP7Uo//N4GRK40ovn
SbZoO9d8TowKZSIOyc0KtYU3J/SP7CMWdZqulh2puXG/JsYyBuvCVUUneq9tzvk5
7vZ+9i8XyNXdCdxyKTXOqpuZPI0T1stlY8RqlH/0iMgo5wgpX+IEKy3Xe/dJYK7W
NTCS9+NtWjJisOtO2oB680uzvcnwd3quPcWoe+wvcteMvGD9I31O08Lgv2WWbCHs
aN35/VWCDN6kAaz3LmRLosl3mQbXvM9HplPt6i2UaM0wBEutkmMlfKx5Y1xCgQJp
e9BWzjLk7EyDAtaoRvTmENj1sI//p78LtZEJl8CO7ymyFNvmB8qmQXuffP1UvFFl
hGJLTEEh/8mvgiQJnKaZYRZqaT9tPgjGqi+/MHkDjjd4du+sxizd0TeG7n9K7qpL
/Y0a6FKrGr5ZwwR5ggo+SQ1YM/0pCuaFMyOH05olDusfZ+Ld0ZLFwWWJOuE3uoKr
sbKjv21Bbvw06ZUyUkXFAMIsWYzqnArfX8/Pn96AqQ8TiZJwjtbmO+hkUxPtNTZs
GP8KEhPInuMikpIWINChrEPFv8EWSekOklAlfPeUL3M6LuKzZyv6NHIRoUP5GsZ8
HXd60tvF+AFOpflHUD4/Qz99mL6Bi7Xw6XuUGJ5/Sl5qr0lKwtk=
=36FT
-----END PGP SIGNATURE-----

--/Pqu5MabrEmHzPoQ--
