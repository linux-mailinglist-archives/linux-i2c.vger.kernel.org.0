Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F214ABE72
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383071AbiBGMJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378211AbiBGLft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:35:49 -0500
X-Greylist: delayed 486 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 03:35:41 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAC3C0401C1;
        Mon,  7 Feb 2022 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644233739;
        bh=lqTCzfaXoYJ6xzRKRc8BodZxPW5s9n0MDFMCYqCahgE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=A9DcrX44uOrhWhplw+3Fq0DcGpHGYKBSiezJpytjnVZHHAkXItZbaJgmrJ7aZOlZA
         7UsNEQPxXF0+UfG5PrXLnd344B3ADvmjcX9usrnP48FY5LbmphSIPvtxxlPBuLgmYu
         AjogvB8SI9lc+ctZJ0g7q1X8SIK/q1ovjGfxfJCQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1nt7zZ0o38-00c7kl; Mon, 07
 Feb 2022 12:21:27 +0100
Date:   Mon, 7 Feb 2022 12:21:21 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YgEAsTW6DrZSSgL+@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NaN2xgGUpssnCj8u"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
X-Provags-ID: V03:K1:AsivsehVN199XEIOqSWLNn43v72Gcc2UASqJDvfKfVl22rdsl5Q
 kdM4NIVpL+f4UzDCnWB9MMzUYm406GUqtXSIGuy1QGz/aLBV7JuUPPM1ThmxTfvB9uYMVmP
 2r7xGYruhwlCJ8dlvIm7rQV7MQHSaKua3ydumGTrxm5tmZzcXUgv672Csfxia58bdjtkbaZ
 ebDj9zA+W8zQG9PNoZ6Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bkmvcLGjkPQ=:CNPB4pwuOXfK8mFfEDiBqG
 4lPtTfWXOZkqnHmjMTye2rSHy7fpcln4BQleF1mx5B7NjS3u0d54Kvfdg0mqLQxnpi9AxiohK
 LP2QCD2G4pReLSCIYuvhveQj2imQAXeHghHe0DxHhpPZMGXZYM0lXkNuhICLemvrOBJ59IVWw
 QvVV95ST5yGiwbuKLaKcPuzJvN3oZtsb20Nf/jrO5wJqYM1tvHfM1wy0y5xkQ9MQPT2+H4Zjt
 hawn+IY8rLP1vIpdqC+BYzRmbvvbVbO69O7lf6hL0gwOVrNOEUYNt5tt6xzRBeEFWADfYTbis
 IdTxGE2OuvEszhwdVlpYORoG/FZY6gCKt7lLeg6gRRN0Pm0NOVZQw4nTUl5Yk8OoKLoYS2d7s
 BVsQ4NMmI77dCWa9D2+1mfToEHIAdBd3O7JObB+HAE3Tv6KeDurqXntk2ml7kkacpiQjO0/zN
 1bBvynqd1mqwrt69MbPPOvqcccITA51cDA+/6eloyrvy/Am0MXt7WG1akshIsTYuCVyayOdML
 tzWrwUVHs55QAPCD4AxW3JrhGBLepAN58aWULdd1aPQ+meTj5ECDrUBM8mifFXu02JLkAnu94
 hjl/zeuJOttdPXtrRjeDX3zgVA7qivqQe9wUbaKp/elG5J/07vjM26wKN+WtSSkywAOJd3Mzn
 0YTfkXw9EUXdggTRq0Knzu605w4aC3fMPn1SFGctN4g48hbrvMm6v6L7Jvav8GTSwjN6cVCJ4
 +aar1nxSj00YWJ+tY4itv/aAf6K0tguZC4PBP3v4tfSvoo15lg7EyZN0PuX2p+ltT4yPjOV3N
 mNQ55uey3GOlj6ykmpamBrUyomp6m0+8C7M79EhS3z5qOr6AUB9Txv4YUlK5DXwRrSCHmV2Pp
 jvzQ1FnVaQ/tPm+ZI0EOTc9IBKZqrQXv4r9UcVqMgLnnIyZQn/Wj+DghUq0XxxZ1pQSKwXlZy
 GnkZD46U+hC1B56qgPIGJXrEwDQHwPXroR/v2oGi/7BHf2hwBX/EShunE5F495iwI9lC9K3u0
 5lWmGmq/5AmIH0kAM4qsbtdd8rPBg0uj+uAZFJQcRJseFUQXaO0fFLPy7YA8yQq2FHQw7zCkC
 Y1p6FsslPdIBKg=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NaN2xgGUpssnCj8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> This commit adds compatible and syscon description for NPCM845 i2c module.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
[...]
> =20
> +  syscon:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon

By making the syscon property required, the existing npcm7xx devicetrees
become wrong (because they don't have the syscon property).
Please, either keep it optional, or adjust the npcm7xx devicetrees in
this series.


Best regards,
Jonathan

--NaN2xgGUpssnCj8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBAIsACgkQCDBEmo7z
X9sN+hAAxwYehg8JfvdijxWJEGC9oYMzKVhAiQcyLJQUFWyKpIj9X8UVhwdUvDdp
zFzr/+Q9H0xFTRvJuRY6L0j2BpoQcmEu6TmqC4UVeElY6aJkxtBhtwGogdNI7ZRz
9xw8BEAypsCh2Aqx1RWI8M9uvfVov/6PuSVFmowTiL+D/j5SzhZPC4F2aK7iMucs
3VEpS9mTwS01TR3U6afuHjUfeqPW9SgORy776khM8gM61mvku0dfnE+YTlvuT8nB
Yj7kNvFqjSz0h2ETItDdERXycwEijVOpOK7yst6Eh2POE/A+u3TTgC8hUjkjwmsM
r8Tii/9ssnpEsG8u/vUPPdzSiqq1Xlte7cnaex0EZvQSQ6J/FEZQtdeN975BMg8n
W0RvAFE0+sZ0su+olsShCg9LXvtlU7mHuJtnd6Rqc9LpQHXhzPqtaUCn0c+S7p4E
3HPTdtN92zbSdQ0S37Wb4BtDPSzFwekYd2NUSozdRclT9Vm9r/XJwyI8C+suRuTN
8fihbstXrryOHpMsy2DReOlJ31K4RhSorgzTHJAyTo5mMCnS9uLxlhqZDDNGwvl+
Jh1n96uAETIeqFT9G7IW6VY+ntvP9ekKlu+FiQpu56DK+NmF0fxeTJusMr2AvMzH
j+kI/tULDt8ZfX4lmfqt6BSPwlGuG0APBkYwJPRJ4IRPjYv03uM=
=auDF
-----END PGP SIGNATURE-----

--NaN2xgGUpssnCj8u--
