Return-Path: <linux-i2c+bounces-2870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60989F1EC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 14:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6057E1F218FE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 12:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4E515AAAE;
	Wed, 10 Apr 2024 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcSuHPiZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7234501D;
	Wed, 10 Apr 2024 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751723; cv=none; b=XCELeRQPmS3hXpVXNNNimvW5I8zD33Yn0kaKAj2Qqt24YhDPq3dYIA4r9nmIHqZ/J9DCfiCtygpElBNp7PoIet9KJLrOCYQE198Whi0YA58gyGxVwEjw5M9GuaUlqUHOq7rnHosWU8MHiC8Pqc3NOCOdijpvfBcqYr4FshI0wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751723; c=relaxed/simple;
	bh=fhCS1XykDjhuWUw28ZSsJwT4DsrmC4F3xhQAUnzXjjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZRR4+7k/7sGKHEOfyjMw8/bdTNr2GC1Vy8cIiX9UNNTVj+SBBJ9ABC+FJ8LpvAgKyKphXZEWvDEiFSpl7X0DQopHht+Vk62YD5ctXyTqhz/YWF9bxXH8C8HQ8rfiDYWsg9ZQgdZq1/sceznLPJVTWBzjppFp0vZKM0wEpwvpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcSuHPiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF14C433C7;
	Wed, 10 Apr 2024 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712751722;
	bh=fhCS1XykDjhuWUw28ZSsJwT4DsrmC4F3xhQAUnzXjjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcSuHPiZOHBuNUmt1rR8ndwr/eCwbc3+2nDisVYpPu97NHt+i3fkdSVrhZPTL8Dpu
	 nuHQJcbzhLTReWBGJpLUMn8eymab9QKBcKRKNqdK9XcY5d058yanCg7mkvlGT+ApXB
	 jXCYvCUtW3JSvJj0ZPWbPE9SszsQ50qgIQATaa/JxdPcNEHzglGLkZ5t5l9oTzTpYZ
	 NpQbZRePDV2LuDAwAlcOnngz44Ps8PKxXwi6B1w3DODBBXaEwfgPIdXIkWS7NqZbfi
	 E3l4UlAAhgAj267kZQKmGfT8j4IiHA91xsPiqmybr8KrOtsKnIqimQYCRJ7m+uGxru
	 CkTbAoozlfgzA==
Date: Wed, 10 Apr 2024 14:21:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/18] i2c: i801: remove printout on handled timeouts
Message-ID: <242ogjpole3ltk5nu53knbfsxmmwcqfrbcivjh7fnkngvrroq5@cwspwdrtepwh>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-26-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410112418.6400-26-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Apr 10, 2024 at 01:24:20PM +0200, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Turn all timeout related
> printouts to debug level.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Here, I did not delete the printout to support checking the termination
> process. The other drivers in this series do not have this SMBus
> specific termination step.
> 
>  drivers/i2c/busses/i2c-i801.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 4294c0c63cef..a42b5152f9bd 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -400,7 +400,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  	 * If the SMBus is still busy, we give up
>  	 */
>  	if (unlikely(status < 0)) {
> -		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
> +		dev_dbg(&priv->pci_dev->dev, "Transaction timeout\n");

why after 5 patches of removing dev_err's, here you are changing
them to dev_dbg?

It's still good, but if we want to be strict, errors should
print errors: as we are returning -ETIMEDOUT, then we are
treating the case as an error and we should print error.

Upwards, then, we can put some more logic and decide whether
-ETIMEDOUT is a real error or not and consequently print a debug
or an error message.

As you did before, I would just remove the printout here.

I will wait a bit for more comments and take patches 1 to 5 so
that I can unburden you a little from them.

Thanks,
Andi

>  		/* try to stop the current command */
>  		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
>  		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
> @@ -411,7 +411,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  		status = inb_p(SMBHSTSTS(priv));
>  		if ((status & SMBHSTSTS_HOST_BUSY) ||
>  		    !(status & SMBHSTSTS_FAILED))
> -			dev_err(&priv->pci_dev->dev,
> +			dev_dbg(&priv->pci_dev->dev,
>  				"Failed terminating the transaction\n");
>  		return -ETIMEDOUT;
>  	}
> -- 
> 2.43.0
> 

