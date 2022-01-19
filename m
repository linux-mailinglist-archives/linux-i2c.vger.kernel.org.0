Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA69D493D21
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 16:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355670AbiASPab (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 10:30:31 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:53232 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355728AbiASPaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 10:30:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 69D3D212B8;
        Wed, 19 Jan 2022 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642606214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R4gEG6X7yQYFUifkRnRfRb4n9XnU2Dqv9Tx9QyGeGGs=;
        b=htKia9XnspTqTBWTVd9JwKXUC8VYO0gESFuOWwskjnvwo7jOqaOpBqA7E+PghhrGYHKQqI
        mlhMV4NMEWstJK8Sx1q64Q1XF/nGp5H2ZtOD1yovhvkdktlPUJgtahCIrwTAjnEq0rHkLz
        9f6gnRI+Rs+EV0c0GMfHJroIJ8uAijs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642606214;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R4gEG6X7yQYFUifkRnRfRb4n9XnU2Dqv9Tx9QyGeGGs=;
        b=v+EvfFaGQrqRQrp5vQvFPWHgXoYY6OWZQty3MYXuskpBQmXvfs6rkgTHMQypjF7Hn1EvZ3
        ULoaLSedWot3OpAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9439D13E15;
        Wed, 19 Jan 2022 15:30:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9oaSIYUu6GFABwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 19 Jan 2022 15:30:13 +0000
Date:   Wed, 19 Jan 2022 16:30:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <jdelvare@suse.com>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <20220119163012.4274665d@endymion>
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

Hi Terry,

On Tue, 18 Jan 2022 14:22:30 -0600, Terry Bowman wrote:
> This series uses request_mem_region() to synchronize accesses to the MMIO
> registers mentioned above. request_mem_region() is missing the retry
> logic in the case the resource is busy. As a result, request_mem_region()
> will fail immediately if the resource is busy. The 'muxed' variant is
> needed here but request_muxed_mem_region() is not defined to use.  I will
> follow up with another patch series to define the
> request_muxed_mem_region() and use in both drivers.

Shouldn't this be done the other way around, first introducing
request_muxed_mem_region() and then using it directly in both drivers,
rather than having a temporary situation where a failure can happen?

As far as I'm concerned, the patch series you just posted are
acceptable only if request_muxed_mem_region() gets accepted too.
Otherwise we end up with the situation where a driver could randomly
fail.

-- 
Jean Delvare
SUSE L3 Support
