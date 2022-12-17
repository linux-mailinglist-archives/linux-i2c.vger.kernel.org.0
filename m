Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD6164F917
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 14:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiLQN2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 08:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLQN2g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 08:28:36 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75B4CE27;
        Sat, 17 Dec 2022 05:28:33 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 90CCC447AA;
        Sat, 17 Dec 2022 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1671283710; bh=94DNmBx41m1GaLqUJXLbTvW5t7x+aJ0RDNQpAYt2Eu8=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=Exz4I590rlMyW/ZbYpqEEp3DBBItYymx8UlN2cSejx+OcA4qN2AmdGWtrorymYwRb
         SsyKUyD2zHV0QTomri2xdy/zoPHSJVgS4w1atc8o8IvItBdtlxrPqmANQR3qIVk9lJ
         lmgAmLEJDQMaCmZA2tw2zXpEVYc1EvZaH9ZcikM3nbbczqTDESzTAC57BKtGOS/Xh1
         4oeU9IyFPVzUf6Oy68lK/PVaIz+P23r9THgWC/kbdCuVZHamqkZ36lgILg1qG6c/tb
         tjtyO8EmFQl4Z5nzTup4n/+6+8CJOpMP++0Lm3Qib5J9HVYuOgnczKQy9q5qkhWsms
         aXG0Ys2f8VqDQ==
Message-ID: <10a724cf-fa2b-a0fb-6737-b456238d0385@marcan.st>
Date:   Sat, 17 Dec 2022 22:28:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Alex Henrie <alexh@vpitech.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
References: <20210626054113.246309-1-marcan@marcan.st>
 <20221215152641.39164ca3@endymion.delvare>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
In-Reply-To: <20221215152641.39164ca3@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I'm going to be honest - it's been so long I completely lost all mental
state of this patch, so at this point I'm mostly at the same place you
are here.

On 15/12/2022 23.26, Jean Delvare wrote:

> I object to this patch going to stable, as the original regression has
> already been addressed by an earlier patch. The "Fixes" tag doesn't
> seem appropriate, for the same reason.
> 
> This patch is way too intrusive and risky to be considered for stable
> kernels, it clearly fails to meet the first two acceptance criteria. It
> should live for some time upstream before distributions may consider
> backporting it.

That's fair. The original intent was to fix the regression and implement
it properly in one go.

