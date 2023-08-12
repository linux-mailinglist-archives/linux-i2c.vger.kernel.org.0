Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD6077A31E
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Aug 2023 23:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjHLVqi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Aug 2023 17:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHLVqh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Aug 2023 17:46:37 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F82A10DB;
        Sat, 12 Aug 2023 14:46:40 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RNZ4G1FWpz4d;
        Sat, 12 Aug 2023 23:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1691876798; bh=NJ/Yc7uHKEcjOVuZ+gE0DU4BA0k1lRoFUFnn/HLv53k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ETx5VYARI3hsMwljkr2QYcvzsC83yk5mfDzd3M25zJhIv7ufo/9MWaKQM5KSnRjMm
         Q57Gscvs79JyL/ppus3vhCYovHpbD/LLNlpkVoUn/JP+9No+gfz2sBafz6bf400DM7
         pIG+YwRaEBzrlYT9gZ1pJg2Mml9oKUNp7E6Qvg9BdfVTvuFcObiQg3pkfzttC0dytR
         jutJiENIsPJI9kzLO2IjeBswEZRZJuOFiV48987z4BwJe8xSKdFLfAIL3zQWvFGG58
         MRRh5t81GUVZfaYORa/p8PodU3kUjkpFh+JVCbwg1mIbOylxa7Abs4XSonPXpDH7AA
         /ch/S7xUnpqIg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sat, 12 Aug 2023 23:46:36 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Rob Herring <robh@kernel.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Message-ID: <ZNf9vKJHc/FFlkY4@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-2-clamor95@gmail.com>
 <20230811173752.GA3639776-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230811173752.GA3639776-robh@kernel.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 11, 2023 at 11:37:52AM -0600, Rob Herring wrote:
> On Sat, Jul 29, 2023 at 07:08:56PM +0300, Svyatoslav Ryhel wrote:
[...]
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
[...]
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
[...]
> > +        i2c-parent = <&gen2_i2c>;
> 
> Couldn't you just add 'detect-gpios' to the existing bus node? It's 
> really part of that bus and there's not a separate bus. That would be a 
> lot simpler. I suppose you want to instantiate a driver, but that's not 
> DT's problem.

Not a driver but a group of devices (possibly discovered dynamically)
behind a passive gate (like e.g. PCA9517A with EN tied to a connector pin).
It's not much different to a I2C gate or mux with a single child bus
(i2c-mux-gpio that has only a single child). For ASUS Transformers with
only the dock plugged-in it could work with a 'detect-gpios' extension
(I'll take a look at how this way would work).  I think there were also
different attachments made you could connect instead of the dock.

Best Regards
Micha³ Miros³aw
