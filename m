Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220D0576DF7
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiGPMkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiGPMkN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:40:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9309E165B1;
        Sat, 16 Jul 2022 05:40:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0C1D60FF7;
        Sat, 16 Jul 2022 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC02C34114;
        Sat, 16 Jul 2022 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657975211;
        bh=EYr6c2vq7Z2CIr2SyBxupqkJDkN4iZxYVwmtiiJt7oA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LUX8Zo2IDtTFRlEBvoNngNHF3YKMumPs79UIR7VxvnyIeyg+kJGtjaxs/sng/WcHn
         q2SM4k+34B9XnvDXyfEzzKeKaQ7lhQZyOJwGsd6NHJhz56RviAkvHFa3HBnOhOIUdQ
         qXYzNgJjJwFHlt7LrS6bs8SDvTKMa8mMW0CDuHm5DQj/haDhXvtNW2EYD7PiISUUS+
         eGO6WpP1QYj6lfGn4Pth0k7iDY+luXZ3JVovHTQ5ViMXixaKMoH8jeGLwrUhTe9Tnf
         kgbFZaazEe4Qrm9imutiVpQedVVxSXhNZzCQOHvUv6ucmwdZez3O03E47f/kViesfa
         OOyJT9Q5sg4wQ==
Date:   Sat, 16 Jul 2022 14:40:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: brcmstb: Fixed adapter named with optional
 interrupts
Message-ID: <YtKxpz7kiER8ydcj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BRCMSTB I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20220706172115.224240-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LJK7ertNbs9eFtr7"
Content-Disposition: inline
In-Reply-To: <20220706172115.224240-1-f.fainelli@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LJK7ertNbs9eFtr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 10:21:15AM -0700, Florian Fainelli wrote:
> When the adapter is registered without interrupts, we would be showing
> the following:
>=20
>   # i2cdetect -l
>   i2c-3   i2c             Broadcom STB :                          I2C ada=
pter

What about switching to pdev->name here? That way you also get the base
address for free to differentiate if there are multiple instances on the
SoC?

>=20
> which is visually disturbing, only add the separator if we do have an
> interrupt.
>=20
> Fixes: dd1aa2524bc5 ("i2c: brcmstb: Add Broadcom settop SoC i2c controlle=
r driver")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/i2c/busses/i2c-brcmstb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-br=
cmstb.c
> index b00f35c0b066..538a51299e04 100644
> --- a/drivers/i2c/busses/i2c-brcmstb.c
> +++ b/drivers/i2c/busses/i2c-brcmstb.c
> @@ -684,9 +684,11 @@ static int brcmstb_i2c_probe(struct platform_device =
*pdev)
>  	adap =3D &dev->adapter;
>  	i2c_set_adapdata(adap, dev);
>  	adap->owner =3D THIS_MODULE;
> -	strlcpy(adap->name, "Broadcom STB : ", sizeof(adap->name));
> -	if (int_name)
> +	strlcpy(adap->name, "Broadcom STB", sizeof(adap->name));
> +	if (int_name) {
> +		strlcat(adap->name, ": ", sizeof(adap->name));
>  		strlcat(adap->name, int_name, sizeof(adap->name));
> +	}
>  	adap->algo =3D &brcmstb_i2c_algo;
>  	adap->dev.parent =3D &pdev->dev;
>  	adap->dev.of_node =3D pdev->dev.of_node;
> --=20
> 2.25.1
>=20

--LJK7ertNbs9eFtr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSsacACgkQFA3kzBSg
KbbOHg/+KG6EldS5rYxtybZl1Xmz7FqF7erdT0vtqs2eYqPdK40tpJ3i09LS3gv2
lh3vlpBT9CnW/JteYnpLYCH5fmeWDA98mStrTb4Qpf9xlm0vrCzj7o774UoGHObW
xHx4rfo7S3oczUEgK7DvNr3bYF1mR51BTqsOOgbMEW+v4aBq6Mpaz0Zd7MN+8oQ+
HWmtgkYoypwC8E/jia/FmhLfEF+kkbuk/exI3pKBmWrp+fmqqibdB1fX7kTjSM6+
M3qkcsW/0yKFjrp8cKeyY/5MYOnABsE7GRlGlctJqEGw1dV0w6Kn1LqRtVda9Wbz
gATgl+7z66ZfgMEHqpUIlUapeLqczue8coMqeLI3xwqQRnO5HceQi54jq/KcSF3E
iSdC+YSbJbkXHshxKQGc0ChtPjf4Ex/ECJo+JHXGNfAg4qkbtYbAOPD3BgUabtRh
CEqcrrPV+0UM5dNfF/d/i/29Z6cNgOc/0pHKbzGvE9imT9zMs5qGKRskeow2lb1U
X6kIclUfsv15BtCF1um7BAJWpRvSOdp95AqLUkB4NDdFOFeGChl5oGKKfdLWWuMM
ISXwCTYJKQGscFAdxXyw8akeKcn6E7MEfxDPFDqqQkjDqcaZxK1vVYN1eLmSJkvS
zWH1AWzvafR2fQt6hq4rO1dlhOTYdYqT5qEezlKTfaz+CuJ9IWs=
=TN3x
-----END PGP SIGNATURE-----

--LJK7ertNbs9eFtr7--
