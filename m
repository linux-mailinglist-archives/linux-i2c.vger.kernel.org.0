Return-Path: <linux-i2c+bounces-10940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E7AB468B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 23:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133694652AC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 21:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BC623535A;
	Mon, 12 May 2025 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o53Jcayf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DBC23A9B4
	for <linux-i2c@vger.kernel.org>; Mon, 12 May 2025 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085844; cv=none; b=LLPAsLgsOAsrNfL3E+SomQ4Gjsp4cR8FTfLPBLMekRzG47HSRQgz45PMA9bmnDO0FXyKK7ZBqRTVuuypdV0X7csivcLeqM+JjcQOOG1w4K6KlzyRNi7dnwNTXiLvm+UfQU74AH/Ls+fm0LtHNmvi5Gnz1jlO/aprsHW9yKpzvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085844; c=relaxed/simple;
	bh=ju5nUl19tTWEpVH5K1UV1j5tuP/kpD3sTccZKxSkRcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h81FS+Z1UoU3AJwhOzEBIdosIEf10RoPViL1IVAtu8FA9XqAa1PPSuU+1gObTz2t4/CsC9Jw83lc5pN05woJGJMRC3Ct/3GraewewAx8gi9/li3phB4O3Cvqjds5ruTHmUPHPevuIkLWj4SAnPeZCREpqaJCYF0P6WS8jq0H2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o53Jcayf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02E0C4CEE7;
	Mon, 12 May 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747085844;
	bh=ju5nUl19tTWEpVH5K1UV1j5tuP/kpD3sTccZKxSkRcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o53JcayftoXzA+QwRagVfvCMNL1tABsliC3/lLsx7Qg2Vy1xqgbImscz7oA6tSbw8
	 h4oNhhpWCYdGhQC1GgZ9QV9C38t7/X4kRAg2U9ardvGAQP/ZiVpyUkRKq59kMR2N20
	 zEREUVS5WsoJWpqrh4KPIDlXdoUmYLeVLxuOYI4ISdN26HXc4zru30G52VgHRKP86m
	 Mq6KtdsI+WuLDQ9Ks+mpqd4+kkHmFIDcqxdwoxWy25vCvpoxYBBkRKuljyq3Np/JYT
	 qKZs0DBeNE9N8smzic+ymt9zHTw+efHnJRL3T71cGxVXI69zF/91J6iUm2T66m/xoM
	 ZTPcxa82vaQyw==
Date: Mon, 12 May 2025 23:37:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 8/10] i2c: xgene-slimpro: Replace dev_err() with
 dev_err_probe() in probe function
Message-ID: <ozxx5rchchm4tbj2jvvsrvtjluxqbvfxcuueddcibuzsix3i5l@npbertdzp4ym>
References: <20250511203920.325704-2-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511203920.325704-2-e.zanda1@gmail.com>

Hi Enrico,

On Sun, May 11, 2025 at 10:39:21PM +0200, Enrico Zanda wrote:
> This simplifies the code while improving log.
> 
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
> ---
> Changes in v2: Rebase to https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> branch i2c/i2c-host.

from your original series, I asked you to resend both patch 4 and
patch 8. Please check my comments on viai2c-wmt.

In any case, I am taking this one.

Next time, when you send a single patch like this, considering
that I already took 8 out of your 10, you do not need to keep the
original numbering (e.g. 8/10), as it is now a standalone patch.

Thanks,
Andi

