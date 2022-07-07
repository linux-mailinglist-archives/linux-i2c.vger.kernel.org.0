Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3790156AD1D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 23:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbiGGVDO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 17:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbiGGVDN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 17:03:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D9C205F7
        for <linux-i2c@vger.kernel.org>; Thu,  7 Jul 2022 14:03:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D13F2B8215C
        for <linux-i2c@vger.kernel.org>; Thu,  7 Jul 2022 21:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD4BC3411E;
        Thu,  7 Jul 2022 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657227789;
        bh=OZx4dC2p05UGQQE8MMRf/HvPH/ohhoQ+1pvHOdwpblo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3SWavCrMs58w7AFnugI5gd6dHraHVrqiHy+quCvjudpVMLWy3kwpBv+6G8tHdDea
         KUO+pM0nd4oCvdX370FpOxjrZ5X08bvmZKztu5wbdf+qitEva+qwI69/L0B0rZFVdB
         2uQoc5mOSR5cJaVWGi5l5S5d9bf+Y0gA24Bb9nTjCCO9Kh4rg5eHW2TWSlTDmStSTc
         whFPMDy928GThDtDyUwn9QtrOtICutAHNYNz24eypryYrBwZYKCPLhH0ioKGgmwJa7
         Fyjd2Wp9bsw4MTBxR457qA1FyCYZTxvnmLgttCwp+6K1HMIKCwSQpPQTU84l3DZJEd
         qVYMmXNLdPV7w==
Date:   Thu, 7 Jul 2022 23:03:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
Message-ID: <YsdKCeEbEW7ZodZe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
References: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UT7d8yRAtmpI1jtZ"
Content-Disposition: inline
In-Reply-To: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UT7d8yRAtmpI1jtZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 04, 2022 at 11:24:20AM +0530, Shubhrajyoti Datta wrote:
> From: Robert Hancock <robert.hancock@calian.com>
>=20
> Hook up the standard GPIO/pinctrl-based recovery support..
> In the discurssion
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20211129090116.16628=
-1-shubhrajyoti.datta@xilinx.com/
>=20
> recovery should be done at the beginning of the transaction.
> Here we are doing the recovery at the beginning on a timeout.

Which is still wrong.

>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

This is an AMD address, but the one you sent from is from Xilinx?

>  	if (time_left =3D=3D 0) {
> +		i2c_recover_bus(adap);

This is the wrong part.

>  		cdns_i2c_master_reset(adap);
>  		dev_err(id->adap.dev.parent,
>  				"timeout waiting on completion\n");
> @@ -852,8 +858,12 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *=
adap, struct i2c_msg *msgs,
>  #endif
> =20
>  	/* Check if the bus is free */
> -	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
> +	ret =3D readl_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET, reg,
> +				 !(reg & CDNS_I2C_SR_BA),
> +				 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
> +	if (ret) {
>  		ret =3D -EAGAIN;
> +		i2c_recover_bus(adap);
>  		goto out;

This is proper.

>  	}
> =20
> @@ -1278,6 +1288,7 @@ static int cdns_i2c_probe(struct platform_device *p=
dev)
>  	id->adap.retries =3D 3;		/* Default retry value. */
>  	id->adap.algo_data =3D id;
>  	id->adap.dev.parent =3D &pdev->dev;
> +	id->adap.bus_recovery_info =3D &id->rinfo;

Since 'rinfo' is never populated with actual data, I am quite sure this
patch has never been tested.

Regards,

   Wolfram


--UT7d8yRAtmpI1jtZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHSgkACgkQFA3kzBSg
KbYL5Q//d76HP2/aVsDhvqjzukRhWIXGCX5aNszuOBDrUqZ+RkplQpgyYhZpbCZS
hbrK5tBT6V42gEtGfnZ8174DhyngElO+vdVT3guD8CbdyGMK9LRmVD12ZwgoLC0J
tvu5TFVy/mez6WGJWw6tQ1kjVoED1iriNEJ7hePFIxYCIHHZSadoygkwlM7OtZSU
0nAVRd0mprQSNK50H5/5FLBTeaK2Xv9xfl+ax9YYuONcNi1bAU6Zo0+yObxlWI2W
5E6Ku4qU4CHO3SwI19+osL/luGOs44OF1tkq32CUSFFShD4u17FDYRiAIcLZOY2H
ltzYOaqx4pTkQAr+7WcPmRYCfoLmFpu1hx8XyqwE2rYIfW0DxMI4gq6n8ekxLvRg
gfaj3UC8NrjWfnsTffgdhMLiGINpxbDHhltAR7+0zIhoR89Hcnx4brE/HUTxUaHd
PP+szH8CZj3AF8fFQ09d7Crkyo5RHmQn4D3PU9B1OihREpxN/8GqVrs10g+1jEb2
c7lYdzIMLf0FCkbcXpTr6X+gZc6pgHt5pCkosmN4IT3ix4Dj0JfRXjgFUa7wmnlh
EF6UoI5lICNZ6N7x7N4oBCnxrEqNsBIVzmXFVKehhq1YGQjjMrgMvNKihsWOC48b
VdPtE+4EEte5bKq5BQInxLnyg7yCd2sa9RlRwhYw6SPKbp7baqI=
=QeTy
-----END PGP SIGNATURE-----

--UT7d8yRAtmpI1jtZ--
