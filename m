Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D11452EF2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 11:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbhKPK0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 05:26:12 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:45906 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbhKPK0F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Nov 2021 05:26:05 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 84DA8218CE;
        Tue, 16 Nov 2021 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637058188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Am4ZYzGhlSLqHxhJ47Z861WbSEX6YwPeg3qxO88F9E=;
        b=l1Fk7/YWzxTPgGLeHSJ4IHwOzyXobX2Zo5vvFDdrx2ZpoqDihu2XX08msF0wlKOnqjBrU4
        ybYkeqbHyMn735k/1NIu6VgD9sCPYCZGPHnmKUi3Ex9PZiNUrNz1sv9z5J+6OQwxl5PKgB
        l6rAk3QWDfYJIFS5lQcgTE26kdW+yNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637058188;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Am4ZYzGhlSLqHxhJ47Z861WbSEX6YwPeg3qxO88F9E=;
        b=l44NnLfjukZyp1MY+f7vnYq1CAiY4jsW8W+O05zLbsKlEAtT1aTeJv8VsEAhRh96rHcc8W
        no5a0a9/i7A367Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 512F713BA1;
        Tue, 16 Nov 2021 10:23:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id r0CTEYyGk2FwJgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 16 Nov 2021 10:23:08 +0000
Date:   Tue, 16 Nov 2021 11:23:07 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Restore INTREN on unload
Message-ID: <20211116112307.039054d2@endymion>
In-Reply-To: <d4f76584-7548-baae-837d-b87300086196@linux.intel.com>
References: <20211109160257.4c089eef@endymion>
        <d4f76584-7548-baae-837d-b87300086196@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021 16:31:41 +0200, Jarkko Nikula wrote:
> Now we restore INTREN on suspend but do not explicitly enable it after 
> resume.

We also don't enable it when loading the driver, so this is consistent.

> I didn't fully get how RMI4 stack resumes but perhaps they will 
> do some power on, reset, etc command transaction and that gets the 
> INTREN enabled and allow host notify.

I didn't check either, but it shouldn't matter. If INTREN has to be set
for RMI4 to work, then it must have been set even before the i2c-i801
driver was loaded. In this case, my new code is a no-op (SMBHSTCNT will
be set to the value it already had, that is, INTREN is enabled at all
times).

-- 
Jean Delvare
SUSE L3 Support
