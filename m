Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7686120AE5A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 10:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgFZIWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 04:22:14 -0400
Received: from sauhun.de ([88.99.104.3]:37642 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFZIWO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 04:22:14 -0400
Received: from localhost (p54b33841.dip0.t-ipconnect.de [84.179.56.65])
        by pokefinder.org (Postfix) with ESMTPSA id 538F22C0307;
        Fri, 26 Jun 2020 10:22:11 +0200 (CEST)
Date:   Fri, 26 Jun 2020 10:22:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mans Rullgard <mans@mansr.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: check returned size of emulated smbus block
 read
Message-ID: <20200626082208.GA4559@kunai>
References: <20200613104109.2989-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20200613104109.2989-1-mans@mansr.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 13, 2020 at 11:41:09AM +0100, Mans Rullgard wrote:
> If the i2c bus driver ignores the I2C_M_RECV_LEN flag (as some of
> them do), it is possible for an I2C_SMBUS_BLOCK_DATA read issued

Out of interest, which driver did you use?

> on some random device to return an arbitrary value in the first
> byte (and nothing else).  When this happens, i2c_smbus_xfer_emulated()
> will happily write past the end of the supplied data buffer, thus
> causing Bad Things to happen.  To prevent this, check the size
> before copying the data block and return an error if it is too large.

Good catch, we were relying on the drivers too much here. I think the
same fix is needed for the non-emulated case as well. Will have a look.

> +			if (msg[1].buf[0] > I2C_SMBUS_BLOCK_MAX) {
> +				dev_err(&adapter->dev,
> +					"Invalid block size returned: %d\n",
> +					msg[1].buf[0]);
> +				status = -EINVAL;

I changed this to -EPROTO as described in
Documentation/i2c/fault-codes.rst.

Applied to for-current, thanks!


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl71sCwACgkQFA3kzBSg
KbYGPw//ZrBp9jkyvtk0WmZ2Rkpaf69KHl9lgNoCFfsRVlHAMAOygAgedV6ih0an
13bFDvRfjEIq2ZnWJT/M+PhraNOOUyNgujMbpeiyAMR9aff2W17QECuDFsyluQ9C
SMQFtqpuLey+t0rVxO9gpNvGUhz5C5aZvPCQfGAsxVKve+2EwqlQep1S6JknN6HW
4SBPeK+y2SdCIR00bwojpkFn7JHw2pwCsraz2lxX8EwQlJVcUxQ10tA0QEKu1zla
DDsyfNlsg1YmntX315IJ4fnHU9MtROS7qv67sqo5A4+bPtWAQqkeIg+c00yyJRH/
fyL0A8k/Cc2U9GtuXAGtZV9pCNzCe2wn8cw0gnEQ9HSQuAiKTV9fr5Nx/9NkFMev
xvrz/4ay7TxSTcrrYtHADXrjDGKHGEJ0a8sXONAenCTJgmC4dy9wjHn5UNcap+nJ
fMG+u5krSwcsCj/1cTbPcRV7F0MDZ5bkxleIhDAWh1dzpnr3/BKoCZrSiKV0Ln4N
Dvy0+Q16ewbFwby0+p0Mrxsk10Rre+qcgKqZD5b3DPZbE6MZpC4XKZrOEUgilJaI
Q3TBqXNNYHZ+oSaDKwQj3wO9SELbZdymZknEpS7vORgvMyIz4sBVhxIsQCtX944F
eXYvJGjWFTQL700XPh0DsW+1R6G0ChavBzv8azB7OTNgrf18+Oc=
=Tpvw
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
