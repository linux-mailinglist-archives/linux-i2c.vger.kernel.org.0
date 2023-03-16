Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B526BD8CA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjCPTTF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjCPTTC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:19:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA19E4863;
        Thu, 16 Mar 2023 12:18:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 207BC620F7;
        Thu, 16 Mar 2023 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D0DC433D2;
        Thu, 16 Mar 2023 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678994298;
        bh=U6/3MAM8lEWJuAQad1Q+TVX2oTsNcl0STc3k5xy9Klg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lka3LA3zNxRuOKAFjjixGSIQqsYiL+s0wuBpCboYGUB+hn39p7r+N9ZHBasxkdnyb
         4JSSvT96btScmpf0WgeEX29S62/0B301LF49slJPT5Z0XJEhHOrzXTm1hOQ03rtDP/
         XbzEMb5/S1Rx3gdNkhmMaZ+5U/zWhgPN6skkB8J79ghJkpmb1htrW7LAOPrDYW5Ewc
         uPHZPuIYSC8ya9qx8xt1HMHWoK3sd4uhVWfW0MtgXlmhOG+gwTy1XznsCAwW1V79lk
         vMJix/0BhIo+9Dkjd2gLc+Kf36QBHmsmh4vWdWXtquzrQJWBE/zF5SdrR0PfkLyFod
         QvYWz9NCaDZqw==
Date:   Thu, 16 Mar 2023 20:18:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 2/5] i2c: microchip-core: convert
 SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Message-ID: <ZBNrd5ww9YD3xQTS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Daire McNamara <daire.mcnamara@microchip.com>
References: <20230309204452.969574-1-conor@kernel.org>
 <20230309204452.969574-3-conor@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TIODK/DyJw5FNTCf"
Content-Disposition: inline
In-Reply-To: <20230309204452.969574-3-conor@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TIODK/DyJw5FNTCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 08:44:49PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the Microchip FPGA
> i2c drivers to use the new symbol.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--TIODK/DyJw5FNTCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTa3YACgkQFA3kzBSg
KbZWQRAArPUHPGdzaDCWZYxs1RoufYMPW3mLcn2mvcWqFmxkR89/yXReohhpb09D
99smcOSUtpAXFkzmCoCc4KlsUQDmUqG8Zy8dJ70//YEbx1IZddE8OkDOu2WwMToX
WY3AQ7Xkfa3Ror25SeitAVTnpP3XnFTR/jPl4d6Vz7ug5vGIcleqJRs5AOShZfdH
nDRdXQfayeVeWfjA/zSp4XM4ahx5ZaLAyqyOQEUmx2IZDJGcaUZXc4K2SeHoeJ9e
KYrhY+SHfwTSqNoPB7bUUfrz11Ub6use6WHLLZPMGUYzkuHyhpkFUxAInoZPpVgd
dhpTUodP5iZHalX4Z2ZFCX1ciYuowOQN5fr5dFZBBM87cxE9OMd/eaGC3dVMe98U
LqAmJzWg1+E38GswGLZdgRWtuhSwMxvSGm5bRxlZlyoOdBXEFlTjOB1WAKGyduzs
raLno/7NRrdQvPzV9/DVXNQQ4ERA5hInN6Ax1bhqApMNouaxsTqv8leU+AVFL+Tg
JVU1OFGedAfBYFHySpAEO3AeNV1hWKBMkccjWZHMwExC86r3dGFfc4KYo8/OEM//
/yjIwK1DuOLfH7CoM/F/wsK4Ga8XmuIg7z1/34m5Z7iKfsz30zmlDxHHKeMLm5RF
XoBHu7Mq3A0osybzaKLJWmXXYW9G3/kIIeXGZhQNoCb999t+8+I=
=WGcd
-----END PGP SIGNATURE-----

--TIODK/DyJw5FNTCf--
