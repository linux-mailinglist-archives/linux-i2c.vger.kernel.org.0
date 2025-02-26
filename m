Return-Path: <linux-i2c+bounces-9600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62207A46E9B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 23:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8437C188CB84
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 22:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E8925D8F6;
	Wed, 26 Feb 2025 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1vskQYJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D3825D8ED;
	Wed, 26 Feb 2025 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608998; cv=none; b=NqnHXihftkvYUzLv1W1sgkmmahjRfTwVt6Xzy5FyEv7L8Ehpctnb7BRtTgWHuMMLa8heDDPmrMY2LF2nVitOAnmT6OV1rkr36pWuqIdO6ucb/V8Rc9+EZwL8OK/BUtzoP0hst+LL1dmw4y6K2dKv0qC0ra1tAGO0rOcjxdf/4Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608998; c=relaxed/simple;
	bh=Ox7VW8uCR7EQGODyEOPtWbCm7BamPqalA/9ewaWgco8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/UdWk0FMgL5adnV9RxS5OmFqmjDwe7dLpkRes/61v4htdb4iUBZgoPm2yvY8kHXOfjwiqAs6ZFL1hyvYeP1KBO6erimQVnGqG6qWVQ5tZBcVqFrGhUCNDPTI+YNmEhaey6Lx2XtqdqCazqgTz/SyEhAJHsQgZ+xr+NIlIqzgOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1vskQYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EA8C4CED6;
	Wed, 26 Feb 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608998;
	bh=Ox7VW8uCR7EQGODyEOPtWbCm7BamPqalA/9ewaWgco8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1vskQYJgo2lx5rAn15os0M8047EmPwCJbzmLjTsifKrh94od5lAeiTqtcj7q5+69
	 OuHOukGgdWpRr5CWbPYVv0QGYPgB0WjLIXtO++HVEmrNB6N77efh+17kBhuVqlKi3h
	 QqJcXUQrHOzqR3uNsDrzn7EmJa9Y7y0pA9wCfwmRP+gQ+nCxlyX958lU5BEnmAHtfm
	 3raFgZok0OhH+XOr8jEsPgja2bpiRk+6fFABUXfK6JKF51O8GtdP5Kfg/X4YuD5dEy
	 hc/KRYaDzonzB+wuYfP0nfGJUN3c8npudD/uoevHP+w+zuffXvPNsXRDJv6JVAS1ey
	 9z3SU/9mgWllQ==
Date: Wed, 26 Feb 2025 23:29:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: amd-asf: Fix EOI register write to enable
 successive interrupts
Message-ID: <7jajf752oxkrfalmohtqjt3ys2un3arhfrlydaeetnmzsfb7gt@cldv4owsjrty>
References: <20250219135747.3251182-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219135747.3251182-1-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Wed, Feb 19, 2025 at 07:27:47PM +0530, Shyam Sundar S K wrote:
> The commit b1f8921dfbaa
> ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
> introduced a method to enable successive interrupts but inadvertently
> omitted the necessary write to the EOI register, resulting in a failure to
> receive successive interrupts.
> 
> Fix this by adding the required write to the EOI register.
> 
> Fixes: b1f8921dfbaa ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
> Cc: <stable@vger.kernel.org> # v6.13+
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

