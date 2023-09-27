Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAE17B0CCE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 21:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjI0TiN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 15:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjI0TiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 15:38:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD08195;
        Wed, 27 Sep 2023 12:38:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926D8C433CA;
        Wed, 27 Sep 2023 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695843490;
        bh=lGBTujJv9f/ZZnz44luym045cfP5zny2lEWjKYdqX1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fe9epdi4aCGuW1eF4w5rzO0Xzjjsb3aFGAl7M1evPIighXg5O8HzF2pbv2weq0u8c
         8tZgUYHgrBID6mwEwTHpJzSUx0V4Lf4nE6o7knUmcVZ0z0wAgB0YnDgd2AI85Y6BKx
         IXbU084kCqU/Nocutynw52CNpPhu1kND0lrjDQfYStmQtaaeKLyvbRc3SlsC6wph3a
         MQcYgvhI5RrDhGb65XCSwwvQjLkFQSA3nTr84RWl6J35KNP1QIP++eCLmt46EJSLlS
         a8iWShlr0FE4Yp9vkXlTbTODZyZl0tYw1gPcK3wISzCi34oDfIbSy0YZCwg3zToX97
         pFkFkhTFp+0Wg==
Date:   Wed, 27 Sep 2023 21:38:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZRSEntqne/1y1ozq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fkMkjJQxLyFdQNxM"
Content-Disposition: inline
In-Reply-To: <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fkMkjJQxLyFdQNxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So my next question, is the change to dw_reg_write something that I should
> write and submit, or should someone else submit something more generalized,
> like option 2 above? I don't own the i2c driver, I'm just trying to fix one
> issue on one processor with minimal risk of breaking something. I don't have
> the broader view of what's optimal for the whole DesignWare i2c driver. I
> also don't have any way to test changes on other models of processors.

Well, I guess this is a question for the designware maintainers: do we
want this one conversion from *_relaxed to non-relaxed. Or are we
playing safe by using non-relaxed all the time. I would suggest the
latter because the drivers I look after hardly write registers in a hot
path (and not many of them at a time). But you guys know your driver
better...


--fkMkjJQxLyFdQNxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUUhJ4ACgkQFA3kzBSg
KbZ6DBAAhkOsLHfj0HyxKHf97+1+l6j2E3BfwFnHgRYc5dE7iApWaP94tVdbTY7Q
mgIFaQHJ/Y4yBjRC9EnHISK4fLpJGB3GE2iuQxReMth5vFGB+Taeqp/Xbi9jAPFn
IymQQCUN1PLRVVoze475Hl+TaxhFK6d9aNuUlVL5NeMzZ1b7FlHBY5oxqEA8omb6
eymok+xfhxw+Lc+6xHamP0FX5yQuNdFmgyoIjWl5eVcM9lG/bcRa6oYcM5CAkF8f
iVc5hAT/18bvLp8dfnt/6zdfopcHJIkz2vEQcF7TgHQEHzNCwOEK3GPB1Y2QAWGt
r1yLvN1gmCzLafXWjVMcbYRXJb3BTR4PM4kAhDyxEi3L+BpzfyJVseUdZCfjNH2t
O3VApKYxOzGbqkoImpw/cKX98rryggAhFU2EK/alPPjfgbzTyyRgQ1QwcWawAHTm
dkLAbquguT21e1Qbt4brqnKMdqzB5dBIKA7hl5hrNlgiSA6/2L/E8ayq8EePUkJf
alEPVzp+SzPY9DwVr3KyhjhYqM4ihJyj+8uhTO3AzWDpcg4Oc5XY5qKZDUQGgG5S
wD+QXbymowS6V5iGOxN30DtGoVp8kVuqOP/qSVfaPXYPBwhj9RzlzBT+8+ru1Bey
XRefnMvXGmeSRi1ZxmEvdQ0bNO6gsWIVvuDMSjvI9A2xxTxnZt4=
=Tl9y
-----END PGP SIGNATURE-----

--fkMkjJQxLyFdQNxM--
