Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C86A2EB2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 08:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBZHE2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 02:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBZHE1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 02:04:27 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A80E06D;
        Sat, 25 Feb 2023 23:04:25 -0800 (PST)
Received: from sparky.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BD3A2022A;
        Sun, 26 Feb 2023 15:04:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677395063;
        bh=Y7NTv+s/hWLeamtCbWmhn/7LKRoNqR/n38OfE9hBxlM=;
        h=Subject:From:To:Date:In-Reply-To:References;
        b=eRUwOOoHuKdrRpkN6k32TqeYuPJ2qpo8OHbVCzKlNi0EcrDheEyrUr7y8e7GJXNED
         PQwzOSmmsOInezLa2c5lLpi0j0qRe3tda/GrHsp2InsAdUhXEerdjAFXxWoH3gbzHx
         dDYrnKPJZbqCtAng1kR86tfWvHG2oOa/oQ++PKP+19xVZuawP0azjT98V5dNiTSadq
         8v3A5ynMhOdk7FvEZgoSv2pABRqqkeW8E9fVYdE31uRXt2MdT0XYrVjXoNgBFxY/g5
         m8O0EWEC04qfEIQ3kBcIl0LGlDNYvh+ThCamAIPZWrpyTkS307I3ZcU/ECJeppcfGd
         6BwTzPiVu4NkQ==
Message-ID: <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date:   Sun, 26 Feb 2023 15:04:16 +0800
In-Reply-To: <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
         <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ryan,

> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,25 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 states that there is another master =
active on this bus
> =C2=A0
> +=C2=A0 aspeed,timeout:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: I2C bus timeout enable for master/slave =
mode
> +
> +=C2=A0 aspeed,xfer-mode:
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C bus transfer mode selection.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "byte": I2C bus byte transfer mode.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "buffered": I2C bus buffer register tra=
nsfer mode.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "dma": I2C bus dma transfer mode (defau=
lt)
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum: [byte, buffered, dma]
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/non-unique-str=
ing-array

There are still unresolved questions about this xfer-mode property from
previous submissions of this binding. We don't yet have a justification
on why the mode configuration is needed in the device tree rather than
something that is specified in a driver implementation.

By now, I think we well understand what the modes are, and how a driver
implementation might configure them, but none of that has (so far)
provided sufficient rationale on why this belongs in the device tree.

The previous threads had a couple of pending discussions, following up on
those here:

A) You mentioned in [1] that the DMA controller is shared between all i3c
devices, does that have any consequence on which modes individual
devices might want to choose?

B) You implied in [2] that the different transfer modes might be related
to whether there are other masters present on the bus, but the logic
behind that is not clear.

C) In [3] you mentioned that there might be some DRAM savings by using a
particular mode.

and, most importantly:

D) unanswered from [4] and [5]: what are the hardware-specified reasons
why a DT author would chose one mode over another?

If you can write this out in some format like:

 - in hardware situation X, you should use DMA mode
 - in hardware situation Y, you should use byte mode
 - [...]

that might help us to understand where this configuration belongs, or
what a reasonable DT representation should look like, or even if
existing DT schema can already provide the information required to
decide.

Cheers,


Jeremy

[1]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009876.h=
tml
[2]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009892.h=
tml
[3]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009880.h=
tml
[4]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009871.h=
tml
[5]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009884.h=
tml
