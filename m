Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E950B7B510E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Oct 2023 13:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbjJBLRh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 07:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbjJBLRg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 07:17:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08713DD;
        Mon,  2 Oct 2023 04:17:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE31C433C9;
        Mon,  2 Oct 2023 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696245453;
        bh=2bmKRrOZ9VWZskLx+eJzTp2iUx/wx8oS6h69Tph3GzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PcqNrh57u3Afc6ESzkYtFZRvNxGolGfYJRWyFXgkalv2pipu6A+4PrUwaMUMoaXlP
         FVjgBaO9Ts0WsbQg8CbfPX8c9ANlcSyD85dDbSYRT6HQBulvZCfR6FlFYVfxCdPsTb
         hS1Na2S+894LjDOjLlP2yoYIsbwaKE4rXFbp8M2wU0omNw+jrUT78kZKCj7bULwODQ
         m0L2pXlsxu03xoXd+u2VJYTgld43t/kfTdzuqdopkrq1Tbwb6P0owd9OytEwp4Gmd+
         OF0UiTLU7B+0vF9b/GLKvaXNXmvrbZDdSy+nmj7fh8nTNWjZDhWBFasoEQezKez8oO
         6UhsRBJPDT74w==
Date:   Mon, 2 Oct 2023 12:17:27 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: qcom-cci: Document SC7280
 compatible
Message-ID: <20231002-magnetize-regulator-b98bcc3d4a30@spud>
References: <20231002-sc7280-cci-v2-0-9333fda4612a@fairphone.com>
 <20231002-sc7280-cci-v2-1-9333fda4612a@fairphone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kqiXeAPr6klURmAS"
Content-Disposition: inline
In-Reply-To: <20231002-sc7280-cci-v2-1-9333fda4612a@fairphone.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kqiXeAPr6klURmAS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 08:55:30AM +0200, Luca Weiss wrote:
> Document the compatible for the CCI block found on SC7280 SoC.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 042d4dc636ee..8386cfe21532 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - qcom,sc7280-cci
>                - qcom,sdm845-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -159,6 +160,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sc7280-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
>      then:
>=20
> --=20
> 2.42.0
>=20

--kqiXeAPr6klURmAS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqmxwAKCRB4tDGHoIJi
0ogIAP9NCHC88Aezq70XG1fYtnFB5qjR72uBP7sD6ilqzpG3UwD48OOjo2MuBZeu
+KBPM6znytsGCqfoZEsVKOp5ZCZTAA==
=nmti
-----END PGP SIGNATURE-----

--kqiXeAPr6klURmAS--
