Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1D37217D3
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jun 2023 16:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjFDOdp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 10:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjFDOdk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 10:33:40 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B328DE51;
        Sun,  4 Jun 2023 07:33:14 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 695511FE58;
        Sun,  4 Jun 2023 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685889106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nU5hOiG/6SgErvIMlhvC3Oo6LCYPqO1sxyBdwidDt1o=;
        b=gfNOUuj+m6RUbNDqunD46qHbvytz92jDuyuTczI9UDsY/7xcWZW1R3Z/1n4UdBFQAFdKbs
        cuESDQBN5z3pVmf+VCDBb/5Ag9BTpXOzOWH1zXCwzk1GCwGH7vOfNC/eFArUMiWq4VI6Rx
        9Ty7kQXMw3Nmglyqva9aMZ4uUTjwpDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685889106;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nU5hOiG/6SgErvIMlhvC3Oo6LCYPqO1sxyBdwidDt1o=;
        b=HkbUfmdBhRZONEG/fyQfieLXeDaMBKYlQUh7kmokYTj8lm/k/bA3JJ0hU5an6ldJCJkvSL
        sGM1W95zQncJBZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3819B139C8;
        Sun,  4 Jun 2023 14:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ejpqC1KgfGSUWwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 04 Jun 2023 14:31:46 +0000
Date:   Sun, 4 Jun 2023 16:31:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230604163144.1e6e5bef@endymion.delvare>
In-Reply-To: <20230604160132.102dd6a7@endymion.delvare>
References: <20230514103634.235917-1-mail@mariushoch.de>
        <20230523200350.62ab4788@endymion.delvare>
        <59a6a917-2a93-d52d-37f3-091295dd0db4@mariushoch.de>
        <20230604160132.102dd6a7@endymion.delvare>
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

Hi again Marius,

On Sun, 4 Jun 2023 16:01:32 +0200, Jean Delvare wrote:
> IRQ number 255 indeed looks suspicious, but I'm also not aware of this
> being a special value (nr_irqs is defined as an unsigned int, which
> suggest that large IRQ numbers, albeit unusual on desktop and laptop
> systems, are supported and frequently seen on large server systems), so
> the i2c-i801 driver has no reason to handle it in a particular way.

OK, I stand corrected. There's this interesting comment in
drivers/acpi/pci_irq.c:acpi_pci_irq_valid():

	/*
	 * On x86 irq line 0xff means "unknown" or "no connection"
	 * (PCI 3.0, Section 6.2.4, footnote on page 223).
	 */

So that's probably what you are seeing on your Dell laptop.

Unfortunately this function is static inline, so we can't call it from
the i2c-i801 driver. It's called by acpi_pci_irq_enable() but only if
(gsi < 0), which isn't the case on your system.

-- 
Jean Delvare
SUSE L3 Support
