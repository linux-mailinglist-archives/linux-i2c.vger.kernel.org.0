Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76596A47D8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 18:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjB0RXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 12:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjB0RXU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 12:23:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20A21205D;
        Mon, 27 Feb 2023 09:23:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE52BB80CAE;
        Mon, 27 Feb 2023 17:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2209CC433D2;
        Mon, 27 Feb 2023 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677518596;
        bh=+SBZwkALRB0cxBJAoCsB3XkME62yCRKd3uRseS1J/I0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJUYjCEtD4l38C7r/2OsKb+m59lda5sPVo0k8zL1CA78ooEyfu9im+NP+gS5NuTag
         5KVesuQRBqS8z4oLkynsemQGkosAxpmZYqev/Jxkqh0Mfo5m2znLsEEXLAeeQhvfWI
         km3GDcQ3JnfjMmcBLazVb+4V6+HWumdqxXNlkW2Bgf9cAeR+WLpSXGY+S+pUPTNN20
         aDp/XUGMy6ntE2t3PqpJfDZVuIHMNWdhM4mgEJwswDTWuxsojuAXu6iaFyhJJYarOj
         zBASj0Fxxsz2IzU/AFyEgYguRBeSphKk4y1whzG2wVFzdUjCFdDxc/eusBOQHTHt8s
         /HSlsV24Qrevg==
Date:   Mon, 27 Feb 2023 17:23:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v2 4/5] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <Y/zm/Uk/d6VRxLBx@sirena.org.uk>
References: <20230225140118.2037220-1-xiang.ye@intel.com>
 <20230225140118.2037220-5-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N252Zu7nZpqEMZYb"
Content-Disposition: inline
In-Reply-To: <20230225140118.2037220-5-xiang.ye@intel.com>
X-Cookie: On the eighth day, God created FORTRAN.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N252Zu7nZpqEMZYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 25, 2023 at 10:01:17PM +0800, Ye Xiang wrote:

> +struct spi_xfer_packet {
> +	u8 indicator;
> +	s8 len;
> +	u8 data[];
> +} __packed;

> +static int ljca_spi_read_write(struct ljca_spi_dev *ljca_spi, const u8 *w_data, u8 *r_data, int len,
> +			       int id, int complete, int cmd)
> +{
> +	struct spi_xfer_packet *w_packet = (struct spi_xfer_packet *)ljca_spi->obuf;
> +	struct spi_xfer_packet *r_packet = (struct spi_xfer_packet *)ljca_spi->ibuf;
> +	unsigned int ibuf_len = LJCA_SPI_BUF_SIZE;
> +	int ret;
> +
> +	w_packet->indicator = FIELD_PREP(LJCA_SPI_XFER_INDICATOR_ID, id) |
> +			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_CMPL, complete) |
> +			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_INDEX,
> +					 ljca_spi->spi_info->id);
> +
> +	if (cmd == LJCA_SPI_READ) {
> +		w_packet->len = sizeof(u16);
> +		*(u16 *)&w_packet->data[0] = len;

Are there no endianness considerations here?

> +static int ljca_spi_transfer(struct ljca_spi_dev *ljca_spi, const u8 *tx_data,
> +			     u8 *rx_data, u16 len)
> +{

This function has one caller with barely anything in it - perhaps just
inline it?

--N252Zu7nZpqEMZYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP85v0ACgkQJNaLcl1U
h9BIlwf+Nbje3veuBnpfv+ZeclyBPPaTReO9MEpZHFwpOILoA2mQxVdtQ5DBqObm
mnXmP3TdRdJvYf4n0MxtflxvgukIGaQoDm7LHx3JxeRESqtTpORJS8S3CkCWQATF
2Ui/NP1tvJILrljgtOWTI1UmvWXprj8wz4UsUY1mxcDLwKKbEvAe7UOXnB1dZEW8
m7Bo2PXG9URgmLsk1/nnGyZEkLquy2z2pqXUIWfHz7N1lgbbXbYyB7SWsFUeYGg4
sUvHu0PcSMbm83+RGm+xzA/LcTJ2BOgKZFXF6scLdijA0nu2nPf0d7UCMonsPDqr
wxUmVY06/ThUdahIiJArdgBJSkG13g==
=mOKa
-----END PGP SIGNATURE-----

--N252Zu7nZpqEMZYb--
