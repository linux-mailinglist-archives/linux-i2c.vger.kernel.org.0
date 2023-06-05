Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B26A5721ED9
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 09:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjFEHDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 03:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjFEHDF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 03:03:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6191706;
        Mon,  5 Jun 2023 00:02:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B92C861F9E;
        Mon,  5 Jun 2023 07:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F522C433EF;
        Mon,  5 Jun 2023 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685948524;
        bh=UY3nLgx5ktjqstws5tU2oB1vOZhXh6L50Bolq73FYzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NjQVjTBw6Rf8UlLW8WTLW3bXDKiDFhS2c9HwJmdPwNLS/oTlipVqQu7dnj7tnt8tF
         Q13nE97Xf7UFskZt0KEZaUBYbolmeQVMkRgUEf7oisbmZf1nL4mbUPkSbXiTQZnrtI
         iZGuWovK6+7d6zqJD1q4TargREutBqctvZ6nKX6GwPuULvATlI++pclzsYMOMsme/r
         NDaWIRUYekDHCMF2RxSJVQgV1UetbNyQLdBVhgWU3ctuhmOMJfCZWMk8/VEKiz8Ct2
         fyhlxqo89DZ/o6JQnN/n9WekduA3xGjoam4meOUL+Eb7haV7WwH5EQ5tKTX7BwxxIe
         d82v55d1BB35Q==
Date:   Mon, 5 Jun 2023 09:02:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v11 2/9] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <ZH2IaM86ei2gQkfA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        Piotr Raczynski <piotr.raczynski@intel.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
 <20230605025211.743823-3-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7Kg18qcwmutGUSx"
Content-Disposition: inline
In-Reply-To: <20230605025211.743823-3-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C7Kg18qcwmutGUSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 05, 2023 at 10:52:04AM +0800, Jiawen Wu wrote:
> Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> with SFP.
>=20
> Introduce the property "wx,i2c-snps-model" to match device data for Wangx=
un

Does this not need some binding documentation somewhere?

> in software node case. Since IO resource was mapped on the ethernet drive=
r,
> add a model quirk to get regmap from parent device.

All the best,

   Wolfram


--C7Kg18qcwmutGUSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9iGUACgkQFA3kzBSg
KbbYrQ/9FEyXD3uaVkL6TjkfZKbPWVKFYOJxtDnXR8jyBwK1G41bCdSggGp7ShSF
tcF1YqIbZmDRiElwRDWgeYYvHfWETGFvAx+Jn5njZWOQSp1FeFNZh3//MTBd9Mv2
weVom24lGR07d61JbAsei3ax3lqGCjkbvOUHXjeQWSAYWA5e6bK/KL3ZkrjJUmjx
CglJFynmsXdbPMZ/oIFYON7xEJo2LXsd8MfLSoNYyscRA53ntezaOlKRiPd7ASe8
3LW9y3dYAccZGrEenxoV3CPdCICt8AhE8bZa7/xJOaqjzvHDMOsxr58ptzw6HIRM
rMAvt7RBiSv6IPBzUWAYh1JOpfjqmKXAi4rL5b6QVjpmxofB2M57kR/imueOHWx9
12F/CbZj28seONdyDGDzhnwsxXQi6YOslB46b5D/g+K7s8znqmzRqPeN78j0TFoM
5dUJQqvt/o8BlE9fGawb06rDn3VwDuMLq4+viHsCbQ1ZrTsXA9AtwCpXvaUFS++M
i/qiUFnClmXtrYmb0PUCaLshQAsDttb1upNzbtzwPo3zDgrscB41tcl9tsZaZeNf
vpGlPr3gQhk7c3hLCO8lLYfq/q7VtMkVYhQdpDZNHXsVUOEYexiW16Pzphv7kSwz
LBdgLkNFgSUJaW+jCyX6GxzUMEqlIpfx3q1JFopfbfJJNzI630w=
=/Ntz
-----END PGP SIGNATURE-----

--C7Kg18qcwmutGUSx--
