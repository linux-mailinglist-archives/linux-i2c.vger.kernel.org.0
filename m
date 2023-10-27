Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B927D990A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 14:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345598AbjJ0Mzq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 08:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345541AbjJ0Mzp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 08:55:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D161B1;
        Fri, 27 Oct 2023 05:55:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D6DC433CC;
        Fri, 27 Oct 2023 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698411340;
        bh=wSX3hZkZaTrYS5zn46sQAvcYVUlw291hdHsmheCFw7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T3uPk2WaIv4i+lUBOQtRXwUHb6Q58T0/wvONVvtFSn1Maj2zynMwpNQLYcJMhojwb
         m4OF8V5DmUPf5d9ZqiJvGGXq1kmX0DYJhYCkDy8aOYjXbpOisO7srwSCXzBgOKt8Y7
         cuG6nloPsP8cLC46m9ETXxE4Q2kfi03LdjvVovY/QfoQoTiWHILg0XA1pMsnBvHcpz
         bSCYynI2H3pxPJ9goZ81qdQrFgDxJqSvn/ARGKbLQGp+tepha+6nJVrzD9agmDzh0f
         USBH9Ou1z9sp2GZDdfEnonBMQhPzlmnxvxohAj/G8Huch9rDMnltoNcnWRILfLMQin
         1wXMMhIWCtpqQ==
Date:   Fri, 27 Oct 2023 14:55:37 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Message-ID: <20231027125537.5d5cu3wc4r4c2yb4@zenone.zhora.eu>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
 <65911ec0-e073-435f-846a-c5501dd5d3a9@linaro.org>
 <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Fri, Oct 27, 2023 at 01:37:05PM +0200, Krzysztof Kozlowski wrote:
> On 27/10/2023 13:27, Krzysztof Kozlowski wrote:
> > On 27/10/2023 05:31, Chris Packham wrote:
> >> Some hardware designs have a GPIO used to control the reset of all the
> >> devices on and I2C bus. It's not possible for every child node to
> >> declare a reset-gpios property as only the first device probed would be
> >> able to successfully request it (the others will get -EBUSY). Represent
> 
> Cc: Mark,
> 
> Also this part is not true. If the bus is non-discoverable, then it is
> possible to have reset-gpios in each probed device. You can share GPIOs,
> so no problem with -EBUSY at all.
> 
> The problem is doing reset:
> 1. in proper moment for all devices
> 2. without affecting other devices when one unbinds/remove()

yes, I thought that we could get to this point, but I did not
object the patch as I didn't see an immediate better solution. I
would still be OK to merge it until we develop something better.

Let me mull this over and will be back to the topic.

Thanks, Krzysztof!
Andi

> The (2) above is not solveable easy in kernel and we already had nice
> talks about it just few days ago:
> 1. Apple case:
> https://social.treehouse.systems/@marcan/111268780311634160
> 
> 2. my WSA884x:
> https://lore.kernel.org/alsa-devel/84f9f1c4-0627-4986-8160-b4ab99469b81@linaro.org/
> 
> Last,
> I would like to apologize to you Chris. I understand that bringing such
> feedback at v5 is not that good. I had plenty of time to say something
> earlier, so this is not really professional from my side. I am sorry,
> just my brain did not connect all these topics together.
> 
> I apologize.
> 
> Best regards,
> Krzysztof
