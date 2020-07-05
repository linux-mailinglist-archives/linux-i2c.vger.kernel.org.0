Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDEB214FC1
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jul 2020 23:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgGEVJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jul 2020 17:09:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727894AbgGEVJ6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Jul 2020 17:09:58 -0400
Received: from localhost (p54b33111.dip0.t-ipconnect.de [84.179.49.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66BD920708;
        Sun,  5 Jul 2020 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593983397;
        bh=/CSI7abxLv8Pc3WAATfmk0MQHaUctOQmqgjenee+WS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hVbmiwgQ+gyxLGOWmEQrsr/+QFj3HrZ6kILQ9SdqDqD71MSP+avP5cp+0NXZ5WGKy
         mtCciswcqwa+VB1OpLoiH016DRJ6IVwEJNbsJOWE8rurmnkR8oPHVWzogfLVXoEarj
         8dbk6u7VMdQYtjR3ZVUwIMYq+k9ZppWVGZuh2rL8=
Date:   Sun, 5 Jul 2020 23:09:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 0/4] i2c: core: add generic GPIO bus recovery
Message-ID: <20200705210942.GA1055@kunai>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2020 at 05:19:00PM +0300, Codrin Ciubotariu wrote:
> GPIO recovery has been added already for some I2C bus drivers, such as
> imx, pxa and at91. These drivers use similar bindings and have more or
> less the same code for recovery. For this reason, we aim to move the
> GPIO bus recovery implementation to the I2C core so that other drivers
> can benefit from it, with small modifications.
> This implementation initializes the pinctrl states and the SDA/SCL
> GPIOs based on common bindings. The I2C bus drivers can still use
> different bindings or other particular recovery steps if needed.
> The ugly part with this patch series is the handle of PROBE_DEFER
> which could be returned by devm_gpiod_get(). This changes things a
> little for i2c_register_adapter() and for this reason this step is
> implemented in a sperate patch.
> The at91 Microchip driver is the first to use this implementation,
> with an AI to move the rest of the drivers in the following steps.

Thanks for doing this! On a first high level review, this looks very
good. I have one question in patch 1. From Tuesday on, I'll be
off-the-net for two weeks. Still I think it will be all good for the 5.9
merge window unless we encounter an unexpected problem. But as said, so
far it is looking good!


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8CQZIACgkQFA3kzBSg
KbZSFw//V/RqkgvKSxNeOBqifHvPPJFZFRuqwrFgRyi0NpSS8q7zgZBRvd1uVk9Q
eRLfGCd6DPjbpi8M2FfNaPHoROvZEQ6pFdQw61Uqd2Z1ELrTBpG2Pvq0J9FFaWbl
U6U5MA+9EaAXSKAA/ylVU3kyCFDgaqpqSRBGGYydIQsUOSf5Bj3lJs1ep4Jtpuq/
nBjbGhuKUP7kegTM8MwRcQuHTG/vX+2FBssKtsqgULgeBwuNjS4BHsXTcE7cJIeV
Egz0998d1vTQsy4GvUc1qfHtcYivCsoG7NKsKA8reos5aPrIjlhMWQ5/YPJDma65
ePGye2rMUdH2bUPBtZ01Px6+4DSJmON6vlAtbseay21yvWr0PaDgpuPTD7jvvMwq
VjHdCEE1EapZTEVySj1plRiPX80wcKlR8RqQZErpdQxEsG911lKEuItG2ppZodOv
25hGQr+R0Cm91WzHvtgKibHoBmauGhHhJWx1yvc+h6S0ZHCE+IeskqEUzetNbZqw
XaJCsD0l1iUY6o5ph5z2NrD1GZ4aCxvNlt/8oyIUvxzyUk8KrQKwXAZW02saIiu+
p87dpYOYLWp/IDri/JZ6tNoehnoeX355UqVb1Wqhk0gfWqQZTIOGmbsLU1D2cTJa
Ti108H0CVqSfuAmkwdUIJAe1BjIVYnaB9INhiYHBgGLzuaX9ft4=
=jI5N
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
