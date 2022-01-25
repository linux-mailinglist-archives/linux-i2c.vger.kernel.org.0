Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7E949B91D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 17:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1585890AbiAYQpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 11:45:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:39300 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1584416AbiAYQjG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 11:39:06 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 10F7E1F381;
        Tue, 25 Jan 2022 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643128742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8rtmaWBIZkB4evzRWl/a+elxNpDHBMDViK3dm7DyrXY=;
        b=jxCcb+UNxJm3RN5zJlC+KAxIvdePBPr0TyxuVat1JdtTU21NDpEz0xd3jvyemLmDF9Com+
        oESd2xPq40JT5HDgw2pwGRLpcJR7w8QVzzXuP60WyuXDQB4joWg+llMgEdhgQGhm2FIwdK
        yMsRsFnZGWjfdKKPCoS+cMpBkC+P9sE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643128742;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8rtmaWBIZkB4evzRWl/a+elxNpDHBMDViK3dm7DyrXY=;
        b=X8KDMnPUGIm1FS5WM8OLQ2cGYl9Jd+wwiQpg86/UnAgxr49UA840E/z1Q5bU8sqL9ga7mY
        gMgfPHMaMTmzhPAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CD4513E4B;
        Tue, 25 Jan 2022 16:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id hCxwDKUn8GGzOQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 16:39:01 +0000
Date:   Tue, 25 Jan 2022 17:38:57 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <20220125173857.1c85fddc@endymion>
In-Reply-To: <a55ca093-d8d1-6821-1cb9-18343c6f1fd0@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-3-terry.bowman@amd.com>
        <20220125144520.17a220bc@endymion>
        <a55ca093-d8d1-6821-1cb9-18343c6f1fd0@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 25 Jan 2022 09:18:59 -0600, Terry Bowman wrote:
> On 1/25/22 7:45 AM, Jean Delvare wrote:
> > On Tue, 18 Jan 2022 14:22:32 -0600, Terry Bowman wrote:  
> >> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
> >> +				     u32 mmio_addr,
> >> +				     const char *dev_name)
> >> +{
> >> +	struct device *dev = tco->wdd.parent;
> >> +	int ret = 0;
> >> +
> >> +	if (!mmio_addr)
> >> +		return -ENOMEM;  
> > 
> > Can this actually happen? If it does, is -ENOMEM really the best error
> > value?
> 
> This can happen if mmio_addr is not assigned in sp5100_tco_setupdevice_mmio() 
> before calling sp5100_tco_prepare_base() and __sp5100_tco_prepare_base().

Ah yes, I can see it now.

> I can move the NULL check out of __sp5100_tco_prepare_base() and into
> sp5100_tco_prepare_base() before calling __sp5100_tco_prepare_base().
> As you describe below.
> 
> The ENOMEM return value should be interpreted as the mmio_addr is not 
> available. EBUSY does not describe the failure correctly because EBUSY 
> implies the resource is present and normally available but not available 
> at this time. Do you have a return value preference ?

Well, if one mmio_addr isn't set, you shouldn't call
__sp5100_tco_prepare_base() for it so there's no error to return. If
neither mmio_addr is set then the hardware is simply not configured to
be used, so that would be a -NODEV returned by
sp5100_tco_prepare_base() I suppose?

BTW...
 
> >> (...)
> >> +	if (ret)
> >> +		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
> >> +			mmio_addr, alt_mmio_addr, ret);  

... I think that should be a "or" rather than "and", and singular
"region", in this error message? I mean, the plan was never to
reserve-map both of them, if I understand correctly.

-- 
Jean Delvare
SUSE L3 Support
