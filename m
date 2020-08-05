Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59F023C835
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 10:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgHEIwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 04:52:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbgHEIwi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 04:52:38 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2B482177B;
        Wed,  5 Aug 2020 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596617558;
        bh=vu4bu5z9/vfE+ysgdbkt/Or5Zq032DMLXZbVq+Roaf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PZ5J/Q1QAa04Zp/Hcg+ox3ngVm2XSvHfsxvrKIvk61pj+BA84JABYkEgwI1NFnC+U
         IQkOXSfR0XTas5rf5YxGLMLDaG22qhpDRKtWVkifTFiPcHgfeZSm9Ro6Dxsquu5rq3
         4svlwLC5uCAa1nLjm2w2/PPgG0B27gSf2AQMx2TI=
Date:   Wed, 5 Aug 2020 10:52:36 +0200
From:   <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 0/4] i2c: core: add generic GPIO bus recovery
Message-ID: <20200805085236.GE1229@kunai>
Mail-Followup-To: <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
        <kamel.bouhara@bootlin.com>
References: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
In-Reply-To: <20200804095926.205643-1-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Codrin, everyone

> This patch series was previously sent as a RFC. Significant changes
> since RFC:
> - "recovery" pinctrl state marked as deprecared in bindings;
> - move to "gpio" pinctrl state done after the call to prepare_recovery()
>   callback;
> - glitch protection when SDA gpio is taken at initialization;

Thanks for the fast update, now all merged for inclusion into 5.9. I
think it is really good, but to verify and double check, I think two
things would be even better..

One thing, I'll definately be doing is to add this feature to
i2c-sh_mobile.c and scope the results.

The other thing would be to convert the PXA driver and see if our
generic support can help their advanced use case or if we are missing
something. Codrin, do you have maybe time and interest to do that? That
would be awesome!

Happy hacking and kind regards,

   Wolfram


--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qc1QACgkQFA3kzBSg
KbZCyg//Qg7gQ0nyIFtC1bC47ahB6lQVhGflL+6pItCAXkD7FMoEbFOTFDtDHAcy
/Uz+AmMkv96HY0sI65t4LI2mJZZcOL9WXyO8Aas1/Y7wAB9IxKz3reECmodn305S
PU0v4AlFTI3r0Zck7s4F0MPLQ3wVfNoyk6RYhJpAI8/aPEmC1im9BTq8MfAaXZEB
ghxbnqWLAiNMAwWUBuqQOkH+yD1C5+WRdyiyrWbcwGDnrbZQUmZrsZFarfzG8BHY
8bo4a49Nb1lZu0Y5Y06Iy6EerXEpeOWZza/J0T2pNfxW7yvZpKyDMgE2L2uww6GO
BLdZMPSMJuhVRJmRdS/edJSoQKSG1P3rBUCmLyuv2eoo2HOO567SunGfjuOSboRV
cgyQ6sXyN64YKfhvqtaLB1KAKJuLQ5vpJaqzEVZI3WA/Gn+6mBP4fh3XjhQhDEBt
0n+URh0t8zmdBZvW95+wAzR5IIzNoo7TpIoJAkkkz00eLDOZxEh9iPOAaGARvFKL
4tGLLFkCR4oPd7scvcySNFzqRFNSLlAXeDxcRMH4jddc3lY5Ntbq/mIoV5DUcUKo
R3wnpLzDx7HNGO10dNjBP+1yakGz7WespmHJF8zJf7l1xQ5zIRqVSvTYWV2LmGoB
uGTfGvISBXR5DQKmkk0V8a61Yqw94wckoO8Kn2JOrGzwLT2yu/k=
=nFwm
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
