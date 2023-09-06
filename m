Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61727936DC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 10:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjIFIIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 04:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjIFIIR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 04:08:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70243E79
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 01:07:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3909E2029B;
        Wed,  6 Sep 2023 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693987626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=02cyOWpXzHY8q5tFXxZaLLYXF5EBAhHRZBEhQ3SRE44=;
        b=UhGMjjjJwMbaxR2VcaCteigUWjWIENjJ+YISOetcszJrsWh0r4GhWqtmPLG9RWH/Egkpk2
        hKmo+cM+QLstNtA1dr9XG/QR0U/tpgnM2+6M+ONV3bk7uusRj47FYQRIv0gpAFL2qMSgs7
        bz8lec7x7xxXbyA/3GYFikX8EEUJ40M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693987626;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=02cyOWpXzHY8q5tFXxZaLLYXF5EBAhHRZBEhQ3SRE44=;
        b=/h3E/Xggj7/pX88HJrN6ItNTldAAj+x2rzNuomnlJLXWFn+RWbNyuJKs9A5MmEo7hsX8vl
        Va2BQQgUL4j8OwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BE231346C;
        Wed,  6 Sep 2023 08:07:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id rxxXASoz+GQTWwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 06 Sep 2023 08:07:06 +0000
Date:   Wed, 6 Sep 2023 10:07:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230906100704.3e581f9c@endymion.delvare>
In-Reply-To: <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
        <20230905101243.39920fe5@endymion.delvare>
        <20230905091155.h3oezdj5g6z5jpxu@zenone.zhora.eu>
        <5838f7e4-dd08-48eb-2f9c-df45daa0214a@gmail.com>
        <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
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

On Wed, 6 Sep 2023 00:59:22 +0200, Andi Shyti wrote:
> On Tue, Sep 05, 2023 at 01:35:10PM +0200, Heiner Kallweit wrote:
> > On 05.09.2023 11:11, Andi Shyti wrote:  
> > > On Tue, Sep 05, 2023 at 10:12:43AM +0200, Jean Delvare wrote:  
> > >> On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:  
> > >>> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> > >>> receiving the last byte. If we get e.g. preempted before setting
> > >>> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> > >>> before SMBHSTCNT_LAST_BYTE is set.
> > >>> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> > >>> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> > >>> is also consistent with what we do in i801_isr_byte_done().
> > >>>
> > >>> Reported-by: Jean Delvare <jdelvare@suse.com>  
> > >>
> > >> Note for Wolfram: checkpatch says we should insert here:
> > >>
> > >> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/  
> > > 
> > > does this also need a Fixes: tag? I tried to check it, but there
> > > was an intricate jungle of commits in these lines.
> > >   
> > Quoting Jean from previous communication about this patch:
> > As far as I see, the race condition already existed when the kernel
> > switched to git, so there's no point in having a Fixes statement.  
> 
> true... I forgot about this comment.
> 
> Anyway I think that this should, then, go to all the stable
> kernels and I believe that without the Fixes tag this will never
> be picked up.
> 
> Maybe Greg can advise here.
> 
> Would you mind resending this patch Cc'eing the stable kernel and
> adding a note after the '---'?

Again, no. This is a theoretical bug, that was discovered by code
inspection. It's been present in the driver for over 20 years and we
have no evidence that anyone ever hit it.

Furthermore, it only happens if the driver is in polling mode, which is
uncommon, and only for block transactions, and only when the block
buffer isn't used. And then the only negative effect of the bug is to
shift the internal register pointer by 1. So it would only ever be a
problem if someone mixes block reads and immediate byte reads on the
same device. That's a very uncommon usage model. That's definitely not
"a real bug that bothers people".

Not every fix needs to go to stable. In this case, our engineering time
is better used elsewhere.

-- 
Jean Delvare
SUSE L3 Support
