Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070C42587E0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 08:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgIAGLM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 02:11:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgIAGLM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 02:11:12 -0400
Received: from localhost (p5486cc57.dip0.t-ipconnect.de [84.134.204.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D61DC208DB;
        Tue,  1 Sep 2020 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598940671;
        bh=YsDbACSX8CnRhHRZGrmXUc3sEBWwyLNxZmT5l9Rde84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CLKRRC3FAZcPv5wieBFaYC4/EIyrAe7n9Rwvf9RaPKLFuCsEguaLgth/kwWICOt/T
         uZDzm0qqCGT00++bb/x44FoBogEmMASrHh7/S875Er/fji8IUqH5XAED8hN1jB9n7L
         PjuXCq+nuZ9cL7SbFAShV8+1oA55Jn55fCJb3zrA=
Date:   Tue, 1 Sep 2020 08:11:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
Message-ID: <20200901061108.GB1148@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-3-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


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
> +			dev_dbg(&panel->input->dev, "command truncated\n");

Just double checking: Do you really want to process truncated commands?
Since you detect the state here, you could also choose to reject such
commands?


--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9N5fwACgkQFA3kzBSg
KbblGxAAqtep5GwduBK2FEY7BHP1N8rC4iVTZ7zJcUIwulC+F5Yp1xRPKz1qSQ/S
7FiKoSb+PCIbaxb4y6XninMvEp1wd0Tg+3LJTiKf2GLbYP+SbAOEHIAPMONFudmL
d252Sfh+8arrvDfU7xgRVwnMQZEd86y7qQv3l6iAWHUps4Xq1xrJ4cWE9P5FoUOW
ZBVW+4snG0Df1FE8FI0K1IR6ubQzFTa01ihq1ua2VRA1Jxt2X2eSKNp0CP0hfOjY
yAFXmqxMU7mG+t2TgzVJawdDqSJSm+rXDDF6VOTudT4FQh6R34HEC5b7T5Z6x090
vJfXV3sYTtdnb7Pa2v3TnnF7dR/K0we7GZlXtI1ssgx/+7MioXqX2/2zgPTJtrnl
0lAN8B0tWz2bucSxb0e2DK3MYnO6GmK1QHMI+Q/aDHjOXjHx2qsfpy3DHxZdmV0h
DwEZxGR+RZ9/gsPMot2ahQhC/cR9EKHPnhu5+t2dQvyeRYo95Y3gfTm52U+/qbg1
aPTLqJHZXcLE8hLh2wzmjoaRl/lULyizU3IGvI/aFIA+dzRdQHe00QVe6b13LmrK
ABQW2hBfV2XYo7l8H11evDVJ9PNDK32Lj/askz7F4+xC4yq7B02X+zb8r2mNpN7e
FOY1/3ShXPSrQAEiTeu0oKjWY+mzjqPngc8xRhasn4nrM/5RKj8=
=Mnzn
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
