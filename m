Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81BD6ECF9A
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 15:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjDXNuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 09:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjDXNt6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 09:49:58 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE9293F8;
        Mon, 24 Apr 2023 06:49:34 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a9253d4551so36794275ad.0;
        Mon, 24 Apr 2023 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682344173; x=1684936173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=if+qLJBC6aei07h/TQBMVq0RtLZPNMknfuB7zM+rGdc=;
        b=SkeEEfCHKLxhZdFgxLT9n810Zk1T2LbV240NhzxldIIJ3bU+Lx+LfDnAJMfuVUku2r
         wqHrs99cOyFbZ1QVSiK4hTkAUXMMHg9++FI6XkMlzAs8LLRXnhEjKGAkuCu3qX6MpKNR
         GlKkl/RFIdJeLGZJY/aa09/0M4aIJdMhufPGrWnt9GSbPKJi4ofDK14FIy1XV6Oti6tW
         ktzeT67IBTChjIukzWZEYnpQzXuMpwRUB4VxsXZg0hVWlsYv94H4k3yVH6xhG+7JEswJ
         yVWfJrQ6RgqDoRRPiMZ8Cn5fcpM4MeOqcVw0tMV8+HdcWwFGSsb1Y1wSYVgz7QM9VXL2
         QwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682344173; x=1684936173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if+qLJBC6aei07h/TQBMVq0RtLZPNMknfuB7zM+rGdc=;
        b=E4F4GTEtVRIqVLswU5vp05y3/H7s3vxii6giX44fGAhIH+PY/9xa7oSk46Pvkxy5W3
         ZCX+A1JfNXbH41sY+MZuxM1dd7Hgv0bp4w9+Oo5uqo/N9k1MnyAp2odhNqU4nZAdmA6i
         VddETwIpbBUKX76pWDlkcQHmPQiCjmnByVWQLxDk2oJ1Oqc3P46R06woKGTuPDxyrzdV
         r2AaJPH5h/WLrJc3aB0DMadA81TEfY8boLseSgjTJ+7e6REIItPUlM7AY4XBV9mZMuaZ
         JQtCE+tT+QpLgwrt6o5XHSOcbXLLbwr3a8YmCjArusnJFLkkbrQzFnkUujv97vhgNeAt
         HR9w==
X-Gm-Message-State: AAQBX9dr59SkTDH6skEovdwCMjEW0Nrcl7lAFNmCZpPWeULzLBOzbbTU
        gqrotTzcsUJrs+VItfZqdiE=
X-Google-Smtp-Source: AKy350aPI3/FpDsR41fVSeGjbJihBRzaLq/za4vCRNQPIQVZqsGsFiRSCRi1RVlBMM978oPwtGrMDQ==
X-Received: by 2002:a17:903:64e:b0:1a6:a2df:4700 with SMTP id kh14-20020a170903064e00b001a6a2df4700mr13428967plb.9.1682344173112;
        Mon, 24 Apr 2023 06:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090282cb00b0019fcece6847sm6629514plz.227.2023.04.24.06.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:49:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Apr 2023 06:49:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 24, 2023 at 06:13:49PM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 driver.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..c1c8e310f9c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4286 power monitors
> +
> +maintainers:
> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc4286
> +      - lltc,ltc4287

There is no LTC4287, at least according to the Analog website.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vrange_select_25p6:
> +    description:
> +      This property is a bool parameter to represent the
> +      voltage range is 25.6 or not for this chip.

Existing attributes are adi,vrange-high-enable, ti,extended-range-enable,
ti,bus-range-microvolt, adi,range-double. I would suggest to use
adi,vrange-high-enable.

> +
> +  rsense-micro-ohms:
> +    description:
> +      Resistor value in micro-Ohm

I would suggest either shunt-resistor-micro-ohms or
sense-resistor-micro-ohms as used by other bindings.

> +
> +required:
> +  - compatible
> +  - reg
> +  - rsense-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        status = "okay";
> +        ltc4286@40 {
> +            compatible = "lltc,ltc4286";
> +            reg = <0x40>;
> +            vrange_select_25p6;
> +            rsense-micro-ohms = <300>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6545eb54104..930bdba0f73c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12183,6 +12183,15 @@ S:	Maintained
>  F:	Documentation/hwmon/ltc4261.rst
>  F:	drivers/hwmon/ltc4261.c
>  
> +LTC4286 HARDWARE MONITOR DRIVER
> +M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> +F:	drivers/hwmon/pmbus/Kconfig
> +F:	drivers/hwmon/pmbus/Makefile
> +F:	drivers/hwmon/pmbus/ltc4286.c
> +
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  L:	linux-i2c@vger.kernel.org
> -- 
> 2.17.1
> 
