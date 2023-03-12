Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B46F6B65F8
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 13:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjCLMd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 08:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjCLMd0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 08:33:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8911D935;
        Sun, 12 Mar 2023 05:33:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB8AFB80B18;
        Sun, 12 Mar 2023 12:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C379EC433D2;
        Sun, 12 Mar 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678624400;
        bh=wKK18JhLAidYuz7urwViijJ7ZzWu18IoQlSj7/PTI4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eymBdvbLzTtRs6nBQ8S8SsE7NG6OOyokbEEAu2+UYecDgnuFGBPRsp2lyq+aixcOe
         4QUQPnA5Ml3/EPjJ/78qW1dIZlnKn8l0z64Pzcc007TntpiL0AUTfSEJTPzBuh5JOL
         OIt2F7U3ccQLmcwVxxkFhWUYVmPuDas4QL8rbd9sN7t708A++tjaPP0z9rm6+bb4gp
         8pm/U9GRpBatLyhesGz582RrB2Myu1qla1USA6uUjasI5FHMTFwCPdgcfAm1uRVfwl
         MKumMM1UiIsGwnR9jrt904v3srZFfEGFQPGRp322wd47pnK1zWgv3d2DT2Usj26Y9i
         es2PWSPYPJtCQ==
Date:   Sun, 12 Mar 2023 13:33:16 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20230312123316.rn2qm3jnw7iy5yts@intel.intel>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof and Ryan,

> >>> +  aspeed,timeout:
> >>> +    type: boolean
> >>> +    description: I2C bus timeout enable for master/slave mode
> >>
> >> Nothing improved here in regards to my last comment.
> > 
> > Yes, as I know your require is about " DT binding to represent hardware setup"
> > So I add more description about aspeed,timeout as blow.
> > 
> > ASPEED SOC chip is server product, i2c bus may have fingerprint connect to another board. And also support hotplug.
> > The following is board-specific design example.
> > Board A                                         Board B
> > -------------------------                       ------------------------
> > |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> > |i2c bus#2(master)-> tmp i2c device |          |                       |
> > |i2c bus#3(master)-> adc i2c device |          |                       |
> > -------------------------                       ------------------------
> > 
> > aspeed,timout properites:
> > For example I2C controller as slave mode, and suddenly disconnected.
> > Slave state machine will keep waiting for master clock in for rx/tx transmit.
> > So it need timeout setting to enable timeout unlock controller state.
> > And in another side. In Master side also need avoid suddenly slave miss(un-plug), Master will timeout and release the SDA/SCL.
> > 
> > Do you mean add those description into ore aspeed,timout properites description?
> 
> You are describing here one particular feature you want to enable in the
> driver which looks non-scalable and more difficult to configure/use.
> What I was looking for is to describe the actual configuration you have
> (e.g. multi-master) which leads to enable or disable such feature in
> your hardware. Especially that bool value does not scale later to actual
> timeout values in time (ms)...
> 
> I don't know I2C that much, but I wonder - why this should be specific
> to Aspeed I2C and no other I2C controllers implement it? IOW, this looks
> quite generic and every I2C controller should have it. Adding it
> specific to Aspeed suggests that either we miss a generic property or
> this should not be in DT at all (because no one else has it...).

this property is missing in the i2c devicetree property and
because this is the second driver needing it, I think it should
be added.

To be clear, this timeout means that the SCL is kept low for some
number of milliseconds in order to force the slave to enter a
wait state. This is done when the master has some particular
needs as Ryan is describing.

It's defined in the i2c specification, while smbus defines it in
a range from 25 to 35 ms.

In any case it's not a boolean value unless the controller has it
defined internally by the firmware.

So... nack! Please, hold a bit, I'm sending a patch. 

Andi
