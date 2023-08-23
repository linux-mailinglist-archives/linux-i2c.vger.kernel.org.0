Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65AED786207
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbjHWVPv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237089AbjHWVPX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:15:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F70110D9;
        Wed, 23 Aug 2023 14:15:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D630562CCC;
        Wed, 23 Aug 2023 21:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A063C433C8;
        Wed, 23 Aug 2023 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692825321;
        bh=Bz9WC4mbT4sUO+N5FkXmzqysmJcvwA45LQXrhS3WCRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jxFbOPuLaQm/yXUxuM0Nd26+ie6RvOoBaWVne7Nzv1V0tBd5Vpz4t0RDWjLyTYe9k
         tVvmKEyCNRqRr2tWMGDJdc8qJVG37eCkuY9iqD6nuenQN5LUeFv2vRknHVoiLyBz5C
         wm0n3KMzvY06r6yi9eXcnVE3xHIi5Ay5i31qjzy/EZNrs7AsuzXMztsfoq8umxMSrH
         kn8mpcg7gM78UrOKNV6VsNTkBfPlRwzcxI9SQCQcrHLsVHhZv7VTmGUGNyVOWunbCX
         9tqwrDrj3yfQPm+V2H1YkYbLdg4p+lJMocHIS0dqI5qM80jw4nkLCULh9ymCvNI6B2
         S31etcqsLEF3w==
Date:   Wed, 23 Aug 2023 23:15:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Message-ID: <ZOZ25TdCydCEoFFq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        naresh.solanki@9elements.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-3-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VFt4DzFPw48PdFrn"
Content-Disposition: inline
In-Reply-To: <20230817071056.2125679-3-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VFt4DzFPw48PdFrn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 09:10:51AM +0200, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the existing pca954x driver.
>=20
> For chips that are powered off by default add a regulator called vdd-supp=
ly.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--VFt4DzFPw48PdFrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmduUACgkQFA3kzBSg
KbYP5RAAlBjescHFvavuZNDuYEyZ10b+5UNQe/KS+Il8JT9yqyTt2wTiuxnXjJfu
Z/wpHCBotFfmlRMRTtbqtkvxQ4v6YPYRWJ93IoOs1HOPX4M0eajYCpQfDpKkbNy+
t01GRi6mlDCoTf/KNMaKFA+eDYTP08Mk0qAzMVgaiCyUqfNjcGRzbvIEp2jjAwZ+
Rg6AHbZS6KumMxW/rAlRYopQnEPF01YhsD4akYfzrTxQJ+Shqmqk3hNRjAIpYqyt
b7iFozwEOOuyGcaht27JgHAp/Ob1woeAd48nLThvqEwAzySvNiTGalTj0HAD00nM
Cw0XO4GEGPIiQ0THNiyZHecXD8wJUzL0pjRK+fVs4GXgw5sfktxa4jI9XXaAoZUi
i/gtlrgjhv6dBM+YMa6qr8JqO5dQhwGiFgZ2LVmDDf6O3lKtTdFhndzre//urtdT
Pm7ww8mNjcz2VzCbBjdfZu+B61MqZo5RF3Z4cgLGQPSHY1pymwx9dogY2Qx4i1ej
M864c6dqKKm3+Gq1jpuLSN5Ot1td6Qhh0k5Fn00es5DjbA/u4iVkq+knTfWL+xX5
4J1excxbOKGiNBjHS4S3L5PgBewW7sBC3HQJo29eQfWbIwFWV2wFTaKcs8RtG0rl
J/cMBD9YJMnq1MfYPzIdaIiwdHO7cz9BUy75e+9CVqUgkxCHDhg=
=G2yI
-----END PGP SIGNATURE-----

--VFt4DzFPw48PdFrn--
