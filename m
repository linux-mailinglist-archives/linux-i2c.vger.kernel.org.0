Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050D06F2555
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Apr 2023 18:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjD2QGj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Apr 2023 12:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjD2QGi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Apr 2023 12:06:38 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D4919B4
        for <linux-i2c@vger.kernel.org>; Sat, 29 Apr 2023 09:06:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2A66921D66;
        Sat, 29 Apr 2023 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682784396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pEfq0VVD4xfZaz1e85/GzHvMOLkZI0PJ2efY8nMUg40=;
        b=JXvfPKsm5oFEkU6gSU09bpj0/FdulwK47FiyuKTnD5B3JQ15rdqWIO899At5oQDtRyKNvR
        6FQNnDOAlbnuUPfnETESvRIjphb4RDf2JJBwJdd/XSC1rt8e0DffbcUxwIGms6cxtr4BUL
        4FQORITdOTfz+nJVPIMygc52wFVYGU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682784396;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pEfq0VVD4xfZaz1e85/GzHvMOLkZI0PJ2efY8nMUg40=;
        b=9P7qcwXg0/p9h+mWYW+iB9Xyf1lVE0j/SrPYk99T5CHqG5lm9eG/qWHPFd+43KIluT/Cmw
        ATq8mF8vATdK0kAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0286A13587;
        Sat, 29 Apr 2023 16:06:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sG16OotATWSDGgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sat, 29 Apr 2023 16:06:35 +0000
Date:   Sat, 29 Apr 2023 18:06:34 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     =?UTF-8?B?SmVhbi1GcmFuw6dvaXM=?= Roy <jf@devklog.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [ee1004] Failed to select page 0 - G.Skill Trident Z5 NEO DDR5,
 ASUS X670E board - 6.2.11-arch1-1
Message-ID: <20230429180634.7f94b29e@endymion.delvare>
In-Reply-To: <20230429171522.05c671f8@endymion.delvare>
References: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
        <ZEISllc9y2bot/ZT@ninjato>
        <20230429171522.05c671f8@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 29 Apr 2023 17:15:22 +0200, Jean Delvare wrote:
> I took a quick look on jedec.org in search for information and found
> JESD400-5A which covers SPD contents for DDR5 and it enumerates 1024
> bytes. This is twice as much as what EE1004 EEPROMs can hold, so DDR5
> modules are definitely not using EE1004 EEPROMs. So far I couldn't find
> the "equivalent" of EE1004 for DDR5 modules so far.

Found it, it is named "SPD5118 Hub and Serial Presence Detect Device
Standard" and is published by Jedec under reference JESD300-5B. That's
a 126-page document. In comparison, the EE1004 specification was
35-page long.

So I expect there will be a lot of work to get it to work. And I don't
own a DDR5-based system yet, so I can't even test.

-- 
Jean Delvare
SUSE L3 Support
