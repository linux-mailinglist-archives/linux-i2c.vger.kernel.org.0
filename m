Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F095E61F7C6
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 16:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbiKGPhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 10:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbiKGPhk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 10:37:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FF01E70A;
        Mon,  7 Nov 2022 07:37:39 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB76E7B;
        Mon,  7 Nov 2022 16:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667835456;
        bh=tN24SZMtxVeuqD+eft5ip0/oeDHTUb64yvneuF+U788=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PxZ/oB51BM477JHOCVHIqzj6lgE4O2muFTyRKew3QS71DkicIdsMHTZlJTkXQlyBu
         tPrDtPDNw76DwivUyQNBHW2AfSswNsAMNu2aC1scthPqMk4DXSKwr2H/KsR24m8qIo
         2VOXA43amBSRJmGKefMTJVrfTrljH066CZk9UusI=
Message-ID: <50f0e9a2-33a4-9afb-4105-eadd6da21e99@ideasonboard.com>
Date:   Mon, 7 Nov 2022 17:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 0/8] i2c-atr and FPDLink
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <b0319f7c-54af-3132-2775-fba7dcad6bbe@fi.rohmeurope.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <b0319f7c-54af-3132-2775-fba7dcad6bbe@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matti,

On 07/11/2022 16:37, Vaittinen, Matti wrote:

I only had time to have a brief look at your code, but I have a few 
quick questions.

> I think it was Tomi who asked me the benefit of using MFD. In some cases
> the digital interface towards pinctrl/GPIO or other functional blocks in
> SER/DES is re-used from other products - or the blocks are re-used on
> other products. Separating them in own platform-drivers is a nice way to
> re-use drivers and avoid code duplication.

Is there anything that prevents us (or makes it difficult) from 
refactoring a "monolithic" driver into an MFD later? If we see such IP 
re-use, can we then move to an MFD?

I admit I have never written an MFD driver (but I have hacked with a few 
years back). As I see it, the "subcomponents" in FPDLink ICs are more or 
less tied to the FPDLink. It's not like they're independent. Compare to, 
for example, a PMIC which provides regulators and GPIOs, and possibly 
the only shared part between those two features are the pins.

So, I think I'm still wondering about the benefit...

In the current version I have the deser driver supporting UB960 and 
UB9702. I guess I could split those into separate drivers, and using MFD 
I could share lot of code between them. But I still can't see why that's 
better than having both UB960 and UB9702 in the same driver (and, if the 
amount of supported devices increases, perhaps dividing some parts to 
separate files and using function points for a few things).

The benefit would be more obvious if there was some other type of IC 
that uses the same IP subcomponents. Maybe the display side FPDLink 
devices are such, but I have never done a deep dive in their 
documentation. And, even then, I think I still have the question: can we 
just move to an MFD later when the need comes?

Also, isn't the use or non-use of MFD strictly a driver private thing, 
it should not affect any shared parts or shared designs? In other words, 
if you have your ROHM hat on, why do you care how the UB9xx driver is 
structured internally? ;)

  Tomi

