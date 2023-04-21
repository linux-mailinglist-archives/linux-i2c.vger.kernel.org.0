Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02896EA2D9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 06:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjDUEfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 00:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjDUEfm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 00:35:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB3D5FEB
        for <linux-i2c@vger.kernel.org>; Thu, 20 Apr 2023 21:35:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 470C164BAF
        for <linux-i2c@vger.kernel.org>; Fri, 21 Apr 2023 04:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E44C433EF;
        Fri, 21 Apr 2023 04:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682051740;
        bh=PbER3PU3D+Nt6MLirn+6/8MxvKCaCgBNO09oAGg3amw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l7+IOxq9Tru2fVdCy0sSFX16wgbNBIPqKHxDG7znU6oIYiYBqBtXB+6fy5IMuPc/X
         TAcqbs3ZKVBHk0Dc4ZhR75rLpeau0AFArdfmHM3R4kLvAKbYKYLKkIqHzQ85CbDoh3
         KpAeyvtuyPkkZY0hqpcHTr7U9mAzDjLPYKqm8zfZBURp07BUmpz8evHZSoh7td6uYF
         PN/c5yYUBUee0GJqbvEAIgE0gcd73bGxEZlkP3VnxXqkk+KrdWMv9v8da8at7+zhHx
         9/llvldeNmQSO/NF9UO96JNevII29wOEsFCBDFcotCQQSICayEw39oxCwYuZPffZZE
         GhS+paVN8qmhQ==
Date:   Fri, 21 Apr 2023 06:35:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?Q?Jean-Fran=C3=A7ois?= Roy <jf@devklog.net>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [ee1004] Failed to select page 0 - G.Skill Trident Z5 NEO DDR5,
 ASUS X670E board - 6.2.11-arch1-1
Message-ID: <ZEISllc9y2bot/ZT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?Q?Jean-Fran=C3=A7ois?= Roy <jf@devklog.net>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BrxrHi4rOqV5k0Xk"
Content-Disposition: inline
In-Reply-To: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BrxrHi4rOqV5k0Xk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


CCing Jean Delvare...

On Thu, Apr 20, 2023 at 03:51:38PM -0700, Jean-Fran=C3=A7ois Roy wrote:
> Hello,
>=20
> On a ASUS X670E (AMD AM5 platform) board, I am unable to read the
> eeprom for my memory (through decode-dimms). The SMBus is driven by
> piix4_smbus.
>=20
> i2cdetect -l lists the following:
>=20
> i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapt=
er
> i2c-1   i2c             NVIDIA i2c adapter 2 at 1:00.0          I2C adapt=
er
> i2c-2   i2c             NVIDIA i2c adapter 3 at 1:00.0          I2C adapt=
er
> i2c-3   i2c             NVIDIA i2c adapter 4 at 1:00.0          I2C adapt=
er
> i2c-4   i2c             NVIDIA i2c adapter 5 at 1:00.0          I2C adapt=
er
> i2c-5   i2c             NVIDIA i2c adapter 6 at 1:00.0          I2C adapt=
er
> i2c-6   smbus           SMBus PIIX4 adapter port 0 at 0b00      SMBus ada=
pter
> i2c-7   smbus           SMBus PIIX4 adapter port 2 at 0b00      SMBus ada=
pter
> i2c-8   smbus           SMBus PIIX4 adapter port 1 at 0b20      SMBus ada=
pter
>=20
> Looking at i2c-6:
>=20
> i2cdetect -y 6 0x50 0x70
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:
> 10:
> 20:
> 30:
> 40:
> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: --
>=20
> I think those are the memory eeproms. If I bind them to ee1004 as so:
>=20
> echo ee1004 0x51 >/sys/bus/i2c/devices/i2c-6/new_device
> echo ee1004 0x53 >/sys/bus/i2c/devices/i2c-6/new_device
>=20
> The kernel prints:
>=20
> [ 1642.373579] ee1004 6-0051: 512 byte EE1004-compliant SPD EEPROM, read-=
only
> [ 1642.373588] i2c i2c-6: new_device: Instantiated device ee1004 at 0x51
> [ 1645.328289] ee1004 6-0053: 512 byte EE1004-compliant SPD EEPROM, read-=
only
> [ 1645.328299] i2c i2c-6: new_device: Instantiated device ee1004 at 0x53
>=20
> But then when I use decode-dimms, the kernel is unable to select page 0:
>=20
> [ 1697.112564] ee1004 6-0051: Failed to select page 0 (-6)
> [ 1702.581605] ee1004 6-0051: Failed to select page 0 (-6)
>=20
> I tried looking for a SPD write enable/disable option in the system
> firmware but didn't see any (I am trying to confirm if that feature
> exists or not).
>=20
> All this on 6.2.11-arch1-1.

--BrxrHi4rOqV5k0Xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRCEpIACgkQFA3kzBSg
KbaZhg/+I5fyyXVowcBz/obYOlAWljDrSDo74SaH9RJOzaCqZJ9sqs1JxCK3XZ/8
eCu1fNbnai1OruTlw8nfZbfOKuY4hzwrehMXnlw5p/vELBl5K76qGyq9sC/KRvuP
nL07MZ2VnCUazurmHLcyZk1M6i9hUQbhcH8yo9wHdAdHqUZ03eD1AUCqLU2y1OUH
tCr/p4AUrw4NG7EDbDUrdHkQxZhv2tHaEJg78LuVGLuX8/ao8FxvrK7gsiMJ4yIM
sY/Pq+14GcaEN1CkoCIiCUI+rNEIdDKyaHjQGCJDTwkHrL9noioZKsymxwWVj03q
kS+EukMDGM3ClbUkmJ054xC7VvbA5l8wOvS+pzRER3tXxpNflJECES+KVlyXqUEy
J3PG2+nMDWce8uTHOmAwkBaqAzevCu79ZRI3hcUHXI7e5VARVnbkCVL7RL+Y9krX
p6sshmkKFsAuL8kzf1BnZhnq2vibTAvs0eb0EXvqjfFTy8/CVkT0rcHaEr8alDYJ
3o1Fpc0ByxXRwhTq7YGkUNRrWpTVyebnw0czMpGPRXrWg0AcXUQcn2yLB4ldMYDv
LVbPRNu7pvRwidTUfdSIW8sTFUzNl4k29WQyQMoD9HM5ne7dG44DNY288hQ+kks4
g8F3ghQtQqQ58zOjK3cpj0KjXjVbNTy0pH8dXvvsHLTu03Zb5FA=
=m+eR
-----END PGP SIGNATURE-----

--BrxrHi4rOqV5k0Xk--
