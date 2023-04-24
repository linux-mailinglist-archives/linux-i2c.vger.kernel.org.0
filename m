Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCE96ECDFF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 15:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbjDXN2r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 09:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjDXN2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 09:28:43 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D656E8A;
        Mon, 24 Apr 2023 06:28:28 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-38c35975545so3297060b6e.1;
        Mon, 24 Apr 2023 06:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682342893; x=1684934893;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gY8hrXNwbYgQ5hLI5h332CojeiGsOYICAo5dCroy2lQ=;
        b=LVSupP1936OxcO0WiqfFbbw9lk4g8gntNmL/STtFIaMv+YS5Xs8V5u/VXlWudNwyas
         5l9mV282gHs3Rpt0+R/azx41opR64NIlgVIqaNNgjqJ0Dbz+c9F8BYPXAGUW12lDuAyp
         sTc+7bW6RxMCRB4seLVy+HkU1uTIW9Hbp6jgO82UoxP86ntZxuSG27wz0NkPkTAD3eLs
         EePWWIrFoJry62LFqNRi43WuCQFr2Lz/Kn/I7qajWf0yfxEYAstXLVdDYeXUTHQNiIPs
         dL8EpDPOpUevm12kDu9PGAQC1/YHiXNo7uFtYfHYf7UWgv8xuVGJM+GAqOH946svG9Rm
         M5+w==
X-Gm-Message-State: AAQBX9dySGSPdKacXm5rvqwnBdrW2GRXQpFSgFMF7rK+qzhe+JlVHgTi
        S57dvLVNrcB0OPtoF0WPWw==
X-Google-Smtp-Source: AKy350aHyMng2QoKCc18TU/ZFGYuy+IOUzcAsszb+A6bsy1fPX+RPEaIvQ8jI9zBld6hKtxYuqrW7g==
X-Received: by 2002:a05:6808:17:b0:38e:8e21:d042 with SMTP id u23-20020a056808001700b0038e8e21d042mr5028866oic.58.1682342891865;
        Mon, 24 Apr 2023 06:28:11 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80e7:4387:ec9f:155:c2d2:6e82])
        by smtp.gmail.com with ESMTPSA id i25-20020a056808031900b0038bf8c6151fsm4551118oie.6.2023.04.24.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:28:11 -0700 (PDT)
Received: (nullmailer pid 2494965 invoked by uid 1000);
        Mon, 24 Apr 2023 13:28:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
Message-Id: <168234106840.2461053.15248983062211825110.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Date:   Mon, 24 Apr 2023 08:28:08 -0500
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


On Mon, 24 Apr 2023 18:13:49 +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 driver.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dts:22.17-30: Warning (reg_format): /example-0/i2c/ltc4286@40:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dts:18.13-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dts:18.13-26.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dts:20.24-25.15: Warning (avoid_default_addr_size): /example-0/i2c/ltc4286@40: Relying on default #address-cells value
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dts:20.24-25.15: Warning (avoid_default_addr_size): /example-0/i2c/ltc4286@40: Relying on default #size-cells value
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

