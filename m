Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A7879010B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 19:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbjIARD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 13:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjIARD5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 13:03:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7514210F2
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 10:03:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 30E5F1F853;
        Fri,  1 Sep 2023 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693587833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9GagGRztP1T820hQctp2gZEuFFiWxTmDDCxtH5A4stY=;
        b=ldkiK20Acr0LYaoHhgSeFQZ+Qat22kxQY//5ly0PfcrJqzt8Lc4oJXPTU1c5ck6LVH4wOT
        OTEuCNYoLCfL2tMoDIM9qE1pG5H370lRW5ZQoTkFaq9ekd+zjmIr//FoapDc6L+QQh14pZ
        7xHKUjtdGSwAfNp1fexizoNxS2fOWaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693587833;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9GagGRztP1T820hQctp2gZEuFFiWxTmDDCxtH5A4stY=;
        b=sI/KRgGRyMsk1K4ar7Zkgc05YQiAvIAkimxoqVJbK2236Mo08h6fBye2S6MFCdaLgRCKl7
        kQ5AW3u20qA2CNDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0409A1358B;
        Fri,  1 Sep 2023 17:03:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +Lv7OXgZ8mRyLAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 17:03:52 +0000
Date:   Fri, 1 Sep 2023 19:03:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: fix cleanup code in remove() and error path
 of probe()
Message-ID: <20230901190351.2bd3b346@endymion.delvare>
In-Reply-To: <dd6c9ddd-da76-ae6d-5903-e945cf950969@gmail.com>
References: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
        <20230901141929.640fc5d5@endymion.delvare>
        <dd6c9ddd-da76-ae6d-5903-e945cf950969@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 1 Sep 2023 14:41:38 +0200, Heiner Kallweit wrote:
> On 01.09.2023 14:19, Jean Delvare wrote:
> > On Sun, 27 Aug 2023 22:26:05 +0200, Heiner Kallweit wrote:  
> >> Jean pointed out that the referenced patch resulted in the remove()
> >> path not having the reverse order of calls in probe(). I think there's
> >> more to be done to ensure proper cleanup.
> >> Especially cleanup in the probe() error path has to be extended.
> >> Not every step there may be strictly needed, but it's in line with
> >> remove() now.
> >>
> >> Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")  
> > 
> > I think it also fixes 9424693035a5 ("i2c: i801: Create iTCO device on
> > newer Intel PCHs").
> 
> Right. We should add this, even though this fix won't apply cleanly
> on some older kernel versions. I think we'll need separate patches for these
> LTS kernel versions.

Our task is to annotate the commit message with the dependency
information. Whether or not people want to backport the fix to a given
kernel is their decision.

Personally I wouldn't bother backporting this to stable kernels, as it's
not "a real bug that bothers people", to quote
Documentation/process/stable-kernel-rules.rst.

> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-i801.c | 14 ++++++++------
> >>  1 file changed, 8 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >> index 73ae06432..7a0ccc584 100644
> >> --- a/drivers/i2c/busses/i2c-i801.c
> >> +++ b/drivers/i2c/busses/i2c-i801.c
> >> @@ -1754,6 +1754,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>  		"SMBus I801 adapter at %04lx", priv->smba);
> >>  	err = i2c_add_adapter(&priv->adapter);
> >>  	if (err) {
> >> +		platform_device_unregister(priv->tco_pdev);
> >> +		outb_p(priv->original_hstcnt, SMBHSTCNT(priv));  
> > 
> > Doesn't seem to be needed, as I can't see SMBHSTCNT being written to
> > during probe?
> >   
> Right, this is what I was referring to in the commit message when saying
> "not every step may be strictly needed". Restoring SMBHSTCNT isn't needed

Oh right, missed that, sorry.

> here, but it makes cleanup in the probe error path the same as in remove
> and therefore may improve readability and maintainability.
> But I don't insist on it and don't have a strong opinion.

I think it would make sense to omit it from the probe error path (to
make it clear it's not needed there) and move it at the end of
i801_remove() and i801_shutdown(). That way the probe error path is
still a subset of the remove and shutdown paths and I think this solves
the maintainability issue. Would that be OK with you?

-- 
Jean Delvare
SUSE L3 Support
