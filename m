Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8792C262142
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgIHUlB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:42672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgIHUlA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 16:41:00 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3343F2078E;
        Tue,  8 Sep 2020 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599597659;
        bh=ZBnLqQXUDUlPYMCF3YpMXyyslNWcYsHiCcgLu+l3GO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lmsOjBes32X3TWdJGF24xlfXkf0qQfz0GJ8xy3LbxJUgwN6SuOMWy8qAn1cBLFs/a
         OaPms8VG5VDug9HTt4NNty4Zw+Jia9Hd9t6g8QmcsM0m51y0CFTtcnoPYDphK4K5Nk
         ebRLfSyiyhskW5cbP34dXOG7s/KaASIdZgosxUuA=
Date:   Tue, 8 Sep 2020 22:40:51 +0200
From:   wsa@kernel.org
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        rentao.bupt@gmail.com, ryan_chen@aspeedtech.com
Subject: Re: [PATCH v2 2/5] input: misc: Add IBM Operation Panel driver
Message-ID: <20200908204051.GA46393@kunai>
Mail-Followup-To: wsa@kernel.org, Eddie James <eajames@linux.ibm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        rentao.bupt@gmail.com, ryan_chen@aspeedtech.com
References: <20200908200101.64974-1-eajames@linux.ibm.com>
 <20200908200101.64974-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20200908200101.64974-3-eajames@linux.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eddie,

> +	switch (event) {
> +	case I2C_SLAVE_STOP:
> +		command_size = panel->idx;
> +		fallthrough;
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		panel->idx = 0;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (panel->idx < sizeof(panel->command))
> +			panel->command[panel->idx++] = *val;
> +		else
> +			/*
> +			 * The command is too long and therefore invalid, so set the index
> +			 * to it's largest possible value. When a STOP is finally received,
> +			 * the command will be rejected upon processing.
> +			 */
> +			panel->idx = U8_MAX;
> +		break;
> +	default:
> +		break;
> +	}

Sorry, I missed this in my last review. READ states are mandatory, so
you will need something like this:

+	case I2C_SLAVE_READ_REQUESTED:
+	case I2C_SLAVE_READ_PROCESSED:
+		*val = 0xff;
+		break;


> +	if (command_size)
> +		ibm_panel_process_command(panel, command_size);

I wondered if you could check for the correct command_size here, so no
need to call into the function when the size doesn't match?

> +       rc = i2c_slave_register(client, ibm_panel_i2c_slave_cb);
> +       if (rc) {
> +               input_unregister_device(panel->input);
> +               dev_err(&client->dev,
> +                       "Failed to register I2C slave device: %d\n", rc);

This dev_err can go. The core will print messages if something goes
wrong.

The rest looks good from an I2C point of view.

I'd think this all should go via the input tree?

Kind regards,

   Wolfram


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9X7E8ACgkQFA3kzBSg
KbZZlw//fDqtIYCmNJjyZM2EgNZ/ONjnWdFRKtGBTVcqUcsVUARK908eeGg71Faa
mgV79t2WGoNcBlNNemyEYhdAawTvU6bVxMJ6HF1pEOUBz27xm9LuPQSJvPs4bk1K
mYOB6h+mW7n0hQ+W8a6QrWf6kcjxsHl1ElkzcysK+pxMWFzMkzk70jIQpqiYZYO9
kU/s8Fik4c7rRBTfqz61FyRz/kr2f+bkKaMByvedVDlrU2ZRT5B62hvYqsNvuen8
oFCyIf26/GgjQCDH/lzQsSQZNYEX2wkN9RrL/7BlNN2eL8XXPt9eGdmXVE1UxbV4
c6bN7xQSAsh7Buc0yK1x+yxZEU6RidGA7NRK0cheWcewui8VB6kCyPHNJgEo/5HC
jfBOG81k1Sb+sIzmkf5agjWq/G1Xak1ZNjVPcITfqzV23mfSLGasUyzeuT5QPMUp
DTHdptphhgvQ+mA63EA6dJI8Isz5qh18HxWOrX5xRsRUHbhbZjg2PDesPGKmw5jr
05rnIGRgz9ntZxpdNhOqqQTUDVZ/+7WDHRkveDtQgrpzWu1eWf/1ku6GJcHyFViX
eZCYEO8Yo5yFU6JLIqa1T5NzoKJJd/TqU03y1iEKADDhynobjssrZ3IJ4+fy5zaO
PCA+oP+CiEcScDLN6LEnj1YZxJUiwo4o88sfbUOEPPy5qqxtXXI=
=KIvm
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
