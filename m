Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2F7543D0E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 21:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbiFHTlt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 15:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiFHTls (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 15:41:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACEB1B9;
        Wed,  8 Jun 2022 12:41:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1BFAB61369;
        Wed,  8 Jun 2022 19:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6351C34116;
        Wed,  8 Jun 2022 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654717306;
        bh=9GAynSnsawCwnmUqw7IoWAT2vpCqkUaJCxcBNxSbCJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RuOwV/2DtYx6MUh2WNc8ugwmhz/cY7WUs12guZyuVz0xDuQn3r64L1e3HweTV114R
         bbcFAg53qUJHlbSiuhkxHWmBlDiGnz04zR1FWfRj8USDXtjHMlg8QdP+dAkBf05iir
         +QitD5Rx6ZHR4MGTzbgoYi3gYmsI4Oe5PsxMkJ1oeAj34kJbbNbb0L6vMNKT4WEyaR
         7PdrJAazUA9q/VGFd4XYAeREZxEgJB5BuVu2wZAWUzLo0AERbC+YCQYx6Rek+CSYEP
         OlybjU+cgMhPTgHCXLiZYhTDYQnJYaaBk4C+bhbPuiIfIMY839FYbAWnCab0twggBy
         cLTV4J79pykJA==
Date:   Wed, 8 Jun 2022 21:41:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Rewrite Nomadik I2C bindings in YAML
Message-ID: <YqD7cN7j6qL3QmD+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220526211046.367938-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Upe8hv5tAPvft1GE"
Content-Disposition: inline
In-Reply-To: <20220526211046.367938-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Upe8hv5tAPvft1GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 11:10:46PM +0200, Linus Walleij wrote:
> This rewrites the Nomadik I2C bindings in YAML, some extra
> tweaks were needed because of the way the original nomadik
> names the compatible with two compatibles and the DB8500
> with three, and the two main variants use a different clock
> name.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to for-next, thanks!


--Upe8hv5tAPvft1GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKg+2wACgkQFA3kzBSg
KbaNCg//Q7V9llgbW/g+hSGWPDus2htZc5CQ2phlVbovwRmfLpOcTy+5hitlhO+p
6to4uPVusjUEf0Fh3AhxtD6FFg0+x7wasQ86XrkqRb7kHa/wwlrf0pRzCzoN2JPZ
FPOH92QvHEQ29+lE7oYVDW1B8FX3UZrsLLnpIl4Zhh2FdSBCgAM5WTF+4oFqV4zX
6QVnKbYoIr9jRLRelAINRw6VZTEujsEKRt3RxS1OeFyQr8+tGL/0hlsQUPn+qVA7
Vr5q5YriNTYFAiY6PxBRkuCh7Sc8/a4s+7ylND2c5gNmV7L2dAWlhUfQ4o2W2gCQ
bFMtDkZ0lwfI9nrfvlCfKpq31FaYZszfCaMFp8aMM52nDHJIZFmW/VmdmZJfZfR+
jA/iAlQ3l+uHvXtvyHvFpqys1HdBkB8QdhDX0YL6iJlFKngM21FHGHYPZfsDnLMU
+5gCE1Rt/eHbXYq49ux53zqxodoWN6HxdUWTTa/eaHS6VWHNu4ltj60qVZIBonw9
5PUa8BCtgNL7HuMTAz1pN4XAt+nPGviqxsodmpPmOiZaBLRfy4O14+psRerHV/rl
rDuzyzpbTFP4zOEdA71T5xPsF6Zr058Cl/E3E4OLsTKbT31fanJ2Nka565Y4rOnI
0/yDJbDQ77uA3NuOfkqAsBFO76SZewd3gGPprC0NFCEt+i4hAl8=
=Wm9g
-----END PGP SIGNATURE-----

--Upe8hv5tAPvft1GE--
