Return-Path: <linux-i2c+bounces-4928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66092E873
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E44E1C22108
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C55215CD6A;
	Thu, 11 Jul 2024 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EecGcICg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1604414F9DA;
	Thu, 11 Jul 2024 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701844; cv=none; b=giiJsijrdZBDqLd9oWAscZYJOBZeKdw5mHathuBmLpgFroSEnSLYJg0ck1lAuT1eFLeujMqTS9/6fOmzPLEG8uS2T/d/55I+KhD2GHt/Ee6ww+UFOZkilXcMEBcljwQW+TKMZmL0BSdZWJMVK6Z4IrFBVQ3G/uGgrk2+Bx+MrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701844; c=relaxed/simple;
	bh=o4HNL2HBPvfhn3lIhSgSL422VMo2jRCeE9i50s6mWPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cetHLc3k4h2vvrX1uELtfT+4Yzp3+hZBK4gPpaNaAi6g36RqeAyXn+IuiETDchA+eFl+p1AwtY6/+B8j89SuEqAB92OFVvg23E94PVn1AkKyeLWbJPna+2pWc6wHAtYZEYO6RLwIlSl5D7ZReHl29Uq0g4hhJFdVJJRP6LqxGp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EecGcICg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E38C116B1;
	Thu, 11 Jul 2024 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720701843;
	bh=o4HNL2HBPvfhn3lIhSgSL422VMo2jRCeE9i50s6mWPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EecGcICgha7Xf+wcr6OuylRw9qlPQsO7dj18XRIfv6Eh0gBGdcXOtCfTahlpbruOw
	 B1Rvsxia4lv857PZjDKeVkOWOcPS22JRBB/AeYDcw24k8zBTsHWKu7oNkOGbUKny5R
	 eqMb4EM3085Ot0bhzxqgOputP+2HjJONSnMzODlUB4c/e8jZ0WWSgJTQCVjmgJmdFr
	 vhd/7AN0CX2HsgZEK0t50PeJ8CCPMz5A9C7FImbAeR09xOINTy57RoR9mmcnQD2lGr
	 vLsZKj1Lg5GjhIX3OrzrQ3p+Z4INDiWVPBQiCJ8zXN/uCTp16+YlEBeAaRNUdQcPjG
	 hiFhZ2kjEOasg==
Date: Thu, 11 Jul 2024 14:44:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Robert Richter <rric@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 51/60] i2c: thunderx-pcidrv: reword according to
 newest specification
Message-ID: <h7vwcdzdaatxhgw4eef4hfl7x7lwbypdcwxyxfhj4t3y7xbxmj@akjrp4llv5ik>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-52-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-52-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:51PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

