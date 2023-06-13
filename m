Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED02C72ED61
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 22:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjFMUym (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 16:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjFMUyl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 16:54:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95DD1701;
        Tue, 13 Jun 2023 13:54:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 721A963ADB;
        Tue, 13 Jun 2023 20:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D11C433C0;
        Tue, 13 Jun 2023 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686689678;
        bh=V+7wvrdAGdJCiaLWAv9usWBEYbulbrunmsViGawNtJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BX1JvrG4+ZrfgGyZWqmyBYZ3w+8Xfdpt+OP/iZcXJyB2uhGeGgpJmn58vZDK+bN+m
         k+qUGEzq2fEBMzNSGypyUbeWCSI992VgzW++7n1owD9hUDkyp56Nq2vTI9ChP5/lLe
         GKYVmVhRajnWMBo+lo4jt8PuSrWaGkFWQ/nzZkTleRzozeamMcBQM+soOcUyTwuOe5
         fzCYsRPj3xPuigrIR1dIFLM4gUnpXP5yT2q24bhLnj6xeeAm6m8+24V9VF7XXD7Ki+
         GL+GGCLqRUeYVuOw/n/89XHFhiAOzcdwPpB0rDJTTmgHE9x1r8lS8vTOd5bwyhW0cx
         dimMqPXQnVFyA==
Date:   Tue, 13 Jun 2023 21:54:34 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: opencores: Add missing type for
 "regstep"
Message-ID: <20230613-rinse-scrounger-fccd2fb1dab5@spud>
References: <20230613201105.2824399-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CZQK5/nX+1xRYy/Q"
Content-Disposition: inline
In-Reply-To: <20230613201105.2824399-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CZQK5/nX+1xRYy/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:11:04PM -0600, Rob Herring wrote:
> "regstep" may be deprecated, but it still needs a type.

Mea culpa!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.y=
aml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> index 85d9efb743ee..d9ef86729011 100644
> --- a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> +++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
> @@ -60,6 +60,7 @@ properties:
>      default: 0
> =20
>    regstep:
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        deprecated, use reg-shift above
>      deprecated: true
> --=20
> 2.39.2
>=20

--CZQK5/nX+1xRYy/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjXigAKCRB4tDGHoIJi
0nhtAQD6qoeZtlATQKrd5zF9/Fi0JB5tkeBpuicmd22dJWAEqQD/RlwLecKLe2hM
i9EJ/1K1v112DNTCBZKkKxqpwcRnfQA=
=eShX
-----END PGP SIGNATURE-----

--CZQK5/nX+1xRYy/Q--
