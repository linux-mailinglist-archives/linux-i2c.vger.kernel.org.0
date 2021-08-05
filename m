Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30973E108F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238304AbhHEIt4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 04:49:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50844 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbhHEItz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 04:49:55 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 69F4E2234A;
        Thu,  5 Aug 2021 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628153381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M6A+FlNX4JW6X+37HrJxwaXqI7F5CdnQHTVCP+05okY=;
        b=CpJ0MsrAfGfoE6BZINTmMRQqEchPtjNMygxnqSLOFzX05VyNA6rF1RnuOjG4kiWNtmwcDi
        6A7+dlzc4cu+HMitT9IMdFoL+5tPlbXxKttxz2d1D283uXhotfO+WbZcdRWRmWGuHMFRnz
        bBgKuDpNS0StEcohfLCJ3X5WLTYJojk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628153381;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M6A+FlNX4JW6X+37HrJxwaXqI7F5CdnQHTVCP+05okY=;
        b=evtntPY4rlQIikfqFkyywZ6omURJ+rnVoREYNMIUvZgUS3f93mkCSy53ltwXNqBdOyGoCV
        zsX7DQUPf3wuQYDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2F09013785;
        Thu,  5 Aug 2021 08:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 4kqzCCWmC2HLVAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 08:49:41 +0000
Date:   Thu, 5 Aug 2021 10:49:39 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 03/10] i2c: i801: Make p2sb_spinlock a mutex
Message-ID: <20210805104939.1dd2995a@endymion>
In-Reply-To: <2e727b49-b59b-fad9-6ed3-febc5b98b8d4@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <2e727b49-b59b-fad9-6ed3-febc5b98b8d4@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:18:38 +0200, Heiner Kallweit wrote:
> p2sb_spinlock is used in i801_add_tco_spt() only and in process context
> only. Therefore a mutex is sufficient, and we can make the definition
> local to i801_add_tco_spt().

Mika, no objection?

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index bdb619bc0..504f02e1e 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1492,12 +1492,11 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
>  	.version = 4,
>  };
>  
> -static DEFINE_SPINLOCK(p2sb_spinlock);
> -
>  static struct platform_device *
>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> +	static DEFINE_MUTEX(p2sb_mutex);

To be on the safe side, we should explicitly #include <linux/mutex.h>.

>  	struct resource *res;
>  	unsigned int devfn;
>  	u64 base64_addr;
> @@ -1510,7 +1509,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	 * enumerated by the PCI subsystem, so we need to unhide/hide it
>  	 * to lookup the P2SB BAR.
>  	 */
> -	spin_lock(&p2sb_spinlock);
> +	mutex_lock(&p2sb_mutex);
>  
>  	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
>  
> @@ -1528,7 +1527,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	/* Hide the P2SB device, if it was hidden before */
>  	if (hidden)
>  		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
> -	spin_unlock(&p2sb_spinlock);
> +	mutex_unlock(&p2sb_mutex);
>  
>  	res = &tco_res[1];
>  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
