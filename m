Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF377A6CB4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 23:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjISVGD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 17:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbjISVGC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 17:06:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4962CBD;
        Tue, 19 Sep 2023 14:05:56 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so102486151fa.2;
        Tue, 19 Sep 2023 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695157554; x=1695762354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHsPKP6BqysoYMa8V+ESH1TfEZajohINi+xCVCti5js=;
        b=epEkl2dwdHsU4KAi2Xb+W564ofdcbX1VckodH5cnedaRMZPSKXyMcLGfgdY4bF7W+M
         8QnIYAbQw+9T+F9L9WshmVbkkWj3jR/BtNlI5Nx5ZLOJst9evuN433+aAhY1+NCUUNZj
         z/AxonJyY61x5auhHpPKXqEpCHw+q1CF6zSP/KOIHqQmiCnEbEN9/cXj9MwY29fkdI2s
         6tqMMjUbajgLoUqi2FSofH9sUsry0rJ8GyLYg2J86T6jzQan12TKETZ0C8FDCa0Mn5t/
         tUsMlbhcmAYF9rXdZf1FtWPTHsHGa3Bmcc+to5evh6Gtcs8P4sUa8zkJV49B+DuShcQv
         I3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695157554; x=1695762354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHsPKP6BqysoYMa8V+ESH1TfEZajohINi+xCVCti5js=;
        b=xPQm12CbvwxBLbM5o2sKp9dJZj36AhFCAopqT1vkBDy9GYXmbn+U8bgUbfw/jioVWS
         GlA20FpvxImKSx1fVzZI+qMYRbtzTlRbLaa5LRzm0Ie0X1mkxsNbLi94HA9xQTzDd0gc
         h9j74AEqBL6v2LMlNaPNFz0jo4FmAcmnyA2agkw1YHW5wXOj5XN+8rv62NMIzmV1QO6l
         2xu9T2WMfzth0gagCFB1yylF0pVlg0/oiTHlyqPj3eAaXQYUgZJOwAxKkXcdTRroZFVG
         JaRabX0rIWWmyIp1q8323xt2lag2zvu+FL9Ppgse/vhaBnGisfXuLPHL8XpdG5nKh7MH
         /+RA==
X-Gm-Message-State: AOJu0YxhpvDLkhySzaYt1ungSqHjztTACwtNgxjO7wNDEzarVKG2CBzk
        lBW661JE3KCA/1rCzWTd8FM=
X-Google-Smtp-Source: AGHT+IEGWeDEc5IDLpBY0biNaWDbt43yNNPzz3UTeUf2oAQ0i4hrMtXXeXs61q+RjnCVKLq04Dv8Tw==
X-Received: by 2002:a2e:8095:0:b0:2bc:f739:2eda with SMTP id i21-20020a2e8095000000b002bcf7392edamr488625ljg.5.1695157554027;
        Tue, 19 Sep 2023 14:05:54 -0700 (PDT)
Received: from mobilestation ([178.176.86.124])
        by smtp.gmail.com with ESMTPSA id t25-20020a2e8e79000000b002b9e5fe86dasm1867888ljk.81.2023.09.19.14.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:05:53 -0700 (PDT)
Date:   Wed, 20 Sep 2023 00:05:50 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
References: <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all

On Tue, Sep 19, 2023 at 11:54:10AM -0700, Jan Bottorff wrote:
> On 9/19/2023 7:51 AM, Catalin Marinas wrote:
> > 
> > While smp_* is ok, it really depends on what the regmap_write() does. Is
> > it a write to a shared peripheral (if not, you may need a DSB)? Does the
> > regmap_write() caller know this? That's why I think having the barrier
> > in dw_reg_write() is better.
> > 
> > If you do want to stick to a fix in i2c_dw_xfer_init(), you could go for
> > dma_wmb(). While this is not strictly DMA, it's sharing data with
> > another coherent agent (a different CPU in this instance). The smp_wmb()
> > is more about communication via memory not involving I/O. But this still
> > assumes that the caller knows regmap_write() ends up with an I/O
> > write*() (potentially relaxed).

Catalin, thank you very much for your messages. The situation is much
clearer now. I should have noted that we indeed talking about
different memory types: Normal and Device memories. Anyway to sum it up
AFAICS the next situation is happening:
1. some data is updated,
2. IRQ is activated by means of writel_relaxed() to the
DW_IC_INTR_MASK register.
3. IRQ is raised and being handled, but the data updated in 1. looked
as corrupted.

(Jan, correct me if I'm wrong.)

Since ARM doesn't "guarantee ordering between memory accesses to
different devices, or usually between accesses of different memory
types", most likely the CPU core changes 1. and 2. places
occasionally. So in that case the IRQ handler just doesn't see the
updated data. What needs to be done is to make sure that 2. always
happens after 1. is completed. Outer Shareability domain write-barrier
(DMB(oshst)) does that. Am I right? That's why it's utilized in the
__io_bw() and __dma_wmb() macros implementation.

Wolfram, Jan seeing the root cause of the problem is in using the
'_relaxed' accessors for the controller CSRs I assume that the problem
might be more generic than just for ARMs, since based on [1] these
accessors "do not guarantee ordering with respect to locking, _normal_
memory accesses or delay() loops." So theoretically the problem might
get to be met on any other arch if it implements the semantic with the
relaxed normal and device memory accesses execution.

[1] "KERNEL I/O BARRIER EFFECTS" Documentation/memory-barriers.txt

If so we need to have give up from using the _relaxed accessors at for
the CSRs which may cause a side effect like IRQ raising. Instead the
normal IO write should be utilized which "wait for the completion of
all prior writes to memory either issued by, or propagated to, the
same thread." [1] Thus I'd suggest the next fix for the problem:

--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -72,7 +72,10 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writel_relaxed(val, dev->base + reg);
+	if (reg == DW_IC_INTR_MASK)
+		writel(val, dev->base + reg);
+	else
+		writel_relaxed(val, dev->base + reg);
 
 	return 0;
 }

(and similar changes for dw_reg_write_swab() and dw_reg_write_word().)

What do you think?

> 
> If we wanted maximum correctness wouldn't we need something like
> writel_triggers_interrupt/regmap_write_triggers_interrupt or maybe
> preinterrupt_wmb?
> 
> The ARM docs do have a specific example case where the device write triggers
> an interrupt, and that example specifically says a DSB barrier is needed.
> 
> If I look at the ARM GIC IPI send function gic_ipi_send_mask in https://elixir.bootlin.com/linux/v6.6-rc2/source/drivers/irqchip/irq-gic-v3.c#L1354
> is says:
> 
>         /*
> 	 * Ensure that stores to Normal memory are visible to the
> 	 * other CPUs before issuing the IPI.
> 	 */
> 	dsb(ishst);
> 
> I would think the IPI send code is very carefully tuned for performance, and
> would not use a barrier any stronger than required.
> 
> I believe dma_wmb maps to DMB on ARM64.

Jan. Yes, but it looks like DMB() for the Outer-shareable domains
should be enough (see my comment above). DSB() seems like overkill
here. We don't raise IPIs or use mailboxes in this case, but merely
update the CSR flags.

-Serge(y)

> 
> - Jan
> 
> 
> 
> 
> 
> 
