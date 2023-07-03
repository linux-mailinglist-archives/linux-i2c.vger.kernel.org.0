Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4DE745F17
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjGCOu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjGCOu4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:50:56 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B08B2;
        Mon,  3 Jul 2023 07:50:53 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-78625caa702so176890139f.1;
        Mon, 03 Jul 2023 07:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688395853; x=1690987853;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oClqgtuEJ5kxas9fDkwmwd/7VCwke8lenSscKAAvr8=;
        b=GlpxQvaQj1XDczx1FAtMD16oZ12IyVHA99viXEk74jCDvtnE1zeC4OW+nfvE0xApy5
         k2+rdhoIwNMMeDebR5/QFy51beXhqXTzbHxuDWsChxUpUT4CgvvljZMri+sahQ30SUmb
         t7o+AtwsUFmgyHJatopYSefRbp4lne03XrB0gMJv6ftQlU98RKqqx1i8ZU8JMxEqfw+A
         FNF293XwioupRHlNex0sGVsRVqACx9M7No2zbvAd9GRQUcZBw0oKxbpqaShoa2h155Qs
         4qYbJ94ktoYszDGUI6P2LKdMjbSIoFwDZIlg3bLrWg8KBVcMGsLYeB9Gg4jcdWjTsYRB
         /5qg==
X-Gm-Message-State: AC+VfDyKpz+0V7gwdq0ZXWVFk2nawXn54s7sddNTGnWAV0XRpJhGIq9c
        KOxLunW+qSJVOkWiZUtsL1lPic5vzA==
X-Google-Smtp-Source: ACHHUZ5YdfEkLDyk8nhQAw2w5UexpOXgzHRtjJA78rJ89+yRFKE71e4m4sXqlabBZ5NbW4D3Yb0fbg==
X-Received: by 2002:a5e:c64c:0:b0:784:314f:8d5b with SMTP id s12-20020a5ec64c000000b00784314f8d5bmr10668475ioo.11.1688395853161;
        Mon, 03 Jul 2023 07:50:53 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id x14-20020a02ac8e000000b0042b060ad00esm2845518jan.90.2023.07.03.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:50:52 -0700 (PDT)
Received: (nullmailer pid 3733421 invoked by uid 1000);
        Mon, 03 Jul 2023 14:50:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-serial@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20230703-topic-8250_qup_icc-v1-3-fea39aa07525@linaro.org>
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-3-fea39aa07525@linaro.org>
Message-Id: <168839584767.3733402.17418126780770305815.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: i2c: qcom,i2c-geni: Allow no qup-core
 icc path
Date:   Mon, 03 Jul 2023 08:50:47 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Mon, 03 Jul 2023 15:31:12 +0200, Konrad Dybcio wrote:
> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
> Allow such case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 27 +++++++++++++++-------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@8c0000: i2c@a94000: More than one condition true in oneOf schema:
	{'oneOf': [{'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-config'},
	                                                            {'const': 'qup-memory'}],
	                                                  'maxItems': 2,
	                                                  'minItems': 2,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 2,
	                                             'minItems': 2},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}},
	           {'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-core'},
	                                                            {'const': 'qup-config'},
	                                                            {'const': 'qup-memory'}],
	                                                  'maxItems': 3,
	                                                  'minItems': 3,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 3,
	                                             'minItems': 3},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}}],
	 'properties': {'clock-names': {'items': [{'const': 'se'}],
	                                'maxItems': 1,
	                                'minItems': 1,
	                                'type': 'array'},
	                'clocks': {'maxItems': 1, 'minItems': 1}}}
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: i2c@a94000: More than one condition true in oneOf schema:
	{'oneOf': [{'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-config'},
	                                                            {'const': 'qup-memory'}],
	                                                  'maxItems': 2,
	                                                  'minItems': 2,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 2,
	                                             'minItems': 2},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}},
	           {'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-core'},
	                                                            {'const': 'qup-config'},
	                                                            {'const': 'qup-memory'}],
	                                                  'maxItems': 3,
	                                                  'minItems': 3,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 3,
	                                             'minItems': 3},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}}],
	 'properties': {'clock-names': {'items': [{'const': 'se'}],
	                                'maxItems': 1,
	                                'minItems': 1,
	                                'type': 'array'},
	                'clocks': {'maxItems': 1, 'minItems': 1}}}
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230703-topic-8250_qup_icc-v1-3-fea39aa07525@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

