Return-Path: <linux-i2c+bounces-2588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA388BB34
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 08:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11B8BB21CF2
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3917E130A6E;
	Tue, 26 Mar 2024 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXV4nuKq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57112DD8C;
	Tue, 26 Mar 2024 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438159; cv=none; b=KyNfTBloxEzC+3u4L5wclRwvgTW6p2D+nkcbd1F9VtUZGivw1yWVNJDEZNy2Wdm/x/h/VfJgrz6a8dKCHVsOmBS7CbUPxs3SN6UQ197kwPJ0gD1Rrqdsw2YV52w46+vjTLdaERb/Fs6YWjRSEd/pIlyMbivk5aZlu4HZb0QK45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438159; c=relaxed/simple;
	bh=GJ0yx1JhcovFgbp/QH9L5v/lpXHonxmhtO8NcBScCBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxABdqzAAYexxzCu095hgNBmhyGTu9JjUrkkdUL46FlzhjflciTHq5+ejJUWFxKbXWcrmOn2SRT7qBk5ZDEk2rxRxG+3UqgUVYqCdGN6Jc3OzzmwVQbPM3wEDhs3i3zPQCDWW66SstjAkfva7CO9vb7rSJjhZ8A+6inpyQjXq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXV4nuKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3523EC433C7;
	Tue, 26 Mar 2024 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711438158;
	bh=GJ0yx1JhcovFgbp/QH9L5v/lpXHonxmhtO8NcBScCBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXV4nuKqay6ivTMTjGXxNtTwsjdq5Rx55HoNRy3OuSFTz6NZoxBC7cftLWOwSZl9T
	 mZFSvM6zOFL0b2q6HZrO9rfKNtoESIFyD6lgpddAC2zA2GJzgc26JV0qhTJRFxeqgu
	 I6WxwFQI+kKOoZx5lk3eh1MDzKJo3cweoYWgqanKlpaEsvkzChLkRak6KQqsOHehCi
	 4oWccjnN5kGvKFD1EuG0CIu0BH+JI9v7+kzHjNpf5LMOuTIFZLevtjia7xlOFkzj+g
	 o1ulAn+BSAxrXjr1n7oYbD+HLZP+yltOCIkK8iQ7A0Z/9wMH/9tEC1AIzv/Va8fFsV
	 2GLTiVi9hbbxg==
Date: Tue, 26 Mar 2024 08:29:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/64] i2c: bcm-iproc: reword according to newest
 specification
Message-ID: <whamqxbfiwwmo6ng226hu3eluu2436iqvugmqrk4wf4b5xbbbk@wj6e2bkebvo6>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-8-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:00PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

