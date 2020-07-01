Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA0221080B
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 11:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgGAJ1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 05:27:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:47756 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728812AbgGAJ1e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 05:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=teDyRAMnCYGrtz7QXsHV79meCGf6
        97spk16Hx6wV0tI=; b=T1N8UkoBTzbV4inV0ZhfjgXGZrz8XLZJZ7C1R38O5tDg
        QGZw5PY6oLwO11fPnN0QbSv7c7qcE6mODbFL+xsFAtt3eaEyT7kwpDt0Ns8eT9or
        S7bIHriKdAMjEc0Btu3Ha4AumGEjC2OH7vCFfQefKhgcQ4NHWiKMqzD50TFH4bE=
Received: (qmail 489303 invoked from network); 1 Jul 2020 11:27:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 11:27:31 +0200
X-UD-Smtp-Session: l3s3148p1@U2q+5l2pjNogAwDPXwRGALjtBlSZf+V/
Date:   Wed, 1 Jul 2020 11:27:31 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701092731.GD2261@ninjato>
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline
In-Reply-To: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Alain, this is the code needed to enable SMBus HostNotify for the
> Renesas R-Car driver already using the binding we discussed yesterday.
> I got it to work finally, so we have now two working cases. Good!

BTW I think the DTS additions don't look too bad? It is a grey area,
though...

 &i2c3  {
        pinctrl-0 = <&i2c3_pins>;
        pinctrl-names = "i2c-pwr";
+
+       enable-host-notify;
+
+       dummy@32 {
+               compatible = "dummy";
+               reg = <0x32>;
+               host-notify;
+       };




--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78Vv8ACgkQFA3kzBSg
KbYwNw/6AixQ6CL7twfSGkAU2f/jubPUmTMgA17s1VJ2E6rUVOQ0+sAJ6L5u5mcK
3trn6S4aa8yi44TnDsq09LIVbsPvcTa9D1TuLptkwjDOMxX9/pOpVAtNo6YEDjB7
Hay8c9rC3eF/p7b9IHLvBI7M3+kK3PJ7m4ZigXbXJ0satO1UjePCf1KYBWfxC+Kw
LGCEBraOgtAJ7dRtmmBlIMhPaOxyi1C94ObeMzuVRRjh+0nzZJhucvfwwAhmh8fr
mpIUOAFUtPXGwCUCzFumvKIjtAg4yv5WSeXvzvnKexd8zkd7+EcWTbPSWc5BPNsH
Vzq3/whwgVNk4SeRq/k9w9teJpyJPQNcxmw+iA0Xnw6mXE4rz7Ejng+heOCR/PeQ
/ktwjrczf8VcNuLCRVSU2KtLhMhTSb4i/mtw33cjgeJvUwZc8CG2ZltL/wYb7Snu
ftY74djdMR7hcU3OlesuHiPwEWAP5Sg+zB3MEBKLjbHyDlPRBP6AeneSFVcAtuys
1+MBahoaSvuyhhAht3B9CWQhWwVBT1ljAKV/AnJTlaCpLVL7IaZmUXofhrVGYfLB
Wr3iI0r9fZBFGgUB5yKkGNLwU+F+dyuqMCpgAkNJI1NeD9uNjlz19R/0B/S/LPPz
ZIKn+brBa6ZhwsAjdjLGWd+NL905anWxXQmz9IT0lJj2G+EkQu8=
=gIqN
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
