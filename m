Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75156950F2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 00:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfHSWli (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 18:41:38 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53914 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728402AbfHSWlh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Aug 2019 18:41:37 -0400
Received: from [37.160.94.72] (port=26528 helo=[192.168.43.3])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hzqLD-000DZ3-5y; Tue, 20 Aug 2019 00:41:31 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
To:     Rob Herring <robh@kernel.org>
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
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net> <20190813154439.GA29515@bogus>
Message-ID: <8bd3161b-31d6-f49a-cc79-1ac9762e037f@lucaceresoli.net>
Date:   Tue, 20 Aug 2019 00:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813154439.GA29515@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

thanks for your review.

On 13/08/19 17:44, Rob Herring wrote:
> On Tue, Jul 23, 2019 at 10:37:20PM +0200, Luca Ceresoli wrote:
>> Describe the Texas Instruments DS90UB954-Q1, a 2-input video deserializer
>> with I2C Address Translator and remote GPIOs.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>>
>> Changes RFCv1 -> RFCv2:
>>
>>  - add explicit aliases for the FPD-link RX ports (optional)
>>  - add proper remote GPIO description
>> ---
>>  .../bindings/media/i2c/ti,ds90ub954-q1.txt    | 194 ++++++++++++++++++
>>  1 file changed, 194 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
>> new file mode 100644
>> index 000000000000..73ce21ecc3b6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.txt
>> @@ -0,0 +1,194 @@
>> +Texas Instruments DS90UB954-Q1 dual video deserializer
>> +======================================================
>> +
>> +The TI DS90UB954-Q1 is a MIPI CSI-2 video deserializer that forwards video
>> +streams from up to two FPD-Link 3 connections to a MIPI CSI-2 output. It
>> +also allows access to remote I2C and GPIO.
>> +
>> +Required properties:
>> +
>> + - compatible: must be "ti,ds90ub954-q1"
>> +
>> + - reg: main I2C slave address; optionally aliases for RX port registers
>> +   and remote serializers. The main address is mandatory and must be the
>> +   first, others are optional and fall back to defaults if not
>> +   specified. See "reg-names".
>> +
>> + - reset-gpios: chip reset GPIO, active low (connected to PDB pin of the chip)
>> + - i2c-alias-pool: list of I2C addresses that are known to be available on the
>> +                   "local" (SoC-to-deser) I2C bus; they will be picked at
>> +		   runtime and used as aliases to reach remove I2C chips
> 
> s/remove/remote/

Will fix.

> Needs a vendor prefix.

The ultimate goal here is to define a standard property that all chips
able to to I2C forwarding (video serdes or, potentially, other chips)
can use. That's why the GMSL (Maxim deser) developers are in Cc: they
are also facing a similar need.

However I'm OK to change this to "ti,i2c-alias-pool" just in case there
are reasons to not use a common name [yet]. However, following this
argument, shouldn't a prefix be needed also for other nonstandard
strings, such as "i2c-atr" below?

>> + - gpio-controller
>> + - #gpio-cells: must be 3: FPD-Link 3 RX port number, remote gpio number, flags
> 
> We're pretty standardized on 2 cells for GPIO. Perhaps combine the port 
> and gpio number to 1 cell.

Oh dear. I dislike implementing software that does not model the
physical reality. I know it will bite me back sooner or later. Here we
_really_ have N physically separate GPIO controllers, and the number of
GPIOs they have depends on the model of the chip that is connected remotely.

This is how things look in the case of 2 ports:

 <-- base board -->         <------- remote camera module 1 ----->
                            .---------------------.
 .-----.    .------.        |         SER 1       |
 | CPU |----|port 1|========|----------.          |
 `-----'    |      |  FPD   | GPIO ctl |          |
            |      | Link 3 `---------------------'
            |      | cable        ||||
	    | DES  |         remote GPIO pins
            |      |
            |      |        <------- remote camera module 2 ----->
            |      |        .---------------------.
            |port 2|        |         SER 2       |
            |      |========|----------.          |
            `------'  FPD   | GPIO ctl |          |
                     Link 3 `---------------------'
                     cable    ||||||||
	                     remote GPIO pins

Perhaps we should have N separate gpiochips, one per port? Under which
node? Not under "ports" ("We don't allow other nodes within graph
nodes"), and "i2c-atr" does not seem like a suitable name. Under a new
"remote-gpiochips" node?

>> +Required subnodes:
>> +
>> + - ports: A ports node with one port child node per device input and output
>> +          port, in accordance with the video interface bindings defined in
>> +          Documentation/devicetree/bindings/media/video-interfaces.txt. The
>> +          port nodes are numbered as follows:
>> +
>> +          Port Description
>> +          ------------------------------------
>> +          0    Input from FPD-Link 3 RX port 0
>> +          1    Input from FPD-Link 3 RX port 1
>> +          2    CSI-2 output
>> +
>> +          Each port must have a "remote-chip" subnode that defines the remote
>> +	  chip (serializer) with at least a "compatible" property
> 
> We don't allow other nodes within graph nodes. I'm not really clear what 
> you are trying to do here.

Each of the deser ports (2 ports in this chip) creates a physical
point-to-point "bus". It's called "FPD-Link 3" in the TI chips, "GMSL"
in the Maxim chips. One "remote chip" serializer can be connected to
each bus. The remote chip has, at least, a model (e.g. DS90UB953) and
some properties. So I need a place where model and properties can be
described. The port node looked like a good place, but as you point out
it is not.

Adding to the above discussion about 3 gpio-cells, I can think of a
different, tentative DT layout:

deser: deser@3d {
	compatible = "ti,ds90ub954-q1";
	reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
	reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
	clocks = <&clk_25M>;
	interrupt-parent = <&gic>;
	interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
	reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;

	i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			endpoint {
				remote-endpoint = <&sensor_0_out>;
			};
		};

		port@1 {
			reg = <1>;
			endpoint {
				remote-endpoint = <&sensor_1_out>;
			};
		};

		port@2 {
			reg = <2>;
			endpoint {
				data-lanes = <1 2 3 4>;
				/* Actually a REFCLK multiplier */
				data-rate = <1600000000>;
				remote-endpoint = <&csirx_0_in>;
			};
		};
	};

	remote-chips {
		#address-cells = <1>;
		#size-cells = <0>;

		remote-chip@0 {
			reg = <0>;
			chip {
				compatible = "ti,ds90ub953-q1";
				gpio-functions = <...>;
			};

			remote_i2c0: i2c@0 {
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;
			};

			gpio-controller;
			/* 2 cells for _each_ gpiochip */
			#gpio-cells = <2>; /* remote gpio num, flags */
		};

		remote-chip@1 {
			reg = <1>;
			/* similar to remote chip 0 */
		};
	};
};

