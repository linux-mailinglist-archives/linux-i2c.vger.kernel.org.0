Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6AF431A75
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 10:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfFAICs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 04:02:48 -0400
Received: from sauhun.de ([88.99.104.3]:47962 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbfFAICs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 1 Jun 2019 04:02:48 -0400
Received: from localhost (ip5b40b67c.dynamic.kabel-deutschland.de [91.64.182.124])
        by pokefinder.org (Postfix) with ESMTPSA id 5F0452C54BC;
        Sat,  1 Jun 2019 10:02:46 +0200 (CEST)
Date:   Sat, 1 Jun 2019 10:02:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
Message-ID: <20190601080245.GA1012@kunai>
References: <20190530210421.24941-1-linus.walleij@linaro.org>
 <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> NOTE: any chance I can convince you to CC LKML on patches like this?
> There's no patchwork for i2c so I can't easily grab this from
> patchwork unless you CC LKML.

See MAINTAINERS, there is a patchwork instance on ozlabs.


--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzyMSEACgkQFA3kzBSg
KbYAmA/+LVWVa2NEvqFUkRQFWo1EWZlvg34v6BBBzJJJ6DLXapPcEfGenOOnghos
aToYlKs7gOfXfWf+iN2oQpPsq6K6PrJECvk/TG6kXpZs2EDz7TtoIG0bHFiRnSVB
jbEAbL83T8I8v4IXkjuX81o7ggYA4GMCpSsmkf2YkBYgQzMNYbY17CJOp3lkGRP4
JbskO7LSrK8kMWv5z8nTZA6gPXRnKpfAmEAsf8IiDoAMcZYIoPCOLRkBrrWxOJeD
NRnGkgNQ8uTulUowLsY+sIseGIBzLgRUCxF67/1IOAyJOcuRg/xeBAQxsx5SfFae
8rPk0s0YPK8n3YzyFAXIoSiJfEP7X46DaKRNvPhZlhoqt/lFDn0pnWWPGlwhSKxX
ngS69uGTmTFUqCq5kkrgcTWh6qhO5XXEnBXwEuZpZOVXHIdDUOiglFEYtAk1ZQSh
1s5rCPlWXujLxuajz5sD4ipM/HRmlB7j5godj8f+nM+im5794avUlhkmshLm+oDO
FsfcHaddxlYHjVF6Fw1jquEvQdaqpE5O8U7mpIsagWmAjtW4QRdM5Xg0ZLJPiygU
xs0sIO0LL88orD3BqXvl+PA85GPEUPrwnZwiuSY6nK5cXmvOK3fMM9bDDjaeM1iq
ViVR02yNg/FIHptQPiTcaJxqHMQtEzZmJwIipJ4ZaVIvRl+PN8I=
=S5Qg
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
