Return-Path: <linux-i2c+bounces-8064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA689D309A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADAEEB23C09
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB281D0B95;
	Tue, 19 Nov 2024 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYX/Imw8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89E1BBBD3;
	Tue, 19 Nov 2024 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732056039; cv=none; b=jcOzj/iEi4p9qkAgvMGXyzb0F7KKpgwfLonuhUM5AjDPcCc6g/lQGTup4+fddhKMGbCE8Bl6zbgSYc/JNvqVoryUXcgBnqvrWyJecXLJ5jeNCPGJCUuQL+AK6va7kr1RrCmksHfJZQNTQ48aGVuM4UdfkgsrPuSR02m5ZybnmOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732056039; c=relaxed/simple;
	bh=Ga+rHpU9xVdO0+x231snPHKwucJu2Sq2TuNrJrYN5uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClJgf0yp97C8qIA/bknN7+xjRoh4z0a1EGR9quMk9DunbzmLgw5iMJ3+O53h59nppVvnYSyh1XYP5iaNdm9kV1Pj6mQPRTmC8Rg/SBbofv23f5x5z7CHNcc4Q1fOeOaDTXLH9OhcQBjjv8apiWYrdYmJ3NMZI7/UxBTCLa7YCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYX/Imw8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ADCC4CECF;
	Tue, 19 Nov 2024 22:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732056039;
	bh=Ga+rHpU9xVdO0+x231snPHKwucJu2Sq2TuNrJrYN5uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYX/Imw86H5yNdT1GBqqqBLZGHXyrNN5Wl3U5oeWGZsHl6qBd8mU0zFureZ1V3CsO
	 Gvi7lagxKuaDoXc0AkcFDPZO9zyEd8ZBh/a3RlBB/H3E+uoFhLVvHuZPWXt0UPRKNv
	 +DiQwfUe5l9xJLdmjnBkkXxrs1Tj8RkdqC72+fVns7b9ffwpUMipMKum82vUTFu0Is
	 aUItbwuvd/s1qrJf0P4NL0zOINwVi9oVvXoMzc3/rFzTc6HFzFU3G5oyA+9iC/7zWp
	 yNPXkqCU65oTG2cbMz3rgPooyo51N45BKw8T1w3SaWTuFTtsgevVh3DcGb3/D51jLI
	 3uYL2rdBpVhTQ==
Date: Tue, 19 Nov 2024 23:40:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

On Wed, Oct 16, 2024 at 11:13:21AM +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove_new isn't supposed to be used any more. To be able
> to eventually drop .remove_new, switch the driver to use .remove which
> has the same functionality.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> the driver was introduced in commit
> 6894f640b8f3f48700ccc828419ba60704f5a405 which happens after I sent the
> patch that became e6be2197ec38 ("i2c: Switch back to struct
> platform_driver::remove()") that converted all of drivers/i2c. So here
> comes a separate patch for this driver.
> 
> Best regards
> Uwe
> 
>  drivers/i2c/busses/i2c-cgbc.c | 2 +-

This driver has not been merged yet.

Andi

