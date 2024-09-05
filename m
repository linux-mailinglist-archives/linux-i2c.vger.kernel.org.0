Return-Path: <linux-i2c+bounces-6281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D796E501
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63BED1F251A2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0700E1A76AF;
	Thu,  5 Sep 2024 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vB3qGyo3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8574186E40;
	Thu,  5 Sep 2024 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725571440; cv=none; b=qMcEQaqXE5mTLJXFv3l9u4zoV9B/Xb8ieh8ZZYWg6B/VUjQ3RC2SZ4KQMJIUkc3mUfms4MUaoIcBOUSxCpJoiZyD/8s6e14CDf4zqsXSF1VhRklJZTtxZs2l1f4nxEs5aoLWTaodKpqjzLpaknivLfmmwzJ5V3BhQ7QAs1tPyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725571440; c=relaxed/simple;
	bh=b3ULdFogwoeI0XvlpVirzfRUhuJ43tY9H/6dFn25c6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElSYsESSN/Y2qv9j+/aPQBu0LK4s94J+3h5FRw4nTd0cnYOv/LdsY5U0o8QQV4G1thVTaJT8o1fllbgtawtd+fg9tsqUUNlJODUzvLnOJB3FIZry5U3cnGBntaJcP2yYB+PEUOtdWhlMi9xljt0cObYvKZtBJJow8drCEx1Okhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vB3qGyo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F7C4CEC3;
	Thu,  5 Sep 2024 21:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725571440;
	bh=b3ULdFogwoeI0XvlpVirzfRUhuJ43tY9H/6dFn25c6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vB3qGyo35LrR5C41h10LIV33t3xyDtceS/qKSEAHhWj1WDAH7+lAjcSvT7wJOdMTZ
	 gu0VqPYo7BEEGeq4qjd0vvVuRFUoX0TUgUn35MI5LjJfQAUncHYCYOcoCxQ997V8WX
	 49sn5PdSFqnZEUbGWquG7epp6wRZnXrkpIgX11wPAtxJ8ooJf6wJ5LEOYHI2iOnzWD
	 mJnMvjhgbTduP1YutUQ6oGYsni/GJtxOam6Plc3ohf8fA3WcI5nxun01OxDUG1Drz6
	 37tfxXxFLK9YIhv28cmAFJCr0AWmdnINNxQPR8RFu0CbemhsLB1UHN0nXSHX57JnrG
	 SSI1MwV9twtJw==
Date: Thu, 5 Sep 2024 23:23:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830034640.7049-2-kfting@nuvoton.com>

Hi Tyrone,

On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> The original design supports 10 slave addresses although only 2

please remember that the "slave" term has been replaced by the
"target" term. I will change it when applying the patch.

> addresses are required for current implementation.
> 
> Restore the npcm_i2caddr array length to fix the smatch warning.
> 
> Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")

I don't think the Fixes tag is necessary here. This change is
primarily addressing a static analyzer warning. While some cases
come close to a buffer overflow, it couldn’t have occurred in
practice since we don't actually have the devices listed in
npcm_i2caddr[].

> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..bbcb4d6668ce 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -136,11 +136,13 @@ enum i2c_addr {
>   * Since the addr regs are sprinkled all over the address space,
>   * use this array to get the address or each register.
>   */
> -#define I2C_NUM_OWN_ADDR 2
> +#define I2C_NUM_OWN_ADDR 10
>  #define I2C_NUM_OWN_ADDR_SUPPORTED 2
>  
>  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> -	NPCM_I2CADDR1, NPCM_I2CADDR2,
> +	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> +	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
> +	NPCM_I2CADDR9, NPCM_I2CADDR10,

Looks a bit hacky, but serves the purpose.

The core issue in "npcm_i2c_slave_enable()" is the lack of an
upper boundary check, which could potentially lead to a buffer
overflow. In practice, we rely on the assumption that these
addresses don’t exist in the real world.

An easier fix could have been:

@@ -629,7 +629,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
        if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
                dev_err(bus->dev, "try to enable more than 2 SA not supported\n");

-       if (addr_type >= I2C_ARP_ADDR)
+       if (addr_type > I2C_SLAVE_ADDR2)
                return -EFAULT;

        /* Set and enable the address */

But yours is a bit more robust, so that I'm going to take this
patch.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

>  };
>  #endif
>  
> -- 
> 2.34.1
> 

