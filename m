Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7236F39F2BD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 11:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhFHJsb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 05:48:31 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56790 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHJsb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 05:48:31 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 247AC1FD4B;
        Tue,  8 Jun 2021 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623145597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g9J+6hkjBnAtWIP22qYek1W/6Pim/qGNQFywvyR4atU=;
        b=Bm7yiSW77lrruY58r+eFwBR5tUFiJQI4lpjW9CAawaJBScjzrnMZBCe6i4sTMG3xtKTQlO
        KPlSm5C01RLaOhFK27G6522egTzF+z8RRO2E1vcVQ/YyJQJPEBuOPatvPI2qHilmYpKyCq
        7Is2cHoW5FESr4mbehPV89TGrVjAsDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623145597;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g9J+6hkjBnAtWIP22qYek1W/6Pim/qGNQFywvyR4atU=;
        b=ig7kYgerxLTHJhE7eCz8mTw1My3J3pvWUZ+XfeRt8/gMblTEjYE8HrLC4QWNWHLv59d7me
        0098P9rgDvYe31Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id DD034118DD;
        Tue,  8 Jun 2021 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623145597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g9J+6hkjBnAtWIP22qYek1W/6Pim/qGNQFywvyR4atU=;
        b=Bm7yiSW77lrruY58r+eFwBR5tUFiJQI4lpjW9CAawaJBScjzrnMZBCe6i4sTMG3xtKTQlO
        KPlSm5C01RLaOhFK27G6522egTzF+z8RRO2E1vcVQ/YyJQJPEBuOPatvPI2qHilmYpKyCq
        7Is2cHoW5FESr4mbehPV89TGrVjAsDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623145597;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g9J+6hkjBnAtWIP22qYek1W/6Pim/qGNQFywvyR4atU=;
        b=ig7kYgerxLTHJhE7eCz8mTw1My3J3pvWUZ+XfeRt8/gMblTEjYE8HrLC4QWNWHLv59d7me
        0098P9rgDvYe31Aw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id l890M3w8v2CKaAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 09:46:36 +0000
Date:   Tue, 8 Jun 2021 11:46:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: Fix missing pci_disable_device() on error in
 ali1535_setup()
Message-ID: <20210608114636.65512e28@endymion>
In-Reply-To: <1623036068-30668-1-git-send-email-zou_wei@huawei.com>
References: <1623036068-30668-1-git-send-email-zou_wei@huawei.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wei,

On Mon, 07 Jun 2021 11:21:08 +0800, Zou Wei wrote:
> Fix the missing pci_disable_device() before return
> from ali1535_setup() in the error handling case.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/i2c/busses/i2c-ali1535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
> index fb93152..bdbaf79 100644
> --- a/drivers/i2c/busses/i2c-ali1535.c
> +++ b/drivers/i2c/busses/i2c-ali1535.c
> @@ -206,6 +206,7 @@ static int ali1535_setup(struct pci_dev *dev)
>  exit_free:
>  	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
>  exit:
> +	pci_disable_device(dev);
>  	return retval;
>  }
>  

We don't actually want to disable the PCI device. Maybe it was already
enabled before the driver was loaded, and maybe the BIOS needs the
device when the system is being shut down. You'll notice that we do not
call pci_disable_device(dev) in ali1535_remove(), so there's no reason
to do it in the error path.

As a matter of fact the i2c-i801 driver, which is used on the same kind
of hardware, has the following note in its remove function:

	/*
	 * do not call pci_disable_device(dev) since it can cause hard hangs on
	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
	 */

So this is a nack from me, sorry.

-- 
Jean Delvare
SUSE L3 Support
