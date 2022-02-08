Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70DA54ADB0F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378108AbiBHOUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378140AbiBHOUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:20:30 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B8CC03FED2;
        Tue,  8 Feb 2022 06:20:29 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 74D0B210F6;
        Tue,  8 Feb 2022 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644330028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4WJJhP7jK0DOQJQHtTPx5EKq+DTMvkwZuP4aNJjiaLw=;
        b=OmWrblqdPiugw9YHUSDri6EPj9V5dG5thraHw1pYjL02hVWsJnvtcxjcmpTPtaaPKLkzGJ
        AFfo9yT3fn9o2OXs6e+cnrMiIjteYbnxLO52Y5XGK++KwNqwID7vj1Ro7IDzZLYnlJX6i9
        Id6c0c2HXRYZd1xzXY9wJZE5ckHJ0Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644330028;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4WJJhP7jK0DOQJQHtTPx5EKq+DTMvkwZuP4aNJjiaLw=;
        b=TZqH/rbrNg8iqMzfqld1VwhzWyENulmGhmXa1niWC3JcjL9iJoPZ5owP1LuKxe8n4ThGzS
        ORoCGEDbUcPvb0Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E441113C79;
        Tue,  8 Feb 2022 14:20:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IcMaNit8AmKmfgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 14:20:27 +0000
Date:   Tue, 8 Feb 2022 15:20:25 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <20220208152025.00d8e7ec@endymion.delvare>
In-Reply-To: <YgI/P754rQyA9bpM@ninjato>
References: <20220130191225.303115-1-terry.bowman@amd.com>
        <20220207134416.72c22504@endymion.delvare>
        <YgEYjOwoxtbkBdfq@shikoro>
        <20220208104535.468198f0@endymion.delvare>
        <YgI/P754rQyA9bpM@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Feb 2022 11:00:31 +0100, Wolfram Sang wrote:
> > I'm still reviewing these, sorry. I only picked the first patch of the
> > series so that the sp5100_tco patches would build so I could test them.  
> 
> Ah, I see. I thought more than the first patch was needed for testing.

You need the full series to be on the safe side, otherwise there's a
risk that the two drivers will access the same registers using
different methods (legacy I/O vs MMIO) so there's no synchronization
and they could step on each other's toes.

However as I knew about this limitation, I was careful to not use the
SMBus driver while I was testing the watchdog driver :-)

-- 
Jean Delvare
SUSE L3 Support
