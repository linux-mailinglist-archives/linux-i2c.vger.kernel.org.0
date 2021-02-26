Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041C5326149
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhBZKbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:31:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:47664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230473AbhBZKbm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:31:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB33764EEE;
        Fri, 26 Feb 2021 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614335461;
        bh=cbgMj02ws1ox1ax+5/yQQcl3dPfXcdcjRcxxC4rOdew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+s/EB1JZ0WFaGuI4TyjS3Hhoo8t2srHkHsDT+BfqZzi6Lbk9WrU5pklSYY3q6FHT
         7BJHmSvai8mp8zz1VdY9T6TP2Po964LrMoPhW0U/roxOiRG8Whzx3260YFVcPVd2UO
         bOLfp7joJi9g80T+geL7nweSd8aya2/WVsEpuZxF3BSZsil/sYEyHaHPImsq/7CevA
         VWZB25YJ4/8V6OLCmQCowUg0ObscORuhKXr3l594xQAFUpwVeI75fu7JDiyV1JWkWU
         w/hqRoUOxhk3yi49AWLUDK8On15dMikP3ws5MXeHikcryoXkJxBpxQne7RhmDboI0t
         w1/KsdHGFjABw==
Date:   Fri, 26 Feb 2021 11:30:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Liguang Zhang <zhangliguang@linux.alibaba.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Get right data length
Message-ID: <20210226103057.GD1014@ninjato>
References: <20210225142631.1882-1-zhangliguang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline
In-Reply-To: <20210225142631.1882-1-zhangliguang@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 10:26:31PM +0800, Liguang Zhang wrote:
> IC_DATA_CMD[11] indicates the first data byte received after the address
> phase for receive transfer in Master receiver or Slave receiver mode,
> this bit was set in some transfer flow. IC_DATA_CMD[7:0] contains the
> data to be transmitted or received on the I2C bus, so we should use the
> lower 8 bits to get the real data length.
>=20
> Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>

Applied to for-current, thanks!


--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA4zeEACgkQFA3kzBSg
KbayxQ//VStvwCcJeXZgB+XWQQ2tzZBBemXbVP55M91Yle06cngZTram7k11/oQN
9wA1hjFjU8XYfvzVck8sGpKHjyOW+GdCMkfeyt3SsAYF9tZSdQ0K0+BDwq3R5NEx
DIXBKc6AMXDpc2a3nSGBQU++P2pZSPe2sPySAGz5MqxI1BGP122ps6e6LtRnnpUV
6F/RE8tJJ0wSZ9dYdeZVr2cxS/UQzPeMu83l1Y+uGj3fZ52IiaFZCjB2FE60qSLi
Cy+u7yK2bXgEDSv3LohrTdN9I6yIk9Y4JUZ1zhybC8Psb5EqcD5FmG17lMWFWAqR
0+foN2/nK3Jrd9YLiyZJHVfisbYTIt+lWI4lutc/pycLEjmpNwxps2WSWmVjJ/lV
7sKjjYOqGTixwMRW/pVWTV7/4C97sohVCBEhZGojk4TzQBVoPxuw7y2wC2v1q6dR
vpjI93RY73Idxu+yD3S5t65UAZjY5we2RyReGHiBM+MSEIIj0tbIRoUOCReVU0Mf
8VfMDtjwqcdDlpd6WGTGvJVu2aQI9fptru+ac7JkS4cFk9R4MKpjHoGNT7yKeplD
arIUrRUqZTThzvVzkhTUrjDUIMQoZh/4HX+zpnTHw6JLdzQqXpvy8Qy7rRIh/o+g
1zx8bwcJnTIX592b3PbNt0LOzm2XcgnxiE6feUOCXQyJfP1WNoM=
=61r/
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
