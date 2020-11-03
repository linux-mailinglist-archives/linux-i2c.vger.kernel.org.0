Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223CC2A3A6C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 03:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCC3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 21:29:36 -0500
Received: from mail-oo1-f65.google.com ([209.85.161.65]:33675 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKCC3g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Nov 2020 21:29:36 -0500
Received: by mail-oo1-f65.google.com with SMTP id u5so3866925oot.0;
        Mon, 02 Nov 2020 18:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LvMH2M39sGMDugQ+SeCib9ETqH3o3fYshl+O+PWh8Ic=;
        b=YieTujv39I+HxKwb771U3kU30HHY4jJRm4P+hyoU3ybRoBpfLVdwr4OaB4Jla0McHl
         J0WjeCv+CqPxdgVAvj8KrUG22EjuYB0hrid+E6W1p7h9D5WhgjAfot3Xtvgcph/C9LPm
         fEpjfLceafRafMxxuRCfQsN6E4Bw/iqVKB6syysqpE3Tm8DgJN+GtwX4GRP3B2farcI/
         Fgzwh2T1r7kE3VlruwWw4c8itaTKEmVRNJ8rgZQuGukRALA7rbYnR8sS8ayt8S2m5kmw
         b5LEh10pNyndJlqsavBp2vBBjzobbGLwtlxXrfZJOcm4G+EOMunenes3YII4kWbpfMWf
         ii6A==
X-Gm-Message-State: AOAM531sgsS/LT+mzGCIsFFGjzpHBCwwkqAZ7QpS6ZcPWScNzzj8QUKe
        Jj0Qr4FU/WDHT7gjhNPfpA==
X-Google-Smtp-Source: ABdhPJy8t7I4uF5iXGRmohxwvxRM33Kg8xlXPwBT2gtlZNNedV0t/JOmoNoNK433W9wBlZE/VuUJBQ==
X-Received: by 2002:a4a:b503:: with SMTP id r3mr13879716ooo.28.1604370573696;
        Mon, 02 Nov 2020 18:29:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p126sm3827647oia.24.2020.11.02.18.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:29:33 -0800 (PST)
Received: (nullmailer pid 689946 invoked by uid 1000);
        Tue, 03 Nov 2020 02:29:32 -0000
Date:   Mon, 2 Nov 2020 20:29:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
        Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 2/3] dt-bindings:iio:imu:invensense,mpu6050: txt to yaml
 conversion
Message-ID: <20201103022932.GB679426@bogus>
References: <20201031181801.742585-1-jic23@kernel.org>
 <20201031181801.742585-3-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031181801.742585-3-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 31, 2020 at 06:18:00PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Relies on the patch to convert i2c-gate over to yaml.
> 
> 2 prior examples combinded into one as a single example can show
> all of the binding elements as long as the right part is selected.
> 
> I don't know if there is a simple way to exclude i2c-gate if the
> master interface is SPI.

Not currently.

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Peter Rosin <peda@axentia.se>
> ---
>  .../bindings/iio/imu/inv_mpu6050.txt          |  67 -----------
>  .../bindings/iio/imu/invensense,mpu6050.yaml  | 105 ++++++++++++++++++
>  2 files changed, 105 insertions(+), 67 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

However, ...

> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> deleted file mode 100644
> index f2f64749e818..000000000000
> --- a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
> -
> -http://www.invensense.com/mems/gyro/mpu6050.html
> -
> -Required properties:
> - - compatible : should be one of
> -		"invensense,mpu6000"
> -		"invensense,mpu6050"
> - 		"invensense,mpu6500"
> -		"invensense,mpu6515"
> -		"invensense,mpu9150"
> -		"invensense,mpu9250"
> -		"invensense,mpu9255"
> -		"invensense,icm20608"
> -		"invensense,icm20609"
> -		"invensense,icm20689"
> -		"invensense,icm20602"
> -		"invensense,icm20690"
> -		"invensense,iam20680"
> - - reg : the I2C address of the sensor
> - - interrupts: interrupt mapping for IRQ. It should be configured with flags
> -   IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
> -   IRQ_TYPE_EDGE_FALLING.
> -
> -  Refer to interrupt-controller/interrupts.txt for generic interrupt client node
> -  bindings.
> -
> -Optional properties:
> - - vdd-supply: regulator phandle for VDD supply
> - - vddio-supply: regulator phandle for VDDIO supply
> - - mount-matrix: an optional 3x3 mounting rotation matrix
> - - i2c-gate node.  These devices also support an auxiliary i2c bus.  This is
> -   simple enough to be described using the i2c-gate binding. See
> -   i2c/i2c-gate.txt for more details.
> -
> -Example:
> -	mpu6050@68 {
> -		compatible = "invensense,mpu6050";
> -		reg = <0x68>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <18 IRQ_TYPE_EDGE_RISING>;
> -		mount-matrix = "-0.984807753012208",  /* x0 */
> -		               "0",                   /* y0 */
> -		               "-0.173648177666930",  /* z0 */
> -		               "0",                   /* x1 */
> -		               "-1",                  /* y1 */
> -		               "0",                   /* z1 */
> -		               "-0.173648177666930",  /* x2 */
> -		               "0",                   /* y2 */
> -		               "0.984807753012208";   /* z2 */
> -	};
> -
> -
> -	mpu9250@68 {
> -		compatible = "invensense,mpu9250";
> -		reg = <0x68>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
> -		i2c-gate {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			ax8975@c {
> -				compatible = "ak,ak8975";
> -				reg = <0x0c>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
> new file mode 100644
> index 000000000000..f640d161773c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
> +
> +maintainers:
> +  - Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
> +
> +description: |
> +  These devices support both I2C and SPI bus interfaces.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - invensense,iam20680
> +      - invensense,icm20608
> +      - invensense,icm20609
> +      - invensense,icm20689
> +      - invensense,icm20602
> +      - invensense,icm20690
> +      - invensense,mpu6000
> +      - invensense,mpu6050
> +      - invensense,mpu6500
> +      - invensense,mpu6515
> +      - invensense,mpu9150
> +      - invensense,mpu9250
> +      - invensense,mpu9255
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +  vdd-supply: true
> +  vddio-supply: true
> +
> +  mount-matrix: true
> +
> +  i2c-gate:
> +    $ref: "../../i2c/i2c-gate.yaml"

Though really I think we could just get rid of i2c-gate. We set the name 
here, so having it doesn't add much over just including 
i2c-controller.yaml here.

> +    unevaluatedProperties: false
> +    description: |
> +      These devices also support an auxiliary i2c bus.  This is
> +      simple enough to be described using the i2c-gate binding.
> +      Only possible if using an I2C interface to the host.
> +
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - invensense,mpu9150
> +                - invensense,mpu9250
> +                - invensense,mpu9255
> +    then:
> +      properties:
> +        i2c-gate: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imu@68 {
> +            compatible = "invensense,mpu9250";
> +            reg = <0x68>;
> +            interrupt-parent = <&gpio3>;
> +            interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
> +            mount-matrix = "-0.984807753012208",  /* x0 */
> +                           "0",                   /* y0 */
> +                           "-0.173648177666930",  /* z0 */
> +                           "0",                   /* x1 */
> +                           "-1",                  /* y1 */
> +                           "0",                   /* z1 */
> +                           "-0.173648177666930",  /* x2 */
> +                           "0",                   /* y2 */
> +                           "0.984807753012208";   /* z2 */
> +            i2c-gate {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
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
