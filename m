Return-Path: <linux-i2c+bounces-13782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A80C05E6C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40ED1B87E49
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 11:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C690935A146;
	Fri, 24 Oct 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iukExgpZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0635A13A;
	Fri, 24 Oct 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303466; cv=none; b=jasvN5HEz7kIKG85MjC4pxPtr/3bvkGtS7hVGpZg9HTw4yQqIS1E1O62wZQWQj3FFyqAUxvUUP0ZiOcULsi1thhorfnZ6qe+2LbEmaCpl4km5nSSGukSGp+KEAKcKo6olBc/zn5cDopMy4oCWFhwwxKc7BkK4JllA2mQZh5isSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303466; c=relaxed/simple;
	bh=fuHTtIQYRQ7K3fYdtT88g69/8fE3b6YVWeIBoo5ehTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lkbi/x88dmBULH8BFSVxji+snumudca5Eb3I5r8u5fAGhtDkEtgdKlFWewRjx3NUdZhFxeFZBkvfJRQKtHpHI+10FhX8OuTiEOcLwKPtntkoX0HLGTUVpjdb+YKGZfeyo13COnHa9cP8BB5WRU5P9P/sf6ZIOYE603A8niRNchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iukExgpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F059C4CEF1;
	Fri, 24 Oct 2025 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761303466;
	bh=fuHTtIQYRQ7K3fYdtT88g69/8fE3b6YVWeIBoo5ehTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iukExgpZV15InvoMWGR067TrdB7zr+ooZ2SlLtX0BgrT/DRQt6FDWJ+JR9jsOjAF4
	 WsWAgv23LDZHROzI6iR/OWoI1BF1TE8/m46p37I6qqIpa1F9WKDcF6i1YcOn1WILia
	 9LarQqpEa7FTdSL3TBhx9Ph6uCTxCbcFC7J/dVkdgsQbJ72TnYuVlxEh7klpadNF1Z
	 oj40PTFogp7ywPhJP0Ik7n5fetBMTZvqz7/z7axkogWJNCn6nkUlNtO9WMdP2mECuD
	 ixU51vOAzA+dbjzrSQ6OWMOzQONctdC17WxsO59c8p+FJkvIBbq1Y52kPDTf2X02Kl
	 V8XMhMupy0XoQ==
Date: Fri, 24 Oct 2025 12:57:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v9 1/3] i2c: pcf8584: Move 'ret' variable inside for
 loop, goto out if ret < 0.
Message-ID: <dnjved3kd3awdseclr56mbwxkbuysxcezzbebrk7fjpuq2kf2p@rhat4xhdao52>
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
 <20251023120043.8661-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023120043.8661-2-chiru.cezar.89@gmail.com>

Hi Cezar,

On Thu, Oct 23, 2025 at 03:00:41PM +0300, Cezar Chiru wrote:
> Require spaces around '=' and '<'. Add spaces around binary operators.
> Enforce error fixing based on checkpatch.pl output on file.
> Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
> improves usage of ret variable.
> 
> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

you don't really need to resend patches for updating the tag
list. Anyway, that's OK, better to send than not to send, when in
doubt, ask.

For this patch I think neither me or Andy have been suggesting
the change. The change came from you, we made observation which
you applied, this is the normal review process.

If you don't mind, I'm going to remove them when applying (let me
know if you don't agree). No need to resend.

Andi

