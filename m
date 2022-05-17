Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA9552993F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 08:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbiEQGEX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 02:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiEQGEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 02:04:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318CA3E5EA;
        Mon, 16 May 2022 23:04:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3B5061543;
        Tue, 17 May 2022 06:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F0BC385B8;
        Tue, 17 May 2022 06:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652767460;
        bh=FgE6LrLuJ3LeyvdaaxAW7dFJk8FTlG8i7HpgFaazl5c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QhDkSXztayy6bs5gf3G4/xyEiLlU5CZzhRwEXzrX24pHhEkIdDn06LO5VIwTuozP+
         q8yhj+V/mKS36NtDJr8a0+LeE58nFyHFlObbQsJ3wc23P6d+6B2y9vlWNpGw8lxiHB
         VvUPpV8B8ZhN5dAy/HYlUFva46wrAWZvrRscvw1eF/e9VbyxWoJPH82JuLi/47tUWv
         PgLUKQWTyBLzHo4emDomwHq+N0jduMwBe+oANXk2RVfPquL5uSVWm6HT/vlaYIpi5V
         DTg+Np+LPBPDAf0uRxS42t7LUX82JBVG3xaPeVz77dh2vznyXH1Mlg5QfsaVTfyL6N
         iVIAK65zYkecw==
Date:   Tue, 17 May 2022 08:04:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        jie.deng@intel.com
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <YoM63XoYZbFGJ8s7@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        jie.deng@intel.com
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com>
 <YoKqdfLSeJ69WFhi@kunai>
 <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZD0WxnqJMfI4UMfN"
Content-Disposition: inline
In-Reply-To: <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZD0WxnqJMfI4UMfN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> After reviewing these two links, we decided to keep only the author's
> SoB for each commit.
>=20
> https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
> https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/

When Andy said "chain is wrong", he meant the order. You must add your
SoB, otherwise I can't take the patches. But yours should be last. The
SoBs need to be in the order people worked on it.

Does that make sense to you?


--ZD0WxnqJMfI4UMfN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKDOtkACgkQFA3kzBSg
Kba2dQ/8DA/NMvr5xjTQrg+KZeVKu1FP8k7R6RkznvixaWJUaDTuRTuPXcFExLAu
urIUfpDjZiVWqRQCqBKp2AGAh7yFnZU/V0GAEzhMI6OReamobsqq/TUPFdQ+TAgr
ronrfnzaCMmjEFNzbZyhrcusCbtL0QczMxa1RIkfRzZSyYscuxVm8Nj8Ypy09r8k
wd3UU+SHyow27742jNfoSYEVjC2J9r++Qb5ms4bjrW3JvsrTIHvP0FedPDBbJVrt
fnXeEgOHkX6PYdopvaEVQb8/Dz1D04lgBtkZoqScHC3JHKskbaeNPoWkafRL9oKI
AHuhRw1zebM82X+UpEfGzZDQprSikW1iKA780VwbI7xiR3ZTWTYPpRzqKayDWT5m
X8cFQqWiaVXMOK2va2IdQT4hh8A1Y4kRlcV2w7u2Uk+K3qefl7PlN5xK2ysb+9Ij
srbNuXUjeI0CXDg4CT20eHLiom5uhRQyd0ih8HZtkW+uddWXd/zaTfHxdFbXYUcj
d/dpYAToxGjFPvyt9bbx8uGTs/NoEiNvTXyvgbCKR3wv9PhfQ0Duq7rPfH1BY1S0
uNxh4nXMZeviqgx1Qu1ouL+5AJlGDp8hjW+58RzaIhvreLNn1GREPJ8X/s5vf+gb
MG2K2pIS45sucLXqB5t+vWdYQDQigOx1IOt/x7YtUo2+IRqccVI=
=71Iy
-----END PGP SIGNATURE-----

--ZD0WxnqJMfI4UMfN--