>> +	/*
>> +	 * The controller provides a bit that implements a mutex mechanism
>> +	 * between users of the bus. First, try to lock the hardware mutex.
>> +	 * If this doesn't work, we give up trying to do this, but then
>> +	 * bail if ACPI uses SMBus at all.
>> +	 */
>> +	if (!priv->inuse_stuck) {
>> +		while (inb_p(SMBHSTSTS(priv)) & SMBHSTSTS_INUSE_STS) {
> 
> Do I understand correctly that there are 3 cases where we would be
> looping here:
> 
> 1* The SMBus was used by the BIOS at boot time and they forgot to clear
>    SMBHSTSTS_INUSE_STS. The expected outcome is a timeout.
> 
> 2* ACPI is using the SMBus, and the implementation is a good citizen
>    (acquires the hardware lock before starting a transfer, releases it
>    when done), and we are in the middle of an ACPI-side SMBus transfer.
>    The expectation is that the ACPI-side transfer will complete and the
>    hardware lock be released before we reach the timeout.
> 
> 3* ACPI is using the SMBus, the implementation is a bad citizen and did
>    not release the hardware lock after a transfer. The expected outcome
>    is a timeout.
> 
> Case 1 wouldn't be a problem, but we can't differentiate it from case
> 3, which is a problem, therefore we always consider a timeout to be the
> problematic case 3 and inhibit driver access when that happens. Right?

Not quite. inuse_stuck does not inhibit driver access by itself until we
see *some* access from ACPI (acpi_usage).

It is impossible for BIOS to forget to clear SMBHSTSTS_INUSE_STS *and*
for ACPI to be a good citizen with the bus, because that would
immediately deadlock on the ACPI access regardless of what the OS does
(unless there is some weird logic/workaround to clear the lock on first
access in the ACPI AML, but let's hope nobody does that). So the
expected cases are:

1. SMBus was left locked by the BIOS but is *not* used by ACPI
(inuse_stuck == true, acpi_usage == false). In this case we expect a
timeout once, then we give up on checking the hardware lock altogether
in the future.

2. SMBus is/was busy on a well-behaved ACPI transfer (inuse_stuck ==
false, acpi_usage == true). In this case we make note of the ACPI usage
but nothing bad happens (no timeout).

3. ACPI is/has used SMBus and left it locked (inuse_stuck == true,
acpi_usage == true). In this case we give up on future driver accesses
entirely.

Only case 3 leads to the driver bailing out on further accesses.

> Note: I had to change this to use time_is_before_jiffies(), as
> MAX_RETRIES has been removed from the i2c-i801 driver by commit
> 44c54c4ec391 ("i2c: i801: Improve status polling") meanwhile.

Ack.

> Technically, this is "Non-SMBus access". It could still be an access to
> other functions of the i82801 chipset, but we don't care about these.

Right, makese sense.

> 
>>  	 */
>> -	mutex_lock(&priv->acpi_lock);
>> +	if (!i801_acpi_is_smbus_ioport(priv, address))
>> +		return i801_acpi_do_access(function, address, bits, value);
>>  
>> -	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
>> -		priv->acpi_reserved = true;
>> +	if (!mutex_trylock(&priv->acpi_lock)) {
>> +		mutex_lock(&priv->acpi_lock);
> 
> I was pretty confused by this construct at first, I think it deserves a
> comment. My understanding of it is:
> 
> 1* We first try to acquire the software lock without waiting. If it
>    works, it means that no transfer is in progress on the Linux side,
>    and we can proceed with the ACPI I/O request, as we hold the lock.
> 
> 2* If immediate acquisition of the software lock failed, we wait for
>    the lock to be released by i801_access(). Once we have the lock,
>    there are two options. Either the first thing done by the ACPI side
>    is reading SMBHSTSTS_INUSE_STS, it is a good citizen and we can
>    continue (we hold both the software lock and the hardware lock). Or
>    the ACPI side accesses another register directly, which means it
>    does not check SMBHSTSTS_INUSE_STS, it is a bad citizen and there is
>    no safe way to access the SMBus on the Linux side. We prevent
>    further access from the Linux side, as we did before this patch.
> 
> Please correct me if I'm wrong.

Yes, I believe that was the intent.

> 
> I see a problem with this implementation. It is possible that
> i801_access() gets called in the middle of an ACPI-side SMBus transfer,
> because the software lock is not held for the whole duration of an
> ACPI-side transfer (contrary to Linux-side transfers). Before this
> patch, the first step of the ACPI-side transfer would have blocked any
> future access from the Linux side, so we were safe. After this patch,
> acpi_usage has been set to true at this point, but that alone won't
> prevent access from the Linux side. Access will only be prevented if
> SMBHSTSTS_INUSE_STS is considered stuck. If the ACPI implementation is
> a bad citizen, I'm afraid there is no guarantee of that happening.
> SMBHSTSTS will eventually be read during the ACPI-side transfer, and
> that will acquire the hardware lock as a side effect, but not as the
> first step.
> 
> Specifically, the scenario that would cause problem is:
> 
> ACPI side				| Linux side
> ---------------------------------------+----------------------------------
> [first step of a transfer]             |
> mutex_trylock(&priv->acpi_lock)        |
> priv->acpi_usage = true                |
> i801_acpi_do_access(random register)   |
> mutex_unlock(&priv->acpi_lock)         |
>                                        | take hardware lock
>                                        | mutex_lock(&priv->acpi_lock)
>                                        | priv->acpi_unsafe is false -> OK
>                                        | perform transfer
>                                        | release hardware lock
>                                        | mutex_unlock(&priv->acpi_lock)
> [second step of a transfer]            |
> mutex_trylock(&priv->acpi_lock)        |
> i801_acpi_do_access(random register)   |
> mutex_unlock(&priv->acpi_lock)         |
> (...)                                  |
> 
> Obviously the ACPI-side transfer will be screwed, as whatever register
> value was set during the first step will inevitably have been
> overwritten by the Linux-side transfer.
> 
> I admit that the probability of this scenario happening is extremely
> low, because it will take only one completed ACPI-side transfer (bad
> citizen case) to take the hardware lock and not release it, which in
> turn will prevent any further access from the Linux side. The above
> scenario can therefore only happen if the very first SMBus transfer
> from the bad citizen ACPI side happens at exactly the same time as a
> transfer from the Linux side.

Agreed, this is a problem.

> Question: why do you check that the first action of ACPI AML is to
> acquire the hardware lock *only* if that action was attempted while the
> Linux side was performing a transfer? That event is quite unlikely to
> happen. Can't we perform that test unconditionally the very first time
> i801_acpi_io_handler() is called? Unless the i2c-i801 driver gets> initialized in the middle of an ACPI-side SMBus transfer [...]

I wonder if there's some way to close this race? This doesn't sound all
that unlikely (consider: ACPI backlight is also a module, device init
happens in parallel, so we could well end up probing i2c-i801 in the
middle of an ACPI SMBus transfer more often than you'd expect at boot time).

How about this: instead of checking for the lock access on the *first*
call to i801_acpi_io_handler, we add an acpi_must_lock flag. This is
initially false, but it is set on completion of every Linux-side i2c
transfer, and cleared once we see ACPI take the lock properly. The ACPI
handler then checks it and expects a lock access if it is true.

So as soon as Linux does an i2c transfer, we expect ACPI to be taking
the lock next time it touches the hardware, and we know to bail on the
Linux side in the future if it does not.

* If the i2c driver probes in the middle of a well-behaved ACPI SMBus
transfer, nothing bad happens, since if we try to do a Linux-side
transfer it will block on the lock until ACPI is done. Further ACPI
SMBus transfers after a Linux transfer will pass the locking check.
* If the driver probes in the middle of a misbehaved ACPI transfer but
is otherwise idle, nothing happens until the first Linux transfer, then
the next ACPI access after that will have us bail and disable driver access.
* If we probe *and* try to make a transfer all in the middle of a
misbehaved ACPI transfer, then we are going to step on its toes and
break it, but at least we will notice as soon as the Linux side is done
(or possibly failed due to the collision) and ACPI tries to touch the
controller again, so we will get out of its way in the future and
there's at least a chance it will recover for future accesses.

Further closing that last edge case to avoid ever conflicting with
broken ACPI implementations would require some sort of mechanism to know
whether ACPI AML started running an i2c transfer method before the
i2c-i801 driver loaded, which might be too intrusive a change to be wrth
it for such a corner case. Though maybe there's an easy way? If there's
something like a global AML lock we could just have the probe sequence be:

1. Register the ACPI IO handler
2. Take the AML lock
3. Set acpi_must_lock = true
4. Release the AML lock
5. Finally register the i2c controller

That makes sure we serialize on any ongoing ACPI shenanigans at probe
time and allows us to truly check that the first access from ACPI after
that is a lock, before Linux has a chance to do anything itself. But I
don't know off the top of my head whether there is such a lock.

- Hector
