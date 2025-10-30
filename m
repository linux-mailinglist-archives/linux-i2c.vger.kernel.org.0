Return-Path: <linux-i2c+bounces-13909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20595C20F55
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 16:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1AF546365D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FA63655D2;
	Thu, 30 Oct 2025 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twvq8vx/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4783655CA;
	Thu, 30 Oct 2025 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838468; cv=none; b=hEtJjuGu2FItfp1vrE7RoSQJVuc+vJgeawJs8+kY/gQjYu57YW5YSWAXA3EJXDEOIcs6dIrMde0qXY6kmDct+n+zxUaZ8cX3KewnLU+GtUPkWeQEESrulytUWQKSoa/E2c6mILGqjeHN+ALgrH4iG9p1sM5IdWaTInW6CLPm5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838468; c=relaxed/simple;
	bh=OyXHR6XYNNU2ifnDb9UD0UTobJRP1sqkacwAo98BRNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4gjRol/yVFXxGNv3SphmQOLzGHHJcYEK1TTUnfcOfWmA/nmFDFlWuJ/LtSEfaMMrf53x2J4xAsWc/41o1AEN53LZQVU03RMBk+MiaspJYT6NRYVgTLC8erQYmeDASfEdtxb5UruLf/wJ49W87B5IOm45kYzWhaaFOsXJMspmMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twvq8vx/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536E2C113D0;
	Thu, 30 Oct 2025 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838468;
	bh=OyXHR6XYNNU2ifnDb9UD0UTobJRP1sqkacwAo98BRNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twvq8vx/XZXuAMBTIzzJHsaV+h/kYq+kvXbpoiihP98R6Ef3S/7UMtQTidm+I0lti
	 7WT22sMXhwOXvVgT+simou2SOrA4ZMPV6MDBhssJ+dW1XBjCbLBUpobsa0Rxq/t+t7
	 4VRcVSh6//l8igqtIbUqA1ZJuJ55ik1tx1cDV4HyDM+J0hJK3Pfg8AEgtm5HRnqGGg
	 Scfcl9pIu+VUtkT/Hy0sp2MILeV9LJHec8vTfio4hf8LRnzGwUEF2/y4Z16LtB90ub
	 EgeeACkPTFtk26l+PA/uZe9HnGqriXZ2d4SlG6QN49NyPP77dsYaR8h/4qaJHj5F49
	 XYTuK5dOY872A==
Date: Thu, 30 Oct 2025 16:34:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Faraz Ata <faraz.ata@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rosa.pila@samsung.com, dev.tailor@samsung.com, pritam.sutar@samsung.com
Subject: Re: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports
Message-ID: <2knbzksxobg2kl3aexuiwluctgafgzxblsqc5q5rcikuruuegr@cqlizryhhx4s>
References: <CGME20251014111455epcas5p30731028365023e101dad3b9ba1f90bec@epcas5p3.samsung.com>
 <20251014112338.2023223-1-faraz.ata@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014112338.2023223-1-faraz.ata@samsung.com>

Hi Faraz,

On Tue, Oct 14, 2025 at 04:53:38PM +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add i2c nodes for all the instances.
> 
> Signed-off-by: Faraz Ata <faraz.ata@samsung.com>

what happened to patch 1/1?

Andi

