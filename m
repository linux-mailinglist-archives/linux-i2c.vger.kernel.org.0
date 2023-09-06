Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF72793647
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 09:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjIFHc4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 03:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjIFHcz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 03:32:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6182794;
        Wed,  6 Sep 2023 00:32:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5279AC433C7;
        Wed,  6 Sep 2023 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693985571;
        bh=rA6dVSbG+dQq5j1TWqDv/sU8ofco7JkJsESS9r4nexI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EpiIJ1va/OaAlymFCx4jcMot106SymqceVmqONNNcqQY7R0gUrH7ExLhQnq0I2rom
         sqbmxWokxHdagxbPRmcjYpRL/F+JoszpNW/CcEooYOOxN93NYtShdQYC79Vp80EiBi
         fcLosiNlmJQGKRmnBwcMmRFohwBvq25CcgfF1UnSS/80BquP9HaE//Tq2S6tbULpv/
         IFhG0Q7/jCxFx7rxL2HIUQObVHoudFj5jhUpD9fezJisUDgt9riqCEmocbFrMJiT6E
         EMAsBWawBRUO/i9hdvZmHdsd+Nf6i7ZnFBY6e8tweB9P2NpzHoIeEod1USOwjIu2cv
         WmD32kkBWNwzg==
Date:   Wed, 6 Sep 2023 09:32:47 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <20230906073247.hjzjywivxzt3lcxw@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
 <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
 <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sean,

> >>>> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
> >>>> u32 dnf_dt;
> >>>> u32 dnf;
> >>>> struct stm32f7_i2c_alert *alert;
> >>>> + bool atomic;
> >>> 
> >>> this smells a bit racy here, this works only if the xfer's are
> >>> always sequential.
> >>> 
> >>> What happens when we receive at the same time two xfer's, one
> >>> atomic and one non atomic?
> >> 
> >> From the include/i2c.h:
> >> * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
> >> *   so e.g. PMICs can be accessed very late before shutdown. Optional.
> >> 
> >> So it’s only used very late in the shutdown.
> >> 
> >> It’s implemented the same way as in:
> >> drivers/i2c/busses/i2c-imx.c
> >> drivers/i2c/busses/i2c-meson.c
> >> drivers/i2c/busses/i2c-mv64xxx.c
> >> drivers/i2c/busses/i2c-tegra.c
> >> … etc…
> >> 
> >> 
> >> In drivers/i2c/i2c-core.h it’s determined whether it’s atomic transfer or not:
> >> 
> >> /*
> >> * We only allow atomic transfers for very late communication, e.g. to access a
> >> * PMIC when powering down. Atomic transfers are a corner case and not for
> >> * generic use!
> >> */
> >> static inline bool i2c_in_atomic_xfer_mode(void)
> >> {
> >>        return system_state > SYSTEM_RUNNING && irqs_disabled();
> >> }
> >> 
> >> So you would not have an atomic transfer and later an non atomic.
> > 
> > What about the opposite? I.e. a non atomic and later an atomic,
> > for very late tardive communications :)
> 
> Sure it’s the opposite? Normal scenario is “non atomic” transfers going on and under shutdown it switches to “atomic”.
> From i2c_in_atomic_xfer_mode() it can’t go from “atomic” -> “non atomic”.

well at some point we move from non atomic to atomic and we
preempt whatever is non atomic in order to go atomic, including
non atomic transfers.

A "global" variable thrown there without protection is a bit weak
and we need to be sure to be covering all possible scenarios when
this variable is used.

> extern enum system_states {
> SYSTEM_BOOTING,
> SYSTEM_SCHEDULING,
> SYSTEM_FREEING_INITMEM,
> SYSTEM_RUNNING,
> SYSTEM_HALT,
> SYSTEM_POWER_OFF,
> SYSTEM_RESTART,
> SYSTEM_SUSPEND,
> } system_state;
> 
> If you are asking what happens if a “non atomic” transfer is ongoing and irq’s is disabled, IDK.
> 
> Let’s get Wolfram in the loop (Sorry I forgot to add you) :)

Nah, it's OK... I am thinking aloud here and trying to cover
possible scenarios. I also think that setting up a spinlock might
be too much paranoiac and not necessary.

I'm going to ack it... but I will keep a few thoughts on thinking
what can happen wrong here.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
