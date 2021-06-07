Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2554839E033
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFGPYg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:24:36 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54320 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbhFGPYf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:24:35 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A93081FD30;
        Mon,  7 Jun 2021 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623079363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHrxrqjI2FD4f2RsK+Y33pAZtcLIFXMBKuPbbrRe2es=;
        b=Xzlszo05kM5sLH9EhVtYvcRcNYqh/kTyr3Sllei4UBx5ZyZJ/rXYT6xs/B1k1ydOW1vSdl
        2xbyoUeqs1PWz0NyDrY0Dy+tG92hiaTQKWH1s02ld4H+Cbv4r1hz+ipZ+xH44U6oeAyPqE
        Ojlidr+d1PdoNXL4+GX1+n1aCL4zijQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623079363;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHrxrqjI2FD4f2RsK+Y33pAZtcLIFXMBKuPbbrRe2es=;
        b=Ne6NgIz9WdQahMijtxV4jE8sEZPhRckEqzOi0zC6uc+NwABjgkwZotuZ4o7yQRSZjOOpwc
        RIHS1vu1uFUDvjBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 6B7C6118DD;
        Mon,  7 Jun 2021 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623079363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHrxrqjI2FD4f2RsK+Y33pAZtcLIFXMBKuPbbrRe2es=;
        b=Xzlszo05kM5sLH9EhVtYvcRcNYqh/kTyr3Sllei4UBx5ZyZJ/rXYT6xs/B1k1ydOW1vSdl
        2xbyoUeqs1PWz0NyDrY0Dy+tG92hiaTQKWH1s02ld4H+Cbv4r1hz+ipZ+xH44U6oeAyPqE
        Ojlidr+d1PdoNXL4+GX1+n1aCL4zijQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623079363;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHrxrqjI2FD4f2RsK+Y33pAZtcLIFXMBKuPbbrRe2es=;
        b=Ne6NgIz9WdQahMijtxV4jE8sEZPhRckEqzOi0zC6uc+NwABjgkwZotuZ4o7yQRSZjOOpwc
        RIHS1vu1uFUDvjBQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id yU8NGMM5vmDgaQAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Mon, 07 Jun 2021 15:22:43 +0000
Date:   Mon, 7 Jun 2021 17:22:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Hector Martin <marcan@marcan.st>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is
 cleared when leaving i801_access
Message-ID: <20210607172242.564bcd38@endymion>
In-Reply-To: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
References: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner, Hector,

On Sun, 6 Jun 2021 15:55:55 +0200, Heiner Kallweit wrote:
> As explained in [0] currently we may leave SMBHSTSTS_INUSE_STS set,
> thus potentially breaking ACPI/BIOS usage of the SMBUS device.
> 
> Seems patch [0] needs a little bit more of review effort, therefore
> I'd suggest to apply a part of it as quick win. Just clearing
> SMBHSTSTS_INUSE_STS when leaving i801_access() should fix the
> referenced issue and leaves more time for discussing a more
> sophisticated locking handling.
> 
> [0] https://www.spinics.net/lists/linux-i2c/msg51558.html
> 
> Fixes: 01590f361e94 ("i2c: i801: Instantiate SPD EEPROMs automatically")
> Cc: stable@vger.kernel.org
> Suggested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - add proper stable tag
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index c7d96cf5e..ab3470e77 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -948,6 +948,9 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	}
>  
>  out:
> +	/* Unlock the SMBus device for use by BIOS/ACPI */
> +	outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv));
> +
>  	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
>  	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
>  	mutex_unlock(&priv->acpi_lock);

Good idea.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

Hector, can you please rebase your patch on top of this one? I'll
review it later when I have more time to allocate to the task.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
