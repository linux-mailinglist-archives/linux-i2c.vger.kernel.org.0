Return-Path: <linux-i2c+bounces-15124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D8D1A36D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBE4A3043539
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4822ED161;
	Tue, 13 Jan 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l9A/Ryvt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DEC2EBBB0
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321539; cv=none; b=pxozegb2jGjVp4dtfYjM9FKtKxGQtgnYmGR1JqejGn6ViQ8dNv/DYtCTI7ikeSJiQbKhfWbuGfYRWsleCjJbZXjybUDrUOMmbYIY29/0ehxMJR1X9dHPxi+Z2W2MQlrftMlorVBNmz7PtvHAuUQ7qE6bsj9ZHdREguSh9Mv/Kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321539; c=relaxed/simple;
	bh=Rveznh0c57+e7yhhtvquzzydLBtcn75EtJDYfJdT8as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dalQUw9BhVaVkavP9zrtv+/PqamIhXw1nfQoQ7zVo/kG1ALYWWNSt362uPJ/rVvChUnTyy1F+lah4xX6z4p1kc8i/q/EZktPt9H0YYguHuPln9nGbu/jAdYD7tRTX7tLXxton8jRQediZOQJqo056zzlniAvRd3l8aOCPWuGXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l9A/Ryvt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qV8M
	JY7h38iiuS7Jd13t8g1lVUmLb7qNuzO3kA20jwM=; b=l9A/RyvtXI7d+/0XOt6Q
	PyM9oaGB2YOiBu+kUjYUlwM+yaJWzA8dbi8JQQ7OXhMOLa46uhQoNkqYVE2jE49o
	eYNHXKqP/VpnZTSzuXbqpTytfwnoLW27hR3miUBF+YdyyWfHCJPVQPJif2G6oNB6
	s7O5DJyJmjrgOioTnqybQ9vxkv60/z0ohfS1FGl29kER1jBy2q+qCN8m7ak0J91L
	6zJS40+UY3G/0yiHOieVoue5dO3W7ZNirOg6cUisM2hdLrfKzgcOie5ZT4t3pFw0
	W6lY1yBzOTHqc4mUe+UaJrAiEFTJZVSp+3m3uFv56qPOXPbp2Ru+pAkGhh685YWY
	kA==
Received: (qmail 1777409 invoked from network); 13 Jan 2026 17:25:30 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 17:25:30 +0100
X-UD-Smtp-Session: l3s3148p1@rCyqcEdIFKQujnvx
Date: Tue, 13 Jan 2026 17:25:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] i2c: core: Check for error pointer for fwnode
Message-ID: <aWZx-l3YPHRdtljl@ninjato>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
 <20260112132346.4087258-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112132346.4087258-2-andriy.shevchenko@linux.intel.com>

On Mon, Jan 12, 2026 at 02:22:40PM +0100, Andy Shevchenko wrote:
> Theoretically it's possible that fwnode is returned by some API,
> that may return an error pointer (and we have, for example,
> fwnode_find_reference() which does that). If such an fwnode
> is supplied to the i2c core APIs the functions will perform
> unneeded loops and checks. Avoid this by preventively checking
> for an error pointer and bail out immediately.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


