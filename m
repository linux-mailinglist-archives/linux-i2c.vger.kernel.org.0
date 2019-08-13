Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBCEC8BD78
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 17:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfHMPom (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 11:44:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33873 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbfHMPom (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 11:44:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id c7so1641533otp.1;
        Tue, 13 Aug 2019 08:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SFxfynLI/PayVK9T09mSvJ64s8uI65LTsxBTjCv6WcM=;
        b=hY3ddn4ZK5tGvPTBiLkxH+x7mamRXpGMTAuWyeXYo6VDrj+ZtRMFD2c0UQX9U2cIry
         109T5HwR+t7wdJNtzQQ9YpCl572oey0n/mrzro9JRIqwhgDxS8X1E6Qhlqkh3d+QdlEY
         bsCv/kUOnq+kAt4H5oVeUTZBku75zyBbwx3rDmUZXoy06+oUsisC2x1KWAljb3mUL066
         n4VZ34/7WIL+u66s0SWglCfDB0tuFVdrtqMSoG5uSJD7gEUhsxJYFizETvprxIbdP8nU
         Kshnh/HmGpqqJ/FiKtyzbWC/Fu3jWW2vmc8smx/A/v5Vhc4+3DW6Hl0m/WJq1mjMtodN
         Jcaw==
X-Gm-Message-State: APjAAAVeXeooLwFojWgE29zxAT9e+YlWqSM0I2y96V5sTakXQpKE9T4F
        kPyh0J3TqlisAwmGt6iC4Q==
X-Google-Smtp-Source: APXvYqwiOI2LwlaSaAXpu7WaNtoQaiiVUisNbPaGgLe845gRk8bidZjBEntLcLXJBp0UuKTM2tqjvA==
X-Received: by 2002:a05:6638:52:: with SMTP id a18mr44508592jap.75.1565711080806;
        Tue, 13 Aug 2019 08:44:40 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id f9sm16190844ioc.47.2019.08.13.08.44.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:44:40 -0700 (PDT)
Date:   Tue, 13 Aug 2019 09:44:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <20190813154439.GA29515@bogus>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723203723.11730-4-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 23, 2019 at 10:37:20PM +0200, Luca Ceresoli wrote:
> Describe the Texas Instruments DS90UB954-Q1, a 2-input video deserializer
> with I2C Address Translator and remote GPIOs.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes RFCv1 -> RFCv2:
> 
>  - add explicit aliases for the FPD-link RX ports (optional)
>  - add proper remote GPIO description
> ---
>  .../bindings/media/i2c/ti,ds90ub954-q1.txt    | 194 ++++++++++++++++++
>  1 file changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
> new file mode 100644
> index 000000000000..73ce21ecc3b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
> @@ -0,0 +1,194 @@
> +Texas Instruments DS90UB954-Q1 dual video deserializer
> +======================================================
> +
> +The TI DS90UB954-Q1 is a MIPI CSI-2 video deserializer that forwards video
> +streams from up to two FPD-Link 3 connections to a MIPI CSI-2 output. It
> +also allows access to remote I2C and GPIO.
> +
> +Required properties:
> +
> + - compatible: must be "ti,ds90ub954-q1"
> +
> + - reg: main I2C slave address; optionally aliases for RX port registers
> +   and remote serializers. The main address is mandatory and must be the
> +   first, others are optional and fall back to defaults if not
> +   specified. See "reg-names".
> +
> + - reset-gpios: chip reset GPIO, active low (connected to PDB pin of the chip)
> + - i2c-alias-pool: list of I2C addresses that are known to be available on the
> +                   "local" (SoC-to-deser) I2C bus; they will be picked at
> +		   runtime and used as aliases to reach remove I2C chips

s/remove/remote/

Needs a vendor prefix.

> + - gpio-controller
> + - #gpio-cells: must be 3: FPD-Link 3 RX port number, remote gpio number, flags

We're pretty standardized on 2 cells for GPIO. Perhaps combine the port 
and gpio number to 1 cell.

> +
> +Optional properties:
> +
> + - reg-names: names of I2C address used to communicate with the chip, must
> +              match the "reg" values; mandatory if there are 2 or more
> +              addresses
> +    - "main": the main I2C address, used to access shared registers
> +    - "rxport0", "rxport1": I2C alias to access FPD-link RX port specific
> +      registers; must not be used by other slaves on the same bus
> +    - "ser0", "ser1": I2C alias to access the remote serializer connected
> +      on each FPD-link RX port; must not be used by other slaves on the
> +      same bus
> + - interrupts: interrupt pin from the chip
> +
> +Required subnodes:
> +
> + - ports: A ports node with one port child node per device input and output
> +          port, in accordance with the video interface bindings defined in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt. The
> +          port nodes are numbered as follows:
> +
> +          Port Description
> +          ------------------------------------
> +          0    Input from FPD-Link 3 RX port 0
> +          1    Input from FPD-Link 3 RX port 1
> +          2    CSI-2 output
> +
> +          Each port must have a "remote-chip" subnode that defines the remote
> +	  chip (serializer) with at least a "compatible" property

We don't allow other nodes within graph nodes. I'm not really clear what 
you are trying to do here.

> +
> + - i2c-atr: contains one child per RX port, each describes the I2C bus on
> +            the remote side
> +
> +	    Required properties:
> +	    - #address-cells = <1>;
> +	    - #size-cells = <0>;
> +
> +	    Subnodes: one per each FPD-link RX port, each having:
> +
> +	    Required properties for "i2c-atr" child bus nodes:
> +	    - reg: The number of the port where the remove chip is connected

s/remove/remote/

> +	    - #address-cells = <1>;
> +	    - #size-cells = <0>;
> +
> +	    Optional properties for "i2c-atr" child bus nodes:
> +	    - Other properties specific to the remote hardware

Such as?

> +	    - Child nodes conforming to i2c bus binding
> +
> +
> +Device node example
> +-------------------
> +
> +&i2c0 {
> +	deser: deser@3d {
> +		compatible = "ti,ds90ub954-q1";
> +		reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
> +		reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
> +		clocks = <&clk_25M>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;
> +
> +		i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +		gpio-controller;
> +		#gpio-cells = <3>; /* rxport, remote gpio num, flags */
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				ds90ub954_fpd3_in0: endpoint {
> +					remote-endpoint = <&sensor_0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				ds90ub954_fpd3_in1: endpoint {
> +					remote-endpoint = <&sensor_1_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				ds90ub954_mipi_out0: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					/* Actually a REFCLK multiplier */
> +					data-rate = <1600000000>;
> +					remote-endpoint = <&csirx_0_in>;
> +				};
> +			};
> +		};
> +
> +		i2c-atr {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			remote_i2c0: i2c@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Presumably, there are child I2C devices here. Please show that in the 
example.

> +			};
> +
> +			remote_i2c1: i2c@1 {
> +				reg = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +};
> +
> +&ds90ub954_fpd3_in0 {
> +	remote-chip {
> +		compatible = "ti,ds90ub953-q1";
> +		gpio-functions = <DS90_GPIO_FUNC_OUTPUT_REMOTE

Not documented.

> +				  DS90_GPIO_FUNC_UNUSED
> +				  DS90_GPIO_FUNC_UNUSED
> +				  DS90_GPIO_FUNC_UNUSED>;
> +	};
> +};
> +
> +&ds90ub954_fpd3_in1 {
> +	remote-chip {
> +		compatible = "ti,ds90ub953-q1";
> +		gpio-functions = <DS90_GPIO_FUNC_OUTPUT_REMOTE
> +				  DS90_GPIO_FUNC_UNUSED
> +				  DS90_GPIO_FUNC_UNUSED
> +				  DS90_GPIO_FUNC_UNUSED>;
> +	};
> +};
> +
> +&remote_i2c0 {
> +	sensor_0@3c {
> +		compatible = "sony,imx274";
> +		reg = <0x3c>;
> +
> +		reset-gpios = <&deser 0 0 GPIO_ACTIVE_LOW>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			sensor_0_out: endpoint {
> +				remote-endpoint = <&ds90ub954_fpd3_in0>;
> +			};
> +		};
> +	};
> +};
> +
> +&remote_i2c1 {
> +	sensor_0@3c {
> +		compatible = "sony,imx274";
> +		reg = <0x3c>;
> +
> +		reset-gpios = <&deser 1 0 GPIO_ACTIVE_LOW>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			sensor_1_out: endpoint {
> +				remote-endpoint = <&ds90ub954_fpd3_in1>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.17.1
> 
