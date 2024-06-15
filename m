Return-Path: <linux-i2c+bounces-4040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1AB909959
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 19:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF501C20F44
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 17:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E584C4965D;
	Sat, 15 Jun 2024 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYF6XMe/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860F173;
	Sat, 15 Jun 2024 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473675; cv=none; b=O5HChAN2gLaYD4Sp4rG2LRNtC34qH0yqKx39tlyafk8jdAXAPTnGrIzX6BUDfth5iq1eOMIcaBoxu0dhDUlSwbZOOkFSLgpBxTS4CIguJ6Q2bBweF+kJdBwM1QpdhM45hpRkOxB8bVn6vrEDWR7ogSZiiOinu+DiqlyGJXy1kgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473675; c=relaxed/simple;
	bh=Hg0vuQu5W6fCl7TQjwa8P0i6cV1Qe8Nzbfm+KW3HCTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX2zhz+qbjmv0mP7hJAZHv94xsDkvUwh6MV+9GPVRY82UXX1TydTLT8CjkeVsHUmI3DxNNNdsYkui1qzID83IfM0fXsWjoNyCG2Msh7nA9cgpw1EZJLxFi1eXuha0wdxzPG0U2XXBav6H9BrRtPXwbikwW4cYzeqQuME1u5ZvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYF6XMe/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D938C116B1;
	Sat, 15 Jun 2024 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718473675;
	bh=Hg0vuQu5W6fCl7TQjwa8P0i6cV1Qe8Nzbfm+KW3HCTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYF6XMe/uKXnP2oPzM+dxq8V5qJKtEj4tTJifQxJOD5gWyzePDn7iv+9GBNJzpgrO
	 kRyCNpbrLiRuim6u3khhqd6/7YHEgTvnpMY+ZSS7SYqqOa1EgVu0bJ6les1gyMAjrd
	 /41cgGosXg7l5HanBxFmuKN/WWFmHSZJFcafiuZb8/ErvQtuzcNooFAyo8RL14Q12k
	 cGF5JeXLp1iPc+1FhNCFwPc/gkDrqbHeIOPbinzzyTDvVrqTXnrg8+PdwnGe+RiRRZ
	 3jxUK99odxNQn/0lJ1J4+RyqqGeBLgxsknCv4tSC9GaRDfIk6xXdYwrNuodscnFI5S
	 mwiRbW7yXSyGQ==
Date: Sat, 15 Jun 2024 19:47:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] docs: i2c: summary: start sentences consistently.
Message-ID: <h6v2qyc5x5fhhu5jk2jx5dh5ljnaulgoj6hgbunmudcyc4pnn5@3slccuj7tafa>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614081239.7128-9-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Jun 14, 2024 at 10:12:39AM GMT, Wolfram Sang wrote:
> Change the first paragraphs to contain only one space after the end of
> the previous sentence like in the rest of the document.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

