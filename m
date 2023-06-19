Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C38A7359C2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 16:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjFSOh2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 10:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjFSOh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 10:37:26 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B3E10F4
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 07:37:06 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 12E831F7AB;
        Mon, 19 Jun 2023 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687185425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8DtRkzicY9tQ/mg2u/HimZ72tYJMfRk6GKRLIT10h0Y=;
        b=ue0qwUqKvWKl4CSgO342OCljqfKXhX/AIuZ31Y34e7GIA9c19QcjJhFYkHMjIPOCgFKqci
        2jMxVzq8eSvyaEuLFplCJfjmnJ4ix47EhwuqwGn/BwxP7gKutfNWflnIsfK6Lh7RBCRjAY
        SRWvzRa/PkqFPEXqHZzqTztXM//8z6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687185425;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8DtRkzicY9tQ/mg2u/HimZ72tYJMfRk6GKRLIT10h0Y=;
        b=7sVcVOI15YhLnsej8h4HPGyNGlqo23XItBpzP+nfwp2qyQr8M+3JkJW0K8NR9BEtyBSN4u
        N2KtKwY5ZywIvDDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF1FE139C2;
        Mon, 19 Jun 2023 14:37:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id DP/0NBBokGRbKAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 19 Jun 2023 14:37:04 +0000
Date:   Mon, 19 Jun 2023 16:37:03 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Paul Wise <pabs3@bonedaddy.net>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] i2cdetect: add messages for errors during
 bus listing
Message-ID: <20230619163703.209d3b18@endymion.delvare>
In-Reply-To: <ZIoxmbo9Cu+bPHsF@shikoro>
References: <20230526002445.57064-1-pabs3@bonedaddy.net>
        <ZIoxmbo9Cu+bPHsF@shikoro>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

Hi Wolfram, Paul,

First of all, sorry for not replying earlier to the v1 of this patch.

On Wed, 14 Jun 2023 23:31:05 +0200, Wolfram Sang wrote:
> Hi Paul,
> 
> thank you for this patch!
> 
> > This makes it easier for new users to understand what is going on when
> > they have a problem listing i2c busses that they do not understand.  
> 
> I like this basically. I do have questions, though.

I don't like it.

I don't think this is the purpose of i2c tools, which are very
specific, to tell the user how to perform generic system administration
tasks. If /proc or /sys is not mounted then you are facing a much
bigger problem than i2cdetect not working. Basically your system is
close to unusable, and this is completely unrelated to i2c-tools. I
can't even think of a realistic situation where these new error
messages would show up. So this is dead code to me.

Plus, manually mounting sysfs or procfs may solve your immediate
problem, but it is most certainly not the proper way to fix your
system. So this isn't even good advice.

The other thing this patch is doing is telling about missing i2c-dev.
Now this is something that can actually happen, and will happen. I
actually have an item about that on my todo list for over a decade now.
So I'm fine with that part, even though I think the proposed
implementation is too complex (I wouldn't bother checking if there are
i2c buses on the system).

However maybe we could be even more user-friendly. Considering that you
must be root to run these tools, and these tools can't work without
i2c-dev, I think we should simply load the i2c-dev module automatically
as needed. Either with a simple system("modprobe i2c-dev") call, or
maybe using libkmod if it has a public API (not sure).

-- 
Jean Delvare
SUSE L3 Support
