Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44F5AACED
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 22:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389812AbfIEUWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 16:22:31 -0400
Received: from sauhun.de ([88.99.104.3]:60676 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388502AbfIEUWb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 16:22:31 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 8830B2C00C0;
        Thu,  5 Sep 2019 22:22:28 +0200 (CEST)
Date:   Thu, 5 Sep 2019 22:22:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190905202224.GA8989@ninjato>
References: <20190905192412.23116-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20190905192412.23116-1-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 08:24:12PM +0100, Lee Jones wrote:
> We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
> a rather horrific bug.  When I2C HID devices are being scanned for at
> boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
> When it does, the laptop reboots and the user never sees the OS.
>=20
> Attempts are being made to debug the reason for the spontaneous reboot.
> No luck so far, hence the requirement for this hot-fix.  This workaround
> will be removed once we have a viable fix.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Perfect now. Applied to for-current, thanks!


--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xbnwACgkQFA3kzBSg
Kba33BAAo5WjqT1D+WfeoYxUWoPMcS53ngjWw/Ga7hVwL9XplajKI0mfbVDy/3AN
1M9+UtAkVbR2XytRpoDd+xt8aHwLXnOAgdILapvUNJcPFzHQDhOFGaeFFaENqWs/
m/BL7XXBq2Qi6HtexsZ/4JiAkD9e3pdWlzOStWSGEKEIdJozp0Jw4TW7vwcSFmoq
e9CNjp55yaxw8KHwj0feHBQF2Q5uD7Ey9T4U8tPNVQx47877AtDKeMMQx/TBfNB9
ariibhw4jUrSbCjH+d/PzjrtuCpw0j1s0H4LOhELUb9HlowBGw3rzpyDeIObHRYT
OLyt2O8t1oggwy1FU5Zv4lRuFqxvoVZKuiehSnkyk+LBfcwgD1NObLfFLhxXZWEQ
x2agoa/G2d+E3zFpuXAKhOfXgebScIuXg+6PUp3FKVjqufLFufC5UwUsm/oF3Yib
9Mlhhs7daZ2zVESprl9Ki3s5yB8AHX13S2JyFgyz/IiIcon47AOMbSQhmr5cR88h
mBjk3CBpkYAnHWT83nKZteBVMf4VpYhLLwo4Vlusd9DnD7vOyNRlH0elytkBFp2k
4hQpUZtnG9nY8zleh1ZMH9tngq7E3C4rldcjfxD8s8FaPkUv42f2UjxE67F1bVIL
3htgI0iPQOo7dHlw6KygB2dmYV2NidgF7LxxFSV7v9cwsM9qDFM=
=n2QB
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
