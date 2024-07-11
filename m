Return-Path: <linux-i2c+bounces-4945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8992F2C9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 01:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770A5B233C9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 23:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFC715EFC4;
	Thu, 11 Jul 2024 23:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdQdYcGe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657466EB7C;
	Thu, 11 Jul 2024 23:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720741703; cv=none; b=rsUEh5SVfftK21JCGlSVgpOGdP09h3hlA3ZnIQPsfuKA9cY/wQplmRIqigo9KaIHXb3dKgsGimbIPMGKfyA+iF9nsUg2TylArnTLGRp9xmuwgNnScYVzfuZcVAcHgL3IEvZE5vmT/aOUhpRQrTuQXhckTinPDcUMhilo/5NWViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720741703; c=relaxed/simple;
	bh=P8s+d9RaUcVBTYM7WleDb/g6oCcf+IbbjjLZjfg98NY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv4wgDIXU2lmpbKkS1OT7beMU2k639fKO8Da0hDGLuIKb8HyqqVmLtvxqf74pT3irvYxMKyGgeSfSxP9C73ZQdrwh/78joRKa1KymlzTSZedYRnUbIsdLYybtv1jOP/EL1MDR/HI2qxwaYtkDKqEqLEMPdASPImpr19v9JuyYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdQdYcGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D19C4AF09;
	Thu, 11 Jul 2024 23:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720741702;
	bh=P8s+d9RaUcVBTYM7WleDb/g6oCcf+IbbjjLZjfg98NY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=BdQdYcGetQdpLaeWZKMgVDq8z45XLPWJUiPfB7me3RHxzFdK37dEc6NnAM3nX80w+
	 IRUvFjJJXyqD7DtmIE6gsdrVdKjqVxzqbjXYUp5mf1NkvMG6yb8ptcWxDbCBsV/28h
	 Pccy0TUDT2onu0MEtvZNLbFAtJsPZJVJqXZ2GCF1gDrBEd/A9/uE4Hc7DIVFO83k4/
	 Kzzat6P2CpEsPTYQ21QhdbqnQBfwEQ8N4kS2/4FnaCxg5u4UIgPXEOKML7pv4+2l8r
	 8Jjc9ukPsNwXS7BqYfdr+7AQ35ySfpAXtHnAp3JInw3JUlCCPVu50qGDJc9aSUH6DK
	 Fmf8YP0zJ0psw==
Date: Fri, 12 Jul 2024 01:48:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: ensure Gen3+ reset does not disturb local
 targets
Message-ID: <x3vki7j7ulld6jz4vqv2mfg6xbhcr6yliod5fnmqmw3jvu5rra@julwoep6ayct>
References: <20240711083043.8334-2-wsa+renesas@sang-engineering.com>
 <ZpBL90Ko-B9oxCLK@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpBL90Ko-B9oxCLK@shikoro>

Hi Wolfram,

On Thu, Jul 11, 2024 at 11:17:43PM GMT, Wolfram Sang wrote:
> On Thu, Jul 11, 2024 at 10:30:44AM +0200, Wolfram Sang wrote:
> > R-Car Gen3+ needs a reset before every controller transfer. That erases
> > configuration of a potentially in parallel running local target
> > instance. To avoid this disruption, avoid controller transfers if a
> > local target is running. Also, disable SMBusHostNotify because it
> > requires being a controller and local target at the same time.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Fixes: 3b770017b03a ("i2c: rcar: handle RXDMA HW behaviour on Gen3")

I was about to ask.

Pushed to i2c/i2c-host-fixes.

Thanks,
Andi

