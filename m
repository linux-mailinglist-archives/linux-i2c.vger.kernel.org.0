Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A66D7AD84B
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 14:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjIYMyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 08:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIYMyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 08:54:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B059AC6;
        Mon, 25 Sep 2023 05:54:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so103192731fa.1;
        Mon, 25 Sep 2023 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695646485; x=1696251285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rpqm6X708WjaZWB+8U/MeoR2u910Jmkbm9EGE0ytBjc=;
        b=CjtMx3RMTNgXg5pdXyD/zyAWS64HJdWWdm2jvLiljBCBgk5nfFCkxGLErNdMHvw88u
         LIMPX4Sk2qf7HtB44LjywCxa9EOnBsaB1O8rZzeznQB8sbiU28FZxLS1u9jVrQv3RX+e
         gaTs+2BFv+gBwzi7YptinenVNQOZeF4oTa6VRGH5jB2L/bjLznxcJy914mkCV79O4k8O
         eH/W3/zH8LvVRFOfTAdDel4Jcxfbpp3dlGSz+LYUL824n4B2bZK9c718hUi21s1TK6lh
         mZxojXQhpfyB6g6o3flCwMOo317h7e+O21hHOEZVgYN1/sDuetcj3LZsFJoZnF0OUAdC
         MCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695646485; x=1696251285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpqm6X708WjaZWB+8U/MeoR2u910Jmkbm9EGE0ytBjc=;
        b=AyFMgZFzNBDKdgMd33Jk2EeIg2dcO1mfRza1kRjp8CrWJnFwMvuWTRxvaUeTGUSqD0
         xg6GdJBbae1dAoQPgKpEjfMBBETH791fCwibwpuGUvTgN2AHMuXGSrkN9827S0leztYp
         heKffFjFjLgZ2s53PBncM/fIxPzGQ3n+zNzhR/UwnA6ExFXCS/VWIDJ5Doe5WNMoIFQL
         y/foVlvsQqR+C2FAkZV4plYDSN+j29T3LEgXf6Lim4q2nwoiMa+u6I4HgdeHbLXAhVoo
         YspZPhOA92UCgBBiH9VgLXXc8dJo2wgk665QmohVFpdt4lYM4N7yRD0WlmH4r0WVgiLw
         Kl3Q==
X-Gm-Message-State: AOJu0YxnnI5shrAu+/U2dBoq3CF8I5LGkDw6dvUEO0R1CEbdUyehrxMw
        0NiU1rnTJOtKhxXx8hjug9Dvhna2Ybc=
X-Google-Smtp-Source: AGHT+IHLC1KBibf0l8J+b8c0+qs59pNruJ6Khq4gjgkxuqhWLzvrQ7vh22M9zQHvWNV/gia3/bC7rw==
X-Received: by 2002:a05:651c:231:b0:2be:541c:d06b with SMTP id z17-20020a05651c023100b002be541cd06bmr4805435ljn.53.1695646484632;
        Mon, 25 Sep 2023 05:54:44 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d17-20020a2e3311000000b002c021b6e82bsm2175121ljc.80.2023.09.25.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:54:43 -0700 (PDT)
Date:   Mon, 25 Sep 2023 15:54:40 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
References: <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 20, 2023 at 12:14:17PM -0700, Jan Bottorff wrote:
> On 9/20/2023 6:27 AM, Yann Sionneau wrote:
> > Hi,
> > 
> > On 20/09/2023 11:08, Wolfram Sang wrote:
> > > > same thread." [1] Thus I'd suggest the next fix for the problem:
> > > > 
> > > > --- a/drivers/i2c/busses/i2c-designware-common.c
> > > > +++ b/drivers/i2c/busses/i2c-designware-common.c
> > > > @@ -72,7 +72,10 @@ static int dw_reg_write(void *context,
> > > > unsigned int reg, unsigned int val)
> > > >   {
> > > >       struct dw_i2c_dev *dev = context;
> > > > -    writel_relaxed(val, dev->base + reg);
> > > > +    if (reg == DW_IC_INTR_MASK)
> > > > +        writel(val, dev->base + reg);
> > > > +    else
> > > > +        writel_relaxed(val, dev->base + reg);
> > > >       return 0;
> > > >   }
> > > > 
> > > > (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)
> > > > 
> > > > What do you think?
> > > To me, this looks reasonable and much more what I would have expected as
> > > a result (from a high level point of view). Let's hope it works. I am
> > > optimistic, though...
> > > 
> > It works if we make sure all the other register accesses to the
> > designware i2c IP can't generate IRQ.
> > 
> > Meaning that all register accesses that can trigger an IRQ are enclosed
> > in between a call to i2c_dw_disable_int() and a call to
> > regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK); or
> > equivalent.
> > 
> > It seems to be the case, I'm not sure what's the best way to make sure
> > it will stay that way.
> > 
> > Moreover, maybe writes to IC_ENABLE register should also use the
> > non-relaxed writel() version?
> > 
> > Since one could do something like:
> > 
> > [ IP is currently disabled ]
> > 
> > 1/ enable interrupts in DW_IC_INTR_MASK
> > 
> > 2/ update some variable in dev-> structure in DDR
> > 
> > 3/ enable the device by writing to IC_ENABLE, thus triggering for
> > instance the TX_FIFO_EMPTY irq.
> > 
> 
> It does seem like there are a variety of register write combinations that
> could immediately cause an interrupt, so would need a barrier.

My suggestion was based on your fix. If it won't work or if it won't
completely solve the problem, then perhaps one of the next option
shall do it:
1. Add the non-relaxed IO call for the IC_ENABLE CSR too.
2. Completely convert the IO accessors to using the non-relaxed
methods especially seeing Wolfram already noted: "Again, I am all with
Catalin here. Safety first, optimizations a la *_relaxed should be
opt-in."
https://lore.kernel.org/linux-i2c/ZQm2Ydt%2F0jRW4crK@shikoro/
3. Find all the places where the memory writes need to be fully
visible after a subsequent IO-write causing an IRQ raise and just
place dma_wmb() there (though just wmb() would look a bit more
relevant).

IMO in the worst case solution 2. must be enough at least in the
master mode seeing the ISR uses the completion variable to indicate
the cmd execution completion, which also implies the complete memory
barrier. Moreover i2c bus isn't that performant for us to be that much
concerned about the optimizations like the pipeline stalls in between
the MMIO accesses.

-Serge(y)

> 
> I understand barriers a bit better now, although still wonder about some
> cases. Like say you write to some driver memory and then write the DW
> command fifo register, and it does not immediately cause an interrupt, but
> will in the future. Even without the barrier the memory write would
> typically become visible to other cores after some small amount of time, but
> don't see that's it's architecturally guaranteed to be visible. This implies
> the barrier is perhaps needed on many/all of the registers.
> 
> Jan
> 
> 
