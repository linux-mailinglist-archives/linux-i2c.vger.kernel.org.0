Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B554A8DDF6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 21:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfHNTgb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 15:36:31 -0400
Received: from sauhun.de ([88.99.104.3]:52086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728265AbfHNTgb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 15:36:31 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 49BA02C311C;
        Wed, 14 Aug 2019 21:36:29 +0200 (CEST)
Date:   Wed, 14 Aug 2019 21:36:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V2 08/13] i2c: bcm2835: Avoid clk stretch quirk for
 BCM2711
Message-ID: <20190814193628.GA9756@kunai>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-9-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <1565713248-4906-9-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static const struct of_device_id bcm2835_i2c_of_match[] = {
> -	{ .compatible = "brcm,bcm2835-i2c" },
> +	{ .compatible = "brcm,bcm2711-i2c", .data = (void *)NO_STRETCH_BUG },
> +	{ .compatible = "brcm,bcm2835-i2c", .data = (void *)STRETCH_BUG },

What about simply putting a pointer to the quirks data (or NULL) as
match_data? Then the code should be:

adap->quirks = (cast)of_device_get_match_data(&pdev->dev);


--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UYrgACgkQFA3kzBSg
KbZicw/8D/a+41Fd2Vuyx+MJvKd29Kzaki6F06fwRq1DQJHiDcdT2eo/uY/EOfQu
efWgwaXvbFL54rj9z9u7MnV3xiImwyBDVQcJxetbTiZm5Jo97aX0cxH0CgeoF28+
q/sW/LZrLjWkfkPFQfDeV59OjvZJzc08AE/MAxiKj7dESO04mseoSCOYgRfcVLYS
mxbciN02zVQoVjpjzO+hgMCH44dkxIVJc2Xlf7NaotrVIzNYxBPzr3D2IjGqL125
WwHQUohUIxATEeTvipI6sob6/J5DGhoOCQL19fgBM7zAZas6V1kvu0lXGGhPXiCI
3d8ncudBanDh8Foqok0Fk0nC8jrtAfr273XRtMBlyQinD6BbAHGUeUBF437r82Tk
OSHL4lCCPUpT/sIthYcrRZGo5c1MKzWuVmdAE7pv2fYgM0GfozIfrHVZgsg30vNl
m/JIbmBjhE9rdhKcCCZMRkuOA0Q85ow5Jdj7z0xoXEn1ZGJdrJnuGjWyclsF85wP
wWMJD3vU8kllp+TobcsNPUUBzV51UuaQjHR7Is3/tM3ObCnJPlxKQ8ZiSfFJwAVs
oOKTpUihBtF5vOyxZlpXWumZhS08zGNrkz4nx8M27vP/TlcrNqV6gyM4QuHBt1TE
fcLZNAzsbxJHjquINMgTchfVqB3tqlIAuwK5nCs31kKojAWmxN8=
=K5pw
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
