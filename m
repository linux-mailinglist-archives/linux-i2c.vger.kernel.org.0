Return-Path: <linux-i2c+bounces-2707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEBC894D7A
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 10:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B8F1F21C3B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 08:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636FC5820C;
	Tue,  2 Apr 2024 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l55a3AM4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E9F45008;
	Tue,  2 Apr 2024 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046598; cv=none; b=r/bLCT0Y3qYYjDcakFtv42gnCJjbOBipGKbW52Fry7yxzLh/tBd563n28l2qXGPLZK4w0/uk6+V3M45W5QaFGucMuV0z1ZOXN9wI7g7xhDlAcHGTDgr9sMaxFMwm3kY4vLq0om4PWIlwkNErTbvb5oigX+6RcWq+iK0Q8FMOXgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046598; c=relaxed/simple;
	bh=KLiOyU5gxLUsegc5eE8/HwQZQ1rmvicDU4hOpKd3aeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLuoTD1n1sYBxD/oGgzj7yIfBMEBo74YOZ1h1M4w1UzudHhb9RA6KFjbH2AuQxDHZQHKHr8kjioin0ef5jQ29plFeiEhTEPsGrloZLox/5jDkl/KESvm1ZkvPCi5PBfizKxjJKIZ+RlW7Fc/WJX2wSOvRUPj2e5OndarLHKFxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l55a3AM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6A2C43394;
	Tue,  2 Apr 2024 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712046597;
	bh=KLiOyU5gxLUsegc5eE8/HwQZQ1rmvicDU4hOpKd3aeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l55a3AM46XbBh4JItwGhAxKslyWIKIYKui6nTuLqnelnvoCzqlpqOBF855wp5JiYA
	 Yowmji/9KFQKT7t3FXrheQWOfrZKhf4TXyansdGzhWv+JZ0NKjtP2vXTecC/0VBNXb
	 iyeRoNhrs0sqvkO3VW5XtNeqcA6vj8bE4n+Bku10Paa7Sw2yozjgMMQor1qpvpJeni
	 NYcWL13S4L1UDvWSpOd96u0uvRmBx+otENbremo5gbkAPR5nG4KtoKeteSAikD4VQo
	 aHJSXR2CScq7H9dhwpbQ9dZeGJASNTbz3sbft5dih+eH9O18+aPLDPwjNCJ64V3l+M
	 Jnld7gjc+HRxA==
Date: Tue, 2 Apr 2024 09:29:51 +0100
From: Simon Horman <horms@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
	"open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240402082951.GG26556@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-11-eahariha@linux.microsoft.com>

On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Simon Horman <horms@kernel.org>


