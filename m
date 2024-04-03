Return-Path: <linux-i2c+bounces-2744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23008968AE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 10:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1F1288DDD
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A55C61A;
	Wed,  3 Apr 2024 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkxXj4AB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A40A5C82;
	Wed,  3 Apr 2024 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133030; cv=none; b=LPEjyNBnIyJGrgFu2j7lDoqAewuJc2wPwEXQE0NxDEFUZNGlXYe9CBPgSFuUazJS2lCdJmUjGEhJcyRbzguKFDGVbYwtI7XF6DjKT+vSnu3Oi/wd5BlnYU7yDkuaOrxd8vdUXdovohLi7Inmmm67H6eelvnqR8qgNCfFcBr6ZmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133030; c=relaxed/simple;
	bh=kjqVQ6E3LGz0GgJpNmzzq9iKyJa7oFl6VehmuIK/HtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeE9t+zCPwp4OI4eV3/KwUqsc13i3m3yJJiwNg4Uyi8VPkBIwJwke1okcj/5Xw4VpBtVOk0XNMbGNmnEo9wR91hqSMWySii9f+Qr07XPqcIj+PkufDj9WUWfsf1KAEHP55NJolQ4ZX9EWnwKo6DeSP2S3yzvX6xwEIhsvXX4L40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkxXj4AB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1885CC433C7;
	Wed,  3 Apr 2024 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712133029;
	bh=kjqVQ6E3LGz0GgJpNmzzq9iKyJa7oFl6VehmuIK/HtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkxXj4AB3ybXO0LR+NGpVlBB+kDGFlRF72bGs9vkfP4HGGLZxEwOxD9U6F28cjqOY
	 RiNKp8BDBjQ80n8XEuYG8q3O7C2IZQT44SBdGWl7KrE4bHgFPIGdbLCoVW86m9sO0P
	 aVnl3aDbCsex5TWqud/xBjGBs966IxfgtVsKL3dWTjv1btjykFVjr2jAZsg4dDw16x
	 GNver1nnlp/7OTsB0ipqRWidTs4Jsz6NDxVRRwiRdygxd+zVARug5B617RefpVbP0t
	 6IWSRkPdykyYh1lCk6yjDLqNOO7DV8b42TYN0QHcuCWv2lzbNovY9qkZrh/zfAr8kV
	 s6scXTdj8lqAw==
Date: Wed, 3 Apr 2024 11:30:25 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
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
Subject: Re: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more
 inclusive
Message-ID: <20240403083025.GT11187@unreal>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-2-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-2-eahariha@linux.microsoft.com>

On Fri, Mar 29, 2024 at 05:00:25PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's series
> to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
> the approved verbiage exists in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
>  drivers/infiniband/hw/hfi1/chip.h           |  2 +-
>  drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
>  drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
>  drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
>  drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
>  drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
>  drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
>  drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
>  9 files changed, 40 insertions(+), 40 deletions(-)

hfi1 and qib work perfectly fine with the current terminology. There is
no need to change old code just for the sake of change.

Let's drop this patch.

Thanks

