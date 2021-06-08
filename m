Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED6939F66A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 14:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhFHMYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 08:24:06 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41226 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbhFHMYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 08:24:05 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1A8531FD2A;
        Tue,  8 Jun 2021 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623154932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xlvttj5juPRcCGmuxcN2NqahzfXUE80nEbCgRSx6Tzs=;
        b=jF2YytS2Z9UihgNFqK4jbRkxSGeUpg/V1gBVZKJdyRX9UG24lkghVTp4XLM6jM0cGFVxV2
        UNf2gKO0jigr1rF5mLs/LPuxiivk/FBJzCSpYCvuUFiXed3z8eAo/NitKFLjisp29JzVUr
        Z0ZugEnU1jJImS9P7L97Te2s0avwiEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623154932;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xlvttj5juPRcCGmuxcN2NqahzfXUE80nEbCgRSx6Tzs=;
        b=0pPUXWOE1PNBX4loUSeBpOsIwkFePfKuQ0rOD2Jt0zMjy/MuugmZBbvwecXXP8aaCW44Zu
        +WU3tTMzdgQkmxDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id D4CA8118DD;
        Tue,  8 Jun 2021 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623154932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xlvttj5juPRcCGmuxcN2NqahzfXUE80nEbCgRSx6Tzs=;
        b=jF2YytS2Z9UihgNFqK4jbRkxSGeUpg/V1gBVZKJdyRX9UG24lkghVTp4XLM6jM0cGFVxV2
        UNf2gKO0jigr1rF5mLs/LPuxiivk/FBJzCSpYCvuUFiXed3z8eAo/NitKFLjisp29JzVUr
        Z0ZugEnU1jJImS9P7L97Te2s0avwiEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623154932;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xlvttj5juPRcCGmuxcN2NqahzfXUE80nEbCgRSx6Tzs=;
        b=0pPUXWOE1PNBX4loUSeBpOsIwkFePfKuQ0rOD2Jt0zMjy/MuugmZBbvwecXXP8aaCW44Zu
        +WU3tTMzdgQkmxDg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id mgD+MfNgv2AQQQAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 12:22:11 +0000
Date:   Tue, 8 Jun 2021 14:22:11 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210608142211.6aa9ad4f@endymion>
In-Reply-To: <YLp9Lc5Ondu3Gicg@kunai>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion>
        <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk>
        <20210413125433.GA9879@kunai>
        <20210521132158.6e0689c0@endymion>
        <YK1fwC4aR5RKTPcB@kunai>
        <20210602110332.73f9cbc1@endymion>
        <YLew8cFWTRQKrBuk@kunai>
        <20210604155708.14159db0@endymion>
        <YLp9Lc5Ondu3Gicg@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 4 Jun 2021 21:21:17 +0200, Wolfram Sang wrote:
> > If we only want *one* I2C block read at a specified offset then i2cget
> > seems more appropriate indeed.  
> 
> I don't have a clear opinion here. On the one hand, if we want just one
> block read, this is more a "get" than a "dump". On the other hand,
> i2cdump already has a range-parameter. So, from a user perspective,
> keeping i2cget to single values and update the range parameter in
> i2cdump might be least confusing?

The feature doesn't clearly fit in either tool but could be made to fit
in both ;-) Which isn't a situation I like.

I think this is really a conceptual difference. For certain devices
(like EEPROMs) I2C Block read means reading from a range of register
addresses, which is i2cdump's realm. But for other devices, I2C Block
read means reading multiple register values from a single address
(which is typically what _SMBus_ Block reads are always about, but
nothing prevents devices from using I2C Block reads for the same
purpose). Which is more like i2cget's realm.

The problem is that, depending on which device our users are working
with, they will *expect* the feature to be in one tool or the other.
And most probably won't even have the idea of trying the other. Of
course we could add a redirection note in the manual page, but users
will have wasted time already. If they read the manual page at all. And
even then, the way the data is presented could be confusing if they
need to use the "other" tool.

As a matter of fact, I have at least two more records of people asking
for this very feature without realizing it was already (partially)
available in another tool (Aleksandr Amelkin in 2015 and Gina Ko in
2019). The fact that i2cset does support Block writes (since 2011!)
when i2cget does not support Block reads is definitely confusing.

So I'm actually tempted to add the feature to *both* tools. Crestez's
patch would be the base for the i2cget implementation, to which I would
happily add SMBus block read support. For i2cdump, it's about adding
support for register range to the "i" mode. I took a quick look already
and it seems fairly trivial to implement.

Stay tuned,
-- 
Jean Delvare
SUSE L3 Support
