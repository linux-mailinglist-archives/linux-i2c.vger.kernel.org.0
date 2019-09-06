Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCC4ABF72
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 20:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404703AbfIFSbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 14:31:42 -0400
Received: from sauhun.de ([88.99.104.3]:47106 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730881AbfIFSbm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Sep 2019 14:31:42 -0400
Received: from localhost (p54B3379C.dip0.t-ipconnect.de [84.179.55.156])
        by pokefinder.org (Postfix) with ESMTPSA id D68DF2C0091;
        Fri,  6 Sep 2019 20:31:39 +0200 (CEST)
Date:   Fri, 6 Sep 2019 20:31:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alokc@codeaurora.org, bjorn.andersson@linaro.org,
        mark.rutland@arm.com, robh+dt@kernel.org, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190906183139.GB19123@kunai>
References: <20190905192412.23116-1-lee.jones@linaro.org>
 <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <20190906105445.GO26880@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Does this mean you plan to have this merged for v5.4?

Only if the machine DTS is expected to land in 5.4. But Stephen said it
is not in liunx-next yet?


--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1ypgsACgkQFA3kzBSg
KbYCEQ//bNKUnXoHDN1BlZHVkF2nPozmMWYN7sE0jaWENzmPcEzBRn4ra1QyARPs
xnnkcaJjK4Doc0RUSkiEmyyZB6Ifbs6GNn5V9RwW0AwyLkYavAKkDHj3nujgyY0H
i9yuFo2u32XI6BQY6ZFtyWyJPFYnSomA9vxDVS96mc+5hmFR7nXdBxASCobWTEIB
NDdQXBf3YQ7BPTW5Lce9UIGvUDjqqlQTlmfsQShkUqOpgFsYmjnbTa4xP9y4X/yZ
U/LbtpPBlUayr/3Jcjt0sOKPyEjbtQhriox/G1iIcN+zgfppHMNDYuJBcMVdJxY+
o/R5F4/BoLG95htnnBJs1Hk9nZJBy+drd8sdg2UAQ8DJFOC9an1FA6LVfYHrssZl
VepEC4UM4n3GnhU1ArYPvnVlqR8aFRwXt8RUywMqjSH6jmASQzaxnM0FzXmNl0Gs
Ydp4cAVjbZ0JHf9ghQTrKMunolyhX6LwFMM9Jse4j5l+Z4uvwDqfmjxE8kIeyMjO
7TIs/qMTbxWP6HZMzuOhMfGzUhpikOthAIfP1Cl4TBCYydRkXkQ69h9ksMKCwEzJ
k2joHx3eGKk/6ioYigI23wcm1Z19iYYK6dAlYgYzQ7fQrSvfiMVLFX6xTOXOR3xP
vmMN2F+Iwo/BULDxSmxgA13gH1QKV0EHE+bPW8LcVnShDT7Y2Yg=
=euYY
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
