Return-Path: <linux-i2c+bounces-2634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72A88F04C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7FA1F2EB4B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 20:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A94152E0D;
	Wed, 27 Mar 2024 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+0dRjEn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70340152168;
	Wed, 27 Mar 2024 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711572252; cv=none; b=GM8OFFRzRuduEYxGP4kvt4R19BIVXIsDpeFFIEcKm7S6N9Gt1ERecCMMaUBPv9P9KVb2AO66uMbh1IOgN7+zAaE3HgAd7kGdKneegtcKohdDqFS2N0MYb+uValNb27x1ZGvRpjNrA/cfC8AGmGnHtyJTdKQrmlQxGDehZfkjBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711572252; c=relaxed/simple;
	bh=92+6zV8Z1pP/Qhvy12rXkz6LThUhG5bZbS3JrqCZ4To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLOa3gKFv/vtKDjoh9G87KyFIkSbHd/w+rF5wutL+RQ2U3+6xUcDYvrWo41WLHo4gOqtr18y0OiGVJpi0QzYGvypx0Kz0/F7iqFCECHZ8AdMzy93CDGwb58IlVAcLf74l0nWwvp1MdJtK/seSsepXLSD1PmTtoh0GWeWKMLHLHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+0dRjEn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D37AC433C7;
	Wed, 27 Mar 2024 20:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711572252;
	bh=92+6zV8Z1pP/Qhvy12rXkz6LThUhG5bZbS3JrqCZ4To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+0dRjEnkc5gf4W7QDxlabDwh6PWd5NWzfmjR5gJbdK0HAtUfNabdtNOPhaaGweeV
	 d08YgS0LpCBYESFdOyrre/xkL/xW4CnQsWe/r/V0H0rnK1e8K3gwPVI5KxrCTZs+UL
	 RvkXgXe2vJquvN3TUy4vu6bF5cYdEYqQBUcFjjBxByMVGd6JDSqcRGzzKlPYQIciHi
	 rBI1VO8GeAI16EopGkp7hj68iNcRnv0dWYRWNwHRu8QhUHBwW9Qi8tO+xfhAdD7K0O
	 zAmNKh6IRvV6+BTryLaBddGJNk9BFK84NSrjoLFMWvYsl9SmnuZZbPnI9tmfSa6O4Q
	 45vfRxaF2pDBg==
Date: Wed, 27 Mar 2024 21:44:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/64] i2c: gpio: reword according to newest specification
Message-ID: <tftdkmgnpeey5kxg4yplmnzfa4mtn5qk5v27ksg3m5ixiri733@maj3547a5aww>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-22-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-22-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:14PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

