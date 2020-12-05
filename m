Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C139F2CFE09
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 20:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgLETAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 14:00:31 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:54542 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgLETA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Dec 2020 14:00:29 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607194787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xbl9LMP/oVqDIFDVOcKlCnjbUI08vR1reFOa/05TqKI=;
        b=yZdHXAlf13OGlt4BNONvpUNFuOXwzyowcPmES5o5+hwC5yd/Rc0nmAdM5MRfJtzEw16for
        azVfb75syZGTix4WKso3n4emJySxV2e/TRgtopW+mi6ZsBuGCKpPQueC+rJZbK2+wsEUpv
        Jn4gDosJQi6h3NrjoAlKqk1v+LHYiWSwdsxAvBwqTnrFf1J9yz8YJL4hvzU7hJ8lDUNXd2
        CPscaIh71zdAU70ua/WeuTrbdrhInkm2Qm34/hIFgyQJa0mQjSTFP/SiG9+jIFbiu4N+/w
        YnciPSIyZoz9S75kp9KQ5TpGTsGQGiEkOgg3Dzc8dYcpPoa2w9Xlt+HxrYme8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607194787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xbl9LMP/oVqDIFDVOcKlCnjbUI08vR1reFOa/05TqKI=;
        b=0zMUA5cfgheI71ds8S+/U8st9ndyc2G5WF9MtlXFp4hDpxo2NJ1oB90dYe5nwMNzufbAdC
        UaUpd6HOQYSBpFBQ==
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     bugzilla-daemon@bugzilla.kernel.org, jdelvare@suse.de,
        wsa@kernel.org, benjamin.tissoires@redhat.com, rui.zhang@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Carlos Jimenez <javashin1986@gmail.com>
Subject: Re: [Bug 202453] TRACE irq/18-i801_smb Tainted when enabled threadirqs in kernel commandline.
In-Reply-To: <20201205162403.sey33v2js2cs65q4@spock.localdomain>
References: <bug-202453-19117@https.bugzilla.kernel.org/> <bug-202453-19117-0k1QQBMPTi@https.bugzilla.kernel.org/> <20201204201930.vtvitsq6xcftjj3o@spock.localdomain> <87zh2s8buh.fsf@nanos.tec.linutronix.de> <20201205162403.sey33v2js2cs65q4@spock.localdomain>
Date:   Sat, 05 Dec 2020 19:59:46 +0100
Message-ID: <87tut084f1.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Dec 05 2020 at 17:24, Oleksandr Natalenko wrote:
> On Sat, Dec 05, 2020 at 05:19:18PM +0100, Thomas Gleixner wrote:
>> +/**
>> + * generic_dispatch_irq - Dispatch an interrupt from an interrupt handler
>> + * @irq:	The irq number to handle
>> + *
>> + * A wrapper around generic_handle_irq() which ensures that interrupts are
>> + * disabled when the primary handler of the dispatched irq is invoked.
>> + * This is useful for interrupt handlers with dispatching to be safe for
>> + * the forced threaded case.
>> + */
>> +int generic_dispatch_irq(unsigned int irq)
>> +{
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	local_irq_save(&flags);
>> +	ret = generic_handle_irq(irq);
>> +	local_irq_restore(&flags);
>
> FWIW, for me &flags explodes build on v5.10-rc6. I had to change it to local_irq_save/restore(flags) (without taking an address via &).

That's right. Don't know what I was thinking when writing it and then
compiling with the patch removed (just checked history ...) Oh, well
