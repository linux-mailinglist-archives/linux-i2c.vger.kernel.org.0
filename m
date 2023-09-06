Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580797940AC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 17:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242322AbjIFPrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 11:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241998AbjIFPrr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 11:47:47 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68302BC
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 08:47:42 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 256E61F459;
        Wed,  6 Sep 2023 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694015261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qj1gFrvpz5RAlpnr1VkZDQG1eu7qusQyo0s8dsojMq4=;
        b=YmEquC39gN2uQLSob8ydJT127tTClbbEJN0IWPJp1XGdNuX9S4IdwuB/afADupGVp6m6cF
        s/N773PmkTI0KgxmQayVz1GRi6otOpsE/pfsGA6gEtFTS1K2kWQ92ef0U6MXO+IcKdIyOE
        4W/mxg+WiIn5IQqYiQh5Qvybdv7lQa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694015261;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qj1gFrvpz5RAlpnr1VkZDQG1eu7qusQyo0s8dsojMq4=;
        b=Jt6sU5HsZLheJoPju9Inywwf3tKbvFVVXgrr+hxsJ8FMkrNxW2nZtfaq8rXJZuxTW/419v
        sqTR0k9kNt7ohRAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA63D1333E;
        Wed,  6 Sep 2023 15:47:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EyiVNxyf+GQ9bAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 06 Sep 2023 15:47:40 +0000
Date:   Wed, 6 Sep 2023 17:47:39 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error
 path of probe()
Message-ID: <20230906174739.499ab821@endymion.delvare>
In-Reply-To: <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
        <20230906134745.24dfa076@endymion.delvare>
        <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
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

On Wed, 6 Sep 2023 16:13:57 +0200, Andi Shyti wrote:
> On Wed, Sep 06, 2023 at 01:47:45PM +0200, Jean Delvare wrote:
> > On Sat, 02 Sep 2023 22:06:14 +0200, Heiner Kallweit wrote:  
> > > Cc: stable@vger.kernel.org  
> > 
> > I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
> > actually bothers people. Error paths are rarely taken, and driver
> > removal isn't that frequent either. Consequences are also rather
> > harmless (one-time resource leak, race condition which is quite
> > unlikely to trigger).  
> 
> we are having this same discussion in another thread: if a bug is
> unlikely to happen, doesn't mean that there is no bug. A fix is a
> fix and should be backported to stable kernels.

No. Please read:

  https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

There is clearly a list of conditions for a commit to be eligible for
stable kernel trees. It's not "every fix".

> Sometimes bugs are reported some other times bugs are discovered
> by reading the code (like in the other thread). In the latter
> case bugs are just waiting for their time of glory.

I'm not saying otherwise. But that's clearly one of the factor to
decide whether a fix should go to stable. A bug which has been reported
by a user who is affected by it is clearly a better candidate to
backport. The other factor is how bad things are if the bug happens. I
fully agree that a bug which is found by code review but would have
dramatic consequences should also have its fix backported to stable
kernel trees, even if it never happened before and is unlikely to
happen in the future.

My point is that the bugs being discussed here do not match any of
these criteria. They have not been reported, they most likely never
happened, they most likely never will, and if they would, consequences
would be pretty benign.

-- 
Jean Delvare
SUSE L3 Support
