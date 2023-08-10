Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690C17782DC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 23:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjHJVwY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 17:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHJVwX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 17:52:23 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DE0ED;
        Thu, 10 Aug 2023 14:52:22 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RMLHl5VHSz5P;
        Thu, 10 Aug 2023 23:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1691704340; bh=cvtkBHs2Gks5HcJOEm6XCtFkEahUxXNvZRy3lqRniJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VY4dcLEatS5B3Uk4w6RbZRuustOgM6ZHNg6ZT1ERgi3stzMsQe38WCTEbgrsGSi0S
         O5DInnSNYvAS48I6TvWSrQLcKRdSQaJQhK26gTrxtusPcm50Ah8y7+br1Zts3gF/Q0
         eKleh9I8/DbiDXSZj4WS0pl0pAlyo8/WdMVoPoIdHrTZxmzevWTs+UcI79aInRMiIP
         mGZ4dg759zYrlJfVdi56EH2DBuIS9xXji81wRna5zGjbX/hZ+EOxAoC21oWhfmNN/A
         8xNOb1z/Z8i4Sl0zR7b6Ap73eeN2mQeIuBumezHdTjNoEkVhDZEh4MFo407+dUwE+U
         4B/+PYGIRcX6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Thu, 10 Aug 2023 23:52:17 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Message-ID: <ZNVcEfNjo0ZZlhIp@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
 <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
 <b9183dfc-8e8a-9602-f31c-5de9e27acb88@linaro.org>
 <ZMd1qI7RjQhpI8zO@qmqm.qmqm.pl>
 <fdc513a3-c0e0-c57d-5c9a-8da6fa2f54e2@linaro.org>
 <ZMg6m+Dru6rxCRqU@qmqm.qmqm.pl>
 <249e806a-f094-9514-9c83-e74e7b1f00ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <249e806a-f094-9514-9c83-e74e7b1f00ba@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Aug 05, 2023 at 09:17:50PM +0200, Krzysztof Kozlowski wrote:
> On 01/08/2023 00:50, Micha³ Miros³aw wrote:
> > On Mon, Jul 31, 2023 at 02:59:41PM +0200, Krzysztof Kozlowski wrote:
> >> On 31/07/2023 10:49, Micha³ Miros³aw wrote:
> >>> On Mon, Jul 31, 2023 at 08:58:14AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 30/07/2023 23:55, Micha³ Miros³aw wrote:
> >>>>> On Sun, Jul 30, 2023 at 10:30:56PM +0200, Krzysztof Kozlowski wrote:
> >>>>>> On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
> >>>>>>> From: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> >>>>>>>
> >>>>>>> Implement driver for hot-plugged I2C busses, where some devices on
> >>>>>>> a bus are hot-pluggable and their presence is indicated by GPIO line.
> >>>>> [...] 
> >>>>>>> +	priv->irq = platform_get_irq(pdev, 0);
> >>>>>>> +	if (priv->irq < 0)
> >>>>>>> +		return dev_err_probe(&pdev->dev, priv->irq,
> >>>>>>> +				     "failed to get IRQ %d\n", priv->irq);
> >>>>>>> +
> >>>>>>> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
> >>>>>>> +					i2c_hotplug_interrupt,
> >>>>>>> +					IRQF_ONESHOT | IRQF_SHARED,
> >>>>>>
> >>>>>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
> >>>>>> shared one? You have a remove() function which also points that it is
> >>>>>> not safe. You can:
> >>>>>> 1. investigate to be sure it is 100% safe (please document why do you
> >>>>>> think it is safe)
[...]
> >> True, therefore non-devm interrupts are recommended also in such case.
> >> Maybe one of my solutions is actually not recommended.
> >>
> >> However if done right, driver with non-shared interrupts, is expected to
> >> disable interrupts in remove(), thus there is no risk. We have big
> >> discussions in the past about it, so feel free to dig through LKML to
> >> read more about. Anyway shared and devm is a clear no go.
> > 
> > Can you share pointers to some of those discussions? Quick search
> > about devm_request_irq() and friends found only a thread from 2013
> 
> Just look at CONFIG_DEBUG_SHIRQ. Some things lore points:
> https://lore.kernel.org/all/1592130544-19759-2-git-send-email-krzk@kernel.org/
> https://lore.kernel.org/all/20200616103956.GL4447@sirena.org.uk/
> 
> I think pretty clear:
> https://lore.kernel.org/all/87mu52ca4b.fsf@nanos.tec.linutronix.de/
> https://lore.kernel.org/all/CA+h21hrxQ1fRahyQGFS42Xuop_Q2petE=No1dft4nVb-ijUu2g@mail.gmail.com/
> 
> Also:
> https://lore.kernel.org/all/651c9a33-71e6-c042-58e2-6ad501e984cd@pengutronix.de/
> https://lore.kernel.org/all/36AC4067-78C6-4986-8B97-591F93E266D8@gmail.com/
[...]

Thanks! It all looks like a proof by example [1]: a broken driver [2]
was converted to devres [3] and allowed a shared interrupt [4] and now is
used to back an argument that devres and/or shared IRQs are bad. I have
a hard time accepting this line of reasoning.

So: sure, if you disable device's clock, you should first disable the
interrupt handler one way or another, and if you request a shared interrupt
then you have to write the handler expecting spurious invocations anytime
between entry to register_irq() and return from free_irq() (BTW, DEBUG_SHIRQ
is here to help test exactly this). And, when used correctly, devres can
release you from having to write remove() and error paths (but I guess it
might be a challenge to find a single driver that is a complete, good and
complex-enough example).

Coming back from the digression: I gathered following items from the
review of the i2c-hotplug-gpio driver:

  1. TODO: register i2c_hotplug_deactivate(priv) using
     devm_add_action_or_reset() before registering the IRQ handler
     and remove remove();

  2. shared IRQ: it is expected to be an edge-triggered, rarely
     signalled interrupt and the handler will work fine if called
     spuriously; it is not required to be shared for my Transformer,
     but I can't say much about other hardware. Would a comment help?

  3. TODO: DT-binding needs an expanded example and fixing some schema issues;

  4. question from Andi in another thread: I'll answer shortly.

Please correct me if I missed something.

Best Regards
Micha³ Miros³aw

[1] https://en.wikipedia.org/wiki/Proof_by_example
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa11e38ce6fe8846fec046a95cecd5d4690c48cd
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f8a3e7fd5bd08e3fd9847c04a5a445e2994f6b3
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df0a2fdab0068f7452bf0a97ea9ba0ad69d49a1f
