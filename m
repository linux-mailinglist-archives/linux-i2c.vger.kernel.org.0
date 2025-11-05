Return-Path: <linux-i2c+bounces-13969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03178C38329
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 23:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D2974EEEAB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 22:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582322F28FC;
	Wed,  5 Nov 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="OPcHwbqx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74192F3623;
	Wed,  5 Nov 2025 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381812; cv=none; b=OqF62sGy/kyuThVw6LWHfQ75/14WHQIfU/W/yCaKOHtnvO5UEZ0OfNr4FGY0VL8Yp4bXduxltcLKWVReV8bX/tP/66mN0jAxe8UXBs3Yu41S9CE45w3Ssf1MrPiohSC+hYbBXE0e4Exw+LhIIqLEix0ORFdS7dzF/WwfDZX/MbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381812; c=relaxed/simple;
	bh=vVspHf5LTMyFcJYODG05qcUbJXGBMGzKZSFjQ+kuIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIAma0n+j4VynoFGvlHlBMF+QsST57c/vBeuQ61CUlKuQhOoPYB7iqzJXHOWG8SkrL6VHUdDIGuIx24+4qWiaFyLnXWJNJ2FYHpYF9NGTLjVct5uOXpGNdzFS4slLpt5p0uSr1qfGRAF/RopscpmoM5tp4KxXqBGHkHaboIN0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=OPcHwbqx; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=1WB5YF5L/yshQ2OgpgkrePCro6RnXwXz3n/xIbIvOQY=; b=OPcHwbqxQ1iw8ViCOSGmOjffci
	YP2eeZLGx6cZSs8sw7JAHuDe5wiKgcWCxhbfIODy0ThEKlw2loWmouMvUq53+VRy9L+tBISfR/n/B
	Ip0DZd8V3WIFGFL4ZWNz4WdAmdV796F++EyH+7AwpvssVy/ZadmfxMhmXCdwXIb4WUghzqiHFgven
	UlX9E9iFTg7sus1a5XimzT+O3h/08xnSOG/uaMfH6l97pvvtSTTCNcWvMzC+1jhkMWdEo94219tQh
	7bqaK58K91lOo1Y3yDaVuuHmSeoh7LxG6A7poi6+IiIMkzAYi8wXrafdsXe4Wop5e2pE47lvJugxn
	DPLD1sjA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGm0n-0000000AelV-0U9O;
	Wed, 05 Nov 2025 23:29:53 +0100
Date: Wed, 5 Nov 2025 23:29:52 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <aQvP4HVcpX-MDZBJ@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-10-09 17:59, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v4:
> - refactor for better readability: simplify condition check and moving if/else (timeout/
>   wait_xfer_complete) logic into a function
> - remove irrelevant changes
> - remove the status clear call in spacemit_i2c_xfer_common()
> - sort functions to avoid forward declarations,
>   move unavoidable ones above function definitions
> - use udelay() in atomic context to avoid sleeping
> - wait for MSD on the last byte in wait_pio_xfer()
> - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com
> 
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - Patch 1/6:
>   Patch 3/6:
>   Patch 4/6:
>     - nothing
> - Patch 2/6:
>   - remove is_pio judgement in irq_handler()
> - Patch 5/6:
>   - fix wrong comment
>   - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
>     return directly instead of using break.
> - Patch 6/6:
>   - add is_pio judgement in irq_handler()
>   - use a fixed timeout value when PIO
>   - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> 
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>  drivers/i2c/busses/i2c-k1.c | 229 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 185 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..a13284f840ee967466a01375e6603f7568a42f86 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,8 @@
>  
>  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>  
> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> +
>  enum spacemit_i2c_state {
>  	SPACEMIT_STATE_IDLE,
>  	SPACEMIT_STATE_START,
> @@ -125,10 +127,14 @@ struct spacemit_i2c_dev {
>  
>  	enum spacemit_i2c_state state;
>  	bool read;
> +	bool use_pio;
>  	struct completion complete;
>  	u32 status;
>  };
>  
> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
> +

At least for spacemit_i2c_err_check, the forward declaration can be 
avoided by moving code, which is anyway probably better done in a 
separate patch.

Besides this nitpick, this sounds good, so:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

