Return-Path: <linux-i2c+bounces-4414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC191AAE9
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B50A9B25051
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12013198A0A;
	Thu, 27 Jun 2024 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sShDh6Ma"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C9770F9;
	Thu, 27 Jun 2024 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501333; cv=none; b=ERnzkhbysHBesNKURwD08HDwrDQGomGkImVoDA0v8nsxpZhP5lrBhCL1v6rJuWJmim5dd2Qb7I9uDAyCf5LPmBPRVbwKgdeTZ2xB+ujeoiCY0nMI/tgY4jRNFtMqIinEzjA6ER2gs4+qwzXCYAVGWy8S7fTOznQa2LNLZlKoZJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501333; c=relaxed/simple;
	bh=tQInYIHxRnPaYRvHGm1dqAKpy8UAXj2p8PUO2emFiuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPgu+R+vGK+2GYX33DARe0wVettG+RGVZu7HQPSvnE2xrPnRYdyrP9X73VkZl/2SUC49X6T7w/DPxPpVGTmYSijvx1x47mJpawNUY5p0IJjQXXLLwm1YEumMpz+fE3Pu2nE8rSzAsTY5SLOTQPLGrOR/+n2LWrQflGlBo8uPChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sShDh6Ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1627C2BBFC;
	Thu, 27 Jun 2024 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501333;
	bh=tQInYIHxRnPaYRvHGm1dqAKpy8UAXj2p8PUO2emFiuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sShDh6MalVHMuyVJGRrOfPfSwdCU6ugtKimwIzpnQhTvN0XynMP99bHkUOu8OhBA3
	 LTE2sWWkMvr0+Xnj3jhMWgx4p9GDHduxdZ+C10kL2rjZiRxJToBrO0shMUZ/32AiYG
	 EifoJgpHm+Ks2QdtZsSj3i+s4hNpy1Ca7+2k4G0C0YOeAyAOTZXkLYZ/fxz8pOIOz7
	 QTDd6Ab5WdmSkpcsL+JyKJbGuFm2e1JBCRwL7J43TKmZt7Cb+FDhQV7MgFRhixAWBk
	 F8bWlmy2CqyzA2CALWhpl2cd5OG+wAPn+p8JJUoLZ259xQLoAQz5axrp/LopZ32C6t
	 Pmh0PyCvUi83Q==
Date: Thu, 27 Jun 2024 17:15:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: testunit: don't erase registers after STOP
Message-ID: <xlr7icpmt5cl5tlmnvcgtwjfybx3mnpymfuqzkcdd2c2kolyty@eyclfojnuwwb>
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
 <20240627111445.29751-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627111445.29751-5-wsa+renesas@sang-engineering.com>

On Thu, Jun 27, 2024 at 01:14:47PM GMT, Wolfram Sang wrote:
> STOP fallsthrough to WRITE_REQUESTED but this became problematic when
> clearing the testunit registers was added to the latter. Actually, there
> is no reason to clear the testunit state after STOP. Doing it when a new
> WRITE_REQUESTED arrives is enough. So, no need to fallthrough, at all.
> 
> Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

