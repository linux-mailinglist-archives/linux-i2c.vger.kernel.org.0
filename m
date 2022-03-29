Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A524EAD1E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Mar 2022 14:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiC2M23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 08:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbiC2M22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 08:28:28 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100C14D9D7;
        Tue, 29 Mar 2022 05:26:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AD714210FD;
        Tue, 29 Mar 2022 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1648556803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GHCym1FAfk584NsBbZrS25WXA0fFraZHorF91Z4iPvM=;
        b=ASediyECI19f//wM1oXpm6I2b+9U65HF9mqs1lX3VAaIC85MNereMsnIDLw5YjjjUB2Jlm
        l7q28MaBy3X9NJH+i7oySHQ0xlkitEb1glicBEzuVIUOBtSqaYNu8IRF8pRp6EmkoMUUbo
        y5Fp1q3wjyFIXty7vC9lLMUeybaGpLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1648556803;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GHCym1FAfk584NsBbZrS25WXA0fFraZHorF91Z4iPvM=;
        b=qAguEPr7+9CTLyj/+Fh9mGF4gyppAwvriarmrAxPsvcYg1hAaBa12CZcK7rN4bOoG/U09t
        Znh21U7xO0EXE5Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50A3513A7E;
        Tue, 29 Mar 2022 12:26:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id PkZPEQP7QmIGHgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 29 Mar 2022 12:26:43 +0000
Date:   Tue, 29 Mar 2022 14:26:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PULL REQUEST] i2c for v5.18
Message-ID: <20220329142642.11692e8f@endymion.delvare>
In-Reply-To: <YkIF9OqbZQ8yinz8@ninjato>
References: <Yj19RH3qpzQsIV/O@shikoro>
        <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
        <YkIF9OqbZQ8yinz8@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Linus, Wolfram,

On Mon, 28 Mar 2022 21:01:08 +0200, Wolfram Sang wrote:
> On Sat, Mar 26, 2022 at 12:58:36PM -0700, Linus Torvalds wrote:
> > It feels odd/wrong to use the piix4 driver for the AMD MMIO case on SB800.
> > 
> > Would it not have made more sense to just make that a separate driver?
> > 
> > It feels like now the piix4 driver has a lot of "if SB800" for the
> > probing code, and then a lot of "if (mmio)" at runtime.
> > 
> > I've pulled this, but just wanted to mention this "that looks a bit
> > odd". How much code is actually _shared_ in the SB800 case?
> > 
> > I'm not insisting on splitting this up - maybe it all makes sense. I'm
> > just questioning it.  
> 
> Adding Jean to CC, he maintains the PC-style drivers.

Well, that's a legitimate question, that I asked myself before many
times to be honest.

To understand why things are the way they are, you have to dig through
the history of the driver. Originally it was a driver for Intel
chipsets (82371 aka PIIX4, then 82443 aka 440BX). Then support was
added for various clones (Victory66 and several ServerWorks chipsets)
which were fully compatible (modulo the srvrworks_csb5_delay quirk).

Then ATI came with compatible chipsets as well (IXP200, IXP300 and
IXP400). These were still very similar to the original Intel design,
with a single SMBus controller driving a single SMBus port. So far so
good.

Where things started diverging is with the ATI SB700, which introduced
a second SMBus controller. Then came the ATI SB800, which introduced a
4-port multiplexer on top of the main SMBus controller. Then AMD bought
ATI and the new chipsets came with new PCI device IDs and a slightly
different configuration procedure, plus a potential conflict with the
IMC which require extra care. The move of the latest AMD chipsets to
MMIO is only one more diverging step in this list.

The reason why I find a driver split difficult is because there's no
clear line where to cut. We could have a driver with MMIO support and
one without, as suggested by Linus. But we could also move the line and
have a driver with multiplexer + MMIO support, and one with neither
[1]. Or a driver with aux port + multiplexer + MMIO support, and one
with neither. None of these cuts is obviously "the good one", they are
all pretty arbitrary.

In all cases, that's going to duplicate a fair amount of code, as the
SMBus block itself is still exactly the same. So at least
piix4_transaction(), piix4_access(), piix4_add_adapter() and
piix4_func() would be needed by both drivers. If we don't want to
duplicate the code, we'd have to create a shared module that both
drivers would rely on. While a clean design, it does not really go in
the direction of simplification.

If we split on MMIO support then the amount of duplicated (or shared)
code would be even larger, as it would also include support of the aux
port, multiplexing and IMC conflict workaround.

The real question here is, what do we win by having 2 drivers? We better
win something, because that's a large amount of work, and renaming a
driver can make life difficult for downstream (it breaks blacklisting,
preset module parameters, requires kernel configuration and packaging
adjustments, etc). And a split is even worse than a rename, as some of
these changes then become conditional.

In the end, the only benefit I can see is a reduced memory footprint on
old systems, which could use the "simple" driver which would be very
close to what the i2c-piix4 driver looked like 15 years ago. I don't
think that's a goal worth pursuing though, as the number of users of
these old chipsets must very small by now.

On the other hand, the benefit for the users of recent hardware is
marginal, as removing support for the oldest chipsets from the current
driver wouldn't remove much code in the end. A rough estimation would
be between 50 and 100 lines removed, which for a 1159-line driver isn't
really meaningful.

Plus, from a maintenance perspective, two drivers instead of one will
automatically mean more work (maybe not much, but still).

And this is how I came to the conclusion that, despite the weird
feeling that there are too many conditionals in the i2c-piix4 driver,
there's nothing smart that can be done to get rid of them, and we just
have to live with them.

[1] That would put the support of the SB700 in one driver, and the
support of the SB800 in another, while they share the same PCI device
ID (but with a different revision range). So both drivers would load on
such systems by default, wasting memory.

-- 
Jean Delvare
SUSE L3 Support
7
