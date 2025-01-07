Return-Path: <linux-i2c+bounces-8954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C268A04B9D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 22:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7527A1625F2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 21:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614B81F63F0;
	Tue,  7 Jan 2025 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnOzXt4a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3821DF98E;
	Tue,  7 Jan 2025 21:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285323; cv=none; b=bCwLixAUkhWPPquZGPj4bZVCxy2XbdNJX73i25ZbI37Bk0ZfKH1AZjK5mUBuMPn5qVR1YNZ2w1GsWS8TU6MQgCSHuoCHrSwvkQl+tSGMpR/4mQUFQfKwRjB01Sg8+RAUUdP+IEYQN5yUYXVMx3rlZ+1hI1UjtFIbLNP8QORk5vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285323; c=relaxed/simple;
	bh=8HGJB7yYUS9sd3pQ4xcMEyxzGUMIAgxhbWWr/J0ibG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ji52yOOJK5L2LqixYZya6nEJ6BNL3OhN6KCEjpSCue49EszIjjjhhe3TxErAqORBXTfxsVqskAQuBh286gARVrhopBXnmjFb7qIG5W2jWeGML++bfOlvsQOpd6G7N4k0gcTvcDQOdCW3l8JVx/YwObhZVHM45SEbmy5CWHe3E0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnOzXt4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2355BC4CED6;
	Tue,  7 Jan 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285320;
	bh=8HGJB7yYUS9sd3pQ4xcMEyxzGUMIAgxhbWWr/J0ibG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnOzXt4akD8+Qx6GknIXndlGTmvDx84LSwI5tWYy44wWBuhxUPaZbRoVxLX5RI5S/
	 1mKxL8mn40YInLs2uSPjbx3Jx/dMkoskjJ7eyrUSZ55yGXAfdAGtguqb6CxlOi76sH
	 S31COq3X6QpdUsuiOswRrY42iT7ZWbrSu6amPZMwYeA37PCFXvv1ay19UouLQ0AjcY
	 rT+9nUBahSZeWdfY7DbH1dsCGSGemhuKYslZxXUd/lksbyPAnAay7BQ6revFPIrXbv
	 Lm8R7CL0SyH2CdHcaVmxPcMi+/TqJyd/O6AyZlnrOvDf/aQQRa6X/TFHAqwkNIaGVt
	 pS8321p1o25fA==
Date: Tue, 7 Jan 2025 22:28:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com
Subject: Re: [v3,0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <q3wod6cg5p26dedukvzns6m3npqt6q3crcr7c6rf7o6r6csosd@a4uo32azmfxx>
References: <20250103143250.1521287-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103143250.1521287-1-zoie.lin@mediatek.com>

Hi Zoie,

On Fri, Jan 03, 2025 at 10:32:33PM +0800, Zoie Lin wrote:
> This series is based on linux-next, tag: next-20241220
> 
> Changes in v3:
> 
> This patch removes the autosuspend functionality from the runtime 
> PM operations in the I2C driver. These changes have been tested on 
> the target platform and confirmed to work correctly without the 
> autosuspend functionality.

Was the autosuspend delay not necessary, then?
Is there a specific reason you included it in the first place?

BTW, next time, please use the format [PATCH v3 0/1] for patches.
Also, for just one patch, a cover letter isn't really necessary.
You can include the changelog after the '---' section of the patch.
was, then, the autosuspend delay not necessary?

Andi

> Additionally, the patch resumes the I2C bus in mtk_i2c_resume_noirq() 
> to fix the unbalanced disable issue.
> 
> 
> Zoie Lin (1):
>   i2c: mediatek: add runtime PM operations and bus regulator control
> 
>  drivers/i2c/busses/i2c-mt65xx.c | 75 +++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 12 deletions(-)
> 
> -- 
> 2.45.2
> 

