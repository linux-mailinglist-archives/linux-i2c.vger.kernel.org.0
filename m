Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B04A398E50
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 17:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhFBPUZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 11:20:25 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57130 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhFBPUO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 11:20:14 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3F3F41FD7B;
        Wed,  2 Jun 2021 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622647109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ya3JPIPC39z8giwZTgw2lxYPmpkNg8bG/i+veyWTJ7k=;
        b=qmkBcEpMqZYWzJh0jYEOD708M1liYRfCsANg6Ee2dogACaz0B6W24o3tfj9eDbu59FK/TA
        aywuuvoGoVkPEBW/GzLnhqpUmoRel6fDoEWE0NgLsQsjqM70ndgmK2R5kMl5x5M/92J475
        Zxfofkm5VRoVmi+cEpQrj710uqZPx7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622647109;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ya3JPIPC39z8giwZTgw2lxYPmpkNg8bG/i+veyWTJ7k=;
        b=x6FXgYeMebrk/lxGqkJXWu9tJu3e3RQ+vKj4CFSHvB1i9jwtDUrgFQqNdmIfYGCRLu5g+R
        ZeC2qskTWXAbI/Ag==
Received: by imap.suse.de (Postfix, from userid 51)
        id 36B7411CD7; Wed,  2 Jun 2021 16:20:03 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 34C4811D0A;
        Wed,  2 Jun 2021 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622624613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ya3JPIPC39z8giwZTgw2lxYPmpkNg8bG/i+veyWTJ7k=;
        b=0nc+4TfVky/hpjVfsbSWU473oN+2h/Lfe3m0LEM1SyT4OmqYAfycgCGT180RIVEqkDUc3J
        tAL2KMlE1XjWWx2Y8xjtKvR8RBK8Ph+j+vMM+CM+sHThKn2c6/GpRlVpb4UKUHL7x2mHn4
        B/z1f1njlrJq7QlXNcfcLdWdQEsXI2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622624613;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ya3JPIPC39z8giwZTgw2lxYPmpkNg8bG/i+veyWTJ7k=;
        b=XafYfJytQ4cEWHhAt9Z+mr9UPnArq1rHr8IkJE4jcVQVFDB9RG1m4sdhMaHSZbtRzYQ27G
        tdUfYVK6O/+OUdAw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id ywDLCmVJt2AVFwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Wed, 02 Jun 2021 09:03:33 +0000
Date:   Wed, 2 Jun 2021 11:03:32 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210602110332.73f9cbc1@endymion>
In-Reply-To: <YK1fwC4aR5RKTPcB@kunai>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion>
        <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk>
        <20210413125433.GA9879@kunai>
        <20210521132158.6e0689c0@endymion>
        <YK1fwC4aR5RKTPcB@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 25 May 2021 22:36:16 +0200, Wolfram Sang wrote:
> > I'll take care of that ASAP if that's OK with you. If you have any
> > other change that should make it into 4.3, now is the time to commit it.  
> 
> Thank you. I don't have any patches left but I will review the ones
> waiting in patchwork right now.

I've committed mine. Do you see anything left in patchwork, or are we
ready for a release?

-- 
Jean Delvare
SUSE L3 Support
