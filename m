Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282ED543D1E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 21:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiFHTuk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 15:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234345AbiFHTuj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 15:50:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E37D5711;
        Wed,  8 Jun 2022 12:50:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A984619AC;
        Wed,  8 Jun 2022 19:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16874C34116;
        Wed,  8 Jun 2022 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654717836;
        bh=bF7wIbQ0JKZK1Dl2Z0CIz11yfYpJD9D+7HRVTxZAbWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bh+goBv7wPMYOS0PQsQp4EW9SlBe13kElbxrtbP3GWfG2tQNtP+aaN+OGdQmhqtth
         Zx6QsJ1UA1ewyPLK+S++Bj5Pm0IHjf719rjbGWqHvifHpgl2rk1nG+TBqxZfcfLZIE
         ABr5FxChiIV8a3tqhF2tpLPkAAsQyffhukmjlaFcFz0pB+W6IsoRkgQNKrIORJP8vY
         gJxVZ6/Df8k0nGPS13FDH0jYOedXmrYVfthlPSSE3fIEYdczOSG3Za/hvHe9pAJoh0
         BcnKC0kXrwmClAlsGUtZJrIvyFpjz325xGvZPvxt0Il5CN317mWv9Ve1EvZ8pUU63h
         3n64VWBNpo8sg==
Date:   Wed, 8 Jun 2022 21:50:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <mail@conchuod.ie>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: i2c: convert ocores binding to yaml
Message-ID: <YqD9hxVO8nDy6kEl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <mail@conchuod.ie>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Atul Khare <atulkhare@rivosinc.com>, Rob Herring <robh@kernel.org>
References: <20220606201343.514391-1-mail@conchuod.ie>
 <20220606201343.514391-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hGhNHd7MU3cinCJK"
Content-Disposition: inline
In-Reply-To: <20220606201343.514391-3-mail@conchuod.ie>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hGhNHd7MU3cinCJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:13:42PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Convert the open cores i2c controller binding from text to yaml.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--hGhNHd7MU3cinCJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKg/YcACgkQFA3kzBSg
KbYwqA/+J5zwS0FWLakgzC0GDLrb6NPSPg8enDq5wa1Mjp2m3KUZZ5kvfJNDyHRj
p9qAYOhyRKQcGWnvsWj4dYi3m2O9720V0VE/Jeld5J4TyviZZ/ZqKTCcyJXrQCo4
3GoZ+1FLM+/Ch6DBGvD1D3FkBpGE9S3zD8B6Ig7wqIo61cvJAUYTgCS3Su8X+iwB
FRRBL7capPTXZqRtsI95WzxKmu1mUvLpmqYihYe5j2zeAb2MfIdRjJbhBc2/oIEC
TOF6onGV4dH0Iu+z1jeos72qhFq+3t14mLbY2fFiXrpXGR/sPf9hKRrCFnAK/8F6
dhCTDyfYbpN3GGifuLwihxA2e/dNXGky7Xq2Fyy3mGcED3UY7DT6mlGHflcQfFqG
H/+XBLeLmSV9ltqmdiRcM9G2aYrZ27zlxs44hOtu+59ToCL8T4JU/qJCs0n0lO+7
FD2+YvQd0Riqsoz95gZYgHiULh39huSsK5drBe8LLBvZGbSf0bbBxKxbaZyAsx3c
BUexRAOzTlMvs4wQbi95+qLPZNuUXfOchyl4QYuGKiikOx9pIrin1zXjdPPDIeX7
4DBrOpgWM2p5YupnUWN5ujffzr3TpP+SfNHlrlzy0LfzsBL4ENlWS33Jc9CURXFw
7wtbm2S0/kTe2inRUQdWCPB6hLdTY53FnYDvetZ/orHb1y272ik=
=OKG+
-----END PGP SIGNATURE-----

--hGhNHd7MU3cinCJK--
