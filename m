Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBEB7AFE39
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 10:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjI0IYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 04:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjI0IY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 04:24:29 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC5D116
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 01:24:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 64DE41F894;
        Wed, 27 Sep 2023 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695803066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sny89avrzVvv1wsoPIvqcA5GqHDt5O2Qljnzs7gXSao=;
        b=rgX7s+DPwdUWQMoM1tTKlH9zxL0psnPhw1h0ykwkHx3sf2wJ7cqNoK4QCyYJbynsWz70gc
        fEJek5JGOn/TBIsQmv1sO/l9QbontBinF9hQvtdVmZCshRMyrVIfqEWjuZYqphKD80paVm
        Yuww8omLlBMTLdbeJRO87p90Dr+970A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695803066;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sny89avrzVvv1wsoPIvqcA5GqHDt5O2Qljnzs7gXSao=;
        b=D0/g+Zx+lMxFLuH6yREMW3Ft8nDnlNs+0T1yH87z4L5suuF4csL1Csf4advXYUCDVIVxaF
        7S+0UyFJNCtOJICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CE8B13479;
        Wed, 27 Sep 2023 08:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kjtEDbrmE2VnZwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 27 Sep 2023 08:24:26 +0000
Date:   Wed, 27 Sep 2023 10:24:25 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230927102425.616feeb8@endymion.delvare>
In-Reply-To: <20230926212720.adcn42akrnj72oxl@zenone.zhora.eu>
References: <20230926133725.5c3fb96e@endymion.delvare>
        <20230926212720.adcn42akrnj72oxl@zenone.zhora.eu>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On Tue, 26 Sep 2023 23:27:20 +0200, Andi Shyti wrote:
> On Tue, Sep 26, 2023 at 01:37:25PM +0200, Jean Delvare wrote:
> > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > written at a time when the i2c core did not support muxing. They are
> > essentially board-specific hacks. If we had to add support for these
> > boards today, we would implement it in a completely different way.
> > 
> > These Tyan server boards are 18 years old by now, so I very much doubt
> > any of these is still running today. So let's just drop this clumsy
> > code. If anyone really still needs this support and complains, I'll
> > rewrite it in a proper way on top of i2c-mux.  
> 
> do you have such devices?

I don't. If I did, I would have written proper muxing code for them
long ago.

> I'm somewhat conflicted, on one hand I like the cleanup. But on
> the other I think that they don't do any harm if they stay where
> they are.

Every piece of code which lives in the kernel tree has a maintenance
cost. As a matter of fact, these 2 "drivers" were affected by 6
tree-wide or subsystem-wide changes over the last 14 years. No actual
driver-specific change was applied during that period of time.

Currently these "drivers" also cause build-time warnings (with W=1),
which Nick understandably wanted to clear, and this is even the reason
why I looked into that and wrote this removal patch.

> There are lots of drivers that look outdated and need
> maintenance, we can't just remove them... right?

Actually we can, and should, if we suspect there are no users left.
There's absolutely no reason to spend time maintaining and building old
drivers which have no users left. Unused drivers also take disk space
and network bandwidth world-wide, and represent an additional attack
surface from a security perspective.

-- 
Jean Delvare
SUSE L3 Support
