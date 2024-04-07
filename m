Return-Path: <linux-i2c+bounces-2807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B889AFC6
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 10:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2327E1C210E0
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 08:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23635111BB;
	Sun,  7 Apr 2024 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsYhQ30R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C498E1C0DC6;
	Sun,  7 Apr 2024 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712479777; cv=none; b=R9zMLMnBpzxgn3nNTwx667qpre/0dJ4oI3EVNG8iPe/kkPApWXCV0fQPDFPp7m+YIyo9S0br2boXWH+KhaIqfwleJXrsc1bA9C4cOdhPdr3FmHYxzB9g2l9D76ikET6C+Qe80FrqaJNAUZ238UmkCo9jr4/PWqsZrsWbIE+mT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712479777; c=relaxed/simple;
	bh=9GexqZRzYwWDDWeEy+/lg6I4B9teFNss+7Iws8stJWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRNPhzl80xt60vRLW6h0am30zK/3+GgkvG0OrpsUm7ASd8T/DoLBMvofTuRA7S1dYeciqrVObFbbJRbnMdabf+Yuyqk4FQWL9hz4aalOpyp4XvgTqoBNQkNjrNQeIBCNkgXYZg0uAsxVVpIN+PdQQjNBqDYRMNYv52ZyuJeYjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsYhQ30R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B894CC433F1;
	Sun,  7 Apr 2024 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712479777;
	bh=9GexqZRzYwWDDWeEy+/lg6I4B9teFNss+7Iws8stJWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsYhQ30RiNQ08UMek5dA4CNyvVWLNNLOpkEsyduifmK1Tj4XpLRA7LVTj2YkBDZXm
	 N7VzP2/DszZcWNJWdLmA2CqdSWEXTAzNUlTq/TSjEANRYJ434Df6+129CUqRDVP7DN
	 eBOQTNlDk9lZRGjvjHo3mMxetTDsvzrvfl8qiJ2t5enPne6X3kTA5g9tJCFUIAEElV
	 d1W9EScb9v5p2WyGdUSWR27nfRbEus4VWc/L5Dn5ww2OmyxQpNBk77r/x9HroCKCu8
	 HJrvhoBs1p93fhFJek+k3PGtGkmy8k13ooNYdNqrwGRCebsszSc95EsJ0gTn4Z5ycQ
	 tOkkQIJjbsJxQ==
Date: Sun, 7 Apr 2024 09:49:29 +0100
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
Message-ID: <20240407084929.GX26556@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
 <20240402082951.GG26556@kernel.org>
 <cd983b4d-70dc-47b8-96cd-55bba39eb892@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd983b4d-70dc-47b8-96cd-55bba39eb892@linux.microsoft.com>

On Thu, Apr 04, 2024 at 12:17:26PM -0700, Easwar Hariharan wrote:
> On 4/2/2024 1:29 AM, Simon Horman wrote:
> > On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> >>
> >> Compile tested, no functionality changes intended
> >>
> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> >>
> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> 
> Thank you, Simon, for reviewing. I believe that we are settling on controller/target
> terminology from feedback on the other drivers in this series. Would you want to re-review
> v1 with that change, or should I add you R-B in v1 despite the change?

Thanks for asking,

either way is fine by me.

