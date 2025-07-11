Return-Path: <linux-i2c+bounces-11912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A37B01F82
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 16:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21631CC0DDD
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958272E9EAF;
	Fri, 11 Jul 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEpg5L5K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9032D0C69;
	Fri, 11 Jul 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752245484; cv=none; b=LjEaspHWozwpdNJy7ZaDpWrFNAjvhUKvuKnf1e9zM7fmMtVLsb+U4TEN5SyU4lAniXALWYXGZO4TSPnNa5rXas8b7xu27oZc/dr6qzXIus3qslvpKXHLgLQKNaVBQctltGOhs/RChBjAEpYQ+Zb3mREU3NBbS9q1ClqZHcaVniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752245484; c=relaxed/simple;
	bh=CTk7D4qi7C88FLyJaQKQJJMK7Br10INSXOwcLa7tdcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxzRXRPNR0WRLVFsF8FDu/b+sPIxzO9+YN+6KVR8U8D2uhZzrfxQr5eM+C7adekACG15qvHLACf04bqLPXuJako9Q5CiqHlEDBIsijmecpcL/ZzLeiGkG5OMwLFXFsCAuOl+DG7u6CxLEokCb0qAhdKcju1YucUna+ZMpKRHQm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEpg5L5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A3EC4CEF5;
	Fri, 11 Jul 2025 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752245483;
	bh=CTk7D4qi7C88FLyJaQKQJJMK7Br10INSXOwcLa7tdcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEpg5L5KJQscfhi4S2XoBrRO+X7MvrKewsYI+wzhDY5XeHgQcAQfjuzILeWJXz25m
	 PsxIILOM/lzTQWdjkpauVqt7dhUu1/Ltg3YoP0IJ9F15leLRojdiVkRIRH/uSVGV4h
	 Yen0V5vpRfMuW2Z3O8lC4nV9CwHbrGKISwUhP+5rmwRVrsko7IGztozniIQnweMrC+
	 EBC3k8YwzpzYfQFgzUIs+hmaBK04w3KBBurV6V08rQYQwRuafdsi4FGBvfKhgQgaGi
	 9uNwEK3W6PSq3cXio9CooAyLMVp8ZkDUn9ycxO7AAPpC3jklhtcGb+omEPUPG6xV/9
	 XvfCkH0FLTeJQ==
Date: Fri, 11 Jul 2025 16:51:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Chen, Jian Jun" <jian.jun.chen@intel.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-i2c@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: virtio: Avoid hang by using interruptible
 completion wait
Message-ID: <pvjv6gn6ylnpncdp5xdzt5wdnzc2tuuww3ihed46q76vm6qwly@7smel4x243a3>
References: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>

Hi Viresh,

On Thu, Jul 03, 2025 at 05:01:02PM +0530, Viresh Kumar wrote:
> The current implementation uses wait_for_completion(), which can cause
> the caller to hang indefinitely if the transfer never completes.
> 
> Switch to wait_for_completion_interruptible() so that the operation can
> be interrupted by signals.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Do we need the Fixes tag here?

Thanks,
Andi

