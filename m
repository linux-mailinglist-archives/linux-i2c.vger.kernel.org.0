Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2A164B68A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 14:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235687AbiLMNqh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 08:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbiLMNqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 08:46:36 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D8CB23;
        Tue, 13 Dec 2022 05:46:35 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id c129so14269614oia.0;
        Tue, 13 Dec 2022 05:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFR9/k0a0Z+UiRC/7xhBYa61yTAUE8KhJLjHg3KEXCI=;
        b=KkVtxjYmnDh5RTSfr1gwuxmY0zRuq9O0dZz+EVJ9fBxfMyUMJd/FOjQ/ew2f4i5ddS
         z5cTDKg/1cCCazoUNW9BQXu0yrjUr7Vr2S7JVUNjiAkj1QTiNNdn+8LhHizD2cOgRiTX
         op0ptWXWnVW7uLnDmudu1Qj8hzlWOFfvloTo618WQ3BVakpFFeyauhBv566rPIv7mJ/j
         wMU/I1ccwPXStwogA0pwHWHAAfv57/kYlvmUhlBZpO3LZDO+PGSvNJJJWe9Cr/gFLk3x
         uWcYPdlFaIbjAuiYToI5qQZ/pJHZ3QcgsU+Z1Pium1n9B/4ljyeGyQck6SRCDaRrA3PU
         QmBw==
X-Gm-Message-State: ANoB5pkFsErC2VYTJkE2saL/rZ2qU5rbjeSg0WqkyZWINburY2UfZi98
        TYMC8Ex7N110Ol5inmNNAQ==
X-Google-Smtp-Source: AA0mqf4/eZTm3aoDTMYTU00TvoIrYcFPo5RbO6GHzIifs3RSEjL4U7Hwto/vONwLGDL1IwvTt8bjYw==
X-Received: by 2002:a05:6808:355:b0:35c:4d3a:6ce4 with SMTP id j21-20020a056808035500b0035c4d3a6ce4mr9303200oie.54.1670939194772;
        Tue, 13 Dec 2022 05:46:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a14-20020a05680802ce00b0035763a9a36csm1630117oid.44.2022.12.13.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:46:34 -0800 (PST)
Received: (nullmailer pid 914676 invoked by uid 1000);
        Tue, 13 Dec 2022 13:46:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        krzysztof.kozlowski@linaro.org, linux-i2c@vger.kernel.org,
        marijn.suijten@somainline.org, andersson@kernel.org,
        agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20221213115628.105149-1-konrad.dybcio@linaro.org>
References: <20221213115628.105149-1-konrad.dybcio@linaro.org>
Message-Id: <167093911669.912918.15733755245227436716.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom,i2c-cci: Fall back to common
 compatibles
Date:   Tue, 13 Dec 2022 07:46:32 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 13 Dec 2022 12:56:25 +0100, Konrad Dybcio wrote:
> Almost every compatible string in the CCI driver is a duplicate. Adjust
> the bindings to include a common (first-soc-implementing-vX) compatible
> to remove the need to keep adding superfluous compatible strings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.example.dtb: cci@ac4a000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sdm845-cci'] is too short
	'qcom,sdm845-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
	'qcom,sdm845-cci' is not one of ['qcom,msm8916-cci']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221213115628.105149-1-konrad.dybcio@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

