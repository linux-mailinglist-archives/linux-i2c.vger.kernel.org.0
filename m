Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65480745F12
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjGCOux (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjGCOuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:50:52 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361AEB2;
        Mon,  3 Jul 2023 07:50:51 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-777a6ebb542so177606939f.0;
        Mon, 03 Jul 2023 07:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688395850; x=1690987850;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WvT8W6UUHkGl/2v0glhXnZWU1jmjMKb3Iaxvw5iaZ20=;
        b=GDUslPD8lZD0uacPShUVESsZLYrA0uQrsOMcQKhWpyFBZVESG0+VBhpw0O+8f1esPy
         IvERPd947NceLtnK+5tKCPa4uRcnPOLw1rh0BY7bZ/YAnsnMGAHVW+q84eBDllmU6rx6
         4TJLFk3Zenf6w30sU98Mf6fnbYGBTLZzoOGiuQh2Y/1/wRL+cH6Svej9Sj0dgrLOQu9s
         BBWiWQVlBQAdMUxNMr5n0baE/tKY5kW7iv10VjMp+eHkUzrgohUsvrgsEUB4gi7fQXY4
         W0PFbcupzJ1xTeCSjuq9H50RWMnH+LZ/dKKkUJKPq/r4oplUeYspYiq/npLlV2MDhW3T
         o0lw==
X-Gm-Message-State: AC+VfDzSKnk/ehQbNq7uWPe1Ko5xNulujQTA5LpFYlP0gh2/oIjvmgOc
        5zNWTbUwp9PetiKxo9Nbmw==
X-Google-Smtp-Source: ACHHUZ4yimfAO+VPw11yaXvO6DKjxZchQyRUEhLA7m2uETW5Mx7B0bC/E0dg1HZJq9nCv5g88ZFF/Q==
X-Received: by 2002:a05:6602:200c:b0:786:2d04:7b14 with SMTP id y12-20020a056602200c00b007862d047b14mr9761365iod.16.1688395850295;
        Mon, 03 Jul 2023 07:50:50 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v14-20020a02b90e000000b0042b0a6d899fsm2909181jan.60.2023.07.03.07.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:50:49 -0700 (PDT)
Received: (nullmailer pid 3733418 invoked by uid 1000);
        Mon, 03 Jul 2023 14:50:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-2-fea39aa07525@linaro.org>
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-2-fea39aa07525@linaro.org>
Message-Id: <168839584680.3733361.16157756581298354084.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: serial: geni-qcom: Allow no qup-core
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


On Mon, 03 Jul 2023 15:31:11 +0200, Konrad Dybcio wrote:
> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
> Allow such case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/serial/qcom,serial-geni-qcom.yaml     | 26 +++++++++++++++-------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@8c0000: serial@a88000: More than one condition true in oneOf schema:
	{'$filename': '/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml',
	 '$id': 'http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#',
	 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
	 'allOf': [{'$ref': '/schemas/serial/serial.yaml#'},
	           {'oneOf': [{'required': ['interrupts']},
	                      {'required': ['interrupts-extended']}]}],
	 'oneOf': [{'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-config'}],
	                                                  'maxItems': 1,
	                                                  'minItems': 1,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 1,
	                                             'minItems': 1},
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
	                                                            {'const': 'qup-config'}],
	                                                  'maxItems': 2,
	                                                  'minItems': 2,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 2,
	                                             'minItems': 2},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}}],
	 'properties': {'$nodename': True,
	                'assigned-clock-parents': True,
	                'assigned-clock-rates': True,
	                'assigned-clocks': True,
	                'bootph-all': True,
	                'bootph-pre-ram': True,
	                'bootph-pre-sram': True,
	                'bootph-some-ram': True,
	                'bootph-verify': True,
	                'clock-names': {'items': [{'const': 'se'}],
	                                'maxItems': 1,
	                                'minItems': 1,
	                                'type': 'array'},
	                'clocks': {'maxItems': 1, 'minItems': 1},
	                'compatible': {'items': [{'enum': ['qcom,geni-uart',
	                                                   'qcom,geni-debug-uart']}],
	                               'maxItems': 1,
	                               'minItems': 1,
	                               'type': 'array'},
	                'interrupt-parent': True,
	                'interrupts': {'maxItems': 2,
	                               'minItems': 1,
	                               'type': 'array'},
	                'interrupts-extended': {'maxItems': 2,
	                                        'minItems': 1,
	                                        'type': 'array'},
	                'operating-points-v2': True,
	                'phandle': True,
	                'pinctrl-0': True,
	                'pinctrl-1': True,
	                'pinctrl-names': {'items': [{'const': 'default'},
	                                            {'const': 'sleep'}],
	                                  'maxItems': 2,
	                                  'minItems': 1,
	                                  'type': 'array'},
	                'power-domains': {'maxItems': 1, 'minItems': 1},
	                'reg': {'maxItems': 1, 'minItems': 1},
	                'secure-status': True,
	                'status': True},
	 'required': ['compatible', 'clocks', 'clock-names', 'reg'],
	 'select': {'properties': {'compatible': {'contains': {'enum': ['qcom,geni-debug-uart',
	                                                                'qcom,geni-uart']}}},
	            'required': ['compatible']},
	 'title': 'Qualcomm Geni based QUP UART interface',
	 'type': 'object',
	 'unevaluatedProperties': False}
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: serial@a88000: More than one condition true in oneOf schema:
	{'$filename': '/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml',
	 '$id': 'http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#',
	 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
	 'allOf': [{'$ref': '/schemas/serial/serial.yaml#'},
	           {'oneOf': [{'required': ['interrupts']},
	                      {'required': ['interrupts-extended']}]}],
	 'oneOf': [{'patternProperties': {'pinctrl-[0-9]+': True},
	            'properties': {'$nodename': True,
	                           'bootph-all': True,
	                           'bootph-pre-ram': True,
	                           'bootph-pre-sram': True,
	                           'bootph-some-ram': True,
	                           'bootph-verify': True,
	                           'interconnect-names': {'items': [{'const': 'qup-config'}],
	                                                  'maxItems': 1,
	                                                  'minItems': 1,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 1,
	                                             'minItems': 1},
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
	                                                            {'const': 'qup-config'}],
	                                                  'maxItems': 2,
	                                                  'minItems': 2,
	                                                  'type': 'array'},
	                           'interconnects': {'maxItems': 2,
	                                             'minItems': 2},
	                           'phandle': True,
	                           'pinctrl-names': True,
	                           'secure-status': True,
	                           'status': True}}],
	 'properties': {'$nodename': True,
	                'assigned-clock-parents': True,
	                'assigned-clock-rates': True,
	                'assigned-clocks': True,
	                'bootph-all': True,
	                'bootph-pre-ram': True,
	                'bootph-pre-sram': True,
	                'bootph-some-ram': True,
	                'bootph-verify': True,
	                'clock-names': {'items': [{'const': 'se'}],
	                                'maxItems': 1,
	                                'minItems': 1,
	                                'type': 'array'},
	                'clocks': {'maxItems': 1, 'minItems': 1},
	                'compatible': {'items': [{'enum': ['qcom,geni-uart',
	                                                   'qcom,geni-debug-uart']}],
	                               'maxItems': 1,
	                               'minItems': 1,
	                               'type': 'array'},
	                'interrupt-parent': True,
	                'interrupts': {'maxItems': 2,
	                               'minItems': 1,
	                               'type': 'array'},
	                'interrupts-extended': {'maxItems': 2,
	                                        'minItems': 1,
	                                        'type': 'array'},
	                'operating-points-v2': True,
	                'phandle': True,
	                'pinctrl-0': True,
	                'pinctrl-1': True,
	                'pinctrl-names': {'items': [{'const': 'default'},
	                                            {'const': 'sleep'}],
	                                  'maxItems': 2,
	                                  'minItems': 1,
	                                  'type': 'array'},
	                'power-domains': {'maxItems': 1, 'minItems': 1},
	                'reg': {'maxItems': 1, 'minItems': 1},
	                'secure-status': True,
	                'status': True},
	 'required': ['compatible', 'clocks', 'clock-names', 'reg'],
	 'select': {'properties': {'compatible': {'contains': {'enum': ['qcom,geni-debug-uart',
	                                                                'qcom,geni-uart']}}},
	            'required': ['compatible']},
	 'title': 'Qualcomm Geni based QUP UART interface',
	 'type': 'object',
	 'unevaluatedProperties': False}
	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230703-topic-8250_qup_icc-v1-2-fea39aa07525@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

