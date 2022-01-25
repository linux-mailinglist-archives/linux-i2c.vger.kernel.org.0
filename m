Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A29149B442
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 13:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1455343AbiAYMqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 07:46:06 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55548 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453870AbiAYMn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 07:43:58 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BA5371F397;
        Tue, 25 Jan 2022 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643114636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GuvCUoMQeQ8ExblQico0vSd8Fo9ymvlCDvFGhydQyJE=;
        b=MsNUYOFzaYK8fFUv9rsEs+L91soobIR+Z5Nk6qLIJ4bNdQxaFInuDAFKjWtBETwaJxB3mW
        ymtAtBlIrWsv2kX1E77BcQ3fJzrgwzAQrNAe5ggi7Eoy+bsNvfMXsuj+5rseyvoaw30HfQ
        2c5GOooX/NoYlkMc7+RInt9pt0nMDZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643114636;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GuvCUoMQeQ8ExblQico0vSd8Fo9ymvlCDvFGhydQyJE=;
        b=XZ0/saN2AncO8DnvNKQYgk/IDQqAmpvhai0UuDniXnMAi2x0luXmY+2cSAXOaXQVEZUTWu
        3AFjaegWR7lrSIAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0842013DDC;
        Tue, 25 Jan 2022 12:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9B88O4vw72HvNAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 12:43:55 +0000
Date:   Tue, 25 Jan 2022 13:43:54 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Message-ID: <20220125134354.4db24118@endymion>
In-Reply-To: <20220118202234.410555-5-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-5-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

On Tue, 18 Jan 2022 14:22:34 -0600, Terry Bowman wrote:
> The driver currently uses a CPU family match of 17h to determine
> EFCH_PM_DECODEEN_WDT_TMREN register support. This family check will not
> support future AMD CPUs and instead will require driver updates to add
> support.
> 
> Remove the family 17h family check and add a check for SMBus PCI
> revision ID 0x51 or greater. The MMIO access method has been available
> since at least SMBus controllers using PCI revision 0x51. This revision
> check will support family 17h and future AMD processors including EFCH
> functionality without requiring driver changes.
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
>  drivers/watchdog/sp5100_tco.c | 16 ++++------------
>  drivers/watchdog/sp5100_tco.h |  1 +
>  2 files changed, 5 insertions(+), 12 deletions(-)
> (...)

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
