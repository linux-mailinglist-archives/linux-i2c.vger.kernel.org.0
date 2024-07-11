Return-Path: <linux-i2c+bounces-4946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D49C92F2D3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 01:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC2152841EB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 23:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F75516D9B2;
	Thu, 11 Jul 2024 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYiNaKpP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE54F1E2;
	Thu, 11 Jul 2024 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720742025; cv=none; b=AzAd2xo2IBX07ZSodJoEW4vBjmHL4KJasgmKAB6g4jNeY7CVyqbHm/URjiTGa7rbO1zx8PskLWhNVsNQaeVc/DCiK1zek4d/wZdJv9ZVGz8rImcnwopc4ag9eGv5UmQ6UFxh4rdPgHQi86SDMi/hzf982imsHpa4g2t9LmYA504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720742025; c=relaxed/simple;
	bh=LQ6GCGpGhvVgwK0KQElrEbVds0Tmz8T4xMt8VV9CWVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQHl5ZzFbzycZPGZBzq7CX4Rjw+VnMxoDQ5r9uo1kS2QBc8zE1a3z7byutBa8qg65ffRg0V1k9Wz/xZZA2P27IqBMciSWJzUh9+3cWwt/9vyxfR3QLvgI8vmGQoeyn7sbRnXm+gPo6S3o7yQYYWhVNUmfi7DlRQab1GZov3WnG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYiNaKpP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133E3C116B1;
	Thu, 11 Jul 2024 23:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720742024;
	bh=LQ6GCGpGhvVgwK0KQElrEbVds0Tmz8T4xMt8VV9CWVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYiNaKpPDGn8nj3AzLtiVklC1VC8LVEFmQailxqEseyCDZzcQnvpExDwORxmCw51q
	 a34u3HpLLczhuob05StmRQqnbQOf9LLHhwtpZJnzrKxzF7eRCymKqISqNbFQxMYrXa
	 9YcnNWmHjc7ymAfNV/eNh7QWw+MJjHFobkN/Fh0QD4UfKaO0o1XsxCjQAS1cZuH/Qq
	 5H2lG5UOMuKTfbihmq4ORuamfgUYcSVYjhbONShWAQy42O1T7BPlKo3PiD6UG/2mfb
	 tBwvFw2ieXG47puiu+NIcjO6dW0hLh25b8DqqLAOhxjFsnrpEAVbSaUL1jpmxgPJd9
	 n1Kg6CfDOD4ig==
Date: Fri, 12 Jul 2024 01:53:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: avoid re-issued work after read message
Message-ID: <ubdgig2rlastmgh4rnquqsk2rornzoqlap6fmclwebaqkdldsu@3qzyswf4vrza>
References: <20240711120818.46543-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711120818.46543-2-wsa+renesas@sang-engineering.com>

On Thu, Jul 11, 2024 at 02:08:19PM GMT, Wolfram Sang wrote:
> The to-be-fixed commit rightfully prevented that the registers will be
> cleared. However, the index must be cleared. Otherwise a read message
> will re-issue the last work. Fix it and add a comment describing the
> situation.
> 
> Fixes: c422b6a63024 ("i2c: testunit: don't erase registers after STOP")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

