Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4676CF328
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjC2TaC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjC2TaB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:30:01 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3566E134;
        Wed, 29 Mar 2023 12:30:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A10CCCE2502;
        Wed, 29 Mar 2023 19:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28172C433D2;
        Wed, 29 Mar 2023 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680118197;
        bh=SS/jbk54VmrEOwURrr56BUHIiEK0pT0Kcy1MuoBHTI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kb/n4qAYhIUyOBdzzpNs4ykgQjGEAVdRdGcvbna374EyEQRq4Fms13V8tlObKv9N+
         JFzO2KXkJ0PYwdK5PL29w1caHjZsa1sUSotKtthT82S4SSUxpWmT3UvgtEIjYHpDKV
         Q6jtZlKYvi6E2VVLMP02coNICSqLYhw9H6STwTvz8emV18IqzBmNr7Va4EkVF3s7vi
         +6KiSdGG1+uH5TiOqmptekIU9tDzTHScpEOlcIHN+qG6r2Bu6fxzwcWi4v+qLF9Rxr
         j9BQuQW48H/FK5Mseig+6cAkA63RpagAms39dCA8i+S6xlz/nVP3XuTw01sKYbwOpI
         UJN6D3Nhju5zg==
Date:   Wed, 29 Mar 2023 21:29:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Message-ID: <ZCSRsWEXIqcV0xC4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3/7x2pzW7P4Mq4zG"
Content-Disposition: inline
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3/7x2pzW7P4Mq4zG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:35:29PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--3/7x2pzW7P4Mq4zG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkka0ACgkQFA3kzBSg
KbZ7QQ//TjhlV9gpnzQf1R+my8YacgB2isHXPlTUphtT1RhFuCtww7h9lGyoh2iz
msnIcykv8xVr+nJ1zkALk9reiZQP7DdXSjVYHsCpd7XZyHXwm4PrfBlhoQi6rkeY
DUDY8mQ5QpFbhG2bbJDFfelYwkc1fwCW/FLew0P7kRudkeb3OVjQq/ABaWVXHZYY
lF1SUIZKC+bsfeoidJ2oA3DcQ+jeML1BV81SZwDJ1TIbaQLRdcx37l+OlMwYLMXA
wOdrZmOH3spf3jWoEEKPH5hO48W4AvMujWAqWiShgcCH8S37g34eXxQ7fUOaQrA5
CupkQ8LBcNbnzLZjsN0nNFZkDYasCLA/aHsAjhhsU+UvR0KWTrp3VOZkQh/YL6Yv
BWG8K2DDl986q2YZWHdyoALr9aK/PkvqcxH+Bsgu5kAOOOBjaSmCG80jIGUz99XF
qwthYFsQbNU0W5D2D1bOCesL0ZXWjYHAob8OD65Jdup6IAcfkFbEsFlhFhtEXurD
QfHepyLM5x4qENtV7M9bGGGaAZwtgW7qYeQgLTKBPQeXy+ZiW10F5t/3y4lfBJ1U
KFLGQankiD98qmHEwQpVxS8sWNUUTIg1XQlGnoOiiZDKd3NEYSj+Ivu2gt2mEkJq
Ra3yRf6q1yETdTaNA2ltFSh0wvup3LOQaEFr84Iq9GXiFPTdNec=
=95C4
-----END PGP SIGNATURE-----

--3/7x2pzW7P4Mq4zG--