Here there are two subnodes:

 - "remote-chips" with a subnode per remote port, each describing
   the remote chip model and properties, remote i2c bus, gpio controller
   and others (other chips have I2S, SPI, UART...)

 - "ports" with only the standard v4l2 port properties, no subnodes
   under the endpoint nodes

Does this look better from the device tree point of view?

>> + - i2c-atr: contains one child per RX port, each describes the I2C bus on
>> +            the remote side
>> +
>> +	    Required properties:
>> +	    - #address-cells = <1>;
>> +	    - #size-cells = <0>;
>> +
>> +	    Subnodes: one per each FPD-link RX port, each having:
>> +
>> +	    Required properties for "i2c-atr" child bus nodes:
>> +	    - reg: The number of the port where the remove chip is connected
> 
> s/remove/remote/

Ok.

>> +	    - #address-cells = <1>;
>> +	    - #size-cells = <0>;
>> +
>> +	    Optional properties for "i2c-atr" child bus nodes:
>> +	    - Other properties specific to the remote hardware
> 
> Such as?

"clock-frequency" at least. The remote chip is an I2C master, thus any
property that applies to an I2C master might apply as well.

"clock-frequency" is only half-implemented in these RFC patches:

 * in patch 5, function ds90_rxport_add_serializer() passes the REFCLK
   value of the deser to the remote chip (serializer): this value is
   the physical reference clock the remote chip receives, all of its
   timings are based on it

 * the remote chip, given refclk, computes the register values that best
   approximate "clock-frequency" [not implemented in this version, would
   be in patch 6]

I plan to implement and document the whole clock-frequency feature for
the next patch iteration. But I'd love to receive comments about how
reflck is passed from the deser to the serializer via platform_data.

>> +Device node example
>> +-------------------
>> +
>> +&i2c0 {
>> +	deser: deser@3d {
>> +		compatible = "ti,ds90ub954-q1";
>> +		reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
>> +		reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
>> +		clocks = <&clk_25M>;
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
>> +		reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;
>> +
>> +		i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
>> +
>> +		gpio-controller;
>> +		#gpio-cells = <3>; /* rxport, remote gpio num, flags */
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				ds90ub954_fpd3_in0: endpoint {
>> +					remote-endpoint = <&sensor_0_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +				ds90ub954_fpd3_in1: endpoint {
>> +					remote-endpoint = <&sensor_1_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +				ds90ub954_mipi_out0: endpoint {
>> +					data-lanes = <1 2 3 4>;
>> +					/* Actually a REFCLK multiplier */
>> +					data-rate = <1600000000>;
>> +					remote-endpoint = <&csirx_0_in>;
>> +				};
>> +			};
>> +		};
>> +
>> +		i2c-atr {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			remote_i2c0: i2c@0 {
>> +				reg = <0>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
> 
> Presumably, there are child I2C devices here. Please show that in the 
> example.

They are shown below to avoid excessive nesting, look for "&remote_i2c0"
(1).

>> +&ds90ub954_fpd3_in0 {
>> +	remote-chip {
>> +		compatible = "ti,ds90ub953-q1";
>> +		gpio-functions = <DS90_GPIO_FUNC_OUTPUT_REMOTE
> 
> Not documented.

That's because this node describes the remote chip. The remote chip is a
ti,ds90ub953-q1, its bindings are defined in patch 4. It's similar to
showing some child I2C devices under the I2C master, as you suggested
just above, except it's not an I2C bus but an FPD-Link 3 "bus".

Is it OK if I replace the whole gpio-functions node with the comment
"/* properties specific to the ti,ds90ub953-q1 chip */"?

>> +&remote_i2c0 {
>> +	sensor_0@3c {
>> +		compatible = "sony,imx274";
>> +		reg = <0x3c>;

(1) here are the child I2C device mentioned above

-- 
Luca
