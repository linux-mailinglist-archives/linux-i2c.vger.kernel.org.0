Return-Path: <linux-i2c+bounces-10995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CAAB8A5B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 17:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A24D170B5C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C438820E70A;
	Thu, 15 May 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVXiGBO2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAD13B7A3;
	Thu, 15 May 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321893; cv=none; b=WgB3sCvrScCb2M/ew0U3SeipysiQZEypLefkItByJr+W7BL1EwaSB3kv61awIQaPsXh9IZt5wfN4EPVHuqFSqRf6GzIX9zguMrPjTnvnedfbItBmSu0+jmFFK0tsH7DMoqXROhwOq6PymHtaxsWRoil9IrMwk0flpF14zMxjdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321893; c=relaxed/simple;
	bh=d/SFKiy4vw3l/tos4LvnZFOyzB2atdQFQHJoJykZ8A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcYOALwxgIRJeEVJAOMAoKaYqZTBPWvkbnqZso6YNpdRYrxqsbGSORTASE69hNrCHEltW42uzWJJ+WOJwyzv1Qk1wE+LTgIzNX7eUn3p+B/C/pC8rZGw4JL6kCIV2UJvsy8wCawrvHFCNRatnXZPqb989cNPfqDNnec8pfIOfjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVXiGBO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EF3C4CEE7;
	Thu, 15 May 2025 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321893;
	bh=d/SFKiy4vw3l/tos4LvnZFOyzB2atdQFQHJoJykZ8A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVXiGBO205/CLPq9TgN0ifDGeSNQwaO6uIwE3hzCGdLw7RxpLpI3c6oCb/dE/I+fL
	 ZRofVBuh83+EqbC+cd2wwnFW863xkcOuF3eTpewZIgVNFhJFusWqHIFnRkR/Qpjv8w
	 6lTq+Fo+cgKfQPrB/WPpdcubDuAgwr7nmmCb1REak0BiuOr07n62lM5nQft2lz1wWI
	 sC7Dqsi5xFb0Mq8PqSpqwIFB+6+cbyzFDQfHJhqTcM6DH/CpyJ9kF25aHzLRYDE3X4
	 6R72w3u2N3LmMbDtMJ2znI5M+Zh1wB2qxuL7+w7sWHVPT2cjcTKPXrIkY3aDlPFjG+
	 L2Skb9VsYhEhw==
Date: Thu, 15 May 2025 17:11:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Don't warn about missing
 get_clk_rate_khz
Message-ID: <g76y5ybk5zlbcclzzn3decg5rfafbvdnpkwya2kinm6xcemrkk@4ramwlaqulsf>
References: <20250513124015.2568924-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513124015.2568924-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Tue, May 13, 2025 at 03:40:15PM +0300, Heikki Krogerus wrote:
> Converting the WARN_ON() to a dev_dbg() message in
> i2c_dw_clk_rate().
> 
> That removes the need to supply a dummy implementation for
> the callback (or alternatively a dummy clk device) when the
> fallback path is preferred where the existing values already
> in the clock registers are used - when a firmware has
> programmed the clock registers.
> 
> The fallback path was introduced in commit 4fec76e0985c
> ("i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt
> registers").
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

