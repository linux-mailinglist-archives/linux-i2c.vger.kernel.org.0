Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97546777BE3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 17:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236046AbjHJPNQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 11:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236047AbjHJPNN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 11:13:13 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9002694;
        Thu, 10 Aug 2023 08:13:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F18701F74B;
        Thu, 10 Aug 2023 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1691680390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gt5T9KAX6h0xqCfiUcP6I8u8wZkJ21yXv35iTl4Gtdk=;
        b=Ap8G5lRCd2wrOy6xvgHmqXqWCfoS+MTJoF9k4fGqt8/bVMgNRM/h5rd6lAa89jo9l02d4M
        VxlCz/JQuhiQhdxNL5YYQufPPih2NecJDetK3i4T6B4xbKMUnJxyJpMRCJlWN8+cItVGyc
        poi7r0Qip1fH02ygYWbWF+LJjt2YFmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1691680390;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gt5T9KAX6h0xqCfiUcP6I8u8wZkJ21yXv35iTl4Gtdk=;
        b=gm+mwcTKzKMut/jWo7SFLu/BRNuvnbbvx35QJ40kTSsPvScaYMWAGm54Wado4gonb8jvGO
        xkkpFndpcFjYM/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF6EF138E2;
        Thu, 10 Aug 2023 15:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id jCg4KYb+1GSHGQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 10 Aug 2023 15:13:10 +0000
Date:   Thu, 10 Aug 2023 17:13:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c/busses: fix -Wmissing-variable-declarations
Message-ID: <20230810171308.5d5c591f@endymion.delvare>
In-Reply-To: <20230809191310.atpqztlpgdbdvc5m@intel.intel>
References: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>
        <20230809191310.atpqztlpgdbdvc5m@intel.intel>
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

Hi Andi, Nick,

On Wed, 09 Aug 2023 21:13:10 +0200, Andi Shyti wrote:
> On Tue, Aug 08, 2023 at 09:56:16AM -0700, Nick Desaulniers wrote:
> > I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> > bot spotted the following instance:
> > 
> >   drivers/i2c/busses/i2c-amd756.c:286:20: warning: no previous extern
> >   declaration for non-static variable 'amd756_smbus'
> >   [-Wmissing-variable-declarations]
> >   286 | struct i2c_adapter amd756_smbus = {
> >       |                    ^
> >   drivers/i2c/busses/i2c-amd756.c:286:1: note: declare 'static' if the
> >   variable is not intended to be used outside of this translation unit
> >   286 | struct i2c_adapter amd756_smbus = {
> >       | ^
> > 
> > This symbol is referenced by more than one translation unit, so create
> > then include the correct header for their declarations.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>  
> 
> You might want to have a Fixes tag here and
> 
> Cc: Jean Delvare <jdelvare@suse.com>

Fixes tag would cause unnecessary worry, with people backporting the
patch while it doesn't actually fix anything. No need for that.

> 
> [...]
> 
> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-amd756.h
> > @@ -0,0 +1,3 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */  
> 
> Please, leave a space here.
> 
> And you might also want to have something like:
> 
> #ifndef __I2C_AMD_756_H__
> #define __I2C_AMD_756_H__
> 
> > +#include <linux/i2c.h>  
> 
> space here.
> 
> > +extern struct i2c_adapter amd756_smbus;  
> 
> #endif /* __I2C_AMD_756_H__ */
> 
> Jean, any opinion on this patch, I don't really know this driver,
> but is there a way to avoid this extern declaration.

Thanks for your review. I would personally not bother with a header
file, this is unnecessary burden. Just add the extern declaration to
i2c-amd756.c as was already done in i2c-amd756-s4882.c. The whole thing
is a horrible hack anyway and there won't be more occurrences of it, so
the more simple it stays, the better.

Some history: I wrote the pseudo-driver i2c-amd756-s4882 when the
i2c-core did not yet support multiplexing. Nowadays, proper support
would be implemented using i2c-mux-* and i2c-amd756-s4882.c would go
away entirely. Actually, I very much doubt any of these 2007 Tyan
server boards is still in activity today, so maybe we should just
delete the driver.

Note that i2c-nforce2.c will need the same fix as struct i2c_adapter
nforce2_smbus is extern as well.

-- 
Jean Delvare
SUSE L3 Support
