Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68F643FE69
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 16:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhJ2O2E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 10:28:04 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56476 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbhJ2O2E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Oct 2021 10:28:04 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 122FF1FD5F;
        Fri, 29 Oct 2021 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635517535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hoX1ZaUYytipDTmVVhM1HT/7M9uAAGUxwL3WuOy5enY=;
        b=Yka7vr1EtrWtMvqr46klbdTnIHi9vtYlIXQ54wJ9H4Ti2tsDQo5aGzfrshNeYJA5kv7RXK
        mMoKy7XWG+D3y+6hQrhlREoOw0J8Cdk46ibEHfK1EikqqtoquAbMxi8a/cGBf7UN4lpIsu
        06l+bWvwm7d0EUWG9pVdK/Qqgo1JP/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635517535;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hoX1ZaUYytipDTmVVhM1HT/7M9uAAGUxwL3WuOy5enY=;
        b=iIz9wxmLwPN4IyPm+MadRTy/j9izWz+t+ynzmNV1mBnosmajeb9UzxAt5JzozxHUSg0HRa
        DKOCszGCNdlDO1Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA28D13F6F;
        Fri, 29 Oct 2021 14:25:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id zS3kJl4EfGFWNQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 29 Oct 2021 14:25:34 +0000
Date:   Fri, 29 Oct 2021 16:25:32 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH v2] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <20211029162532.43e3f7b2@endymion>
In-Reply-To: <20211028145311.1401355-1-jarkko.nikula@linux.intel.com>
References: <20211028145311.1401355-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Thu, 28 Oct 2021 17:53:11 +0300, Jarkko Nikula wrote:
> Currently interrupt storm will occur from i2c-i801 after first
> transaction if SMB_ALERT signal is enabled and ever asserted. It is
> enough if the signal is asserted once even before the driver is loaded
> and does not recover because that interrupt is not acknowledged.
> 
> This fix aims to fix it by two ways:
> - Add acknowledging for the SMB_ALERT interrupt status
> - Disable the SMB_ALERT interrupt on platforms where possible since the
>   driver currently does not make use for it
> 
> Acknowledging resets the SMB_ALERT interrupt status on all platforms and
> also should help to avoid interrupt storm on older platforms where the
> SMB_ALERT interrupt disabling is not available.
> 
> For simplicity this fix reuses the host notify feature for disabling and
> restoring original register value.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=177311
> Reported-by: ck+kernelbugzilla@bl4ckb0x.de
> Reported-by: stephane.poignant@protonmail.com
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2: More verbose commenting around interrupt acknowledging, reporting
>     and SMB_ALERT disabling. Fix typo in commit log and split the first
>     sentence.
> v1:
> Hi Conrad and Stephane. This patch is otherwise the same than the one I
> had in bugzilla but this adds also acknowledging for the SMB_ALERT
> interrupt. There is short time window during driver load and unload
> where interrupt storm will still occur if signal was asserted. Also
> interrupt disabling is possible only on ICH3 and later so interrupt
> acknowledging should also help those old platforms.
> ---
>  drivers/i2c/busses/i2c-i801.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 115660dce722..cf6cf419c760 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -190,6 +190,7 @@
>  #define SMBSLVSTS_HST_NTFY_STS	BIT(0)
>  
>  /* Host Notify Command register bits */
> +#define SMBSLVCMD_SMBALERT_DISABLE	BIT(2)
>  #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
>  
>  #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
> @@ -639,12 +640,20 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  		i801_isr_byte_done(priv);
>  
>  	/*
> -	 * Clear irq sources and report transaction result.
> +	 * Clear remaining irq sources: Completion of last command, errors
> +	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
> +	 * assertion also when the interrupt from it is blocked on platforms
> +	 * where disabling is possible so clear it always when status is set.
> +	 */
> +	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
> +	if (status)
> +		outb_p(status, SMBHSTSTS(priv));
> +	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
> +	/*
> +	 * Report transaction result.
>  	 * ->status must be cleared before the next transaction is started.
>  	 */
> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
>  	if (status) {
> -		outb_p(status, SMBHSTSTS(priv));
>  		priv->status = status;
>  		complete(&priv->done);
>  	}
> @@ -972,9 +981,12 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
>  	if (!(priv->features & FEATURE_HOST_NOTIFY))
>  		return;
>  
> -	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
> -		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
> -		       SMBSLVCMD(priv));
> +	/*
> +	 * Enable host notify interrupt and block the generation of interrupt
> +	 * from the SMB_ALERT signal.
> +	 */
> +	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
> +	       priv->original_slvcmd, SMBSLVCMD(priv));

Thanks for making the comment more verbose as I suggested. However it
is still really only paraphrasing the code. The added value would be if
the comment would say, not what we are doing, but why we are doing it.
In this case, I think the key information is: "because the driver does
not support SMBus Alert yet".

>  
>  	/* clear Host Notify bit to allow a new notification */
>  	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));

In my first review, I suggested restoring SMBHSTCNT_INTREN to its
original value at driver unload time. I stand on this position. If
SMBHSTCNT_INTREN was originally 0, it will be 1 after the first
transaction run by the driver. That's fine as long as
SMBSLVCMD_SMBALERT_DISABLE is set, however i801_disable_host_notify()
will clear that bit when you unload the driver. At that point, SMBus
Alerts will keep generating interrupts. I'm not sure what happens if
nobody is listening to that interrupt. But in case of a shared
interrupt, the other driver is going to be flooded with interrupts
forever if SMBus Alerts are being generated for whatever reason.

So I suggest something like:

--- linux-5.14.orig/drivers/i2c/busses/i2c-i801.c	2021-10-29 11:15:48.283807055 +0200
+++ linux-5.14/drivers/i2c/busses/i2c-i801.c	2021-10-29 16:21:32.392978256 +0200
@@ -259,6 +259,7 @@ struct i801_priv {
 	struct i2c_adapter adapter;
 	unsigned long smba;
 	unsigned char original_hstcfg;
+	unsigned char original_hstcnt;
 	unsigned char original_slvcmd;
 	struct pci_dev *pci_dev;
 	unsigned int features;
@@ -1811,7 +1812,8 @@ static int i801_probe(struct pci_dev *de
 		outb_p(inb_p(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
-	/* Remember original Host Notify setting */
+	/* Remember original Interrupt and Host Notify settings */
+	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
 	if (priv->features & FEATURE_HOST_NOTIFY)
 		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
 
@@ -1875,6 +1877,7 @@ static void i801_remove(struct pci_dev *
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
 	i2c_del_adapter(&priv->adapter);
@@ -1898,6 +1901,7 @@ static void i801_shutdown(struct pci_dev
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	/* Restore config registers to avoid hard hang on some systems */
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 }

In addition to your changes. What do you think?

-- 
Jean Delvare
SUSE L3 Support
