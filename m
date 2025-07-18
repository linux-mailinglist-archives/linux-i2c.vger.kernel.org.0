Return-Path: <linux-i2c+bounces-11960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B72B09DAE
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 10:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4215A2DB9
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1C7296163;
	Fri, 18 Jul 2025 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="lA6uPFVv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB3219E975;
	Fri, 18 Jul 2025 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826666; cv=none; b=pSLtzr3zScODY3ZfpHp38Umd1wvHkXI7Y5WaSlgktp6uaLRJ3eA4FszNbJjiZUwz+RDz1MPa9p/gwoFbXgWiNhXDoq0HaPKGCPU+wYGguapkqH49ZNe6mxFZ2mObExISsi6s23wWEhLw982CBf9srnEMvyqVDhpz10J+7zggBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826666; c=relaxed/simple;
	bh=lHcSyiRIMLiIxySb7kPEVYUOSRAPQet3kxOWKTLW1p0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEfSFNQAb/O7sCXwsllJhsUz8pe6gUqR+mnzahTMLWqrK7gKKOn/k06WxRuerVQB/LPu1RNmfvONNMX2xrVGJ1fYuT1uEVnMsiBl0vy1tdRjHVhAj4wbfbnEoRkGMp9HSwat4+mVoQ64Ix1diOQGN7h6c7Q1IFkGFshGaqojkQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=lA6uPFVv; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=E/IoN6/9dGODDuVI2rSc4k7x3nu31cjT2mdu1L1DJnM=; b=lA6uPFVvrNauB5Ehu6I3leHi+w
	5g5KEE6vEsuCfboaDpFH73Et1kwDAKfx03ol0gpG56TF8tLy0EEPU9osFd3wJv4CaEpubTOUxkTkn
	J5JEAEHsmfS2nyA50skGHEqMJh0nb1gbEX2HgzBZ+9ueIJOTa5wdHP3CdjlFvUpfpERkPD4ZmfGuW
	XefJ4WVqhANfSAV1G9ovoHNsORs/wSqX3iym5IOluj0RzqVfw/hwBltkrXm+pL0UyTBFKo4TiWI7e
	Sr3PMDPWXwxzvoaLqlwzet22pBMehs+/fQ0u/gMNVGCIv5jrAl0FJFLM3LLUlgCWoheh1cnOJ+jRS
	J8pL1kqw==;
Date: Fri, 18 Jul 2025 10:17:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
 andi.shyti@kernel.org, miaoqinglang@huawei.com, grygorii.strashko@ti.com,
 wsa@kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: omap: Fix an error handling path in
 omap_i2c_probe()
Message-ID: <20250718101727.776611a0@akair>
In-Reply-To: <af8a9b62996bebbaaa7c02986aa2a8325ef11596.1751701715.git.christophe.jaillet@wanadoo.fr>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
	<af8a9b62996bebbaaa7c02986aa2a8325ef11596.1751701715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat,  5 Jul 2025 09:57:38 +0200
schrieb Christophe JAILLET <christophe.jaillet@wanadoo.fr>:

> If an error occurs after pm_runtime_use_autosuspend(), a corresponding
> pm_runtime_dont_use_autosuspend() should be called.
> 
> In case of error in pm_runtime_resume_and_get(), it is not the case because
> the error handling path is wrongly ordered.
> Fix it.
> 
> Fixes: 780f62974125 ("i2c: omap: fix reference leak when pm_runtime_get_sync fails")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
> Compile tested only.
> ---
>  drivers/i2c/busses/i2c-omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 485313d872e5..ef1193e0e62d 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1523,9 +1523,9 @@ omap_i2c_probe(struct platform_device *pdev)
>  	if (omap->mux_state)
>  		mux_state_deselect(omap->mux_state);
>  err_put_pm:
> -	pm_runtime_dont_use_autosuspend(omap->dev);
>  	pm_runtime_put_sync(omap->dev);
>  err_disable_pm:
> +	pm_runtime_dont_use_autosuspend(omap->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
>  	return r;


