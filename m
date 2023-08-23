Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129E3786257
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbjHWV2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237822AbjHWV2d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:28:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14850E7A;
        Wed, 23 Aug 2023 14:28:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9FB4266051;
        Wed, 23 Aug 2023 21:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ED1C433C8;
        Wed, 23 Aug 2023 21:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692826110;
        bh=j3/wED7SS5LyLAoF3Vr2uwBwVuU5WjEy7ZL9ccJLLWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G7vNBLsT2nzz41R3tz+HY3j6goL87R02FNYI9tt4wTo5Z56kNy1oqBkltW2V42BxV
         FG/kwe52psZVxh6K/cJEp2C6ShDATtUDr+t1lwx2JVyLOhlXIojf0kqoMJA/nblEzB
         h9EMpV1frlMtZacT1oDHI/3Lo7MsKOZhbRhuXKVxDy1z8PrWJAXmai6Y8PA2Uv8Fvl
         NPGbAfTUMxevI1MMoizT8E687Xar0kD/7jEdiz5sCkLvQmv9U9hwd6u6JFPYP2JXbb
         5cDiOKkRl6b7hmGaeIciIdNhZYP8ZkjbbN0L+VbGI2CfT6lyzNYGFvPNf75kZFQXKr
         Q9oeMUXA6NucA==
Date:   Wed, 23 Aug 2023 23:28:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Omnivision OV7251 to DT
 schema
Message-ID: <ZOZ5+1Dm5pZEkF78@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20230817202713.2180195-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BTbnJp10YoCq6lqH"
Content-Disposition: inline
In-Reply-To: <20230817202713.2180195-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BTbnJp10YoCq6lqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 03:27:13PM -0500, Rob Herring wrote:
> Convert the OmniVision OV7251 Image Sensor binding to DT schema format.
>=20
> vddd-supply was listed as required, but the example and actual user
> don't have it. Also, the data brief says it has an internal regulator,
> so perhaps it is truly optional.
>=20
> Add missing common "link-frequencies" which is used and required by the
> Linux driver.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--BTbnJp10YoCq6lqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmefsACgkQFA3kzBSg
KbZa1BAAps8bLdedGmStheotB2ZVygKPeDI+C8uevYeAQmSSYYViv1x0FlAEegKR
KVv5QHniGivzlq1JpLWV3etg8RPPE0vUAqpVZMqi4UITguyPT7UmuQAeMTTQY5d4
PpQUT+TRHtKbEOcWKjvSHu/65SQLScyMnXV+QHJlTPrAAr5Kl0LobSE/HUNEs/EW
9RzgzZn8tLXLzWuQxhC15+d4kXCvqvx2QJV0//T57rxakJFhziygfxYDP5jvRbkJ
PnT5ITX0E2+zUeIF+pVjjSqza7f9LHZdq4tr0unViKuvYusC6TcRFuElSGKl+l4b
NOvQja/o4myzWTPpD9HP9DxJbNIj8SQYFflSedWyIvkomOZpNG5COE48WJnJekiz
8ebyu4ECxzLRYUXeskf8wl0UlS+SY6bhGxDkvT9qUVI116zkqr8dw4tciyanbTLu
qXOTCHidDick0EV68zKYf7TJu5/AMMlzliXzz8SCrIYOqe/KdhWRgEqipyCj+QIN
TqVJtEDu0S/EBJpqTz4hlfraoXgRlw/BE4tXm7PZyrcj2G9DviOdrLyFtWyU/33j
6tzTC4777jW5uHzkhURSpA1jjCmMvrjl73rmXMCMZuTag4bo3xVmmy9V16mTNjJ/
XvS6HX4EKQUNy/XrMteAoJZ52kwFt4SPZuLNv6+Gl+aU/JAeELg=
=UijO
-----END PGP SIGNATURE-----

--BTbnJp10YoCq6lqH--
