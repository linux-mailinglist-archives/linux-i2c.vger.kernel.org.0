Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7C639BA62
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 15:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhFDN65 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 09:58:57 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46778 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhFDN64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 09:58:56 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 44AF521A26;
        Fri,  4 Jun 2021 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622815029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z2+UtbdG0K09sdy6OOI7W2NBVk+QSBaf9EwZA0VYAWA=;
        b=ucABSgfv2DJdtPbeWzmBbNRlyIJpI0Y1FcavX0LTspEAd+mS1EP+L9crWgkuecgNJfKe2S
        ZPUu8YKP59e/cykz92nwOP+OkxFXK7yqO+lHCkrGoAaGzVAtsbXoW2Z6TWFbT/xmcyGY6W
        ho54hOwOxu053m6LCH+Ofg8MkMMkTY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622815029;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z2+UtbdG0K09sdy6OOI7W2NBVk+QSBaf9EwZA0VYAWA=;
        b=MVKCYJDw7id0+hMlEEolREH/eisaZ1AyYtHJWCpPV5fz7JCjap40Gv/mKcgts0kLcxniAw
        /Fq+eHgzu4thdvBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id EFF92118DD;
        Fri,  4 Jun 2021 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622815029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z2+UtbdG0K09sdy6OOI7W2NBVk+QSBaf9EwZA0VYAWA=;
        b=ucABSgfv2DJdtPbeWzmBbNRlyIJpI0Y1FcavX0LTspEAd+mS1EP+L9crWgkuecgNJfKe2S
        ZPUu8YKP59e/cykz92nwOP+OkxFXK7yqO+lHCkrGoAaGzVAtsbXoW2Z6TWFbT/xmcyGY6W
        ho54hOwOxu053m6LCH+Ofg8MkMMkTY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622815029;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z2+UtbdG0K09sdy6OOI7W2NBVk+QSBaf9EwZA0VYAWA=;
        b=MVKCYJDw7id0+hMlEEolREH/eisaZ1AyYtHJWCpPV5fz7JCjap40Gv/mKcgts0kLcxniAw
        /Fq+eHgzu4thdvBQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id tO3MNzQxumCbZAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Fri, 04 Jun 2021 13:57:08 +0000
Date:   Fri, 4 Jun 2021 15:57:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210604155708.14159db0@endymion>
In-Reply-To: <YLew8cFWTRQKrBuk@kunai>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion>
        <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk>
        <20210413125433.GA9879@kunai>
        <20210521132158.6e0689c0@endymion>
        <YK1fwC4aR5RKTPcB@kunai>
        <20210602110332.73f9cbc1@endymion>
        <YLew8cFWTRQKrBuk@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2 Jun 2021 18:25:21 +0200, Wolfram Sang wrote:
> Well, I thought mainly about this patch "tools: i2cbusses: Handle bus
> names like /dev/i2c-0" but you took care of it faster than I did.
> 
> There is only one patch left in patchwork from 2016:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/patch/044b3af6a47dfa92e047f0ff57e39a5b61e00058.1463165295.git.leonard.crestez@intel.com/
> "[i2c-tools] i2cget: Add support for i2c block data"
> 
> That's all what's left in patchwork.
> 
> Dunno if you care about the old patch, but I think we are good to go for
> a release.

Yes I do care. Apparently I wasn't Cc'd on that thread so I wasn't even
aware that patch existed. It would be very nice if you could bump the
thread to me (unless there's a way to retrieve it from patchwork that I
didn't find?)

I read the thread, my initial answer would have matched Guenter's (as
always...) but the contributor has a point, the range option is not
supported by i2cdump in I2C block mode. Whether it's better to add
support for it there, or in i2cget, I'll see.

I think i2cget has my preference, because i2cdump pretty much assumes
that I2C block reads retrieve successive 8-bit register values, so you
can have block boundaries anywhere without changing the result. As a
matter of fact, while i2cdump attempts to make 32-byte I2C block reads,
it will transparently handle short reads by issuing additional block
reads at arbitrary offsets. This works nicely for EEPROMs but could
fail for other devices.

If we only want *one* I2C block read at a specified offset then i2cget
seems more appropriate indeed.

Looking at the code, I see that i2cdump already supports SMBus block
mode, in a way which is very similar to what the contributor asked for,
i.e. it doesn't really dump the chip's registers, but merely reads one
SMBus block at a specific offset. It's questionable why this should
belong to i2cdump in the first place, beyond the fact that it returns
several values when i2cget typically returns only one value.

So one option would be get rid of "s" mode in i2cdump, and add support
for both I2C and SMBus block read to i2cget.

Might be possible to add support for range limitation to I2C block
reads in i2cdump nevertheless, as it could be useful to read only
portions of EEPROMs.

-- 
Jean Delvare
SUSE L3 Support
