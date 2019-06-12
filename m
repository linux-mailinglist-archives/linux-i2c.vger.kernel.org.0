Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8290C42369
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 13:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406048AbfFLLEz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 07:04:55 -0400
Received: from sauhun.de ([88.99.104.3]:58624 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404880AbfFLLEz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 07:04:55 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id B5E6B2C54BC;
        Wed, 12 Jun 2019 13:04:53 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:04:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, arm@kernel.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] i2c: iop: Use GPIO descriptors
Message-ID: <20190612110453.hzjgxeuw4amyb52c@ninjato>
References: <20190531223756.1861-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kktnzml73vbhwpli"
Content-Disposition: inline
In-Reply-To: <20190531223756.1861-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kktnzml73vbhwpli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> ARM SoC mainatiners: looking for a handshake ACK on this
> so Wolfram can merge it into the I2C subsystem.

Yes, I can pick it up, but an ARM SoC ack would be really good for that.


--kktnzml73vbhwpli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A3FUACgkQFA3kzBSg
Kbak4w//R2MY179YNMdcMZMhODkdOXY+jNQzQiRdM9EJcaZOQk6waCZ/F3PvDzXz
NOxGqFvmIDmEudft/XrBgFW2kO0qtDYVKOJp/nIqYnHxhTT0OIWayRzCJjueHUCB
5pwDHsabcZVMU7MQnHpk3qXoyttT+660EYxZsaJEhX3P6uZFHWVlhd9+SMBxB2TZ
jc7B1g9vlgMSJFacU1pDna4burf4nLLx3so0b4wjlVi/j/rlJieF64B8E2VFLIOf
rUvXpA/FD5cPFdFJCnMNUMq6oFlleqY28Z6Cshn3MCesnYj1dZDZ9jfkxlwD5m+h
Fwu4jHmU0HRIK6JjlrkZMrJtxljIPOykLuyhvAPEif9HP9xPBZZURzRgY6N/uy/T
LNNArWKbe0J+NqyvnA6JI1NaqsgUl47KdEhOMBENgQyQu8UB4l06SlnFu29AAnE4
VlVKwugRLfQYH3gWTwwBiMRlEKIMKxgIJKYafPIirfnNghuvvD2puJ9NmiG/x/pP
3E75nnWZRo/i3OThyzSw3LfDa6VHCGoR0ynCgrr4Ly3QHmxK93Z4KuYz9ptqT8np
SCBXrKRnaSy1DsbYDiY3DBPxl/qta65vUAyNuhD/ly09TeWPtPxvkw9bIYrYGgwH
EXqfQOYEm4OW6vXjAHvvCdyurV8fQRbb3MVCIiwfE4aiJRVtjg8=
=mGBK
-----END PGP SIGNATURE-----

--kktnzml73vbhwpli--
