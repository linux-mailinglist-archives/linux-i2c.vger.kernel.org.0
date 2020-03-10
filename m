Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CC417F76F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 13:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCJM3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 08:29:36 -0400
Received: from sauhun.de ([88.99.104.3]:48178 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbgCJM3g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 08:29:36 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id CED972C1EB6;
        Tue, 10 Mar 2020 13:29:34 +0100 (CET)
Date:   Tue, 10 Mar 2020 13:29:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: mcp2221: add usb to i2c-smbus host bridge
Message-ID: <20200310122934.GA13896@ninjato>
References: <1580185137-11255-1-git-send-email-gupt21@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <1580185137-11255-1-git-send-email-gupt21@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (num == 1) {
> +		if (msgs->flags & I2C_M_RD) {
> +			ret = mcp_i2c_smbus_read(mcp, msgs, MCP2221_I2C_RD_DATA,
> +							0, 0, NULL);
> +		} else {
> +			ret = mcp_i2c_write(mcp, msgs, MCP2221_I2C_WR_DATA, 1);
> +		}
> +		if (ret)
> +			goto exit;
> +		ret = num;
> +	} else if (num == 2) {
> +		/* Ex transaction; send reg address and read its contents */
> +		if (msgs[0].addr == msgs[1].addr &&
> +			!(msgs[0].flags & I2C_M_RD) &&
> +			 (msgs[1].flags & I2C_M_RD)) {
> +
> +			ret = mcp_i2c_write(mcp, &msgs[0],
> +						MCP2221_I2C_WR_NO_STOP, 0);
> +			if (ret)
> +				goto exit;
> +
> +			ret = mcp_i2c_smbus_read(mcp, &msgs[1],
> +						MCP2221_I2C_RD_RPT_START,
> +						0, 0, NULL);
> +			if (ret)
> +				goto exit;
> +			ret = num;
> +		} else {
> +			dev_err(&adapter->dev,
> +				"unsupported multi-msg i2c transaction\n");
> +			ret = -EOPNOTSUPP;
> +		}
> +	} else {
> +		dev_err(&adapter->dev,
> +			"unsupported multi-msg i2c transaction\n");
> +		ret = -EOPNOTSUPP;
> +	}

Have a look at struct i2c_adapter_quirks and especially the flags to let
the I2C core do the sanity checks from here.


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5niCoACgkQFA3kzBSg
Kbbcbw/7BH9KSGZnx60OjlH4kqubSsU/7webUKwIWx40VdSbxBmccq49gipAxmP5
k1fMwsW0uCKcslR/iJ7R88cM8BLP1led1JCbGsbZ2AYMs1liYrcz/np7xxVG5NqZ
33L+D2OyXovtD+9gQudVIF593s0BipaL3FBDvmSayBs/qZldA1OKrt5xKshu6Gu3
twzjtixSLjQnqxhydQ0rva5i0Wccd5X++VTthF1zCfydoN9Yuj+wfu+surk2y9fP
Nou7eizASM27B5yl4T4VJgzrAZZmq2Mq3HeY1/fZ5ic9rIATj819xGOw0NqBpgsr
MgZiUh0shBJenx4gXYD+oZxUxaqGQFb12V88vfWnIw+0l4n5L54sfVhTXmAZE2zC
yMZ5oBLvrQfO6dDGPz5PKYqN1hS0YM+pGaGBi3Fx8mna3QvdbZFe4bLNNvA0wcsX
vg4UgMvfavZAAjpCQtkY8p7ew1dFyOs5eLinYsnVuF9T1KcjOFWlx90/+GOMYeoZ
TzxD2TFDjc8/7Jp60r+IkDgpLwH8/YxsBoy9ESzSi7MBzQLuSw7hju5OATmQ/Sld
oGMy9aUtIEVW2Y/t6P2XbMeFOBGwc0zXO1pWVKS6Pqj1yqYf7QcHWcjwd2CyAyif
Dr9fv+gGmqZ+hEED4tRPQMuzbXvVbax3IlNOOI4rYT8c3LuKUx8=
=rvj5
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
