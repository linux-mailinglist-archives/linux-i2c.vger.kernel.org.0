Return-Path: <linux-i2c+bounces-8076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A19D33EE
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 08:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B121F21BB3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D16B1865E1;
	Wed, 20 Nov 2024 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLHExhL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E8181B8D;
	Wed, 20 Nov 2024 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086084; cv=none; b=MzalPBIseFcEzaiJGcHeag9eOgpmdZtfGwzAS9klxtEy5sBwAJVJ9aVXb7xRyxtWZNyRvhytRAxqq2J9qd169ljIgwKjyQQl+jH4MVRqj7GcVaXhgkpojyf/SAO3fEvYMc5l9mUjiqTPJ58V3V2KyU156ADVDVG5ROM0lLtmLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086084; c=relaxed/simple;
	bh=xCeCfDqKC2oQd+82Wsb/Bc/uI6yodHwTjgoDgi0COO4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebkh9fw/sqDV311d2yJk3fsHNkyTUhXiLJkYHJ+BGUwbHSiF2dxY6+GeR/o7oUEMA8DEJH2pQVdVk/5Z4Su8/9sfO6q5KwBpQutjvmFc+5Z/sLnReET+ri2EG3w2W76U3JRFnIXCId/QCx5UgiTTdF8Mc2LaOhGF4IbI/OThHfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLHExhL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465F9C4CED6;
	Wed, 20 Nov 2024 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732086083;
	bh=xCeCfDqKC2oQd+82Wsb/Bc/uI6yodHwTjgoDgi0COO4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=kLHExhL4TScH9boO5ucuK0cV0xiW5Pomsu6ZTbsGwt5STwd2fzEpEqMlZ0ObC9wuU
	 BT94DG6cfpCDdXkz+p7WADNEfNI02AypytYy5nSKamDBDfc/CRcPF3IovREoi9lX89
	 l77HCUJEc3XgMFQr+BttOQcBWThvycYJdnBEUGvjfUSpNMGNb/xqZAXRkuWuyaJ+X9
	 V4eJ7i4WseLLbDaCDMs9hqdqiV8Y5e5O3da/13TuquFG3KaP3eQ5nqZXOkJ8jtwi5p
	 BoGJ8/ke7bA08NcZzIwDgsviyxXOkZ2eHHo2JHyqkenlViIGVQPyIniRsOVFOiencT
	 xjW18GRXIkYNg==
Date: Wed, 20 Nov 2024 08:01:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <r34ulkawh3c3e2mzyv4eskla7e76z73otpbp4ei2gddarabyxk@pcuw2a3kards>
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
 <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
 <Zz10-aGTFmWcw-1e@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz10-aGTFmWcw-1e@shikoro>

> > This driver has not been merged yet.
> 
> It is in Lee's MFD tree, and thus, in -next.  It will go to Linus' tree
> this mergewindow.

right! I saw it but forgot about it... then I will pin this
patch for later.

Thanks, Wolfram!
Andi

