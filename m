Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B57F49B49D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 14:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244184AbiAYNJV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 08:09:21 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:57222 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385958AbiAYNFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 08:05:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3C3081F381;
        Tue, 25 Jan 2022 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643115934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kvqxhztJgAeV91/7V7GT00sAA8oyoJf3yoHjPQWb5nk=;
        b=oqvBcD8RKi/bikFf+h5ikyaDXqBfmyRjnSm3hR5qoyrd3amMZnB9yzF0FkEm4o7HTUOwAd
        jHOnMexHwJKDWor20M8Dp9zRshSDFQRlOjkob4VYJYafe+6jxbDIepgaRpt9XkLjOHoGmz
        //sof2f+2mud+hTHVN3leMxz8cWq8Uk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643115934;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kvqxhztJgAeV91/7V7GT00sAA8oyoJf3yoHjPQWb5nk=;
        b=1rutgpif2Ya6gDZ/DBaIAW65r8Csve7dEoKO8EgmVXbAkgQa2pZcqWwRAHS6l+mPSUf136
        0Pxut6ZwVVparxAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7545D13DE2;
        Tue, 25 Jan 2022 13:05:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id F8RCGp3172FlQAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 13:05:33 +0000
Date:   Tue, 25 Jan 2022 14:05:29 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 1/4] Watchdog: sp5100_tco: Move timer initialization
 into function
Message-ID: <20220125140529.5ce10957@endymion>
In-Reply-To: <20220118202234.410555-2-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-2-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 14:22:31 -0600, Terry Bowman wrote:
> Refactor driver's timer initialization into new function. This is needed
> inorder to support adding new device layouts while using common timer
> initialization.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> To: Guenter Roeck <linux@roeck-us.net>
> To: linux-watchdog@vger.kernel.org
> To: Jean Delvare <jdelvare@suse.com>
> To: linux-i2c@vger.kernel.org
> To: Wolfram Sang <wsa@kernel.org>
> To: Andy Shevchenko <andy.shevchenko@gmail.com>
> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Robert Richter <rrichter@amd.com>
> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
> ---
>  drivers/watchdog/sp5100_tco.c | 65 +++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 29 deletions(-)
> (...)

Except for the issues already mentioned by Andy, looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
