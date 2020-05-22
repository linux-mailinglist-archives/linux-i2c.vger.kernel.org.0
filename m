Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2901DEB9A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbgEVPPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:15:01 -0400
Received: from sauhun.de ([88.99.104.3]:33480 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729929AbgEVPPB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:15:01 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 07C832C203F;
        Fri, 22 May 2020 17:14:59 +0200 (CEST)
Date:   Fri, 22 May 2020 17:14:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, harinik@xilinx.com,
        soren.brinkmann@xilinx.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
Message-ID: <20200522151459.GK5670@ninjato>
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
 <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="enGqbSaueFq5omEL"
Content-Disposition: inline
In-Reply-To: <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--enGqbSaueFq5omEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The change is valid but the question is if make sense to do it in this
> way. Some drivers are using devm_request_irq to do do job.
>=20
> For example:
>  	id->irq =3D platform_get_irq(pdev, 0);
>         ret =3D devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
>                                   DRIVER_NAME, id);
>         if (ret)
> 		return ret;

I like this version better. Maybe we should simply move the
platform_get_irq() line to the devm_request_irq() call?


--enGqbSaueFq5omEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H7HMACgkQFA3kzBSg
KbaDqQ/+MJaolNtFf7X/HY6b5lJiDPGSgYCu7wD6dyNgsOAoYlegP1AltdpDMnfe
kddLIUFFR/7RCL4vACb0MMHNAF4ZnAAdZOC1s62tn8nQNtFMUmlQNui2OjseFfRZ
v+VZxfLSXZ7C5ZE/bLFfZyXR+pDxArnEkl4MqePIxxeeg9/qugtsnuDcOqnGpKpK
7/dsH/eOMBBaa1djikYshttr5FugFd6ZspAhS0GUHC9hCVAP1AxX84o99/Km5GBw
nAjx80fGy/guTGPTwIna1VMAkniloJFeOM0kSrmDvTudn9pQgkxszAkeQOdLrwkq
kPvGWgCFy67+51aIoPZc/XsMq+b1prY/cU60uDevHLWTTWp/E9kgR+7wALY0lZAf
AjK2SWNrkBzjGNWLmGnt6p9XkbA6/q5UnN/9TMV2FPJP/MplfngVF/+jADinJhZ4
+xIJX9WpDlpCx3KX826PCs4eRbSi5ww40AXQ/KwV/+kl+Lsl39phD9hscXJj8qgb
muTlqXjhMkV4eS7N4stKzLaeQel3cLlJ0LDUyQqA6pN6bE9ywEuaixEq0v0jNqrl
VVn/rmv0lUSBzGAH/HB7KFeSGlglYCDOuCu5BJ0oFejjfGnO+8QjwXWG+3A8cLA4
BpGkxMpV4/RIB9cgHyxpEyqsUq1KcmQ6zQ6A6YzGUvjwrJd7x9s=
=AI5V
-----END PGP SIGNATURE-----

--enGqbSaueFq5omEL--
