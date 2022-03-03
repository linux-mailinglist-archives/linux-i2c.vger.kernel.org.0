Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2175B4CC303
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 17:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiCCQly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 11:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiCCQly (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 11:41:54 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE3C132969
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 08:41:05 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1B52F218EE;
        Thu,  3 Mar 2022 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646325664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iNhLIKsKhKvDAZC7PhcdUBZBqSTk4pfrj6aL8mfONZ4=;
        b=j18HEWhwO33Lo3y7q68rHC/etSIXxeYWqTqgnLlfEDope63YUEONMPhAmNs/RtdY3OcU3/
        lt8o+3iHTo8zs5kuFT/fxbuhPtx6mJs+M0HF1St5ROTpRann7GYRZP0rjrWt2DPXdHuMAC
        l9YhuzEb/mj6D/6kJczYgyOt1kAx0Mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646325664;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iNhLIKsKhKvDAZC7PhcdUBZBqSTk4pfrj6aL8mfONZ4=;
        b=6zVc9L1RBZVL6Py8pMEG1iyBJsngVNaHLaLPYpnruXv8aECQqlhDSc2jrTN/13wRiXuUc9
        QmqnfsIMp9nZqJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2BEA13C68;
        Thu,  3 Mar 2022 16:41:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cr67NZ/vIGKnOQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 03 Mar 2022 16:41:03 +0000
Date:   Thu, 3 Mar 2022 17:41:02 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Message-ID: <20220303174102.4e6f7f30@endymion.delvare>
In-Reply-To: <Yh/d92DazP4LUp7H@ninjato>
References: <20220301172859.5593309a@endymion.delvare>
        <Yh/d92DazP4LUp7H@ninjato>
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

Hi Wolfram,

On Wed, 2 Mar 2022 22:13:27 +0100, Wolfram Sang wrote:
> On Tue, Mar 01, 2022 at 05:28:59PM +0100, Jean Delvare wrote:
> > I went all the way back to kernel 2.6.12 and that masking was never
> > needed. I suppose it was there in anticipation of software PEC
> > support, but that was never added to the driver (and never will be,
> > as this is made obsolete by hardware PEC).
> > 
> > I'm also removing initialization to 0, which is not needed either,
> > and would prevent the compiler from reporting an actual usage of
> > uninitialized variables.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>  
> 
> Applied to for-next, thanks!
> 
> Jean, there are still some patches pending for i801, mainly from Heiner
> and an interesting one from Hector. Do you have time for these?
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=&submitter=&state=&q=i801&archive=&delegate=

Yes, they are on my to-do list and not forgotten. Just I had a fairly
busy January and February. Plus I am currently investigating 2 i2c-i801
issues that have been reported to me privately, and I'd rather get them
fixed first before we continue with driver cleanups.

Stay tuned,
-- 
Jean Delvare
SUSE L3 Support
