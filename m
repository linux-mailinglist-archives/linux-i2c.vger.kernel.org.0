Return-Path: <linux-i2c+bounces-1668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA884EA77
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A0FBB288C4
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FB44F602;
	Thu,  8 Feb 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFxqjXV+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1014F5F7;
	Thu,  8 Feb 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707427408; cv=none; b=PMY/0Yfep02oxwHETr34pA5KtPhPSqGVQ8WXWBNpiF3IGR58WrFU7bCAwbMkRoV5NpBjM3Fu/6fKZTeDcvd66IU3aMKVBOgBNq6NWF6gV6x3bkPniJ6PkZpZTDMrcExquGfLitbkm1Yim13yi9S8T6xxM7KZ2ef2mrXCcsDvy2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707427408; c=relaxed/simple;
	bh=rkgibKPfItQAaRHCkNlK+ov2fvJUMtVo46Whp3LlkEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shjc0iQNPFMDMTbiRxFjlvyaI16uQSFKDA8WEpq33zdUUMpiLAs+nsMMpADu4lu+nrBg6ezhZGaMSq1qpuRW/yIM9i/jC34uFmlbE2gPAmKJCTRCm6fm35v64LQ4U53LU3FS7hEGJ08pzyFQ6fWupx+00iJ/ghs5a+RuP4oBf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFxqjXV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F0C433C7;
	Thu,  8 Feb 2024 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707427408;
	bh=rkgibKPfItQAaRHCkNlK+ov2fvJUMtVo46Whp3LlkEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFxqjXV+FiS/wJOYVWIwOow14yDYMlveXZ0tHMhavkf9/dJp+b3mgtNxVEUyflVjm
	 Pe7juDWSejQ4MpYwwAZEnJnrDNk5FEzB9rmTZQduO4cmqykHxeWNbbifP2mHDGKqJT
	 tUsy4+WV3n37fNBNRT+rdjnXANE0vJh+34UIPvfSTW4Xo/6Pky82H2paz2XAL12tfS
	 P3adFGw6CyF7NZwpPflbUtto893NPJnsBPZ+yLLL21ipXBwIBLRBnpyJgnwuYhd7Qp
	 Sbzs7qH0hPQ9yBuFEKaxg98/tSKz6U9AbExa8AHhicTIxg+0G6pk1j5lN2TFuYKtjA
	 K31fhPy/keOJg==
Date: Thu, 8 Feb 2024 22:23:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v3 1/4] i2c: thunderx: Clock divisor logic changes
Message-ID: <bkqn47hlwfohd4a7k4jkcb2yljtccldedvmfazcmwjs7xfcyxl@snuj66zi3dfk>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
 <20240206114349.32197-2-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206114349.32197-2-pmalgujar@marvell.com>

Hi Piyush,

On Tue, Feb 06, 2024 at 03:43:46AM -0800, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Handle changes to clock divisor logic for OcteonTX2 SoC family using
> subsystem ID and using default reference clock source as 100MHz.
> 
> Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  MAINTAINERS                              |  1 +
>  drivers/i2c/busses/i2c-octeon-core.c     | 29 ++++++++++++++++++++----
>  drivers/i2c/busses/i2c-octeon-core.h     | 17 ++++++++++++++
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 ++++++
>  4 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 960512bec42885c0f1632a7c90851c3d32fbf20e..92b0a55c36e41cf54c7cbf52576d5424b591aa31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4725,6 +4725,7 @@ F:	drivers/net/wireless/ath/carl9170/
>  
>  CAVIUM I2C DRIVER
>  M:	Robert Richter <rric@kernel.org>
> +M:	Suneel Garapati <sgarapati@marvell.com>

Suneel doesn't have much of a history here, though. Can I have an
ack from Robert?

In any case, can you please put this change outside from the
series as it would take a different path.

Thanks,
Andi

