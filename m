Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A1743BC61
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 23:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbhJZVaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 17:30:46 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33368 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239602AbhJZVan (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Oct 2021 17:30:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id AF6F91FD40;
        Tue, 26 Oct 2021 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635283696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z1ET4Z0gPlkKUJqqYRVC9any/0mVnEksgVPzB05OKl4=;
        b=ZrattbXT/Hus7BadPdf+0FyrO7gp0QmXg8YP+//SuqP+0YLbaekdAw+Elesk3ipImSljzQ
        SQAj9rvNDF+GFKW0GnoZeK4wQkHqM9aOEkR3CPz88+kiwY9vqSpvrFB0phcRU8WIoJlpd5
        90PiFm2/ayBC5VROa55epZllH0tsW/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635283696;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z1ET4Z0gPlkKUJqqYRVC9any/0mVnEksgVPzB05OKl4=;
        b=hsnl3Gxvag1eigo3DRQTqu+NtIl8rDtZX53pz6GlASF5DDu3zz1rG44EdbGyr9TxMDwcY/
        I0z9JdPm3UT/xNAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4345413DB6;
        Tue, 26 Oct 2021 21:28:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OocyDfByeGEROgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 26 Oct 2021 21:28:16 +0000
Date:   Tue, 26 Oct 2021 23:28:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <20211026232815.513362d6@endymion>
In-Reply-To: <20211019141700.764413-1-jarkko.nikula@linux.intel.com>
References: <20211019141700.764413-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Tue, 19 Oct 2021 17:17:00 +0300, Jarkko Nikula wrote:
> Currently interrupt storm will occur from i2-i801 after first transaction

Typo: i2c-i801.

> if SMB_ALERT signal is enabled and ever asserted, even before the driver
> is loaded and does not recover because that interrupt is not
> acknowledged.

Thank you very much for looking into this old bug and finally figuring
it out. Great job!

So basically the interrupt storm begins as soon as SMBHSTCNT_INTREN is
set, because that bit controls both regular SMBus transactions and
SMBALERT# (but not Host Notify which has its own interrupt enable
control bit).

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
> Hi Conrad and Stephane. This patch is otherwise the same than the one I
> had in bugzilla but this adds also acknowledging for the SMB_ALERT
> interrupt. There is short time window during driver load and unload
> where interrupt storm will still occur if signal was asserted. Also

The storm only starts with the first transaction, loading the driver
does not start it, so I can't see the window at load time.

For driver unload time, maybe we should restore SMBHSTCNT_INTREN to
its original value at that time, to prevent an interrupt storm from
happening. If we don't, then I suspect we'll have a storm not only for
a short time window but actually forever.

> interrupt disabling is possible only on ICH3 and later so interrupt
> acknowledging should also help those old platforms.

I'd be very surprised if systems with pre-ICH3 chipsets are still up
and running. Even the ICH3 is 20 year old by now. So I wouldn't bother
with them.

> ---
>  drivers/i2c/busses/i2c-i801.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 115660dce722..e95de4ce6b64 100644
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
> @@ -642,9 +643,11 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	 * Clear irq sources and report transaction result.
>  	 * ->status must be cleared before the next transaction is started.
>  	 */
> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
> -	if (status) {
> +	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
> +	if (status)
>  		outb_p(status, SMBHSTSTS(priv));

Might be worth a comment.

> +	status &= ~SMBHSTSTS_SMBALERT_STS;
> +	if (status) {
>  		priv->status = status;
>  		complete(&priv->done);
>  	}
> @@ -972,9 +975,9 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
>  	if (!(priv->features & FEATURE_HOST_NOTIFY))
>  		return;
>  
> -	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
> -		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
> -		       SMBSLVCMD(priv));
> +	/* Enable host notify interrupt and disable SMB_ALERT signal */
> +	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
> +	       priv->original_slvcmd, SMBSLVCMD(priv));

A more verbose comment would be welcome too. Right now we know why we
are doing that, but in a few years we won't remember.

>  
>  	/* clear Host Notify bit to allow a new notification */
>  	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));

Tested-by: Jean Delvare <jdelvare@suse.de>

(But my system was not affected by the issue in the first place, so
it's only a non-regression test.)

I'm also wondering whether it would make sense to actually support
SMBus Alert in the driver. We have core support for it already. If
there are systems out there which generate such events, then maybe
there's some value to be added. But we'd need to know which devices are
sending them. For the time being I agree that just fixing the interrupt
storms is more important.

-- 
Jean Delvare
SUSE L3 Support
