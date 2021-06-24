Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2FF3B34AC
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 19:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhFXRYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 13:24:31 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35932 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhFXRYb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 13:24:31 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 442D41FDA9;
        Thu, 24 Jun 2021 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624555330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZewz+dJ4nSNLfOaC9fHbVY+mBlxFQ3Psk7Ka1K8wG4=;
        b=2MEKv7SLvynfnEaykHKfV4hVixl0g/k2OugV3VlbM+VXVcLs6ssRox5skP4DchWiKuX3Tg
        nzJ+Cjj4o4zEvzexLMdOvbi0Q7xUzyVEYTDmpD984BxBYSmG12NxvvsNqvSxSlalNQJ1lb
        uU2NIZV0v+2/+mSUN0bfnwsn2ANCzGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624555330;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZewz+dJ4nSNLfOaC9fHbVY+mBlxFQ3Psk7Ka1K8wG4=;
        b=OnzFmu2CaRVPgMxeGpg/rveDZTAOwgTHouOLnr47F9+HGJ28SDts6ENDAIbgSJSWVyZa23
        UkfHp5BfRFfR1qBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 0244511A97;
        Thu, 24 Jun 2021 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624555330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZewz+dJ4nSNLfOaC9fHbVY+mBlxFQ3Psk7Ka1K8wG4=;
        b=2MEKv7SLvynfnEaykHKfV4hVixl0g/k2OugV3VlbM+VXVcLs6ssRox5skP4DchWiKuX3Tg
        nzJ+Cjj4o4zEvzexLMdOvbi0Q7xUzyVEYTDmpD984BxBYSmG12NxvvsNqvSxSlalNQJ1lb
        uU2NIZV0v+2/+mSUN0bfnwsn2ANCzGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624555330;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZewz+dJ4nSNLfOaC9fHbVY+mBlxFQ3Psk7Ka1K8wG4=;
        b=OnzFmu2CaRVPgMxeGpg/rveDZTAOwgTHouOLnr47F9+HGJ28SDts6ENDAIbgSJSWVyZa23
        UkfHp5BfRFfR1qBg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id bazEOUG/1GC5WwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Thu, 24 Jun 2021 17:22:09 +0000
Date:   Thu, 24 Jun 2021 19:22:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: parport: Switch to use
 module_parport_driver()
Message-ID: <20210624192209.648eebe0@endymion>
In-Reply-To: <20210616140441.39479-1-andriy.shevchenko@linux.intel.com>
References: <20210616140441.39479-1-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Wed, 16 Jun 2021 17:04:41 +0300, Andy Shevchenko wrote:
> Switch to use module_parport_driver() to reduce boilerplate code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-parport.c | 36 ++++++++++----------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
> index a535889acca6..ccbbc9306e88 100644
> --- a/drivers/i2c/busses/i2c-parport.c
> +++ b/drivers/i2c/busses/i2c-parport.c
> @@ -267,6 +267,16 @@ static void i2c_parport_attach(struct parport *port)
                              ^^^^

>  	int i;
>  	struct pardev_cb i2c_parport_cb;
>  
> +	if (type < 0) {
> +		pr_warn("adapter type unspecified\n");
> +		return -ENODEV;
                       ^^^^^^^

> +	}

Does not build.

-- 
Jean Delvare
SUSE L3 Support
