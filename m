Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712CF528DF8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 21:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345442AbiEPTby (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 15:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345498AbiEPTbw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 15:31:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1A92BB12;
        Mon, 16 May 2022 12:31:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9CB95B81609;
        Mon, 16 May 2022 19:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839D6C385AA;
        Mon, 16 May 2022 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652729505;
        bh=fBVwXZHo+qtid7S1as4N40jlClPl0L7tGotumAtf2P4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QR7zllv543zL9AN8Xo3Xo3bQMny8OxbwHTJbM0P3iFC9Z8q7cp1mfhyQgQCKMOelG
         9qRk9JGezcv4FG8rTrWTLTgWLxm6+trlPt6nyYE6sEhTp8BHDxNom+wMopnAJZ2GRb
         DiUJfN5699H/Wp3teEc8Qmk+Rpf7SsGNt5j8INy84x5RS/1u6hSgHypwjv/ko6FnXE
         AVNceXkCn0vsCJCfeqfWq9o0jRQZfXUSgh0S+cp0DSREFqZUVBtUQAfTHo0Xp1AIM4
         xb+MXxHPqCU64DmcIS7P6fFD1B1XeAey4te7gyPZncKBNLKsqdFctjIoV/5VO42JuF
         5ONMbx72fw0qA==
Date:   Mon, 16 May 2022 21:31:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] i2c: algo: bit: allow getsda to be NULL
Message-ID: <YoKmmIz7qJbD+hPY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
 <2adcd797-f3cc-c8c7-c18c-d3726b2db4c0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7HTPMeNKasai8ds7"
Content-Disposition: inline
In-Reply-To: <2adcd797-f3cc-c8c7-c18c-d3726b2db4c0@gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7HTPMeNKasai8ds7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiner,

>  	/* read ack: SDA should be pulled down by slave, or it may
>  	 * NAK (usually to report problems with the data we wrote).
> +	 * Report ACK if SDA is write-only.

Minor nit: On first read, I didn't understand. "Always report ACK..." is
maybe a tad clearer.

>  	 */
> @@ -203,6 +204,9 @@ static int i2c_inb(struct i2c_adapter *i2c_adap)
>  	unsigned char indata =3D 0;
>  	struct i2c_algo_bit_data *adap =3D i2c_adap->algo_data;
> =20
> +	if (!adap->getsda)
> +		return -EOPNOTSUPP;

Wouldn't it be better in 'readbytes' returning an errno there?

> -	/* Complain if SCL can't be read */
> -	if (bit_adap->getscl =3D=3D NULL) {
> +	if (bit_adap->getscl =3D=3D NULL && bit_adap->getsda =3D=3D NULL)
> +		dev_info(&adap->dev, "I2C-like interface, SDA and SCL are write-only\n=
");
> +	else if (bit_adap->getscl =3D=3D NULL) {
> +		/* Complain if SCL can't be read */
>  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>  		dev_warn(&adap->dev, "Bus may be unreliable\n");

Hmm, this is a bit inconsistent with dev_warn and dev_info. How about
this?

 	if (bit_adap->getscl =3D=3D NULL)
  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");

 	if (bit_adap->getsda =3D=3D NULL)
  		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");

 	if (bit_adap->getscl =3D=3D NULL || bit_adap->getsda =3D=3D NULL)
  		dev_warn(&adap->dev, "Bus may be unreliable\n");

The above code can surely be simplified. I just wanted to show this
simple approach so we can discuss my suggestion.

All the best,

   Wolfram


--7HTPMeNKasai8ds7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKCppMACgkQFA3kzBSg
KbbDCxAAjIYsYW1Ttcja4UkbcbmB8iRJYm/y+wqc5f3STHPyXMYfzWCxcAVHRb8v
s4TLElRKkFVNioSkmEvGFJDtzr3x1hOLsoYHDaVa+facYCQFNBiGISvDYqqjsA4z
274eEYmp1mG44vKSp3njD8WrGhzl9LRm/rCOzDYAlINFHsXMik0nOG7+ggK3ThgK
cJarWHQL9fovFqgfkA4E+eRkuIwkkbeya8C6o5Gz3LeBfOm87E2q/C9JQq1lnZLJ
oA/8mckyNpXg+BCLT739T7oDyTwdvFno/0RXEitUVzaU89c3Zn79HvgtV6cJQnMh
VyX0m1uS5gRBkrv1VolUdq1nRUhX/N1yZQw2+HRmgW/NiVcSvBDKLfMnX7hsDYxM
25m2GyBP5nAf6SeKtHId3+/QRYxiW6gdLrR81I4ZuAU35DEq2O0j8c8s0aEG+avU
I9By8DI6EIuurVCd1ttsRF3zQW3d3u9iUAsp951euUgSWomkF/hgrJMRhtnyhZFX
r4eBnqd2faYPn6+t18lh1hjyqWR//+cvNM/exvAUKXvk4yNM2iFxodtrsRnAKWy5
cnGzoLgA38riRDwbSOpWqsIgYZ1Fmk3DCuX1BEsI1Xf/TtEp+F9MSKpmbNRi6ztK
ICYpH+IZDV2dqc9qvRyDzzYx2gm8w6pVF6Sqz6xe4pF+mR9KveM=
=SE0n
-----END PGP SIGNATURE-----

--7HTPMeNKasai8ds7--
