Return-Path: <linux-i2c+bounces-10312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0EA874DD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 01:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88DC516ECA9
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 23:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9187A188CAE;
	Sun, 13 Apr 2025 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic7ONa6t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3725674E;
	Sun, 13 Apr 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744585582; cv=none; b=VCvgQdma3UJTZOZmXNbz+/ZmWFfff+0uvHCSTmt9BN+pWxg6gAudk9j2M3mRKb7DVRY+PXyROuB2oqvM//Uy04/O71iJT3KOulYk03jmfOPgHRvs8D/X6GYD7q8GZDVGU5NF1Dc28CxSrBwlR9HYT4mC9b7HJKrVM3D42gL9SPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744585582; c=relaxed/simple;
	bh=pBqnKenA44Ex98GT2/2aiRAZUxsM0POq4lWjhVKj3Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFtlKkm39TrvNMCHbhflsvMTmUT28TfJlHhUfDfFNNRifjwIXHyoKwVltYC6g9LkHL3GGQ1ow7NkbuuTimL07HZaWcD68t/UdcwdPGQtHVfI7WVciWIyipcIFpy2Xh+lHNbXBjNEmFa9MUMsTaHqyunz1Cg34ZuZwQu2DmlrfHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic7ONa6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DB0C4CEDD;
	Sun, 13 Apr 2025 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744585581;
	bh=pBqnKenA44Ex98GT2/2aiRAZUxsM0POq4lWjhVKj3Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic7ONa6tP4j0nT8/gdLyKgfwEPXuItsccXSDD3UbZ/X2/HjYpQi+qOjIip1MN595P
	 tQRr+Od7JzuaM+Ko3vdO71mZcAfUepMh5cV8WGTZhvSZC8D4Qtw+mQXJavZyOFSlsW
	 uwOGmI0bqj+H2o24rB77iUsezq9uMnD86ML5cyRzZdynH8oegeMBYxsllX1vvvWshE
	 glLrtIFwzPu0JKo3/8Djz34Uu1q8NvmzaXWNlUcfVi4/CVXvsFxWfMK+1nqAO+7Qq5
	 RVvpGxUNk5v9VedIo/98U0yDzRfni7InfwzsyMUrsVlbAvc/73jhkCdYweR35QPVIA
	 PXFSJ8CXgB1+w==
Date: Mon, 14 Apr 2025 01:06:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: mohammed.0.elbadry@gmail.com
Cc: Tali Perry <tali.perry1@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
Message-ID: <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>

Hi Mohammed,

On Fri, Mar 28, 2025 at 07:32:50PM +0000, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---

we are missing the changelog here. You are at v4 and I need to
see the changes between the versions. For now it's OK, please,
next time don't forget to add the changelog.

One more thing, no need to send patches as --in-reply-to your
previous patch.

>  drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..caf9aa1e6319 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
>  
>  	/* Check HW is OK: SDA and SCL should be high at this point. */
>  	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
> -		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
> -		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
> -			npcm_i2c_get_SCL(&bus->adap));
> -		return -ENXIO;
> +		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,

the space at the beginning of the line should be removed. I will
take care of it if you won't be asked to send a new version.

> +				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> +		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> +			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
> +				bus->num, npcm_i2c_get_SDA(&bus->adap),
> +				npcm_i2c_get_SCL(&bus->adap));
> +			return -ENXIO;

why don't we return the error coming from
npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?

Thanks,
Andi

> +		}
>  	}
>  
>  	npcm_i2c_int_enable(bus, true);
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

