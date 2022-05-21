Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112DE52F91E
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354659AbiEUGBI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354655AbiEUGBF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:01:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C9BD110;
        Fri, 20 May 2022 23:01:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97BB2B82E26;
        Sat, 21 May 2022 06:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A685C385A9;
        Sat, 21 May 2022 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653112859;
        bh=yRlCgFBRhmt2UdNmbaMWVoFj7xEM4POzNRs4hlqC1PY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uMoUOxx4fk6zaVOzrAPNhw8bPqQMnWyLw9aiwLLSEAILugeahA4nCW3gD6+pLpgmH
         Lh5kAZQ3VRuax87OmoW8MTLOpFPdGA2qaMAqeq/45OPofUASdaQqxu9HScGa2iEy8B
         FI0mfpOXESdId0JcpiM6whOsf14Iawk4BkxLBtj6YEics4ilRVNz5CP1AsMlcyWIY9
         BvpAR3DasNToAIZE2KHB2CVtTzObVNsFEWck118988NkR+XXNEn9I1hQyv02aku/+7
         u9Hg4de8diMvPX3/5gJpsSb4PY42jTgyVYkQbQzrhqMKnrVI9BneaH4H2zea6iFRGY
         8nteBJo/cSfAA==
Date:   Sat, 21 May 2022 08:00:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/10] i2c: npcm: Support NPCM845
Message-ID: <YoiAF3fcFJiH4nGP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-10-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5LoHH9RppV0a11Md"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-10-warp5tw@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5LoHH9RppV0a11Md
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Would be great to get an ack from one of the listed Nuvoton maintainers.


--5LoHH9RppV0a11Md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIgBcACgkQFA3kzBSg
KbYP8Q/+LmC3akfquzhe3STyirrK5m+Wp26tWS5IGdzw2Xpn9K1Ewn0FcU+/U8cP
Q5Q+F/2DIBGV/Vn9cloaIkyQK/42P2pbGU0+mQnMVUPGYvo0DLY+2TLE9xj8067k
ICATrgV4zwqfD5W+dLyylOUGVi2JNH4ugniVJ/Lg4WinQC4cjZHHJzpfbSY6hp68
3jC9nk+o57qtLWXh3cDfNYw0VA5Upe1isMIdBiQFckKwUZ9OmRbd7K4r1t2dvNQb
5kaY/tyuHVKSefMn5yIpPHrhctO4aKM0eY60agX94dmkIp8RwdP0Ra2f0oJsG3lK
xdDKMcUkx90WpvHjUmwY+s2bvPLDUs+oKv+h09WDmLWQg1re6E31yGmuWgF35oXy
v7xh4C/RNtu49OJ9HWDFxjZ2NbefxBHDaDXzAEjZkjt59eSmzP35Mmb3UgcffjZo
RElYT3zQluGlXTKqKvs4MFX/j1gl3BqpcK4bX5bvrfXQ0L3IRWMBqr/1Bdc02ySO
kDC/fwEYgKMf+JHeb/pVQKBMmOXSp5d167pFmPwskdMIGmImJMDKamYyeMO9Q+oH
5w7cIA07V3pT6kmDNxgOQaU2okPDNUmqR7rjNIRwNblh+/Swd2t+EoITisOXzAka
AoPYLbSvBMkvH1ChsvEwWPhTZ+8X2d97sG1LZd3w/a4wfF60HjI=
=NbHz
-----END PGP SIGNATURE-----

--5LoHH9RppV0a11Md--
