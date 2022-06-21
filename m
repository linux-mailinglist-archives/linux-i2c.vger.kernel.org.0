Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5109553DDC
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 23:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353956AbiFUVha (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 17:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbiFUVh3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 17:37:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9618BE2D;
        Tue, 21 Jun 2022 14:37:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5F97FB81A8C;
        Tue, 21 Jun 2022 21:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F0DC3411C;
        Tue, 21 Jun 2022 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655847446;
        bh=QEozH589MNtuFtNv/n9JY9HQ9NmxrWcgbRs4SzPhfKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WM/s8HCS+lS1PQy1SXLPJ1ZrZj68w0itIyktvRfhkoT4qrDGJtmDfacWZOCW5un5b
         YI2GAxjewAkTG+QnHfya3azPTBq8N5xAc7nC532yX7mYM2vqd2EeUOShANwkly57ue
         EFAxdD3uASVsEzCFFailgNysofjIIxPRjKuuW9Qv4NMLL80m0rX4K6TaUgJIsqbPLd
         famv6CuWWxu+nW7KlPeJ3ZQXKEDJdtkEezvG9rRmQoTdpey4WfrojANRSSYtl2//TN
         BpRsPSoWYdW6DWrxm0vzsviYYhJnjLf+nDeIY6QcAG0cRvyBvjVXKZ/QSIiACrzITw
         BbCOeyBVLPulg==
Date:   Tue, 21 Jun 2022 23:37:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YrI6EeVkkWVMNPFY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gOFjVNOAQ1QaTcpi"
Content-Disposition: inline
In-Reply-To: <20220620230109.986298-1-dinguyen@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gOFjVNOAQ1QaTcpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 06:01:08PM -0500, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful, so this
> change effectively resets the I2C controller, NOT any attached clients.

I am afraid here is a serious misunderstanding. The I2C bus recovery
procedure is a documented mechanism how to get a stalled bus back in the
case that a client device holds SDA low. This mechanism consists of 9
SCL pulses. A reset of the IP core is *not a recovery*. If SocFPGA
cannot togle SCL in some way, it cannot do recovery and
adap->bus_recovery_info should be NULL. Or did I miss something?

> +static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
> +{
> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> +
> +	bri->prepare_recovery(adap);
> +	bri->unprepare_recovery(adap);
> +
> +	return 0;
> +}

See, this function is named scl_recovery, but there is no SCL involved.
This is why I think there is the misunderstanding here.


--gOFjVNOAQ1QaTcpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKyOg0ACgkQFA3kzBSg
KbaCoA//TYSQgglmhg0+wvtn7CaRSD65yJYC3P+ltv3ow0CjND820EKF0sDYZFw4
Vts87+sTxp8KfXkKb0jyLoNAc+tte/8jj3GxS/hMjjtB56/aBQ7j6tbeHweTmFC2
AzaBv04N7a5yWgnyX4h9nR6BQwwZCvRU09OB3A8OOiNhtFHnzcaJShMTgAQ3Oykm
eYDpvaAIlDQDzoUTydxsQfJhkmlouv8KM52hmNk9FAluCFOY5L1txDv10ocL6+rE
fZu5c1KaQUpWrhnzBZubOXrSAuMktEHtTGchvKqkC4cE7UT9UPu4pw/YLT0Z1aWr
qvAZW9rTn6CFUcAZbMUpNPwGMBdaXC5uQjCqO+Mplqke9XgAtnYlgCVThV3FFdQA
xbanf2o1gXh+qCpBsq+TYcLs9UpUIGouuxT6GK4oWsi9NzBLx0vtGbAGKaEb6vt1
kiLmkMhQ4T6OvE5TFloL5VRblDsdkw6Wh8KG5VOSOxDi2cSYtWDdQGdDAekIrZFj
p99ADXhC5h/gmOFxgrM50j1Bbi7CdE9kmcGAtR+iM2BcYdYXilfxsZEfdlc6QDHB
qegqwLYCqM2ZXc9pI0FYmJYWGmxIeq2p+GeTduFK0oiK7ahpN8MBGXCPSWS6GSF+
Qdaq2pcNgDPfnJ5+GSoy3DObKB3QeYwarOBAh+BPGzcoYgMHDf8=
=Gi2f
-----END PGP SIGNATURE-----

--gOFjVNOAQ1QaTcpi--
