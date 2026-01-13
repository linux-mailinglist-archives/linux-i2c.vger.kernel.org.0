Return-Path: <linux-i2c+bounces-15122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B77D1A243
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463B230453BA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA6538F247;
	Tue, 13 Jan 2026 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h8jm1zC5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229B378D8F
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320877; cv=none; b=X8V/HYy7A58nE9xVOwkk15788N8YnSWl3GQqJ1FAIuOdjbzFdcoAo+Yh+xFAS2jv0524OjbCKD22VZiX4cJ7FJjNVtGzbj4IZOr7JB+xMb4392tYaQNds6IGb37OLn+cCQVlGKIi+HMJ9EFS964IBIlX21k2i6GPjsrTLzU7aZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320877; c=relaxed/simple;
	bh=8DNhfEXVdDCjEeE1QnbDWBIe6Kul+k1kIhVeC3QfrIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yph5qOkxFi9EHFz/iwjaSKAgp07RY9iSlj7SVfxPqTFjifg5V4W8ia5oTAbVK8dR9mkQUcEWYUBeikooM29H8egA6EDsK2K2D1EpAihEF6sdmzVtcCpLQHZJ+7bXkuge9AjC+MOG6GKMkRlFzSLH2o2B7Owi8Tgn1JLfc8DVd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h8jm1zC5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KcEY
	mv/jkGMRk96ueI/s8b4rGq5FhWuEKIEs+twFyQk=; b=h8jm1zC5bZ9aGv9S412W
	aEst41eD9C+7j40pTikgQJ5kCD2sqTGteCL1nOLM71jWiTVLT7pPy1pwUUmAPSGy
	cpm6af2LCf2M52JZoP594ox89uzdZYMJxL19UNPYCaT+kuEYlckFSqqK2bUu5937
	M+V+b2QwtYsAkYcfly9Q+JAAujGzTiQd4s6DLUcmznBGydQmvqnzk9vzIk6WYQvd
	rZRtB2xnqt4/joOyDyx7yAVu+xUSfOwzevKt2brIxlMQSrMqWvaD54ETE41Sg/Xb
	e4aB3Tm46PS3OkfZu2t0MzQkekL5N4whe7XN1yyhtnS4TAdoYE762gX+fDDhefxM
	Pw==
Received: (qmail 1773305 invoked from network); 13 Jan 2026 17:14:33 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 17:14:33 +0100
X-UD-Smtp-Session: l3s3148p1@EsZ5SUdIyJ0ujnvx
Date: Tue, 13 Jan 2026 17:14:32 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <aWZvaEpxQVTIMKYQ@ninjato>
References: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>

On Thu, Dec 18, 2025 at 04:10:21PM +0100, Tommaso Merciai wrote:
> Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> suspend support for the Renesas I2C driver and following this change
> on RZ/G3E the following WARNING is seen on entering suspend ...
> 
> [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)

Applied to for-current, thanks!


