Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470952A3A71
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 03:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgKCCaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 21:30:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44511 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKCCaj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Nov 2020 21:30:39 -0500
Received: by mail-ot1-f68.google.com with SMTP id m26so14615940otk.11;
        Mon, 02 Nov 2020 18:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=57zuFIwsz2PFgFDd2p7uV+Z5ALj6IjpRMLJLTGvmSgA=;
        b=sMnrIhClU+csAXm86Kwh5LCmQSIKY3v+fvDwLZu6Dh5Gwac/xnh0BfIvbj0oGQZROU
         WGiqxumjNyahQJEghJ+/FdQizCmGv1rYR4aOKq2aEfOtVMDmGAFHB1UX7oDULNuyqioQ
         qfdgXogT4rofgkNc4TQdZwoMH9jSo9IOGJe+5fn4h2QelsDsPazNgEp+Nu8lRYIQRq9R
         2UwbWYbbxszeD/LGn3rusm12qnX3sxCZRmMTf+8t+5iJcxSrgBDyAGRATZJ2mWKDaE2Z
         11a1oI1Z9YZr21+csAr5wjHDlHGSQQDmhm6SLjKx5zpIROSS3HD1xaSZett5Y9fYcYyG
         D/jA==
X-Gm-Message-State: AOAM531moqW6MZcTF07IBbW/+U/01gLe23k7c9h3D/+P/U5B3JYBpyCi
        Be1VhI5qVh6IWcWxZQ0AdQ==
X-Google-Smtp-Source: ABdhPJx6L4ISO0Yx3F0tHeQ94bG3Veb2VIF8HQr3ksOSyUO4q7wqq5C73Y8QXzhZYiZlgP1/KF3WRw==
X-Received: by 2002:a9d:3a1:: with SMTP id f30mr7877703otf.312.1604370637934;
        Mon, 02 Nov 2020 18:30:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h8sm1975636otm.72.2020.11.02.18.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:30:37 -0800 (PST)
Received: (nullmailer pid 691354 invoked by uid 1000);
        Tue, 03 Nov 2020 02:30:36 -0000
Date:   Mon, 2 Nov 2020 20:30:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml
 format conversion.
Message-ID: <20201103023036.GC679426@bogus>
References: <20201031181801.742585-1-jic23@kernel.org>
 <20201031181801.742585-4-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031181801.742585-4-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 31, 2020 at 06:18:01PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Very similar to the mpu6050 binding.
> Only unusual element is the i2c-gate section.
> Example tweaked a little to include a real device behind the gate.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../iio/gyroscope/invensense,mpu3050.txt      | 45 ------------
>  .../iio/gyroscope/invensense,mpu3050.yaml     | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 45 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
> deleted file mode 100644
> index 233fe207aded..000000000000
> --- a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Invensense MPU-3050 Gyroscope device tree bindings
> -
> -Required properties:
> -  - compatible : should be "invensense,mpu3050"
> -  - reg : the I2C address of the sensor
> -
> -Optional properties:
> -  - interrupts : interrupt mapping for the trigger interrupt from the
> -    internal oscillator. The following IRQ modes are supported:
> -    IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, IRQ_TYPE_LEVEL_HIGH and
> -    IRQ_TYPE_LEVEL_LOW. The driver should detect and configure the hardware
> -    for the desired interrupt type.
> -  - vdd-supply : supply regulator for the main power voltage.
> -  - vlogic-supply : supply regulator for the signal voltage.
> -  - mount-matrix : see iio/mount-matrix.txt
> -
> -Optional subnodes:
> -  - The MPU-3050 will pass through and forward the I2C signals from the
> -    incoming I2C bus, alternatively drive traffic to a slave device (usually
> -    an accelerometer) on its own initiative. Therefore is supports a subnode
> -    i2c gate node. For details see: i2c/i2c-gate.txt
> -
> -Example:
> -
> -mpu3050@68 {
> -	compatible = "invensense,mpu3050";
> -	reg = <0x68>;
> -	interrupt-parent = <&foo>;
> -	interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> -	vdd-supply = <&bar>;
> -	vlogic-supply = <&baz>;
> -
> -	/* External I2C interface */
> -	i2c-gate {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		fnord@18 {
> -			compatible = "fnord";
> -			reg = <0x18>;
> -			interrupt-parent = <&foo>;
> -			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
> new file mode 100644
> index 000000000000..b0a476afb656
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/gyroscope/invensense,mpu3050.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Invensense MPU-3050 Gyroscope
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: invensense,mpu3050
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  vlogic-supply: true
> +
> +  interrupts:
> +    minItems: 1
> +    description:
> +      Interrupt mapping for the trigger interrupt from the internal oscillator.
> +
> +  mount-matrix: true
> +
> +  i2c-gate:
> +    $ref: "../../i2c/i2c-gate.yaml"
> +    unevaluatedProperties: false
> +    description: |
> +      The MPU-3050 will pass through and forward the I2C signals from the
> +      incoming I2C bus, alternatively drive traffic to a slave device (usually
> +      an accelerometer) on its own initiative. Therefore is supports a subnode
> +      i2c gate node.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gyroscope@68 {
> +            compatible = "invensense,mpu3050";
> +            reg = <0x68>;
> +            interrupt-parent = <&foo>;
> +            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +            vdd-supply = <&bar>;
> +            vlogic-supply = <&baz>;
> +
> +            i2c-gate {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                magnetometer@c {
> +                    compatible = "ak,ak8975";
> +                    reg = <0x0c>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.28.0
> 
