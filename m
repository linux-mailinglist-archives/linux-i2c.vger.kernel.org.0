Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8388049829F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 15:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiAXOmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 09:42:46 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:53180 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiAXOmp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 09:42:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5699C1F38F;
        Mon, 24 Jan 2022 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643035364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PjucltyTeZIEfgxlu1adOfMKsIItrmd8atzRbUUtBsE=;
        b=znfolM5/ozitBq3bzSTQsZTq5nhKEksSDQMnkqSs1aOY9wFvMfoS6/aMSF1XTyKxsJuEIx
        JAI0GhTuTcy6HsqUIXPZE2ZEOrH9aJp0/sdEqUcHVZOxUWKNjjQLBBjj0bXV/woUQheBpQ
        ZCSiZ+n4yoE4jhxRDZ4z8Zu3vqA6Dyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643035364;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PjucltyTeZIEfgxlu1adOfMKsIItrmd8atzRbUUtBsE=;
        b=ilbuAbB34OBOb4u2RDtMB1isyqXg8zmfNtFhOtYaXhO9/j1d8qICDLW3kJELtgzZVRkeCz
        N1uq9FxbI3mHpPAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9572713BA5;
        Mon, 24 Jan 2022 14:42:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 1oMQIuO67mG6fwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 24 Jan 2022 14:42:43 +0000
Date:   Mon, 24 Jan 2022 15:42:42 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <20220124154242.125472b4@endymion>
In-Reply-To: <20220118202234.410555-1-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 14:22:30 -0600, Terry Bowman wrote:
> Terry Bowman (4):
>   Watchdog: sp5100_tco: Move timer initialization into function
>   Watchdog: sp5100_tco: Refactor MMIO base address initialization
>   Watchdog: sp5100_tco: Add initialization using EFCH MMIO
>   Watchdog: sp5100_tco: Enable Family 17h+ CPUs
> 
>  drivers/watchdog/sp5100_tco.c | 335 ++++++++++++++++++++++------------
>  drivers/watchdog/sp5100_tco.h |   6 +
>  2 files changed, 227 insertions(+), 114 deletions(-)

FWIW, I tested this patch series successfully on my AMD Ryzen 7 PRO
3700U-based laptop.

-- 
Jean Delvare
SUSE L3 Support
