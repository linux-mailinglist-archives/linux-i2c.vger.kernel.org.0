Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0318F3C6BF0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhGMIYW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 04:24:22 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:55444 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbhGMIYW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 04:24:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 30B0320060;
        Tue, 13 Jul 2021 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626164492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8SQ6xeafmlUxItSlrb6MoG4XnTMFJZjK7RgmSOF8Nt4=;
        b=MlMMzbsRAxDD5DSJBrCZ41FCcVz7NbQcqC937Ep81mtmqGwjd1sylaOBsXfL0fE8tvkeRd
        7ThE+wTvAc/nirfkdMXO/6wCEKnTmXKQ0VpzshHOQ+zYkWaMbqYqRNHdL+NjUPksKsPffs
        g3WLeWmCv65tTb1FbE2OU3m3dhaZihU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626164492;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8SQ6xeafmlUxItSlrb6MoG4XnTMFJZjK7RgmSOF8Nt4=;
        b=Vc7VDatqHv6Z8wpLVm67xaV8ab9q1YYkHMGtlJmsFPX0yLDF9V5IbdguYeZtrXxYnxiIfP
        GVyI10lLe7i6CvAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAC7413BC9;
        Tue, 13 Jul 2021 08:21:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id NJQTNgtN7WCMRAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 13 Jul 2021 08:21:31 +0000
Date:   Tue, 13 Jul 2021 10:21:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <20210713102130.7dd5851b@endymion>
In-Reply-To: <YNhSnBcspC276w66@ninjato>
References: <20210608172338.0cf520a1@endymion>
        <YNhSnBcspC276w66@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Sun, 27 Jun 2021 12:27:40 +0200, Wolfram Sang wrote:
> > The idea would be to get the first 6 patches in the upcoming i2c-tools
> > v4.3, and apply the 7th patch "later" (either immediately after that
> > release, or some time later, I'm not sure).  
> 
> So, my tests so far went nicely and looking more at the patches didn't
> reveal any major discussion point. So:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I'd vote also for an early removal. The code cleanup is too nice and
> i2cget is, in deed, the better place for mode 's'.

Thanks for the review and testing, very much appreciated. I have
committed the first 6 patches, with cosmetic fixes after a last
self-review.

With this, we are ready to release i2c-tools 4.3.

-- 
Jean Delvare
SUSE L3 Support
