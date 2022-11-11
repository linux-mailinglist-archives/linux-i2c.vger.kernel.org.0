Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44032625F9A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 17:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbiKKQfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 11:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbiKKQfn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 11:35:43 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBE0836B4;
        Fri, 11 Nov 2022 08:35:33 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4DE86240004;
        Fri, 11 Nov 2022 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668184532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cXHM9CjrggCk9/n6DDFxqg1bnzAgIfeSnFV0or9U1F4=;
        b=GUqhcjqkC5SRV3hw3kkmO7MUd7nqU6fM3hwUCBEDTDscLkw1UMFV9JY+Bv2xh7DZMSf0T/
        WnIcy/QbtwqZ7su5TENhxPSikpcZgFH/qYryl3shiizqhS/Q0LR/iRHl+VelA4JmH7/BaC
        czlL8+77+Ox3ejATPR3aCTc8URxDpYV58vNfhg4yZVdEAgnYWu4+/wnOoKNojLKPqucCG4
        CMW3rbS+aqXDT/vGB/OwewRkr0eioybcNzNp/gjpTakuWR5vqMvbIeGT2jbvmvCjCGZt/L
        BeoBrsqC0Ow6MQGQmdCIMtXKbA5mnjL7qmVompB/h5KaKc22ZTLOJe/Ih8X4rQ==
Date:   Fri, 11 Nov 2022 17:35:27 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI
 DS90UB960
Message-ID: <20221111173527.44e2d2e9@booty>
In-Reply-To: <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
        <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Tue,  1 Nov 2022 15:20:27 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

...

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      clock-frequency = <400000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      deser@3d {
> +        compatible = "ti,ds90ub960-q1";
> +
> +        reg-names = "main";
> +        reg       = <0x3d>;
> +
> +        clock-names = "refclk";
> +        clocks = <&fixed_clock>;
> +
> +        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
> +
> +        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          /* Port 0, Camera 0 */
> +          port@0 {
> +            reg = <0>;
> +
> +            ub960_fpd3_1_in: endpoint {
> +              remote-endpoint = <&ub953_1_out>;
> +
> +              rx-mode = <0>;
> +            };
> +          };
> +
> +          /* Port 0, Camera 1 */

I guess you mean "Port 1" here.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
