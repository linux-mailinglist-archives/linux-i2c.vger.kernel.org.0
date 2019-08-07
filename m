Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A80A084B3B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 14:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfHGMJt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 08:09:49 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16894 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbfHGMJt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Aug 2019 08:09:49 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 4B090A10DC;
        Wed,  7 Aug 2019 14:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received; s=mail20150812; t=1565179767; bh=rHCAZ074Uy
        ZIuo+YOhlm7YH0Of6VHZ3w7JPuviszgG8=; b=msNk2qv0fNTuD4PX61ubg1jISG
        qPJuJnrAKNt1IE/LEXBHmFsZHl9nSzfecmvWL692Td9+Ym9o4nclypzUpNDlSJJx
        9pk+b6X+fvMYdr8bBDy4/rmb2BCIctwTxg6XR5rU4dJz4sZJ5efpuMSWkLCarzwf
        WfYJKufSjPk8tc5W1NUboQaH1zchV8qws7kVQJBXkOUYqtHBe/IxFvnoIyXoeS6t
        XBDp5Ih5DlSFpy5jcrYaI9CQCAIakf5v3ePIsdx2AEwx25GRCsLy9WlxBpF0qXqH
        sGofhS16+sRtEcENUfy+U5YLKyubWwTi7rbo2bDDwlrLcPCB/TWYHwqT8o3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565179786; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nIi2+dVFgNEqDAbNVFX5OQFfz6csuB3+TfgG3t4PX58=;
        b=psdQRXuMdCNnuvjhag32JrP02RtOG2WT11a9nkp7lvgI3sQWpETzWnmuUSD/GD5wiL2fx1
        5C/4IA3gMLqfG9i99VUFTqmb6IW7MvfmC1mftvJOAVBvjHVkHBejPAFNfhWshXYqA522xc
        h2zoq+fpJRtpOS5YT8uBXMYyAxxlMzi3zIuPrXwdctiLkORXTqPSYpwR/j39Y6c98/Soj0
        f1wE6LqI0/GPwyPh78LeQvv9GrixT5R8Q2yXz9FlEo/IxRkk/m72kAPVYxd3/6O7xALBO0
        UUu5/+s+qPty7x8eizF+40ZarDlU7VeQnBjl/rT2Hs+J5SFA3QH/Fjiiwm3fmA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id PIIso7cOiSde; Wed,  7 Aug 2019 14:09:27 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Schrempf Frieder <frieder.schrempf@kontron.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Ajay Gupta <ajayg@nvidia.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Elie Morisse <syniurge@gmail.com>,
        Stefan Roese <sr@denx.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: Allow the driver to be built for ARM64 SoCs such as i.MX8M
Date:   Wed, 07 Aug 2019 14:09:24 +0200
Message-ID: <2445092.UF1PKDTzN1@ws-140106>
In-Reply-To: <20190807114332.13312-1-frieder.schrempf@kontron.de>
References: <20190807114332.13312-1-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wednesday, August 7, 2019, 1:44:06 PM CEST Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The imx I2C controller is used in some ARM64 SoCs such as i.MX8M.
> To make use of it, append ARM64 to the list of dependencies.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 09367fc014c3..46b653621513 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -664,7 +664,7 @@ config I2C_IMG
>  
>  config I2C_IMX
>  	tristate "IMX I2C interface"
> -	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE
> +	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE || ARM64

I don't think this should be necessary at all as ARCH_MXC is also available for arm64, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/Kconfig.platforms#n167
I rather wonder why ARCH_MXC is not set. Same for fec.

>  	help
>  	  Say Y here if you want to use the IIC bus controller on
>  	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
> 




