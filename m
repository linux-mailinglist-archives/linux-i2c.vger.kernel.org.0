Return-Path: <linux-i2c+bounces-3414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0E8BB6E8
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2024 00:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7983283063
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 22:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4742B74BE4;
	Fri,  3 May 2024 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LizLuuvl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C081EB21;
	Fri,  3 May 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714774382; cv=none; b=Dx6AiNMVv2inNUYHJ8C6ocU+Tc4cHmAf5gZ47YUPF1z4Nafy++oIxMJnBFBvzsgyrrEOMHTNfUcKcReRJ87bSlgehr+qtFS7KXInPEULYu9SEUn70JDK7fhZw17BUlQcUSHTYrbZAkAbYooHbXPFpXDlXejFOo68txYZ8R3chs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714774382; c=relaxed/simple;
	bh=lfmOGOZfhnCUlEiIDxBBf2bhFfZo+XWkOL15C/9q4gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jL0ld8vNAmHUBKWX76C9ZS44enJSRwxISvGUjIhS+mNwCkK/WkdzOQj8bVpx+fhNDrR3B0cGNL6t9pbOmMmsIR68L95BfWcYVlknvpm7cV/qEIEPs8D3GSKtRYiZlVHSZ5srEarObYIfzuxDYp1kesSLtuEm+lFIrJRHOWdDeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LizLuuvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21A6C116B1;
	Fri,  3 May 2024 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714774381;
	bh=lfmOGOZfhnCUlEiIDxBBf2bhFfZo+XWkOL15C/9q4gg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LizLuuvl3rIQpUP79UErjXcSkos8A0+bWmuon50exKaQxHHovPycNRnTPTY42cSdK
	 tPk26zSCuLzBZBmwxgmvlxX4SJ+nUmpVGWJC9f7/vYwj9yqsa1Pd8/Z/td2Irvy8LU
	 u26vNVtSW9V2MJPM2EMAMZCaLNiVRfP3k/NV1t6mmHVc6SYd7iZbkYK7zk5bhDEE4W
	 dzMTBykNicvk4hvWRqa9jwQUyxPjCkYMtbaCd0opgAr2WdJU75sm4LkESwDbMraJGL
	 2XSMKIhrFZSc+5Bs6hGpAfMTG0dHdow/2S95mJpAFgHi+Lo4RCvM3nco5D4wCcRYD5
	 s0IILBeTsS96w==
Date: Fri, 3 May 2024 15:13:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>, Martin Habets
 <habetsm.xilinx@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org (open list:SFC NETWORK
 DRIVER), linux-net-drivers@amd.com (open list:SFC NETWORK DRIVER),
 linux-kernel@vger.kernel.org (open list), Wolfram Sang
 <wsa+renesas@sang-engineering.com>, amd-gfx@lists.freedesktop.org (open
 list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open
 list:DRM DRIVERS), intel-gfx@lists.freedesktop.org (open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS), intel-xe@lists.freedesktop.org (open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM
 HOST DRIVERS), linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX
 DRIVER), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: Re: [PATCH v1 10/12] sfc: falcon: Make I2C terminology more
 inclusive
Message-ID: <20240503151300.0f202c30@kernel.org>
In-Reply-To: <20240430173812.1423757-11-eahariha@linux.microsoft.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
	<20240430173812.1423757-11-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Apr 2024 17:38:09 +0000 Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended

FWIW we're assuming someone (Wolfram?) will take all of these,
instead of area maintainers picking them individually.
Please let us know if that's incorrect.

