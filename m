Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9332D49B43D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 13:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351453AbiAYMp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 07:45:29 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34030 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453058AbiAYMmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 07:42:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B63912190B;
        Tue, 25 Jan 2022 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643114546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L4S5NdclChYm+37M35o9nCi399I97TtP6PnVsYu3Luo=;
        b=cn6UKb3+e3xOuCyZLA/JXbztoZ72fKvqnARMBeFm2LtB8oSaRdQv5F908O1I2wDf08gzxH
        /EizippsU7g68gIdlikKFU6XCnO10lc4UDum7s7w+82iI2zAcbhls18YG/70VMM7hsHTqC
        q6jErn1qXfNvaX9Fpod+HsGZAGkz6LE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643114546;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L4S5NdclChYm+37M35o9nCi399I97TtP6PnVsYu3Luo=;
        b=Nn+awNBnaWa92hfYNULDfUwjRuQtUW6Kaii9n2zm2cONe5JlxQeX88E7Ei2skQsvvUC534
        QneO9FDOr/95mNBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01BBC13DDC;
        Tue, 25 Jan 2022 12:42:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GmGoOTHw72E5NAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 12:42:25 +0000
Date:   Tue, 25 Jan 2022 13:42:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v3 3/4] Watchdog: sp5100_tco: Add initialization using
 EFCH MMIO
Message-ID: <20220125134224.233b1f80@endymion>
In-Reply-To: <2b6c9dbb-08c9-e28e-a18c-89f215567c7b@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-4-terry.bowman@amd.com>
        <20220124183651.62d5a97d@endymion>
        <2b6c9dbb-08c9-e28e-a18c-89f215567c7b@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 Jan 2022 16:36:33 -0600, Terry Bowman wrote:
> Is your "Tested-by" for patch 3/4 or the sp5100_tco series?

For the whole series actually, I only tested with all patches applied,
not the individual patches.

-- 
Jean Delvare
SUSE L3 Support
