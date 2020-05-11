Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE001CE8C6
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 01:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgEKXFG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 19:05:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36865 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgEKXFF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 19:05:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so9015789oto.4;
        Mon, 11 May 2020 16:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ITRYcPcWlonHrPE5qtDXeTHw7EP1LYK528y4/wZgsuU=;
        b=tgRdXBYceBiJ0giqzxQmpcxy6WZ94TvS4L7tx09ZwZmKt3g571JVv5IDa3vJyPKnzB
         Q29G1W6MlSRDhg98inaW6gaPkSz6a89PrzYISoB7dSrLEcEsA7f8xdMGUg3UJMC/05cr
         UeKYigocv6EMHz4wIA7/7ioex5hg2uYI2PYPKL/iyI5j2yC2ofDD+dOMMg0DYFL9VrnA
         KbSVFKS43wbIE+lv8Xee7gDIms+GgWhNBAnnxclCwSpTvYo8QLIr4wXIxRvB5rStphwW
         QeuXfCNbD6YAjkCXLGbIqdbNPjObgnnZ2xkhfOFS6iJ+CLufbQGWnoU8uWOxSvKZqa7g
         DTMw==
X-Gm-Message-State: AGi0PuagXhTokooopswu+7LdeFWnxACC9iTkvmYex0mbigtRi8TCQLsJ
        MpE2Y9bsZDNB6gZI7jEEpQ==
X-Google-Smtp-Source: APiQypIoY6kUC5CLLTgHsDsYf7d1b4AOMQ8Y25i9EikLDhE7xahbnoqgxdxYueOeAZkbPmnLTpOxvg==
X-Received: by 2002:a9d:7e7:: with SMTP id 94mr14201369oto.82.1589238304172;
        Mon, 11 May 2020 16:05:04 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm2820423otx.31.2020.05.11.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:05:03 -0700 (PDT)
Received: (nullmailer pid 22115 invoked by uid 1000);
        Mon, 11 May 2020 23:05:02 -0000
Date:   Mon, 11 May 2020 18:05:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: display: Convert ingenic,lcd.txt to YAML
Message-ID: <20200511230502.GA21320@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-8-paul@crapouillou.net>
 <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 28, 2020 at 04:12:21PM +0200, Paul Cercueil wrote:
> This one patch will need a V2, I messed up with the clocks.

Looks fine otherwise.

> 
> -Paul
> 
> 
> Le dim. 26 avril 2020 à 20:58, Paul Cercueil <paul@crapouillou.net> a écrit
> :
> > Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> > 
> > In the process, the new ingenic,jz4780-lcd compatible string has been
> > added.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >  .../bindings/display/ingenic,lcd.txt          |  45 -------
> >  .../bindings/display/ingenic,lcd.yaml         | 113 ++++++++++++++++++
> >  2 files changed, 113 insertions(+), 45 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > deleted file mode 100644
> > index 01e3261defb6..000000000000
> > --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -Ingenic JZ47xx LCD driver
> > -
> > -Required properties:
> > -- compatible: one of:
> > -  * ingenic,jz4740-lcd
> > -  * ingenic,jz4725b-lcd
> > -  * ingenic,jz4770-lcd
> > -- reg: LCD registers location and length
> > -- clocks: LCD pixclock and device clock specifiers.
> > -	   The device clock is only required on the JZ4740.
> > -- clock-names: "lcd_pclk" and "lcd"
> > -- interrupts: Specifies the interrupt line the LCD controller is
> > connected to.
> > -
> > -Example:
> > -
> > -panel {
> > -	compatible = "sharp,ls020b1dd01d";
> > -
> > -	backlight = <&backlight>;
> > -	power-supply = <&vcc>;
> > -
> > -	port {
> > -		panel_input: endpoint {
> > -			remote-endpoint = <&panel_output>;
> > -		};
> > -	};
> > -};
> > -
> > -
> > -lcd: lcd-controller@13050000 {
> > -	compatible = "ingenic,jz4725b-lcd";
> > -	reg = <0x13050000 0x1000>;
> > -
> > -	interrupt-parent = <&intc>;
> > -	interrupts = <31>;
> > -
> > -	clocks = <&cgu JZ4725B_CLK_LCD>;
> > -	clock-names = "lcd";
> > -
> > -	port {
> > -		panel_output: endpoint {
> > -			remote-endpoint = <&panel_input>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > new file mode 100644
> > index 000000000000..8e9c851dc7c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ingenic SoCs LCD controller devicetree bindings
> > +
> > +maintainers:
> > +  - Paul Cercueil <paul@crapouillou.net>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^lcd-controller@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    enum:
> > +      - ingenic,jz4740-lcd
> > +      - ingenic,jz4725b-lcd
> > +      - ingenic,jz4770-lcd
> > +      - ingenic,jz4780-lcd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Module clock
> > +      - description: Pixel clock
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lcd
> > +      - const: lcd_pclk
> > +    minItems: 1
> > +
> > +  port:
> > +    type: object
> > +    description:
> > +      A port node with endpoint definitions as defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +required:
> > +    - compatible
> > +    - reg
> > +    - interrupts
> > +    - clocks
> > +    - clock-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - ingenic,jz4740-lcd
> > +          - ingenic,jz4780-lcd
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 2
> > +    clock-names:
> > +      minItems: 2
> > +else:
> > +  properties:
> > +    clocks:
> > +      maxItems: 1
> > +    clock-names:
> > +      maxItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/jz4740-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible = "ingenic,jz4740-lcd";
> > +      reg = <0x13050000 0x1000>;
> > +
> > +      interrupt-parent = <&intc>;
> > +      interrupts = <30>;
> > +
> > +      clocks = <&cgu JZ4740_CLK_LCD>, <&cgu JZ4740_CLK_LCD_PCLK>;
> > +      clock-names = "lcd", "lcd_pclk";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint = <&panel_input>;
> > +        };
> > +      };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/clock/jz4725b-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible = "ingenic,jz4725b-lcd";
> > +      reg = <0x13050000 0x1000>;
> > +
> > +      interrupt-parent = <&intc>;
> > +      interrupts = <31>;
> > +
> > +      clocks = <&cgu JZ4725B_CLK_LCD>;
> > +      clock-names = "lcd";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint = <&panel_input>;
> > +        };
> > +      };
> > +    };
> > --
> > 2.26.2
> > 
> 
> 
