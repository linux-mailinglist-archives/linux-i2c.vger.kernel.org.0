Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B661822B781
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 22:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgGWUU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 16:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgGWUU4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jul 2020 16:20:56 -0400
Received: from localhost (p5486cde4.dip0.t-ipconnect.de [84.134.205.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CC6E2065F;
        Thu, 23 Jul 2020 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595535656;
        bh=FbxTYh0fWLjQ7Sjp/R5xOaVw+O8KPQCewwVWb3GHb1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wiDrhqxXFEBkyR6m/VPuaPmCl4ujg0haeXzw/xkPYLg3z3GLFf+gmTi1//Rg3F5YG
         OVTzSeM6GRIMJ2jvZ+8HLl8Z6yuoTEvruZq7jWIayMMCWTG2a1GHwpBErDvopRz/Hy
         OrAuSlaUupD2qQJWvPEpIotaKQNU1M/CzdCwfsJI=
Date:   Thu, 23 Jul 2020 22:20:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: iproc: add slave pec support
Message-ID: <20200723202053.GD908@ninjato>
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
 <20200717090155.10383-3-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <20200717090155.10383-3-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* Enable partial slave HW PEC support if requested by the client */
> +	iproc_i2c->en_s_pec = !!(slave->flags & I2C_CLIENT_PEC);
> +	if (iproc_i2c->en_s_pec)
> +		dev_info(iproc_i2c->device, "Enable PEC\n");

Where do you set the I2C_CLIENT_PEC flag for the slave? Is your backend
code publicly available?

I may need a second thought here, but I am not sure I2C_CLIENT_PEC is
the right way to enable PEC. Isn't it actually depending on the backend
if PEC is needed? I.e. is the backend an I2C device or an SMBus device?


--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8Z8SUACgkQFA3kzBSg
KbbvpBAAtQRmswxsOKcvCyMFVWcsW5AfEvAruqcfflu4znShCEhfrIQJ0ex22Yar
wk20IjlcslcHYVA/9orCWd781sMa0BSmsvYLEpCdIKx+O3IJ7H4vOyVIwda2fcSv
tMvgFAANNUV7/zEMhrvM8XRV0c86g19iMq8KtbprPGwX/bg2M4VQko8gmUcGBj4f
g1q8x0HjbYCSlEViGTethpGqGK1I8tjWJDIKC4FvqLlU5Vqw8RqkExhHpOLrGEdU
EHkJp1TyZkkJ4xgwWQTtHtr68HF2r9VI0pV/jMZRM/D0NZr9gYzT3wFr1OZ4aHYt
Km/GLzSSjPjf/TWfO5uB2yLE3Ba15N9U+337L8md02v61ZJRSimyUQucTD661XOd
u17HCu0/KLY8jCRvEEdoY6OMNcHZPjKJde4vRuW6o2iiIcuygcbaDUPrOfBuZDdl
kwbktPNE3cdRsDX5Sayr1iV/gccDLg1VWaIzVnnWSaQpxBmpB79cQjarHmRnviJj
N4VxoI5NW+XEc+eKcPRtFKedO78wj9QZmcPygbbFGEC0HMmCX7ciph6fAGE4aNvs
3NJgVPR+XS9GjVUhc/mL1oUuh3vP509cLWUK7PCGumOu2hEIPqI65SqEnKsFo40x
CZH02zq7o5wfOEqZtREELmFr0olUhMlxFh8faiCsfEq941LsaCc=
=eWxG
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
