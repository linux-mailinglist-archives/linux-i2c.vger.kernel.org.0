Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0758B7A561E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 01:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjIRXPG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Sep 2023 19:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjIRXPF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Sep 2023 19:15:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8579137;
        Mon, 18 Sep 2023 16:14:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-502a4f33440so8225663e87.1;
        Mon, 18 Sep 2023 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695078888; x=1695683688; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLG3ZRZbOWJbT+MDw6BjppjDdVVOVF6NEQiUoky0UmU=;
        b=Q1XF0bNhTth/KOjO7N/Ac0kdBTrD0v1sckpsnoBUKUSNg2SWZE6zRE/nFPbEQ6Et+S
         2/on/b2QEOqIqA7HhPkrqk0YXbPf+yfr9MUM2czATagcbpkWRqlmUe+ixOmiGOeY5Wuh
         1czzc0PFoDReH0bBuRfpgrFcTQaULimGxNEJjmXj245eLpK33ZBhMhM1ChgODIlIDH+G
         rsWLyU3iyaeAtg3kOD+ANTd79dsQhrH5khdyYZN3DNWP0RlUbDy4thOn6P7a8+OxcV+s
         cdKY4pUTQdrNlfmrvg2AS69XWWNUaV4f2gO3Ze/ikepp4MN5r0E7SQfSTIC1ZusoAVpS
         6vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695078888; x=1695683688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLG3ZRZbOWJbT+MDw6BjppjDdVVOVF6NEQiUoky0UmU=;
        b=DsB7JUNykPTKktRXLiSdOKx++55KzyvH3v1S6SryZC8ITo9VX15ZFIpmaL+tU8ab75
         3xl2jL5Rfp00/njSOgIXiZizpu1xsRgrCDvilVMQXK+MirGOWwlzLzpxkamoUCJGHcvx
         PlYlQielYgnpt2t/JwvnFKu/q1c/0P8GoWAg7PNE0KpZ1oKh34/R7uVSPO3eUeuK8S0R
         WWRl7TWuLEA/cvYiPz9VoD2wZuhQHz4Gl/+RFqtXcnlFR7us68t7isMhwUPY/62qelhw
         gtcSEwUSXe3iFvOg5iUT/sP6ho/BPeHiMWiKbTeH7TTiolfudQeU9DjqaUhbSsi4pFie
         Ik6g==
X-Gm-Message-State: AOJu0Yz1XAQ+3dd4+14p8tzbhUcJDCdFSZCMq7WfnLep+kNm3eVLQ03x
        Es8gSAGFFGOD4a2t0ehCOIU=
X-Google-Smtp-Source: AGHT+IHoD2r3pUSHA7/e3fCHLfbWkkzoo2myKoy8ywtzVaCJsLtS2cfXelI/UctIColnxKS4B/Lz6Q==
X-Received: by 2002:ac2:499e:0:b0:4fd:bc33:e508 with SMTP id f30-20020ac2499e000000b004fdbc33e508mr8767122lfl.49.1695078887229;
        Mon, 18 Sep 2023 16:14:47 -0700 (PDT)
Received: from mobilestation ([85.26.233.139])
        by smtp.gmail.com with ESMTPSA id t7-20020ac243a7000000b004fcdf99be86sm1990040lfl.239.2023.09.18.16.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 16:14:46 -0700 (PDT)
Date:   Tue, 19 Sep 2023 02:14:42 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Yann Sionneau <yann@sionneau.net>,
        Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 17, 2023 at 10:08:47PM +0200, Yann Sionneau wrote:
