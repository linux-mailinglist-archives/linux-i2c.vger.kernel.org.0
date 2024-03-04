Return-Path: <linux-i2c+bounces-2127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFC86F7F9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 01:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322751F211DD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 00:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1946F385;
	Mon,  4 Mar 2024 00:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqYo9BtS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EB1362
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 00:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709512398; cv=none; b=U4ggYArnPghfGn6jiiIeNr+HZv+E2WNCyPEH89JbzOgvzXl4m3BxVirBvB98NlxyiLZ4T0L2MG+u/xr86wRd2SjnzZansDjqc+VYReDq8PPG5RMiD5+6L4o45VFRAL0BKaFHo8ULAgEDxJE0qU9K9ap5ai84dpmdn/OxzznklbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709512398; c=relaxed/simple;
	bh=5e9Uso6+q35TC4SjsRvX2rVwCTCeLUw0E26VyA6HXtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POZD6899TtA2cE+f0Zq6ozEx8ipfVHfeHY+3RGmP0KXSafSTLSVbOV6khA7nHDzEC279i6i5Z7Ykm2P/wWvpreoltr7bbqULaMzeKbkFSOpL3MoeioCCDhNW0RAwDzvz7Hkisltd8nCDIEuv+uXe5pJGiilGZ4nX7cb2yOBNEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqYo9BtS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA066C433F1;
	Mon,  4 Mar 2024 00:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709512398;
	bh=5e9Uso6+q35TC4SjsRvX2rVwCTCeLUw0E26VyA6HXtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqYo9BtSN7me7GYXLHRVcDQojrQysOPghFmhA719fD98m/ccNdYQdlBgPUuWY94sd
	 9ouCKKbH9DuC76IvibQAI1WKcN/R36p/lpCgRMGSV0WtT5TH6x1lnXyBDy0khTJq8K
	 ElfhJCJlZIppBeK0ohnI3BVbehXLDJ8jbhliR6q62AfQvru+9uJUoexF3z8GdZJWJX
	 cxKOD/v52A6LJ8nSnp9Fd0DjyH8/Hs3vISdWspb1hymHHIdRvSgXsYGhppONcxxmfX
	 MJzrEjVMufuIk5eC16upWPJDyFf/eZXvQ10MdFHpF+2id2GyIi3SqfqvSOB8RLySky
	 jkmhvXTUzhklg==
Date: Mon, 4 Mar 2024 01:33:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix using mux_pdev before it's set
Message-ID: <ezran53u2uths36tt2o36uh3bsoufo4n3zzlygwha7pazzx7hc@2focqd3wxtia>
References: <6db1e4ad-14b5-4d0e-ac06-46541970ce0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db1e4ad-14b5-4d0e-ac06-46541970ce0e@gmail.com>

Hi Heiner,

On Sun, Mar 03, 2024 at 11:45:22AM +0100, Heiner Kallweit wrote:
> i801_probe_optional_slaves() is called before i801_add_mux().
> This results in mux_pdev being checked before it's set by
> i801_add_mux(). Fix this by changing the order of the calls.
> I consider this safe as I see no dependencies.
> 
> Fixes: 80e56b86b59e ("i2c: i801: Simplify class-based client device instantiation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

