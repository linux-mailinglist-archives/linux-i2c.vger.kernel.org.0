Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36174529003
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 22:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346564AbiEPTyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 15:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348082AbiEPTwj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 15:52:39 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D1945078;
        Mon, 16 May 2022 12:48:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 33CB3CE179F;
        Mon, 16 May 2022 19:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E80C34100;
        Mon, 16 May 2022 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652730488;
        bh=8saUzmqA0TOvmnjsDMAn3OVfh2E1uA+myZYrsq0y0hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OEevVY1UECT25EBcbHYE8J4mfBKuo+DyKQ8QD0QiEhQtGbpIuzKP5GI6z4lI1eXsB
         81nbnWHIs/OOEJvNw6Hl6ZJ5HYOz0op63d9rpo3Ah1d2pEYVg1zdSAAkqwnRhlK2sd
         46p32qHgAKWCrxAlIYtwD8AiB8kwIftyEySQECuMqC+bWkOOQ+K1M+M/nHkkGU4E9Q
         UmK3i1TjPqmS9KKjWDUiaY9c1i4o2b7DW2j9IeYqZtkSDjS5CGsUADi21K8ORTXCda
         wC/qIKs8aF8WM1iVXxLFHZSXOx7twJsthoezj9YOGgMF1H+6RME/ljFbe7cCiezfIt
         rEMovxZjmG34Q==
Date:   Mon, 16 May 2022 21:48:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <YoKqdfLSeJ69WFhi@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net,
        arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bta3H5MZ7K5kULNQ"
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-3-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Bta3H5MZ7K5kULNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Change the way of getting NPCM system manager reigster (GCR)
> and still maintain the old mechanism as a fallback if getting
> nuvoton,sys-mgr fails while working with the legacy devicetree
> file.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Tyrone, your SoB is missing for all patches from Tali.


--Bta3H5MZ7K5kULNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKCqnUACgkQFA3kzBSg
KbZ34Q/+OETkCQXb502yS3rtiWo8z1tWp3hrOEDevtsQso3n1oiwKkySOcuqiLsb
f/u+j1YLisJPS6Zdcg7bfi5bGruOmGG4O03ZqAwLfoRXzgwkMchSEB9Ti3HbdIe/
mqlOfmDYXMek199DevOBKY5AouPHsVbuVj8ihNTlARtxx1WHT43w2nWj9w4GAfWg
p2hJG467QwoHNZ5aoNH9JkFW5JxjIkn8ZVOQfBZ8juWTY9s7X/J/Mqq3PDUjAssE
csolAlW117VU2Bde3yWzy9joNo2Cz1acSHXDK2dTFbCccvK/Pm+UsRxrOnNaUSAM
wdX8RvPB8pku8scSI42QR8c3Y3Di6thLgvLJ08zOzVOHrsd7MThvn0cqJuo93VqL
qEoSmGMbKVVUewpD9P9xGat8IfRbaEDeJn7dMXUNhckb5UXVB78eg/SUdMPuhTkr
Nojnyz8XNgFbIWyrtyvJ9Amr1F4pLEJURpfWJkH9xys1BPCdQt8efMEVJPmVyFip
K6SfQt6ZaXlSkAy//W6Y5PDwgNLJWbsoAQ5feStuhpJpLKwsrWfE0DUHn+V41EAv
0V7AAekM8XRVe3lsC+oAw6VJYoTPD6cwMgp8DW/Lb3BPGltoi5W7KD5HZ5aV3E8K
g4P97TcCmS5+YF9a2+PuTsaOBF61n6F7lOwoiJcYW9U0p3ceOws=
=hHWq
-----END PGP SIGNATURE-----

--Bta3H5MZ7K5kULNQ--
