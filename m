Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0758C76A45B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 00:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjGaWuT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 18:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGaWuS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 18:50:18 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBAC1BD9;
        Mon, 31 Jul 2023 15:50:08 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4RFD313l6jzCY;
        Tue,  1 Aug 2023 00:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1690843805; bh=0tPOp+JS5ixYfQHrHF0O6mJvd9r7PaF0dMi6lLuDr9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BDK7Ld3dgMmPUsyXfLAEJHARvKa6QywWLiAMVNRmjE1JQmKHTa+eu4ZBa8Kav5DtK
         PS1ZB4wmwnAg1H3KcLhD/sV4g5/+p+xmtMzlRyXEKRc2WcZTn1MdbWiPM41l15zEqO
         umVDhKyd0AApiCw8JujYem19aM31ROvCw4s1AemV0/N68LdEpS3MzkImLI9fVLIGwK
         cgZEi/qI/D9XomueW1b4wGiRLXyLWU8OdvtUHh81jTyI4O6aqU3OzQcPOciHyP/+YJ
         ilXlfw7DX5lUIcUXAjlp3gHSTtA10UqkUvibgmg/fHtUnzheYJSgqeXIgQVA1hOTh5
         7Lb2WILHGddPA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Tue, 1 Aug 2023 00:50:03 +0200
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
Message-ID: <ZMg6m+Dru6rxCRqU@qmqm.qmqm.pl>
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
 <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
 <b9183dfc-8e8a-9602-f31c-5de9e27acb88@linaro.org>
 <ZMd1qI7RjQhpI8zO@qmqm.qmqm.pl>
 <fdc513a3-c0e0-c57d-5c9a-8da6fa2f54e2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc513a3-c0e0-c57d-5c9a-8da6fa2f54e2@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 31, 2023 at 02:59:41PM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2023 10:49, Micha³ Miros³aw wrote:
> > On Mon, Jul 31, 2023 at 08:58:14AM +0200, Krzysztof Kozlowski wrote:
> >> On 30/07/2023 23:55, Micha³ Miros³aw wrote:
> >>> On Sun, Jul 30, 2023 at 10:30:56PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
> >>>>> From: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> >>>>>
> >>>>> Implement driver for hot-plugged I2C busses, where some devices on
> >>>>> a bus are hot-pluggable and their presence is indicated by GPIO line.
> >>> [...] 
> >>>>> +	priv->irq = platform_get_irq(pdev, 0);
> >>>>> +	if (priv->irq < 0)
> >>>>> +		return dev_err_probe(&pdev->dev, priv->irq,
> >>>>> +				     "failed to get IRQ %d\n", priv->irq);
> >>>>> +
> >>>>> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
> >>>>> +					i2c_hotplug_interrupt,
> >>>>> +					IRQF_ONESHOT | IRQF_SHARED,
> >>>>
> >>>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
> >>>> shared one? You have a remove() function which also points that it is
> >>>> not safe. You can:
> >>>> 1. investigate to be sure it is 100% safe (please document why do you
> >>>> think it is safe)
> >>>
> >>> Could you elaborate on what is unsafe in using devm with shared
> >>> interrupts (as compared to non-shared or not devm-managed)?
> >>>
> >>> The remove function is indeed reversing the order of cleanup. The
> >>> shutdown path can be fixed by removing `remove()` and adding
> >>> `devm_add_action_or_reset(...deactivate)` before the IRQ is registered.
> >> Shared interrupt might be triggered easily by other device between
> >> remove() and irq release function (devm_free_irq() or whatever it is
> >> called).
> > 
> > This is no different tham a non-shared interrupt that can be triggered
> > by the device being removed. Since devres will release the IRQ first,
> > before freeing the driver data, the interrupt hander will see consistent
> > driver-internal state. (The difference between remove() and devres
> > release phase is that for the latter sysfs files are already removed.)
> 
> True, therefore non-devm interrupts are recommended also in such case.
> Maybe one of my solutions is actually not recommended.
> 
> However if done right, driver with non-shared interrupts, is expected to
> disable interrupts in remove(), thus there is no risk. We have big
> discussions in the past about it, so feel free to dig through LKML to
> read more about. Anyway shared and devm is a clear no go.

Can you share pointers to some of those discussions? Quick search
about devm_request_irq() and friends found only a thread from 2013
about conversions of RTC drivers to use devres. [1] IIRC the issue was
then that the drivers requested IRQs before fully initializing the state
(as many still do). Back to the original question: what is the risk
in using devres with shared interrupts? (Let's assume the probe() is already
fixed and remove() removed.)

BTW, We have devres doc [2] in the kernel tree that, among other things,
lists IRQs as a managed resource and mentions no warnings nor restictions
for driver authors. I'd expect that if devm_request_threaded_irq() for
shared iterrupts was indeed deprecated, it should be documented in a way
easy to refer to.

[1] https://groups.google.com/g/linux.kernel/c/yi2ueo-sNJs
[2] Documentation/udriver-api/driver-model/devres.rst

Best Regards
Micha³ Miros³aw
