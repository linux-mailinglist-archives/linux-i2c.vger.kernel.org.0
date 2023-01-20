Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F928675036
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjATJI1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjATJI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:08:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36637518C2;
        Fri, 20 Jan 2023 01:08:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE8C7B81FBD;
        Fri, 20 Jan 2023 09:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356FCC4339B;
        Fri, 20 Jan 2023 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674205703;
        bh=O96ThGuyWt09KyloQFrsJRw6KPqNmy1OWLE7cFXERl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k21IjSbqb93uzSxBV55FK9vwzQOCA9fH9BKTGCg3nVn1bZcxxygORAjzlQyAVERKn
         7Jj/W8uovolQdR/BND0gtSmUKVC4fFJOI24cLhCcns1gaeZUwPOzSSyOqbhdQ22L2H
         TEPNX7mEr/LKvzjpM1NeGW1OPY9FpIja6XPXJ4ETdvQb2AXdsP4pzKTITVAx7xpbre
         x2IFa0I0InMUvs16Sf8BpeRnGhau0VefUu2Z2pC5dlkVL8Dxf+EKZuPlkr6jaJ4QPP
         Q6MUjWi87GsxXwa4putVYiVRL7bkCBpjtD+ed/lrOP+ApdStLfaWTReCOiw2Hd2o4M
         qNLxV9DSokM0g==
Date:   Fri, 20 Jan 2023 10:08:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
Subject: Re: [PATCH V10 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y8paBAVsBJIqLZnH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
References: <cover.1673340642.git.zhoubinbin@loongson.cn>
 <77046b03eb0e75b25934406afce597997624a2b8.1673340642.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8Vp4PIH7jEjIxHln"
Content-Disposition: inline
In-Reply-To: <77046b03eb0e75b25934406afce597997624a2b8.1673340642.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8Vp4PIH7jEjIxHln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the driver looks mostly good. Thank you for your hard work, and also
thanks to Andy for his great review efforts again!

> +static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

Have you tried messages with zero-length or the SMBUS_QUICK transfer
which is basically the same? i2cdectect uses it by default, so if that
works, then we are good.

> +/* The DC subsystem depends on it, we should initialize it earlier. */
> +static int __init ls2x_i2c_init_driver(void)
> +{
> +	return platform_driver_register(&ls2x_i2c_driver);
> +}
> +subsys_initcall(ls2x_i2c_init_driver);

Can't this be handled with deferred probing?

Happy hacking,

   Wolfram


--8Vp4PIH7jEjIxHln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKWgQACgkQFA3kzBSg
Kbbh+xAAgOJ3y/cc938IHev3jEUXPaLd6Kv7ont6wBNPdFFb84sS5lwDuKGOmdbc
gs54YpM5RRj5q3QGUyEdBhYPTJ+wBuftjlvm9tQzfbvBjo2Pzp5me7qesmpzzfv0
0rCMDBSVBFLi8QrYqiEv1UYBy2WqFaFvhu/rFL9p8xrUGx+nYnWOGAHL71P1abUL
LaAR/N+7SezK9vLDLPdoUTsuzxM0mY2Q1I7Axgfkce0Sh315URu0dzzToTwMtn8I
eheEWTOwKK+e7PB0INrDB3BRnge8nHPJl+j4TKSOp3T7rfoeU9d1tP/C7r0k7dQC
XQo0YQoIwKDV9lbmlE19DWrnOwBtD6dsLA3GkHPF0D1tpz9njZr6K5cGuSP09rx9
DB/VV9CPhplSEiWzJMz3fKq0UP9Og/Q9fccYOF7+mm5CiMbBgKiiY58w05mF+wNP
4aCIuCjaoHO6pFqP8ijXppyBDSYdHP121ifpMPgnxLCmA7Vq8Hyk6S4QWyXNUjCA
/9g80ZNAMRQh+BBj0ttM8bW9VlGE/6NfjpliB+VUHdpu+EmOvspk8CQt0thYOMad
BCGUQPxyBv31LnbIKRSgxS0zzqzzBZAl8JZZX0J1nRRrc4cDmq9rtT5ZXcIOM/zW
wRWKrM7alG/ihDWIqx4PNTXnXA7puliUklfzocrsAhXm+qleM1o=
=ajTM
-----END PGP SIGNATURE-----

--8Vp4PIH7jEjIxHln--
