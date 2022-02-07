Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBD84ABF7E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386962AbiBGNTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446823AbiBGMoV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:44:21 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF55C0401DA;
        Mon,  7 Feb 2022 04:44:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 85E26210FA;
        Mon,  7 Feb 2022 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644237858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=REWCo4WyXqeggxlaQoc81Z4br+c6dPKsB4gSuuK5a8s=;
        b=MNQOcYiQ53o6zEK8Lc1m4mw9C6G14uAiy47KM0MqG0ye9B82f7xDvHneHXV3JfqHdRqNxt
        HVIaFh+Iw13hiJ+6YgTNex5CM610q2JgC4WvW66CzSqbQ+ypFqV9XAoxMMU9Ws9Y8wM2TW
        /12zf2YrSTPnlc5H+4w0mU1YBeO1idI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644237858;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=REWCo4WyXqeggxlaQoc81Z4br+c6dPKsB4gSuuK5a8s=;
        b=K2P7SDskUm/1d2WOVLh3wZ975jizBirt8lNG5kSdDCFQxfOD2K53K2lSDQN9BMFYZFHrd8
        h7UU/o6AheZG3NAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0AA213BF5;
        Mon,  7 Feb 2022 12:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6Hy8OCEUAWKqCgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 07 Feb 2022 12:44:17 +0000
Date:   Mon, 7 Feb 2022 13:44:16 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <20220207134416.72c22504@endymion.delvare>
In-Reply-To: <20220130191225.303115-1-terry.bowman@amd.com>
References: <20220130191225.303115-1-terry.bowman@amd.com>
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

Hi Terry,

On Sun, 30 Jan 2022 13:12:21 -0600, Terry Bowman wrote:
> Please confirm to leave your reviewed-by and tested-by.

Confirmed. I reviewed the 4 patches of this version of the series and
I'm fine with them. I also tested the result successfully on my laptop.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

Thanks for your work.

-- 
Jean Delvare
SUSE L3 Support
