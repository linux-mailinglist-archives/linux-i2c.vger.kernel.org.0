Return-Path: <linux-i2c+bounces-14615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AACC5912
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 01:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 189EA3070F13
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 00:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B6114A4CC;
	Wed, 17 Dec 2025 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfg44EYP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EE1CAB3;
	Wed, 17 Dec 2025 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765930231; cv=none; b=UpG1CG1/hRuDu4btXwaEbCcYRxDORXBGuX6Be+24YNaY7+SNkvh3lTk9pSk5gnwKByk+LswKp9n6WojE92xhCm5TFg8AW1lXJb1OPTQefN1c0i8h4YExqu8GvUx6at+iDoqgexF6yya/0dVkAoyo/ZTHuBF+/T0h0v7PKrfDYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765930231; c=relaxed/simple;
	bh=z5wVETfr8eg/QjTXImjVmFJT5T4NRB4FJcexh1oBrp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1yqXANLg3Km5tTMPXysbujAA6SArysOWoD0g7oeTJP2FaMKdL9QFGw9hCeXtRlPbiLw+yFzU6QCeTi37FsuzimlfBGz4UKINMeVx4I0B4MonInlOeLrdSFbuVMiONujkis5mzaUzU2ReNa6I+/1i03CCqN2AjQufW9jEz55ScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfg44EYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F38EC4CEF1;
	Wed, 17 Dec 2025 00:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765930231;
	bh=z5wVETfr8eg/QjTXImjVmFJT5T4NRB4FJcexh1oBrp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfg44EYPpxb3XZZRwALuJWH9OT8+2J/u3pCRxEn3126gJpPbCBcBETPHJntfiHC1n
	 HFk4UWbDjB7U0K9HrY61jTuDa4mOsggX1z+WXhx2C8ApA+1g/LtNxL/ODBevrH7PLs
	 t+7HKqEbkBobe8E2x9A/JkDC1m6oZQdJKH18kL9rqQWUU8ETu7n7mODyEFRzdeDsup
	 0/kphTUEnvIntH8iAPl5eKKU4Y3fY5O1P2ems5ELLy2icSg0IYH8h3YDhGrB7Ri2vJ
	 Xwyte1gdpNmg8SrR5X6MvlktdQeB399Ut/TvrzxWi7mD2E+mH3DTKKNFOtT0d1wk0C
	 o7J0D7WEDAJ/A==
Date: Wed, 17 Dec 2025 01:10:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <hiriaxgujokllanjmdouw2ojstpxfpcpyo6dfzwnkq6qazl27r@zr2amt2tsuq2>
References: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

On Fri, Dec 12, 2025 at 12:58:57PM +0100, Tommaso Merciai wrote:
> Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> suspend support for the Renesas I2C driver and following this change
> on RZ/G3E the following WARNING is seen on entering suspend ...
> 
> [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  134.285536] ------------[ cut here ]------------
> [  134.290298] i2c i2c-2: Transfer while suspended
> [  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
> [  134.365507] Tainted: [W]=WARN
> [  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
> [  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
> [  134.391717] sp : ffff800083f23860
> [  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
> [  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
> [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
> [  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
> [  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
> [  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
> [  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
> [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
> [  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
> [  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
> [  134.466851] Call trace:
> [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
> [  134.473715]  i2c_smbus_xfer+0xbc/0x120
> [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
> [  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
> [  134.493226]  __rtc_read_time+0x44/0x88
> [  134.497012]  rtc_read_time+0x3c/0x68
> [  134.500622]  rtc_suspend+0x9c/0x170
> 
> The warning is triggered because I2C transfers can still be attempted
> while the controller is already suspended, due to inappropriate ordering
> of the system sleep callbacks.
> 
> Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ
> phase, ensuring the adapter is fully quiesced after late suspend and
> properly resumed before the early resume phase.
> 
> To support NOIRQ resume, the hardware initialization path must not invoke
> runtime PM APIs. Split the init code so that the low-level hardware setup
> can be executed without pm_runtime_get/put(). This avoids violating the
> constraint introduced by commit 1e2ef05bb8cf ("PM: Limit race conditions
> between runtime PM and system sleep (v2)"), which forbids runtime PM
> calls during early resume.
> 
> Cc: stable@vger.kernel.org
> Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

can I have an ack from Chris here?

...

> +static int riic_i2c_suspend(struct device *dev)
> +{
> +	struct riic_dev *riic = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&riic->adapter);
> +
> +	return pm_runtime_force_suspend(dev);

We should perhaps swap i2c_mark_adapter_suspended() and
pm_runtime_force_suspend()?

Andi

> +}

