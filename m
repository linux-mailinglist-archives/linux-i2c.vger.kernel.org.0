Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5955BBA83
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 23:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiIQVB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 17:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIQVB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 17:01:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512872BB09;
        Sat, 17 Sep 2022 14:01:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A92F3B80C8D;
        Sat, 17 Sep 2022 21:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF1EC433C1;
        Sat, 17 Sep 2022 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663448513;
        bh=+hT/9Aw0x7veybJewSaiOwhfsAK/8w4ZxgaUJx8BNH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FhZtrlYrgPwFk4gSbt201/xr4bdWoG4F9/XQGihZqJ5la9y7bGoUhfJCS2bC93j7Y
         0XlMhNNbyTeEmgYS4NqPS6uukNGg9MIn0qkCKRfadrbm74vj0Gjc6smRUIdgKFFHxQ
         vUfwuPLF0zazynTEThxw37YWyqgiJk6aFx4btObKgROMpDH5Ckg24qSbpau5EZ1Xz2
         rZeAyRNQToJpjIFHY8P9pztxrJTEpG13nUQWBQdSd9VZVh8Yipcu17HGTxG/pXwm1F
         kFqPwROGPmKOGavAcRDCcke3HO2MsU6nf+DwTAtTics/D92KXmxRO1C5d1y7QztHEP
         by5g2nKszMjsg==
Date:   Sat, 17 Sep 2022 23:01:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, krzk@kernel.org,
        jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YyY1vESf5JalT6GR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, krzk@kernel.org,
        jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eFVKGzIn+ZlvcRG0"
Content-Disposition: inline
In-Reply-To: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eFVKGzIn+ZlvcRG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 07, 2022 at 09:41:43PM +0530, Tharun Kumar P wrote:
> Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C function
> of the switch.
>=20
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>

Thank you for the driver and thanks to Andy for reviewing it this far.
He is right, some nits are there which can be fixed later. But a few
things I need to comment on:

> +static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING |
> +		I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
> +		I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE |
> +		I2C_FUNC_SMBUS_READ_BYTE_DATA |
> +		I2C_FUNC_SMBUS_WRITE_BYTE_DATA |
> +		I2C_FUNC_SMBUS_READ_WORD_DATA |
> +		I2C_FUNC_SMBUS_WRITE_WORD_DATA |
> +		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_READ_BLOCK_DATA |
> +		I2C_FUNC_SMBUS_WRITE_BLOCK_DATA;
> +}

If you can't do I2C_FUNC_SMBUS_QUICK, then you need an i2c_adapter_quirk
struct saying that your HW cannot do 0 byte length transfers.

Also, a lot can be simplified here, e.g. I2C_FUNC_SMBUS_BYTE covers both
cases, read and write.

=2E..

> +	/* Register the isr. We are not using any isr flags here. */

Why not use then simply 0 instead of a define and a comment?

> +	ret =3D devm_request_irq(dev, pci_irq_vector(pdev, 0), pci1xxxx_i2c_isr,
> +			       PCI1XXXX_IRQ_FLAGS, pci_name(pdev), i2c);
> +	if (ret)
> +		return ret;
> +
> +	i2c->adap =3D pci1xxxx_i2c_ops;
> +	i2c->adap.class =3D I2C_CLASS_SPD;

I need to make sure: do you intentionally want autoprobing for SPD? I
ask because it could be needed but it costs boottime when not needed.
And changing the class once exposed is troublesome.

Happy hacking,

   Wolfram


--eFVKGzIn+ZlvcRG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmNbgACgkQFA3kzBSg
KbbCTRAAmBaQg9qrdV42WcrrillciI53u8lW6a8RKn8zH0lhN0GToeAy+VcQ9pr6
8cXxYtqDt2FSsrgWdabCm7hMTOQxsKbRV0xmFBpeOuBKgNnQvHMnr4i424eDbdw4
P/cf5a3SRTPvT1wA85ihPFbszfNtqsElgkPETnvLGP48qw0xgB+TrBqji8TMtQ5L
eFD4AolHXEckEajcJapbHHaL4lCPejTEEMHTFWzy7welGuARBD9fdIKvsQMM/KF9
2Q4ohinZjbbfdWi8JOirFfOtklfb2ywmtUUFdLQd4MCsAyKv4cyFkdbq4Q+UmMBe
N/VuOZyOrqdCFRmedRMEqCdvCWelps432NbywplvdewTOpm9rVgcHCAmKAyckapC
/QMMTNtEvMrmYJL6tuHZJVCG1peDwr7kfAOgD1rl7WN/csqePl2aiTDdmIn8B5xc
cu+ogGlECoiV2PF1c9btduW6St37xRFgokZ5s7IS6CKjbFtYsFfBvq3JrJKTF8Be
zW+7bE7t271ly2eGlH3mwvPcrfdc6Z9tKvaKlH41luE90FhUGEGgl3Mp1QjhR6ez
i1Kl3FdHSA29G+N8HWg1DFomp2+d1kGNKosoRyibbTNzcjpJwNTdkyb3HqTB+tl+
U6kUeXuqS3nO1kqFWJqoxCgawsIsJNYsDYP0O4Y3nnB5V4H29Eg=
=e4fx
-----END PGP SIGNATURE-----

--eFVKGzIn+ZlvcRG0--
