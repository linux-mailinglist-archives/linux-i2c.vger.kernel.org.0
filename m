Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB8D75DC57
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 14:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGVMCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 08:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjGVMCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 08:02:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1374D9B;
        Sat, 22 Jul 2023 05:02:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C46460ADC;
        Sat, 22 Jul 2023 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E722FC433C7;
        Sat, 22 Jul 2023 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690027363;
        bh=2lhE3RdVIzj9FW8Uxhynzfr7wWR0wibk1JlqbdY1c28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qUSAZKPSjoAFmnw7V5FG+RMB/BPXFe6XkDTOzHu4AZfEX9x6/NnzAQDhopCsfAEam
         Z8qhwqdoTLmXeYe0Qpv7XXBjrqQZcFrMUWkjVDyATimD/RUPbKpH75+Ra/+34LqfK9
         DGgg4ru5+A5cC2vj+TrLIMH1H2FPfYB0Q/no5UweIOjb83W9I8NtGctg6bQBFOd8i9
         xrH7uOaa1U1UwJzE+02EeKSOUmHfAxAYT3aQY9I7aVjxr15PsAUw/frlKFjiRw8fVu
         m+L58mtmAXDi93YhlNxl+cDyw35UqQFEBjBcMMecEh25a4JdeueFboIyQ0FPMkVAWZ
         zZAEQIJIQ77/A==
Date:   Sat, 22 Jul 2023 13:02:38 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Message-ID: <20230722-silliness-qualify-5120b10539d3@spud>
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jM3LRQyBiv5Pj4Mz"
Content-Disposition: inline
In-Reply-To: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jM3LRQyBiv5Pj4Mz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 11:57:09AM +0200, Krzysztof Kozlowski wrote:
> Convert the bindings for NXP PCA9541 I2C bus master selector to DT
> schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--jM3LRQyBiv5Pj4Mz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLvFXgAKCRB4tDGHoIJi
0lPLAP9ZV1M4FMtdmU0BQNH3uQTpjAFvlGUloDpgKzEJ1WSHTAD9EhkgA4sMwgYI
nUwPRQPVsP4oktbAtWgVCRr9SMxcCQI=
=LWlQ
-----END PGP SIGNATURE-----

--jM3LRQyBiv5Pj4Mz--
