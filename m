Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC654018BF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 11:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbhIFJWU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 05:22:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44554 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240303AbhIFJWR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Sep 2021 05:22:17 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6AAE122096;
        Mon,  6 Sep 2021 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1630920066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4fLJaJVJnqou70CYeKITkgRVzHAVxWxzUSJuPLYjfCQ=;
        b=vS8Bn4t0k0py8Ixhyf5R5bWxVIDSnFc8bqA7CO/lEzDCxGFcpCSW2YlD+vodYsHTh29V+3
        ao79QKLIuAXLxX7/apQ/z/Cb8kLAa3wjbD1uWVL2bPTM21ayRGzEuF4aMxqvXtJ9sXoyB1
        XbL+8HM9BJq5a64Ky1oL0t/sHxO5DNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1630920066;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4fLJaJVJnqou70CYeKITkgRVzHAVxWxzUSJuPLYjfCQ=;
        b=8p7PVWQJ/rw3jap3zBevQRT72UtjBHXX4//VQYT8C3sKsBA/PyeIiI5WHfit/ibQ5feOnp
        lB8AMxQWsDlTOOBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3796B13942;
        Mon,  6 Sep 2021 09:21:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id YtsyC4LdNWGEewAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Mon, 06 Sep 2021 09:21:06 +0000
Date:   Mon, 6 Sep 2021 11:21:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] i2c: i801: Use PCI bus rescan mutex to protect P2SB
 access
Message-ID: <20210906112104.5cda3131@endymion>
In-Reply-To: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
References: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 05 Sep 2021 17:59:42 +0200, Heiner Kallweit wrote:
> As pointed out by Andy in [0] using a local mutex here isn't strictly
> wrong but not sufficient. We should hold the PCI rescan lock for P2SB
> operations.
> 
> [0] https://www.spinics.net/lists/linux-i2c/msg52717.html
> 
> Fixes: 1a987c69ce2c ("i2c: i801: make p2sb_spinlock a mutex")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 89ae78ef1..1f929e6c3 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1493,7 +1493,6 @@ static struct platform_device *
>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> -	static DEFINE_MUTEX(p2sb_mutex);
>  	struct resource *res;
>  	unsigned int devfn;
>  	u64 base64_addr;
> @@ -1506,7 +1505,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	 * enumerated by the PCI subsystem, so we need to unhide/hide it
>  	 * to lookup the P2SB BAR.
>  	 */
> -	mutex_lock(&p2sb_mutex);
> +	pci_lock_rescan_remove();
>  
>  	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
>  
> @@ -1524,7 +1523,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	/* Hide the P2SB device, if it was hidden before */
>  	if (hidden)
>  		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
> -	mutex_unlock(&p2sb_mutex);
> +	pci_unlock_rescan_remove();
>  
>  	res = &tco_res[1];
>  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
