Return-Path: <linux-i2c+bounces-14301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2874C8D13F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED783A418A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D99B314D1F;
	Thu, 27 Nov 2025 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFwAsE/p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D375E3C1F;
	Thu, 27 Nov 2025 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228258; cv=none; b=cXwFwiVARRnUd403hZh9CGaUm4q5UDuLiQOglY2RFx2KTHb4J2SRcB+HMHrwZF2eTxQWU9X9dB/4iQc2mQjWpQi/HV/cfgHT9nNas/jkeohqTWhqXWmpeKOCXE4JO8wkogzIb5njyTDvAaB+sEBLPYm+Uagzfk/s4B2QO/eN+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228258; c=relaxed/simple;
	bh=DhYRYtBKfaDGGgAu3Z4WJAK/iMJ03cC+RuSpqtCD9Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f20OCI6afdgWtbsvTVJjn6Z29sxrBBgpIoO+pz2o461q4l5vofPqM7UwoXX4cl56VmuF+ndzqGevnBKv/33/BhFMw32K6yJiZ435/xoqjIfNcVCyALnCUzqgcSERS5nnQ3OhLakCFvlhXb+UA2d5Pl+EkWLIRXIsApvQf/xX1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFwAsE/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8AAC4CEF8;
	Thu, 27 Nov 2025 07:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228257;
	bh=DhYRYtBKfaDGGgAu3Z4WJAK/iMJ03cC+RuSpqtCD9Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFwAsE/pfV3Rv3i2KXivcBptGAJ5mR8kIjDc6Uk8EyiuzJTbzWxmQu7M8+1RmHBka
	 YLLKS93sDjsfaP54BYQoJI+PpbHmWjZaFUBCSwv3oL9seIPs5gz5tp3259AY1zesFr
	 XGF6H+vYvyIQu3Da0/kvzSz8HWHaQ9yHEu0rw0Y+d2hw4qG9ilPnZF5A7r7q54O+ji
	 LkmG3BQ35+4QjInxlwJwyc7QKpBbPNNuqv2Tzt7VxGstVPxf+/W/DNXaARRBedm1og
	 IW7HtS8Uw/IPo0L0QO7tSu4utkPJ8QfJw3Ho/afeu7K64DDmRb2doMQLBWF/SwK7OO
	 JNCjKIMuw4lDw==
Date: Thu, 27 Nov 2025 08:24:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ethan Twardy <ethan.twardy@plexus.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>, 
	Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>, 
	Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20251127-liberal-onyx-shark-eaeab6@kuoka>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
 <20251126-cp2112-dt-v12-1-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-cp2112-dt-v12-1-2cdba6481db3@plexus.com>

On Wed, Nov 26, 2025 at 11:05:24AM -0600, Danny Kaehn wrote:
> +  i2c:
> +    description: The SMBus/I2C controller node for the CP2112
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      sda-gpios:
> +        maxItems: 1
> +
> +      scl-gpios:
> +        maxItems: 1

Neither scl nor sda-gpios are needed, they are allowed by i2c-controller
schema, so drop.

> +
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
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
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    usb {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      cp2112: device@1 {
> +        compatible = "usb10c4,ea90";
> +        reg = <1>;
> +
> +        gpio-controller;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        #gpio-cells = <2>;
> +        gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
> +          "TEST3","TEST4", "TEST5", "TEST6";

Please align the next line with opening ". See also DTS coding style.

> +
> +        fan-rst-hog {
> +            gpio-hog;
> +            gpios = <7 GPIO_ACTIVE_HIGH>;
> +            output-high;
> +            line-name = "FAN_RST";
> +        };
> +
> +        i2c {
> +          #address-cells = <1>;

Messed indentation, stick to one, preferred is 4 spaces for the example.

> +          #size-cells = <0>;
> +          sda-gpios = <&cp2112 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +          scl-gpios = <&cp2112 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +          temp@48 {
> +            compatible = "national,lm75";
> +            reg = <0x48>;
> +          };
> +        };
> +

Drop blank line

> +      };
> +    };
> 
> -- 
> 2.25.1
> 

