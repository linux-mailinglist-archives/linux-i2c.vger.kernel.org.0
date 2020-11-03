Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B87F2A3A63
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 03:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgKCCZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 21:25:12 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40194 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKCCZM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Nov 2020 21:25:12 -0500
Received: by mail-ot1-f68.google.com with SMTP id 79so7172488otc.7;
        Mon, 02 Nov 2020 18:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+WKFbwbVIGeckGk+onARWsEbLJfylB3iJhTbWycXwdk=;
        b=rz21r7LmqfAIJJOaoH/8ciUE+ynPWfKN54Gc0xE5Vttp0Pp/LxZWUgLi1LeI1BAx7X
         ZEevwqc6JZ01FZlQyCANOWuQkRFU/S+KQq9o7v2dImf2EXeqJaGVlckL4QE9IHAYcX0A
         CPSLoJQxsA349w48MFagpS0zUPjzvNAQiOZSFdJxoBNGMXEnIH/2fkSOU5lcVkwxZVec
         D1yfssPKE/NN+5+7mX9ZrE81iJSACHnuOKKjPCZcezFgQ8Uj19YSD7KEwW8kJVNYqsJs
         aStzAewdm/LmqDJsmzhjlhubuBQw1Vg+hOQ6gD2YgDUTVHON+Ii7AIhnTQZEn2cBA/bn
         sMzQ==
X-Gm-Message-State: AOAM53233CIFPw2w2oSoubSjVf+KXkY/I0Spt+r9qyC7r7IQhZ98MLFb
        T+XX2CHuYregmVHJjzH+pg==
X-Google-Smtp-Source: ABdhPJxa6GYB7BF9voybZ5WvNO1XzsdemlYbwUoqDr7zL7mCPePWkDN3MDpUMFYcvR1TqBj+kCZxsA==
X-Received: by 2002:a9d:7848:: with SMTP id c8mr14328787otm.120.1604370311439;
        Mon, 02 Nov 2020 18:25:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z10sm87609otp.0.2020.11.02.18.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:25:10 -0800 (PST)
Received: (nullmailer pid 684165 invoked by uid 1000);
        Tue, 03 Nov 2020 02:25:09 -0000
Date:   Mon, 2 Nov 2020 20:25:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/3] dt-bindings:i2c:i2c-gate: txt to yaml conversion
Message-ID: <20201103022509.GA679426@bogus>
References: <20201031181801.742585-1-jic23@kernel.org>
 <20201031181801.742585-2-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031181801.742585-2-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 31, 2020 at 06:17:59PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Needed to reference from the invensense,mpu6050 yaml binding.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> ---
>  .../devicetree/bindings/i2c/i2c-gate.txt      | 41 ---------------
>  .../devicetree/bindings/i2c/i2c-gate.yaml     | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gate.txt b/Documentation/devicetree/bindings/i2c/i2c-gate.txt
> deleted file mode 100644
> index 1846d236e656..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-gate.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -An i2c gate is useful to e.g. reduce the digital noise for RF tuners connected
> -to the i2c bus. Gates are similar to arbitrators in that you need to perform
> -some kind of operation to access the i2c bus past the arbitrator/gate, but
> -there are no competing masters to consider for gates and therefore there is
> -no arbitration happening for gates.
> -
> -Common i2c gate properties.
> -
> -- i2c-gate child node
> -
> -Required properties for the i2c-gate child node:
> -- #address-cells = <1>;
> -- #size-cells = <0>;
> -
> -Optional properties for i2c-gate child node:
> -- Child nodes conforming to i2c bus binding
> -
> -
> -Example :
> -
> -	/*
> -	   An Invensense mpu9150 at address 0x68 featuring an on-chip Asahi
> -	   Kasei ak8975 compass behind a gate.
> -	 */
> -
> -	mpu9150@68 {
> -		compatible = "invensense,mpu9150";
> -		reg = <0x68>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <18 1>;
> -
> -		i2c-gate {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			ax8975@c {
> -				compatible = "ak,ak8975";
> -				reg = <0x0c>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gate.yaml b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
> new file mode 100644
> index 000000000000..29aa0690ed9a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-gate.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common i2c gate properties
> +
> +maintainers:
> +  - Peter Rosin <peda@axentia.se>
> +
> +description: |
> +  An i2c gate is useful to e.g. reduce the digital noise for RF tuners connected
> +  to the i2c bus. Gates are similar to arbitrators in that you need to perform
> +  some kind of operation to access the i2c bus past the arbitrator/gate, but
> +  there are no competing masters to consider for gates and therefore there is
> +  no arbitration happening for gates.
> +
> +properties:
> +  $nodename:
> +    const: i2c-gate
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
> +    type: object
> +    description: |
> +      Child nodes for i2c devices behind the gate.

So reference i2c-controller.yaml. With that, you only need $nodename.

> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    i2c-gate {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ak8975@c {
> +            compatible = "ak,ak8975";
> +            reg = <0x0c>;
> +        };
> +    };
> +...
> +
> -- 
> 2.28.0
> 
