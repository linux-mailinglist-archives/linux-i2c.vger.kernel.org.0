Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6FE4DE288
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 21:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbiCRUaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 16:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbiCRUaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 16:30:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498212BB36E;
        Fri, 18 Mar 2022 13:29:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B600AB82559;
        Fri, 18 Mar 2022 20:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94384C340E8;
        Fri, 18 Mar 2022 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647635337;
        bh=Mg/DyLpcoxRXJnmL4DUhCt5Wg1OShxiLk/qxnj2wARA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qcrEi+YdaZwD1LkkwvJbiFVB+9lOkfbIrNDN6upq13gtU6y3N3FKhPMgLamto7jYG
         xevwKfDWxbCUhQuAa3QAwWnOjaG8yVvWyuA+GAHiyEUVAAR1KeloVnhmy1OBfrxsba
         7DstZKquDsuEW4eAaW7S34jtvSd/phliNh6M4TzULd4RZN7ErmCqGMP7a2UsmNlwaU
         QOH7DnffubMCsRRYwofHsKDWg6yAxisponWINosXlaAgg8Pldz8i+Abjj7nxTZHsdj
         W7l5owFFElt0kmu5gnulb+Lss6IGMmF+Q1rsKwuei9aiOop3RK/2FjGu81ShwfedCE
         aSvgZxi4MmCwA==
Date:   Fri, 18 Mar 2022 21:28:50 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Message-ID: <YjTrgia/VX6rBT1r@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, yangyicong@hisilicon.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5z/A5pCunj4GhFoV"
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-2-warp5tw@gmail.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5z/A5pCunj4GhFoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 04:31:31PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add nuvoton,sys-mgr property for controlling NPCM gcr register.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

There are some comments about this series, so I am expecting a v4
somewhen. However, I already want to state that I usually don't take DTS
patches. So, I guess the path forward is that Rob needs to ack the patch
which is now patch 2. Once he does this and I apply it, you can take this
DTS patch via arm-soc. Sounds good?


--5z/A5pCunj4GhFoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0634ACgkQFA3kzBSg
Kbbklg//Sv2r47FQFg3Yk8MUTB0RS4+pUNIlJHLR548TGl2isIIXUFQ5AY4FrLUB
Vlb41WvFoHVDizEZDtXz1ciqXJrPr6957AX6VpLPw0TiAjEDjWYBxSrmhNgdCzcx
eWSPlSz8D+aGN3X9CKc75S3UCXLAGlTufnlc2Er9raOEUvBsXf4vXv3US4jkoE1S
UC1igte3GDhoK+SnsQh4dAenTUseAcxkJAYZRDZ0Ll/il2Q4P1ZZqndqGIstUA1R
jyVZk8lmB7P8mGhHTdpJlMq33wPHsOx+R5TO+UO9HPGbqso8rNAsDp/50wjrVJQT
saSFrwyrE66gZQVYuikWKW6Ais7XClwj047rlAZ2aFxbCvCiBlu/dLWNr//9++Md
cOcmTP6VCyZveEdEZoY1oHQRRawlIQMoVpiYtELn7Q3Vv//2zcImdkrFoC+5bcf6
/5YwgRSirN6Ih7KaWO1zlGlIf7BV8GmeiDfa1AllahJO1qgqsSZSpeWmWKZ/APnw
trP6iFDftFsBFFKooYtdnwdUTU6eX2KBOwn3OddOoNHmYfN/tiUc3t51OF5Vg8Dp
+8ZXkmHmVkGpxq0lEKRRtsBlQAeZxLapSrwvrNY8pf0Nn3aveX7HpN4x7nkEShZZ
h5yEAUVfSOcAZVj48/7exExVlMPK5CoCpUQfpuHRR+S0WHQdYEQ=
=yg2W
-----END PGP SIGNATURE-----

--5z/A5pCunj4GhFoV--
