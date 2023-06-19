Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D9E736028
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 01:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjFSXiE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 19:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSXiD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 19:38:03 -0400
X-Greylist: delayed 599 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 19 Jun 2023 16:38:02 PDT
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E559F9;
        Mon, 19 Jun 2023 16:38:02 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QlQhV611Jz4T;
        Tue, 20 Jun 2023 01:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1687216779; bh=yLwjcEffcUiCkHIBtIV2E2+D5trU+fSj78KTub/a45Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=En5YPhY/zkeHqi2jZtDiSil2zhRDEPq1EAMvvptbUI9Rf7RWrVcNPAG6lE2MdyKFD
         jT7tvDsLSAPnTqZ8+kJ3074zoXA1+Ts9JwL0aboHZK0CJXMbsjSlqb3opPZEcSDqof
         biTz133qqtpdphof/68zbeLDzAj3m0lpuP6NVm1xQElsvo/iwdZBxuNXbPx1ntZCs8
         4IEy83b8NQGnFGdpzAC90kl8ymWOULGBrlWztn68jTRHkPLrKK1ZT8VdmQHpjAgC1E
         2tpdHgTSNcxw9EQtZIY8djXSycXb5p6sd+/fD9n8RtkdOPJGgOKfla9Aulr2tfHkrl
         3dCz7K6HgxUCw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Tue, 20 Jun 2023 01:19:37 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Message-ID: <ZJDiiZLfRO62NFPx@qmqm.qmqm.pl>
References: <20230619153732.46258-1-clamor95@gmail.com>
 <20230619153732.46258-2-clamor95@gmail.com>
 <32b0e664-9381-19c4-de9d-9466a00b4f50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32b0e664-9381-19c4-de9d-9466a00b4f50@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 19, 2023 at 05:53:24PM +0200, Krzysztof Kozlowski wrote:
> On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
> > Document device tree schema which describes hot-pluggable via GPIO
> > i2c bus.
> > 
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
[...]
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/i2c-hotplug-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO detected hot-plugged I2C bus
> > +
> > +maintainers:
> > +  - Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > +
> > +description:
> > +  Driver for hot-plugged I2C busses, where some devices on a bus
> 
> "Driver" so SW? Bindings are for hardware, not for drivers.
[...]
> > +  detect-gpios:
> > +    maxItems: 1
> > +
> > +  i2c-parent:
> > +    maxItems: 1
> 
> Discussion from v1 stands - this is a software construct, not a real device.
[...]
> Anyway, don't send v3, before the discussion about the entire concept
> finishes. You create a software/virtual device, instead of adding these
> properties to bindings for a real hardware.

Hi,

In this case it's hard for me to tell the difference if this is
real or virtual hardware.

The Transformers have a connector that's used for USB, charging or
for attaching a keyboard (called a dock; it also has a battery and
a touchpad). This connector probably (I don't have the means to verify
that) has an I2C bus lines and a "detect" line (pulled low on the dock
side) among the pins. I guess there is either no additional chip or
a transparent bridge/buffer chip, but nothing that could be controlled
by software. For DT this setup could be modelled like an I2C gate or
2-port mux with enable joining two I2C busses (one "closer" to the
CPU -- parent).

> > +
> > +examples:
> > +  - |
> > +    /*
> > +     * Asus Transformers use I2C hotplug for attachable dock keyboard
> > +     */
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c-dock {
> > +        compatible = "i2c-hotplug-gpio";
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        interrupts-extended = <&gpio 164 IRQ_TYPE_EDGE_BOTH>;
> > +        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;
> 
> I don't think you can have both interrupt and GPIO on the same line.

This actually works as expected. There are multiple devices (and
drivers) that depend on this, e.g. matrix-keypad and gpio-keys.

Best Regards
Micha³ Miros³aw
