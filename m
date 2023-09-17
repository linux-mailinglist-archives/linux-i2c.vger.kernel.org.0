Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96FD7A3AC8
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Sep 2023 22:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239559AbjIQUJF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Sep 2023 16:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbjIQUJB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Sep 2023 16:09:01 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9009497;
        Sun, 17 Sep 2023 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1694981329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=inPUEWNeOcYsGT6Rihk7Mfyq+oNXo6B2hTh4FomfyUM=;
        b=Rv/1UBvREFUr1K2jLeKf3ZbXPPiKU1J+eWNkgScOqgdM2nqxkuNFoUVv662/PbVE3hoKq8
        3D5u60NkSW7KytjVwiAveVWhC1cpcolqCqBMIRQhRflUAOfFfTf+2mFkvaOnXH9kW2wm0E
        GKUg8E5/0M9HtXY8UvMDKTdEfFU0zCU=
Received: from [192.168.1.18] (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id cf744ae3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sun, 17 Sep 2023 20:08:48 +0000 (UTC)
Message-ID: <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
Date:   Sun, 17 Sep 2023 22:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
To:     Serge Semin <fancer.lancer@gmail.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
Content-Language: en-US
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

Le 17/09/2023 à 02:01, Serge Semin a écrit :
> To += Catalin, Will
>
> Could you please join the discussion and clarify some ARM64 barriers
> aspects?
>
> On Fri, Sep 15, 2023 at 06:47:55PM -0700, Jan Bottorff wrote:
>> On 9/15/2023 8:21 AM, Serge Semin wrote:
>> ...
>>>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>>>> index ca1035e010c7..1694ac6bb592 100644
>>>> --- a/drivers/i2c/busses/i2c-designware-master.c
>>>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>>>> @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>>>>        /* Dummy read to avoid the register getting stuck on Bay Trail */
>>>>        regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
>>>>
>>>> +     /*
>>>> +      * To guarantee data written by the current core is visible to
>>>> +      * all cores, a write barrier is required. This needs to be
>>>> +      * before an interrupt causes execution on another core.
>>>> +      * For ARM processors, this needs to be a DSB barrier.
>>>> +      */
>>>> +     wmb();
>>> Based on the patch log and the comment, smp_wmb() seems to be more
>>> suitable here since the problem looks like SMP-specific. Most
>>> importantly the smp_wmb() will get to be just the compiler barrier on
>>> the UP system, so no cache and pipeline flushes in that case.
>>> Meanwhile
>>>
>>> I am not ARM expert, but based on the problem and the DMB/DSB barriers
>>> descriptions using DMB should be enough in your case since you only
>>> need memory syncs.
>>>
>> Hi Serge,
>>
>> I looked at the definition of smp_wmb, and it looks like on arm64 it uses a
>> DMB barrier not a DSB barrier.
>>
>> In /arch/arm64/include/asm/barrier.h:
>> ...
>> #define __arm_heavy_mb(x...) dsb(x)
>> ...
>> #if defined(CONFIG_ARM_DMA_MEM_BUFFERABLE) || defined(CONFIG_SMP)
>> ...
>> #define wmb()		__arm_heavy_mb(st)
>> ...
>> #define __smp_wmb()	dmb(ishst)
>>
>> And then in /include/asm-generic/barrier.h it says:
>> #ifdef CONFIG_SMP
>> ...
>> #ifndef smp_wmb
>> #define smp_wmb()	do { kcsan_wmb(); __smp_wmb(); } while (0)
>> #endif
>>
>> This looks like wmb() is a DSB and smp_wmb() is a DMB on SMP systems, so the
>> two functions are not equivalent on SMP systems.
> Right. They aren't. That's why I added a note regarding the DMB
> instruction. Anyway see further for detailed explantation of my point.
>
>> So lets explore if we think DMB or DSB is the correct barrier.
>>
>> The ARM barrier docs I referred to has a specific example that says this:
>>
>> "In some message passing systems, it is common for one observer to update
>> memory and then send an interrupt using a mailbox of some sort to a second
>> observer to indicate that memory has been updated and the new
>> contents have been read. Even though the sending of the interrupt using a
>> mailbox might be initiated using a memory access, a DSB barrier
>> must be used to ensure the completion of previous memory accesses.
>>
>> Therefore the following sequence is needed to ensure that P2 sees the
>> updated value.
>>
>> P1:
>>   STR R5, [R1] ; message stored to shared memory location
>>   DSB [ST]
>>   STR R1, [R4] ; R4 contains the address of a mailbox
>>
>> P2:
>>   ; interrupt service routine
>>   LDR R5, [R1]
>>
>> Even if R4 is a pointer to Strongly-Ordered memory, the update to R1 might
>> not be visible without the DSB executed by P1.
>> It should be appreciated that these rules are required in connection to the
>> ARM Generic Interrupt Controller (GIC).
>> "
>>
>> I don't positivly understand why it needs to be a DSB and not just a DMB,
>> but this example matches what happens in the driver. The ARM docs do some
>> hand waving that DSB is required because of the GIC.
>>
>> Unless we can come up with a reason why this example in the ARM Barrier docs
>> is not a match for what happens in the i2c driver, then ARM is saying it has
>> to be a DSB not a DMB. If it needs to be a DSB then smb_wmb is insufficient.
>>
>> Does anybody else have a different interpretation of this section in the ARM
>> barrier docs? They use the word mailbox, and show a shared memory write, an
>> interrupt triggering write, and a read of shared memory on a different core.
>> Some would describe that as a software mailbox.
>>
>> I did read someplace (although don't have a specific reference I can give)
>> that ordering applied to normal memory writes are in a different group than
>> ordering applied between strongly ordered accesses. The excerpt from the ARM
>> barrier document above does say "Even if R4 is a pointer to Strongly-Ordered
>> memory, the update to R1 might not be visible without the DSB executed by
>> P1", which implies a DMB is insufficient to cause ordering between normal
>> memory writes and strongly-ordered device memory writes.
>>
>> I know currently on ARM64 Windows, the low-level kernel device MMIO access
>> functions (like WRITE_REGISTER_ULONG) all have a DSB before the MMIO memory
>> access. That seems a little heavy handed to me, but it also may be that was
>> required to get all the current driver code written for AMD/Intel processors
>> to work correctly on ARM64 without adding barriers in the drivers. There are
>> also non-barrier variants that can be used if a driver wants to optimize
>> performance. Defaulting to correct operation with minimal code changes would
>> reduce the risk to delivery schedules.
>>
>> Linux doesn't seem to make any attempt to have barriers in the low level
>> MMIO access functions. If Linux had chosen to do that on ARM64, this patch
>> would not have been required. For a low speed device like an i2c controller,
>> optimizing barriers likely make little difference in performance.
> * AFAICS it does for the write(b|w|l|q)() accessors. See __dma_wb(),
> * __io_bw() and __raw_write*() macros. The former one is converted
> * to DMB.
>
>> Let's look at it from a risk analysis viewpoint. Say a DMB is sufficient and
>> we use the stronger DSB variant, the downside is a few cpu cycles will be
>> wasted in i2c transfers. Say we use a DMB when a DSB is required for correct
>> operation, the downside is i2c operations may malfunction. In this case,
>> using a few extra cpu cycles for an operation that does not happen at high
>> frequency is lower risk than failures in i2c transfers. If there is any
>> uncertainty in what barrier type to use, picking DSB over DMB would be
>> better. We determined from the include fragments above that wmb() give the
>> DSB and smp_wmb() does not.
>>
>> Based on the above info, I think wmb() is still the correct function, and a
>> change to smp_wmb() would not be correct.
>>
>> Sorry for the long message, I know some of you will be inspired to think
>> deeply about barriers, and some will be annoyed that I spent this much space
>> to explain how I came to the choice of wmb().
> Thank you very much for the very-very-very detailed justification of
> your point. I well understand why you insist on using the mandatory
> barrier on your platform. The thing is that your patch concerns the
> generic driver which is also executed on another archs. Thus we need
> to be very careful with the barrier selection since it may cause
> unpleasant side effects there. For instance some time ago I met a
> problem with using memory barriers on the MMIO accesses on the MIPS
> arch. Full mem access barrier caused the program execution stalling
> for too long so it failed to fetch data from a device Rx FIFO on time.
> FIFO got overrun, data got lost and communications were aborted with an
> error returned. I am not saying that the same problem may happen here,
> but just pointing out that selecting a correct barrier is important.
>
> Since you are fixing a generic driver code we should make the
> decisions based on the problem description and the barriers semantic
> defined by the kernel. If for some reason the solution turns to be not
> working, then it might as well indicate that the barrier isn't working
> as expected by the kernel. Thorough studying the platform-specific
> barrier implementation will be necessary then (what you've already
> done).
>
> Here is what you say regarding the found problem:
>
> "Errors were happening in the ISR that looked like corrupted memory.
> This was because memory writes from the core enabling interrupts were
> not yet visible to the core running the ISR...  Add a write barrier
> before enabling interrupts to assure data written by the current core
> is visible to all cores before the interrupt fires."
>
> Based on that, I can infer that the problem is relevant for the
> SMP-systems only and the root of it is in one CPU/core not seeing data
> written by another CPU/core. Indeed adding a barrier shall fix it.
> Seeing neither uni-processor systems nor any peripheral devices are
> affected, SMP-conditional barrier shall be enough. Here is what [1]
> says regarding the mandatory (mb/rmb/wmb) and SMP-conditional barriers
> (smp_mb, smp_rmb, smp_wmb):
>
> "Note that SMP memory barriers _must_ be used to control the ordering
> of references to shared memory on SMP systems, though the use of
> locking instead is sufficient. ... Mandatory barriers should not be
> used to control SMP effects, since mandatory barriers impose
> unnecessary overhead on both SMP and UP systems. They may, however, be
> used to control MMIO effects on accesses through relaxed memory I/O
> windows. ... SMP memory barriers are reduced to compiler barriers on
> uniprocessor compiled systems because it is assumed that a CPU will
> appear to be self-consistent, and will order overlapping accesses
> correctly with respect to itself."
>
> [1] "CPU MEMORY BARRIERS", Documentation/memory-barriers.txt
>
> (note [1] also contains an example of using the smp_rmb()/smp_wmb()
> barriers in a case similar to yours but involving two tasks instead of
> a task and ISR)
>
> Based on that description, the mandatory and SMP-conditional barriers
> are supposed to similarly function when it comes to ordering the
> shared memory accesses in the SMP systems. Meanwhile the former ones
> cause additional overhead on UPs and MMIO which is out of the defined
> problem scope.
>
> Thus this also indicate that smp_wmb() is your choice here. But adding
> it didn't solve the problem meanwhile using wmb() did. And here we are
> getting to these barriers implementation on ARM64:
> wmb() -> DSB
> smp_wmb() -> DMB
> Again I am not the ARM expert, but based on the text cited in your
> message and what can be found in the Internet I can guess that DMB
> doesn't guarantee the memory write _completion_, but instead make sure
> that the accesses are just orderly executed on the core pipeline (for
> instance just by fetching and dispatching these instructions within
> different core cycles). The writes _completion_ is guaranteed by the
> DSB barrier. Seeing in order to solve the problem you described all
> the writes before the IRQ is raised _must_ be finished for sure to be
> visible on another core executing an ISR, the barrier you need is DSB.
>
> Unless I am mistaken in some aspects all of the considerations above
> make me thinking that perhaps the smp_mb/smp_rmb/smp_wmb barriers
> implementations on ARM64 are incorrect in using DMB and instead should
> be converted to using DSB. Then you'll be able to freely utilize the
> smp_wmb() barrier in the i2c-driver.
>
> Catalin, Will could you please clarify whether what is stated above is
> wrong or correct? Could you give your opinion regarding the issue
> here?

Indeed I agree with all that's been said by Serge here.

I'm just adding some piece of information here to help understand the 
issue and then decide what's to be done.

* some ARM blog tips about when to use wmb() and smp_wmb() : 
https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-2---barriers-and-the-linux-kernel

* some details about ARMv7 barrier instructions: isb, dmb, dsb: 
https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-3---memory-access-ordering-in-the-arm-architecture

* The kernel doc about memory barriers, even if I guess everybody here 
knows this resource already: 
https://www.kernel.org/doc/Documentation/memory-barriers.txt

If I understand correctly what I've read in the 2nd link, indeed the DMB 
does not guarantee that the write *completes*. So if the write was for 
instance targeting DDR: it does not guarantee that the write reached the 
DDR before another core could be running the ISR and checks for the data.

*But*, it guarantees that "All data accesses by this processor/core 
before the DMB will be visible to all other masters within the specified 
shareability domain before any of the data accesses after it."

In other word (If I understand correctly): maybe it won't have reached 
the DDR yet *but* the cache coherency mechanism is done and all other 
cores would read the new data if they load at this address.

That seems to me to do the job for our use case.

The difference between DMB and DSB is that the DSB, on top of doing what 
the DMB does, stalls *all* instructions (and not just stores) until the 
synchronization mechanism is done.

That's my understanding but let's wait for the experts to enlighten us :)

Regards,

-- 

Yann

