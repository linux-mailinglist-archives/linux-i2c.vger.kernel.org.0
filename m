Return-Path: <linux-i2c+bounces-14799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6687CE01E5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 21:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74FF23002D1A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 20:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03877321457;
	Sat, 27 Dec 2025 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4RSabqX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546C2475CB;
	Sat, 27 Dec 2025 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766866675; cv=none; b=ZI31fY95dAip24a5EzhDrLz7dT+z840FjaYOToV8XaYrXyjFTL1T7n45NZqYW1jX4HWRBVtR8uvadUrfhasFIMObqWeIY9PAg1F/E/P5sRBjZVk3jM0hZyJBSGUeLpvY2/j+uCGXwYyq/9zZl5Jt3y+794ncuBw5QigPECvbz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766866675; c=relaxed/simple;
	bh=5PuOFsJaWIPugzjtrat1GpSHEMc3250nfDZbEVwuoX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx6u13vT5tvRoZF8KYp34diDpAURR3AYeYPK4KxAp8/q0uIVCELWbPpurLsaugW8V9Gcs6Sm95qcEHgu4E3iarNLugYT84siraxkn9ylXA0wAJcHyOhM0Kto95PVh8ETDWPuNXCLIuwhMrzOYcbY7dbQW5n2S7RAumwBe6hzcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4RSabqX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82825C4CEF1;
	Sat, 27 Dec 2025 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866675;
	bh=5PuOFsJaWIPugzjtrat1GpSHEMc3250nfDZbEVwuoX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4RSabqX+RCAyxhUVPQEVRmELXPOqRO7+OQBHru/lJd0Stdais36BqVKAkzJImWpY
	 n84bgwqLbwCU+j2pyTJdjNTGQbZw1OZFhYfiAQi61opCAcvSMYnvd4beymnxycHXLl
	 VfDkBfeIF3WZChSo228BvkQuS4ZBYc5ogxBTry1+zUnGCieiWjy8NNf3pn/NmNnt3/
	 Yx2fPf+j7U+GKJleankuJCYOEIpl6xkZUwZmn5keqyv5HHOOY2T5P+oPqusPDspAiD
	 CVKLTdUo3Ok+CjGoJY2Uyldv5z0mzPD4mRDFRAyCbF7/w8IX3hceKwyTr+qRee1xHa
	 mkhuhz4+Bkj4w==
Date: Sat, 27 Dec 2025 21:17:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] i2c: designware: Enable mode swapping
Message-ID: <gmn2ha3kdt3dzgghxmhfbsnxjmgnehz7qfwumeol74t7uim3xs@uwnsbpmdj5yt>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

> Heikki Krogerus (6):
>   i2c: designware: Remove useless driver specific option for I2C target
>   i2c: designware: Remove unnecessary function exports

to unburden you a little, I applied the first two patches.

Andi

