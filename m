Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34F79016B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 19:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350370AbjIAR06 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 13:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjIAR05 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 13:26:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ED6E72
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 10:26:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A8D3E1F45F;
        Fri,  1 Sep 2023 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693589208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DRoV8R3gufpAfzMy0gcXpt2f02BNILAVFdVUVYBnL2U=;
        b=L6jXVk5+0MIic9uN2jiIGFoj0fHJ0uxVXp48XURC4gB6EbhhZYphJEOAB5e6VBuIZnC0yI
        VrHGc/n5yZC96CX6rL5jaifBkzFTtnwNr21Us3L6zA0+cH8+wPvjPNXKLJf4p5QdN562CM
        4LgxMX1Xt5R4WmE9e50qVkMYtZQy890=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693589208;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DRoV8R3gufpAfzMy0gcXpt2f02BNILAVFdVUVYBnL2U=;
        b=C3U1kHBIaauZQZBtwj/FQpzvfk7aopxg0SnChlvzgQEpPtMlmLi2Z2Wno65rhWq3qlGYCY
        34s3zKaKK0+UFdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BCDD1358B;
        Fri,  1 Sep 2023 17:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YcGPHNge8mRfNgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 17:26:48 +0000
Date:   Fri, 1 Sep 2023 19:26:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230901192646.3706a36c@endymion.delvare>
In-Reply-To: <d392cf3a-a029-2cd6-44e6-a98f57d42b5f@gmail.com>
References: <679ddcf8-b03d-15eb-e914-bdbaa3f5b890@gmail.com>
        <20230901184455.54effcea@endymion.delvare>
        <d392cf3a-a029-2cd6-44e6-a98f57d42b5f@gmail.com>
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

On Fri, 1 Sep 2023 19:02:13 +0200, Heiner Kallweit wrote:
> On 01.09.2023 18:44, Jean Delvare wrote:
> > Hi Heiner,
> > 
> > On Tue, 29 Aug 2023 08:25:23 +0200, Heiner Kallweit wrote:  
> >> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> >> receiving the last byte. If we get e.g. preempted before setting
> >> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> >> before SMBHSTCNT_LAST_BYTE is set.
> >> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> >> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> >> is also consistent with what we do in i801_isr_byte_done().
> >>
> >> Fixes: efa3cb15ad8b ("i2c-i801: Refactor use of LAST_BYTE in i801_block_transaction_byte_by_byte")  
> > 
> > I don't think this is true. This patch refactored the code but didn't
> > change the logic. The bug existed before already. As far as I see, the
> > race condition already existed when the kernel switched to git, so
> > there's no point in having a Fixes statement.
>
> Shall we go with the patch as-is or do you think it's better to resubmit
> w/o the Fixes tag?

Please resubmit, for the sake of correctness and to be fair to Daniel.

-- 
Jean Delvare
SUSE L3 Support
