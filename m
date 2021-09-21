Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9B14138B5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 19:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhIURkE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Sep 2021 13:40:04 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42779 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbhIURkD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Sep 2021 13:40:03 -0400
Received: by mail-ot1-f45.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso17348492otc.9;
        Tue, 21 Sep 2021 10:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pGkEvsndDrWXC431HKFJfMviLLB9QfJHWpbg2z2WKLY=;
        b=KFrjJjfzzy09LyZl5i1ayxnE/C8n3HOWQ5e1zfB3nWYBFGUV0KVRjxOQJQjtenvw70
         l67pxl6t1v/6Vm/B5r8sPnK8+bdPaSHbzcEawhri7TbcapS8KVxHMA2UHuGJ/HVihX0g
         ky+A6lGSTcK33enMBwYIb11/+lh97v8T0c4fGDtOZl5gYhr0F4DIbFE6iWOc9+GldAM6
         Nlh7hnbdPLAD9+e2jvs09QVo93JJlXC5UNa5dsXZBRJC8H/4MeFcYHhEzQIVjs2PTbKN
         99zHv9CF+fuJDK3/FWJ3iiRWNwXd3nnE3/umiT+VmYIywe+17YqErKw2hTAv+IjELHde
         j1IQ==
X-Gm-Message-State: AOAM532DqG73bvTQOpEnTBfNjxzMsHXPDSGbHjI9KByLfkB0nbXnw7XN
        prFIi8GBkS7uECZLIboKUA==
X-Google-Smtp-Source: ABdhPJwpcd6hQGlU6/o6Rj8OpAg9nVIKzXmx3BMftuRjbb2rH0yfR5J97Jey65zUy56zcEFtZS5Mzg==
X-Received: by 2002:a05:6830:31a7:: with SMTP id q7mr10950460ots.39.1632245913220;
        Tue, 21 Sep 2021 10:38:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o8sm3897052oiw.55.2021.09.21.10.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:38:32 -0700 (PDT)
Received: (nullmailer pid 3014786 invoked by uid 1000);
        Tue, 21 Sep 2021 17:38:31 -0000
Date:   Tue, 21 Sep 2021 12:38:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [RFC PATCH v3] dt-bindings: net: New binding mctp-i2c-controller
Message-ID: <YUoYlyCrLb5RhI01@robh.at.kernel.org>
References: <20210909023215.136490-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909023215.136490-1-matt@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 09, 2021 at 10:32:15AM +0800, Matt Johnston wrote:
> Used to define a local endpoint to communicate with MCTP peripherals
> attached to an I2C bus. This I2C endpoint can communicate with remote
> MCTP devices on the I2C bus.
> 
> In the example I2C topology below (matching the second yaml example) we
> have MCTP devices on busses i2c1 and i2c6. MCTP-supporting busses are
> indicated by the 'mctp-controller' DT property on an I2C bus node.
> 
> A mctp-i2c-controller I2C client DT node is placed at the top of the
> mux topology, since only the root I2C adapter will support I2C slave
> functionality.
>                                                .-------.
>                                                |eeprom |
>     .------------.     .------.               /'-------'
>     | adapter    |     | mux  --@0,i2c5------'
>     | i2c1       ----.*|      --@1,i2c6--.--.
>     |............|    \'------'           \  \  .........
>     | mctp-i2c-  |     \                   \  \ .mctpB  .
>     | controller |      \                   \  '.0x30   .
>     |            |       \  .........        \  '.......'
>     | 0x50       |        \ .mctpA  .         \ .........
>     '------------'         '.0x1d   .          '.mctpC  .
>                             '.......'          '.0x31   .
>                                                 '.......'
> (mctpX boxes above are remote MCTP devices not included in the DT at
> present, they can be hotplugged/probed at runtime. A DT binding for
> specific fixed MCTP devices could be added later if required)
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> 
> ---
> 
> Compared to v2 this patch changes the MCTP indicator to being a property
> on the I2C bus node.
> (Previous patches went only to DT list, I've now CCed linux-i2c)
> 
> Wolfram does this look OK to you?
> 
> Thanks,
> Matt
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt |  4 +
>  .../devicetree/bindings/net/mctp-i2c.yaml     | 94 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mctp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index b864916e087f..fc3dd7ec0445 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -95,6 +95,10 @@ wants to support one of the below features, it should adapt these bindings.
>  - smbus-alert
>  	states that the optional SMBus-Alert feature apply to this bus.
>  
> +- mctp-controller
> +	indicates that the system is accessible via this bus as an endpoint for
> +	MCTP over I2C transport.
> +
>  Required properties (per child device)
>  --------------------------------------
>  
> diff --git a/Documentation/devicetree/bindings/net/mctp-i2c.yaml b/Documentation/devicetree/bindings/net/mctp-i2c.yaml
> new file mode 100644
> index 000000000000..d0ff7fa9e114
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mctp-i2c.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mctp-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MCTP I2C transport binding
> +
> +maintainers:
> +  - Matt Johnston <matt@codeconstruct.com.au>
> +
> +description:

Needs '|' to maintain paragraphs.

> +  An mctp-i2c-controller defines a local MCTP endpoint on an I2C
> +  controller. MCTP I2C is specified by DMTF DSP0237.
> +
> +  An mctp-i2c-controller must be attached to an I2C adapter
> +  which supports slave functionality. I2C busses (either directly or as
> +  subordinate mux busses) are attached to the mctp-i2c-controller with
> +  a 'mctp-controller' property on each used bus. Each mctp-controller I2C bus
> +  will be presented to the host system as a separate MCTP I2C instance.

Odd line breaks here.

> +
> +properties:
> +  compatible:
> +    const: mctp-i2c-controller
> +
> +  reg:
> +    # 1<<30
> +    minimum: 1073741824

You can use hex: 0x40000000

> +    # 1<<30 | 0x7f
> +    maximum: 1073741951
> +    description:
> +      7 bit I2C address of the local endpoint.
> +      I2C_OWN_SLAVE_ADDRESS (1<<30) flag must be set.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    // Basic case of a single I2C bus
> +    #include <dt-bindings/i2c/i2c.h>
> +
> +    i2c0: i2cbus0 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      mctp-controller;
> +
> +      mctp@30 {
> +        compatible = "mctp-i2c-controller";
> +        reg = <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
> +      };
> +    };
> +
> +  - |
> +    // Mux topology with multiple MCTP-handling busses under
> +    // a single mctp-i2c-controller.
> +    // i2c1 and i2c6 can have MCTP devices, i2c5 does not.
> +    #include <dt-bindings/i2c/i2c.h>
> +
> +    i2c1: i2cbus1 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      mctp-controller;
> +
> +      mctp@50 {
> +        compatible = "mctp-i2c-controller";
> +        reg = <(0x50 | I2C_OWN_SLAVE_ADDRESS)>;
> +      };
> +    };
> +
> +    i2cmux0 {

i2c-mux {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      i2c-parent = <&i2c1>;
> +
> +      i2c5: i2c@0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0>;
> +        eeprom@33 {
> +          reg = <0x33>;
> +        };
> +      };
> +
> +      i2c6: i2c@1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <1>;
> +        mctp-controller;
> +      };
> +    };
> -- 
> 2.30.2
> 
> 
