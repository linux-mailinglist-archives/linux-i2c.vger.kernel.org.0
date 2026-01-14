Return-Path: <linux-i2c+bounces-15141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4CD1CE41
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10920301F5D8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24B137A4BA;
	Wed, 14 Jan 2026 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OV2HLy5B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71F35FF41;
	Wed, 14 Jan 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376203; cv=none; b=diIVSJZRQW41nABPrdO8c72BoBWCkB3fj2vzNv+ox2y45WLGQcxaQHpFGIcxpDXlJxJMCRfWcnPYN8P86+gdxs3XdZXLNIGwsiOlH471m5vf5W1tLqjTelI3GjTQgZ5IxcZ+DOdpUtN6YMVLE3PbK6la6s5Kow8ubj8V5UPxRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376203; c=relaxed/simple;
	bh=1IUR1UlKcPUNRJwRm9glgz0q5035pq4VdPdYpDCpgYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omBiBNc8QsnEpktLy6MFBA+2vfCi0yNoVJHw6Mukw57bBhnS2eo5rs1qlulQ8a9Csa2hXFGMOyCKn6AAiHZxF/1cOaaW34VN0P58GvCyELQFT8OPsvdaYitCbuwg7QHZGJp66QWsd8RVvjFFfQ1qP42rk54NhneLXuD8dtJO1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OV2HLy5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A68C4CEF7;
	Wed, 14 Jan 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768376201;
	bh=1IUR1UlKcPUNRJwRm9glgz0q5035pq4VdPdYpDCpgYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV2HLy5BWeBy6H3jueud4sL6+wH8rxP4PwdxAOt9H/eiKI/BSZrtD3G3063h2GgZc
	 HJfcpupsPFTKZMU1erGWzRWd/kso+GvBNxnqyu/WL2VYMcN0kpgFLhP6IFGgfvzGc+
	 ZgehWc/4sCgrHWfP1I4DiVezYItcc0lXADksb+AWFHXRNFC2CBeyKGzqsiOA31ccd2
	 jAM4Uo1nLg3rwv3U3yikX1pv9SO2HTAtTx1Xqt6T4hLgzaeEUmXvhVWlCjP3tp+M8r
	 QGXGW0l3qDvnfHFivd6xili/5kbQQNRQ7oZbBS2X0GIoctYO7WRvyNRYmng2NemCY3
	 DOInzqwOmBo6A==
Date: Wed, 14 Jan 2026 08:36:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH v1 0/2] i2c: mlxbf: A couple of cleanups
Message-ID: <aWdHcnAUY8i5IszI@zenone.zhora.eu>
References: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (2):
>   i2c: mlxbf: Remove unused bus speed definitions
>   i2c: mlxbf: Use HZ_PER_KHZ in the driver

merged to i2c/i2c-host.

Thanks,
Andi

