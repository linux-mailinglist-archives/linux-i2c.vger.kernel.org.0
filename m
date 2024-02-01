Return-Path: <linux-i2c+bounces-1575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFF8451A6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58941C23584
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4C0157E80;
	Thu,  1 Feb 2024 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlORzHnB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD17157040
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706770362; cv=none; b=hgWFeM5Hb7HiweZLLhIaKbNjLHO3T9d78xLof4Ty+MJ4h+VjBhTIpWWsYoSCtoAjtFAN1WGix7CFV9+QX4uN/p5haX6IgZDr4v++ORCSItrViN0vXrlEaQpPP0SUQymzntIhcpblzyWw+XZG74VhWWMIamm7H4G9K27+3/a3W5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706770362; c=relaxed/simple;
	bh=XR0byD4w0+sGsz+3MaDqoGbAjU32wCixQk5lEHQDsxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3ggXwOyMM4E7Oq5WuYs0mtaJoThvx8Ax2YSqAN6eOFN+7mTavACV8e8ZE53XiIj/PNhYJOxAV3/PmCznlsUydcjBigufQTCme0TELDrvLtlvSIMG55LTYxgQ6ESZwzG+1O1Q+iZyjBj8sA9wQeZi0dCA3482J59ABVO1W3Hcqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlORzHnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B036C433C7;
	Thu,  1 Feb 2024 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706770362;
	bh=XR0byD4w0+sGsz+3MaDqoGbAjU32wCixQk5lEHQDsxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlORzHnBCk/8YIiYSfvs4DyY5yhNnvfs/cYfWC6CkMhBS9Y1nCw4+saanQ3/vXO1L
	 Zu/bzkWpiLZgz0yJbI/lyF5gwUZbJNn7KjII6KKjp8ehFoyizjxfShW+6ZJRvcQ7nd
	 sbKz0ycKaHviWKr/rUiGLGfDhxQDFtuCh5Lle6bpL/rAnXs1covUZzkd9Sn+vVprv0
	 0j+7HBk+Oq4UPhMb11r+EhgVzdEyYv6cr2e2ReVFElGHWF2m/aI7kK0N2m7nLcFAnY
	 kIq/m7IMp6PR5+Z4AsHyrRHLm2odVIQ5MbtOX0g3US5sNVQ1Axj3LclaegNIDl7Q1a
	 PkQKZa625mAUQ==
Date: Thu, 1 Feb 2024 07:52:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@huawei.com>
Cc: yangyicong@hisilicon.com, f.fangjian@huawei.com, 
	jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: hisi: Add clearing tx aempty interrupt
 operation
Message-ID: <ixkypuokf3ctdvpzqamymcmu65qk3j3yhdxre6hs3uvi4wbeze@5wk27bjknmxa>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
 <20240201061345.3111600-3-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201061345.3111600-3-liudingyuan@huawei.com>

Hi Devyn,

On Thu, Feb 01, 2024 at 02:13:45PM +0800, Devyn Liu wrote:
> The driver receives the tx fifo almost empty(aempty) interrupt and
> reads the tx_aempty_int_mstat to start a round of data transfer.
> The operation of clearing the TX aempty interrupt after completing
> a write cycle is added to ensure that the FIFO is truly at almost
> empty status when an aempty interrupt is received.
> The threshold for fifo almost empty interrupt is defined as 1.
> 
> Signed-off-by: Devyn Liu <liudingyuan@huawei.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

