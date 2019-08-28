Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54DBA03E4
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 15:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfH1N6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 09:58:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:37206 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbfH1N6R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 09:58:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7ED8EAC7D;
        Wed, 28 Aug 2019 13:58:15 +0000 (UTC)
Date:   Wed, 28 Aug 2019 15:58:22 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     lingyxu <lingyan.xu@nokia-sbell.com>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        WladislavWiebe <wladislav.wiebe@nokia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Message-ID: <20190828155822.7cb13a7b@endymion>
In-Reply-To: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lingyan,

On Mon, 12 Aug 2019 10:40:34 +0800, lingyxu wrote:
> From: Lingyan Xu <lingyan.xu@nokia-sbell.com>
> 
> In current i801 driver, SMBALERT interrupt is allowed
> (Slave Command Register bit2 is 0).
> But these is no handler for SMBALERT interrupt in i801_isr,
> if there is SMBALERT interrupt asserted and deasserted,
> i801 will have an irq flood for the related status bit is setted.
> 
> So SMBALERT interrupt handler is needed, and also, SMBALERT interrupt
> will be generated from time to time if slave chip have some fault.
> So disable SMBALERT interrupt is also needed.
> 
> About the solution,
> please see http://www.farnell.com/datasheets/1581967.pdf
> Page632 P640 for more.
> 
> Signed-off-by: Lingyan Xu <lingyan.xu@nokia-sbell.com>
> ---
>  drivers/i2c/busses/i2c-i801.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f295693..033bafe 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -661,9 +661,11 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	 * Clear irq sources and report transaction result.
>  	 * ->status must be cleared before the next transaction is started.
>  	 */
> +
> +	outb_p(status, SMBHSTSTS(priv));
> +
>  	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
>  	if (status) {
> -		outb_p(status, SMBHSTSTS(priv));
>  		priv->status = status;
>  		wake_up(&priv->waitq);
>  	}

Looks scary. Writing the whole value of SMBHSTSTS back to itself
without selecting which bits you write is dangerous. Specifically,
writing back SMBHSTSTS_BYTE_DONE, SMBHSTSTS_INUSE_STS and
SMBHSTSTS_HOST_BUSY could have unexpected consequences. I would feel
much better if you would just explicitly add SMBHSTSTS_SMBALERT_STS to
the list.

> @@ -1810,6 +1812,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	/* Default timeout in interrupt mode: 200 ms */
>  	priv->adapter.timeout = HZ / 5;
>  
> +	/* Disable SMBALERT interrupt */
> +	outb_p(inb_p(SMBSLVCMD(priv)) | BIT(2), SMBSLVCMD(priv));

Please give SMBSLVCMD's BIT(2) a name and define it after
SMBSLVCMD_HST_NTFY_INTREN.

Also it is mandatory to restore the value of SMBSLVCMD before returning
the control back to the BIOS. Currently this is only being done when
the FEATURE_HOST_NOTIFY bit is set because that's the only case where
we change the value of that register, but if we change it
unconditionally then it must be saved and restored unconditionally too.

> +
>  	if (dev->irq == IRQ_NOTCONNECTED)
>  		priv->features &= ~FEATURE_IRQ;
>  

That being said, if you see this interrupt flood, it means that at
least one device on your SMBus would benefit from SMBus Alert being
supported. The infrastructure is already there as we added support in a
few I2C bus drivers already. So maybe instead of silencing the
interrupts, we could add proper SMBus Alert support to the i2c-i801
driver?

Did you figure out which device is raising the SMBus Alert and why?

-- 
Jean Delvare
SUSE L3 Support
