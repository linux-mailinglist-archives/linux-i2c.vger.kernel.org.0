Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90630788FD7
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjHYU1P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjHYU0o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:26:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D551BF1;
        Fri, 25 Aug 2023 13:26:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FD2161D12;
        Fri, 25 Aug 2023 20:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51985C433C7;
        Fri, 25 Aug 2023 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692995201;
        bh=3Cdu/uTYriSNWsOo9XVfGexrAvdYqJ+xqGlpP07m/rQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=setMzatwhC0Sq2F0eaTOfSx4f8HQrL8YmQArQ6YqiK4UDCGx1G1IvDidFdr30rjtq
         A1hyhVKIGu0EzgKAljP+HVLkOBERZxZydvl8veog/nvVZRsRQHc+ZBoLXJsxnGRYAI
         j7tz36Aw9NTJcr0LS2ZNgJ/hx0z4SLujt07FL51r6dkFyXD7kwYXzIbnk5TadtUUpB
         QhEoKqOva2Mp6NsUAK1zlUYo6UYlhyqC0xFrEIh9bvIw+t/nXnS5j4LhbPI5lroCTM
         +a5Jv+NzE0SdirxMGWtVEM5FTi+enUuzGhjGoxbrdtpZHSlaHRUAPcalFi0hhHVyvO
         2PEh923+qR15w==
Date:   Fri, 25 Aug 2023 22:26:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: designware: Add support for recovery when GPIO
 need pinctrl.
Message-ID: <ZOkOfjtYGUc4DlQW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230822143437.9395-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hxh5RCi5VCAcnbl/"
Content-Disposition: inline
In-Reply-To: <20230822143437.9395-1-ysionneau@kalray.eu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hxh5RCi5VCAcnbl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 04:34:37PM +0200, Yann Sionneau wrote:
> Currently if the SoC needs pinctrl to switch the SCL and SDA from the I2C
> function to GPIO function, the recovery won't work.
>=20
> scl-gpio =3D <>;
> sda-gpio =3D <>;
>=20
> Are not enough for some SoCs to have a working recovery.
> Some need:
>=20
> scl-gpio =3D <>;
> sda-gpio =3D <>;
> pinctrl-names =3D "default", "recovery";
> pinctrl-0 =3D <&i2c_pins_hw>;
> pinctrl-1 =3D <&i2c_pins_gpio>;
>=20
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.
>=20
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--hxh5RCi5VCAcnbl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpDn4ACgkQFA3kzBSg
KbaFAhAAtRCS2vD5BiW1pMDk3RbiaUpphxf1jPSlBAkAzZEj1KLYLRwTDS5H0Spw
ggBWZJk/zisMKuUzh7VY8wjVE7Y4WKMoJxpkqm0fGe/Wi4aoLGrpPJxcrSyx0ArH
zIcYj/DI48IgI04nJlKpD/wH+7KLLqipIDbZTDnvnhQhVUluyMI8Od6XTi6hO73L
BWJ6RyFowBaM0ipGaju4TfDKVUmFFQoymPv3QMsuXyjWp3bk5DDeqC8iApgc6qiP
hi3pFa+BdP0cONvXOsna3x3osiW+iu4JFG8RFfp8xIdKgFnJamnP/XGZRFXQtPor
JBaID2Gin2bQQbkr+C9iT2tjagDSTjTFwtI3AJLCwWL+80QRLNpArhDs+QfSEJ0j
gj7ZeR6UsQ4EXdX144BLzenRZfV0i3h5KjleJD2oQpVp0YlbM/tlOCRcn5BticZp
k/EnBVEuKrEigiC2PkNazdSWtUCvgTa6pmrMzlFtPcqhBVvO+lL9v7nyLKhhxRXO
L3uB0V61wKLuDGhjvVexwdOOv6x5qnqAhSvetiS+t1rt+3qQ/S/vmAyk5c1oYROQ
IvUi9sF9PW5/R/EQqwy0+PwIyIRixOI2Owdr5wT6IRFClJMoHipUZZheQmiucaDF
59xh/UJBJQLIfmIIzjqAfYySAuRVbz2ZCF3LsjVAsbpy7Wu3Aow=
=d8Qm
-----END PGP SIGNATURE-----

--hxh5RCi5VCAcnbl/--
