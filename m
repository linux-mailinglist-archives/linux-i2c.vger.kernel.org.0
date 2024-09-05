Return-Path: <linux-i2c+bounces-6283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACF96E520
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08A71C22C93
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F251AD5D7;
	Thu,  5 Sep 2024 21:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYcXAoWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9415687C;
	Thu,  5 Sep 2024 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725572016; cv=none; b=LVQs+S9aDQRY9/xl4aSHJUzxPVMhCjWYflrgj5gZtwEM9d1NNcgAMv0aICs14CLFon1OlC5u0a4PYkGIzYYKY/A867/pcdX8/tkumi/OVM2I+Z6g+4Tkfm7aihe0JO1Ht23oByJRerZQA9RgnKbSXzIZrgJuPRw8o3wm3Cu7KRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725572016; c=relaxed/simple;
	bh=6KuSkCJ1CtFCClGKj7CSV7OM6CHwqk+v2vBLB3hZSqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omqZlyX6fXMOicBNW4IzqLJ78AuRNzvS9/nx1OwyvFHCToayJUA1U1vpnn9Kqrk4Vdc+NgaH6e6sszGJu4I9B1LPSrD3sLE5Le41mx6y9TTN9o/yqQgh4C8c4QulNc1g0YgZ0jfTQyJ6s751v/11cbDM86rS8iEI+tkOh5ibr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYcXAoWL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FBEC4CEC3;
	Thu,  5 Sep 2024 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572015;
	bh=6KuSkCJ1CtFCClGKj7CSV7OM6CHwqk+v2vBLB3hZSqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYcXAoWLbatqmYxADWvkQkhwBi5XOl+zAmXvhjz4jOPmQ8LuW4aQ0icRI2lJOmkZp
	 Ce732iVhphRPtSrYrERYFBrb6RTcqPYJCMoc9J7eI3TKsuZA9dg8e2Lguw71qQTT7e
	 EXt+l79GJU1sOynMTWg+Y9pc7ctA8v02P4IZbufNV6PVRj/0PvwJIeejtmR9fQU2oX
	 RtD1llyTFu0onwBAoxjB38t3eE7xpK7WQHJ0OElDIkP57vwqHmbUUU6lKvPRkvIq4+
	 6blVXZo9ObX8I05zbUiM9zeV81idIi9Gcd1eb/fg0V+i0u0ZfFAsj7GkORczMq1ida
	 f9J7W0Q5f6cVg==
Date: Thu, 5 Sep 2024 23:33:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] i2c: npcm: use a software flag to indicate a BER
 condition
Message-ID: <x3qhp6xpmeafsaufplh76tflru5bfbjjhndnu3ethw6gpbkre6@pyaswbbuog7y>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-4-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-4-kfting@nuvoton.com>

Hi,

On Fri, Aug 30, 2024 at 11:46:36AM GMT, Tyrone Ting wrote:
> If not clearing the BB (bus busy) condition in the BER (bus error)
> interrupt, the driver causes a timeout and hence the i2c core
> doesn't do the i2c transfer retry but returns the driver's return
> value to the upper layer instead.
> 
> Clear the BB condition in the BER interrupt and a software flag is
> used. The driver does an i2c recovery without causing the timeout
> if the flag is set.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Can I have an ack from the supporters of the ARM/NUVOTON NPCM
ARCHITECTURE here?

Thanks,
Andi

