Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC8C38FE56
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 12:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbhEYKBp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 06:01:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:54804 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232682AbhEYKBn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 06:01:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621936813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A5RJyWvXHoMKx7eu+KXRrfjc/ncoaXaWLQXtNqZouc4=;
        b=gAnaj4lf47WOt0Y+NBqzXIBKajNAS9sSOuyrTdKPr27ssv/5i+W+GwJQlvxkWYNS8MIL6T
        liRlm47MbSWAJdLwd7ZgYDXp/j2dqHbBpZ5SWAZUnkCiv7ZVDK6mIN0FJyj+4Mk14byqjr
        wuwBdmRJEegnO9CrVRNoPVBPmCv9oJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621936813;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A5RJyWvXHoMKx7eu+KXRrfjc/ncoaXaWLQXtNqZouc4=;
        b=2TtvWhLckIAJxwzKdP/m1VYiGNTjBBpxZH9ggOfKZm8ts2gBCpIprG2duzcrPgdeM32zih
        V7qwMIBU2H0cvoAg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8026EAEA8;
        Tue, 25 May 2021 10:00:13 +0000 (UTC)
Date:   Tue, 25 May 2021 12:00:12 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Remove unneeded warning after
 wait_event_timeout timeout
Message-ID: <20210525120012.1ea1d5f1@endymion>
In-Reply-To: <103951a0-4233-bbaf-2192-ac140469b07e@gmail.com>
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
        <103951a0-4233-bbaf-2192-ac140469b07e@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 22 May 2021 00:00:28 +0200, Heiner Kallweit wrote:
> When passing -ETIMEDOUT to i801_check_post() it will emit a timeout
> error message. I don't see much benefit in an additional warning
> stating more or less the same.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 99d446763..bfea94d02 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -509,11 +509,9 @@ static int i801_transaction(struct i801_priv *priv, int xact)
>  		result = wait_event_timeout(priv->waitq,
>  					    (status = priv->status),
>  					    adap->timeout);
> -		if (!result) {
> +		if (!result)
>  			status = -ETIMEDOUT;
> -			dev_warn(&priv->pci_dev->dev,
> -				 "Timeout waiting for interrupt!\n");
> -		}
> +
>  		priv->status = 0;
>  		return i801_check_post(priv, status);
>  	}
> @@ -732,11 +730,9 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  		result = wait_event_timeout(priv->waitq,
>  					    (status = priv->status),
>  					    adap->timeout);
> -		if (!result) {
> +		if (!result)
>  			status = -ETIMEDOUT;
> -			dev_warn(&priv->pci_dev->dev,
> -				 "Timeout waiting for interrupt!\n");
> -		}
> +
>  		priv->status = 0;
>  		return i801_check_post(priv, status);
>  	}

I have to agree.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