> Hi all,
> 
> Le 17/09/2023 à 02:01, Serge Semin a écrit :
> > To += Catalin, Will
> > 
> > Could you please join the discussion and clarify some ARM64 barriers
> > aspects?
> > 
> > On Fri, Sep 15, 2023 at 06:47:55PM -0700, Jan Bottorff wrote:
> > > On 9/15/2023 8:21 AM, Serge Semin wrote:
> > > ...
> > > > > diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> > > > > index ca1035e010c7..1694ac6bb592 100644
> > > > > --- a/drivers/i2c/busses/i2c-designware-master.c
> > > > > +++ b/drivers/i2c/busses/i2c-designware-master.c
> > > > > @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
> > > > >        /* Dummy read to avoid the register getting stuck on Bay Trail */
> > > > >        regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
> > > > > 
> > > > > +     /*
> > > > > +      * To guarantee data written by the current core is visible to
> > > > > +      * all cores, a write barrier is required. This needs to be
> > > > > +      * before an interrupt causes execution on another core.
> > > > > +      * For ARM processors, this needs to be a DSB barrier.
> > > > > +      */
> > > > > +     wmb();
> > > > Based on the patch log and the comment, smp_wmb() seems to be more
> > > > suitable here since the problem looks like SMP-specific. Most
> > > > importantly the smp_wmb() will get to be just the compiler barrier on
> > > > the UP system, so no cache and pipeline flushes in that case.
> > > > Meanwhile
> > > > 
> > > > I am not ARM expert, but based on the problem and the DMB/DSB barriers
> > > > descriptions using DMB should be enough in your case since you only
> > > > need memory syncs.
> > > > 
> > > Hi Serge,
> > > 
> > > I looked at the definition of smp_wmb, and it looks like on arm64 it uses a
> > > DMB barrier not a DSB barrier.
> > > 
> > > In /arch/arm64/include/asm/barrier.h:
> > > ...
> > > #define __arm_heavy_mb(x...) dsb(x)
> > > ...
> > > #if defined(CONFIG_ARM_DMA_MEM_BUFFERABLE) || defined(CONFIG_SMP)
> > > ...
> > > #define wmb()		__arm_heavy_mb(st)
> > > ...
> > > #define __smp_wmb()	dmb(ishst)
> > > 
> > > And then in /include/asm-generic/barrier.h it says:
> > > #ifdef CONFIG_SMP
> > > ...
> > > #ifndef smp_wmb
> > > #define smp_wmb()	do { kcsan_wmb(); __smp_wmb(); } while (0)
> > > #endif
> > > 
> > > This looks like wmb() is a DSB and smp_wmb() is a DMB on SMP systems, so the
> > > two functions are not equivalent on SMP systems.
> >
> > Right. They aren't. That's why I added a note regarding the DMB
> > instruction. Anyway see further for detailed explantation of my point.
> > 
> > > So lets explore if we think DMB or DSB is the correct barrier.
> > > 
> > > The ARM barrier docs I referred to has a specific example that says this:
> > > 
> > > "In some message passing systems, it is common for one observer to update
> > > memory and then send an interrupt using a mailbox of some sort to a second
> > > observer to indicate that memory has been updated and the new
> > > contents have been read. Even though the sending of the interrupt using a
> > > mailbox might be initiated using a memory access, a DSB barrier
> > > must be used to ensure the completion of previous memory accesses.
> > > 
> > > Therefore the following sequence is needed to ensure that P2 sees the
> > > updated value.
> > > 
> > > P1:
> > >   STR R5, [R1] ; message stored to shared memory location
> > >   DSB [ST]
> > >   STR R1, [R4] ; R4 contains the address of a mailbox
> > > 
> > > P2:
> > >   ; interrupt service routine
> > >   LDR R5, [R1]
> > > 
> > > Even if R4 is a pointer to Strongly-Ordered memory, the update to R1 might
> > > not be visible without the DSB executed by P1.
> > > It should be appreciated that these rules are required in connection to the
> > > ARM Generic Interrupt Controller (GIC).
> > > "
> > > 
> > > I don't positivly understand why it needs to be a DSB and not just a DMB,
> > > but this example matches what happens in the driver. The ARM docs do some
> > > hand waving that DSB is required because of the GIC.
> > > 
> > > Unless we can come up with a reason why this example in the ARM Barrier docs
> > > is not a match for what happens in the i2c driver, then ARM is saying it has
> > > to be a DSB not a DMB. If it needs to be a DSB then smb_wmb is insufficient.
> > > 
> > > Does anybody else have a different interpretation of this section in the ARM
> > > barrier docs? They use the word mailbox, and show a shared memory write, an
> > > interrupt triggering write, and a read of shared memory on a different core.
> > > Some would describe that as a software mailbox.
> > > 
> > > I did read someplace (although don't have a specific reference I can give)
> > > that ordering applied to normal memory writes are in a different group than
> > > ordering applied between strongly ordered accesses. The excerpt from the ARM
> > > barrier document above does say "Even if R4 is a pointer to Strongly-Ordered
> > > memory, the update to R1 might not be visible without the DSB executed by
> > > P1", which implies a DMB is insufficient to cause ordering between normal
> > > memory writes and strongly-ordered device memory writes.
> > > 
> > > I know currently on ARM64 Windows, the low-level kernel device MMIO access
> > > functions (like WRITE_REGISTER_ULONG) all have a DSB before the MMIO memory
> > > access. That seems a little heavy handed to me, but it also may be that was
> > > required to get all the current driver code written for AMD/Intel processors
> > > to work correctly on ARM64 without adding barriers in the drivers. There are
> > > also non-barrier variants that can be used if a driver wants to optimize
> > > performance. Defaulting to correct operation with minimal code changes would
> > > reduce the risk to delivery schedules.
> > > 
> > > Linux doesn't seem to make any attempt to have barriers in the low level
> > > MMIO access functions. If Linux had chosen to do that on ARM64, this patch
> > > would not have been required. For a low speed device like an i2c controller,
> > > optimizing barriers likely make little difference in performance.
> >
> > * AFAICS it does for the write(b|w|l|q)() accessors. See __dma_wb(),
> > * __io_bw() and __raw_write*() macros. The former one is converted
> > * to DMB.
> > 
> > > Let's look at it from a risk analysis viewpoint. Say a DMB is sufficient and
> > > we use the stronger DSB variant, the downside is a few cpu cycles will be
> > > wasted in i2c transfers. Say we use a DMB when a DSB is required for correct
> > > operation, the downside is i2c operations may malfunction. In this case,
> > > using a few extra cpu cycles for an operation that does not happen at high
> > > frequency is lower risk than failures in i2c transfers. If there is any
> > > uncertainty in what barrier type to use, picking DSB over DMB would be
> > > better. We determined from the include fragments above that wmb() give the
> > > DSB and smp_wmb() does not.
> > > 
> > > Based on the above info, I think wmb() is still the correct function, and a
> > > change to smp_wmb() would not be correct.
> > > 
> > > Sorry for the long message, I know some of you will be inspired to think
> > > deeply about barriers, and some will be annoyed that I spent this much space
> > > to explain how I came to the choice of wmb().
> >
> > Thank you very much for the very-very-very detailed justification of
> > your point. I well understand why you insist on using the mandatory
> > barrier on your platform. The thing is that your patch concerns the
> > generic driver which is also executed on another archs. Thus we need
> > to be very careful with the barrier selection since it may cause
> > unpleasant side effects there. For instance some time ago I met a
> > problem with using memory barriers on the MMIO accesses on the MIPS
> > arch. Full mem access barrier caused the program execution stalling
> > for too long so it failed to fetch data from a device Rx FIFO on time.
> > FIFO got overrun, data got lost and communications were aborted with an
> > error returned. I am not saying that the same problem may happen here,
> > but just pointing out that selecting a correct barrier is important.
> > 
> > Since you are fixing a generic driver code we should make the
> > decisions based on the problem description and the barriers semantic
> > defined by the kernel. If for some reason the solution turns to be not
> > working, then it might as well indicate that the barrier isn't working
> > as expected by the kernel. Thorough studying the platform-specific
> > barrier implementation will be necessary then (what you've already
> > done).
> > 
> > Here is what you say regarding the found problem:
> > 
> > "Errors were happening in the ISR that looked like corrupted memory.
> > This was because memory writes from the core enabling interrupts were
> > not yet visible to the core running the ISR...  Add a write barrier
> > before enabling interrupts to assure data written by the current core
> > is visible to all cores before the interrupt fires."
> > 
> > Based on that, I can infer that the problem is relevant for the
> > SMP-systems only and the root of it is in one CPU/core not seeing data
> > written by another CPU/core. Indeed adding a barrier shall fix it.
> > Seeing neither uni-processor systems nor any peripheral devices are
> > affected, SMP-conditional barrier shall be enough. Here is what [1]
> > says regarding the mandatory (mb/rmb/wmb) and SMP-conditional barriers
> > (smp_mb, smp_rmb, smp_wmb):
> > 
> > "Note that SMP memory barriers _must_ be used to control the ordering
> > of references to shared memory on SMP systems, though the use of
> > locking instead is sufficient. ... Mandatory barriers should not be
> > used to control SMP effects, since mandatory barriers impose
> > unnecessary overhead on both SMP and UP systems. They may, however, be
> > used to control MMIO effects on accesses through relaxed memory I/O
> > windows. ... SMP memory barriers are reduced to compiler barriers on
> > uniprocessor compiled systems because it is assumed that a CPU will
> > appear to be self-consistent, and will order overlapping accesses
> > correctly with respect to itself."
> > 
> > [1] "CPU MEMORY BARRIERS", Documentation/memory-barriers.txt
> > 
> > (note [1] also contains an example of using the smp_rmb()/smp_wmb()
> > barriers in a case similar to yours but involving two tasks instead of
> > a task and ISR)
> > 
> > Based on that description, the mandatory and SMP-conditional barriers
> > are supposed to similarly function when it comes to ordering the
> > shared memory accesses in the SMP systems. Meanwhile the former ones
> > cause additional overhead on UPs and MMIO which is out of the defined
> > problem scope.
> > 
> > Thus this also indicate that smp_wmb() is your choice here. But adding
> > it didn't solve the problem meanwhile using wmb() did. And here we are
> > getting to these barriers implementation on ARM64:
> > wmb() -> DSB
> > smp_wmb() -> DMB
> > Again I am not the ARM expert, but based on the text cited in your
> > message and what can be found in the Internet I can guess that DMB
> > doesn't guarantee the memory write _completion_, but instead make sure
> > that the accesses are just orderly executed on the core pipeline (for
> > instance just by fetching and dispatching these instructions within
> > different core cycles). The writes _completion_ is guaranteed by the
> > DSB barrier. Seeing in order to solve the problem you described all
> > the writes before the IRQ is raised _must_ be finished for sure to be
> > visible on another core executing an ISR, the barrier you need is DSB.
> > 
> > Unless I am mistaken in some aspects all of the considerations above
> > make me thinking that perhaps the smp_mb/smp_rmb/smp_wmb barriers
> > implementations on ARM64 are incorrect in using DMB and instead should
> > be converted to using DSB. Then you'll be able to freely utilize the
> > smp_wmb() barrier in the i2c-driver.
> > 
> > Catalin, Will could you please clarify whether what is stated above is
> > wrong or correct? Could you give your opinion regarding the issue
> > here?
> 
> Indeed I agree with all that's been said by Serge here.
> 
> I'm just adding some piece of information here to help understand the issue
> and then decide what's to be done.
> 
> * some ARM blog tips about when to use wmb() and smp_wmb() : https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-2---barriers-and-the-linux-kernel
> 
> * some details about ARMv7 barrier instructions: isb, dmb, dsb: https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-3---memory-access-ordering-in-the-arm-architecture

Thanks for the links. Especially for the last one. Reading it gave the
idea to me of another possible reason of the problem, which looks as
more probable in this case.

> 
> * The kernel doc about memory barriers, even if I guess everybody here knows
> this resource already:
> https://www.kernel.org/doc/Documentation/memory-barriers.txt
> 
> If I understand correctly what I've read in the 2nd link, indeed the DMB
> does not guarantee that the write *completes*. So if the write was for
> instance targeting DDR: it does not guarantee that the write reached the DDR
> before another core could be running the ISR and checks for the data.
> 
> *But*, it guarantees that "All data accesses by this processor/core before
> the DMB will be visible to all other masters within the specified
> shareability domain before any of the data accesses after it."
> 
> In other word (If I understand correctly): maybe it won't have reached the
> DDR yet *but* the cache coherency mechanism is done and all other cores
> would read the new data if they load at this address.
> 
> That seems to me to do the job for our use case.

Actually there is no need in the load and store to reach RAM as long as
the CPU is cache-coherent. In general it means what happens on the
per-core or per-cluster caches is visible to all CPU cores. I doubt
any of the modern systems lack of such ability. ARM64 certainly
doesn't lack it. But based on what is said in the second link
the dmb/dsb barriers semantic is configurable in that regard. The
barriers work within the specified Shareability domain. I don't
know at what stage the domains are supposed to be configured
(at the SoC design or at runtime), but if a barrier doesn't involve
all the domains which need to have the preceding operations visible
the problem described by Jan may happen.

> 
> The difference between DMB and DSB is that the DSB, on top of doing what the
> DMB does, stalls *all* instructions (and not just stores) until the
> synchronization mechanism is done.

Yes, that's the main difference. But (r|w)?mb() and smp_(r|w)?mb()
barriers are converted to the DSB and DMB instructions executed for
different domains:

#define __mb()          dsb(sy)
#define __rmb()         dsb(ld)
#define __wmb()         dsb(st)

#define __smp_mb()      dmb(ish)
#define __smp_rmb()     dmb(ishld)
#define __smp_wmb()     dmb(ishst)

The Mandatory barriers affect the System Shareability domain, The
SMP-conditional barriers - the Inner Shareability domain. So if for
some reason the CPU cores on the Jan's system are split up into
several Inner domains, AFAIU the SMP barrier will involve only the one
on which the barrier is executed. So as said on the ARM64 doc:
"Outside of this domain, observers might not see the same order of
memory accesses as inside it."

So Jan could you please try the next out:
1. Check whether all the CPU cores in your system are on the same
Inner Shareability domain.
2. If not (or in anyway) please redefine SMP-barriers like this:
#define __smp_mb()      dmb(osh)
#define __smp_rmb()     dmb(oshld)
#define __smp_wmb()     dmb(oshst)
3. If it didn't help like this
#define __smp_mb()      dmb(sy)
#define __smp_rmb()     dmb(ld)
#define __smp_wmb()     dmb(st)

-Serge(y)

> 
> That's my understanding but let's wait for the experts to enlighten us :)
> 
> Regards,
> 
> -- 
> 
> Yann
> 
