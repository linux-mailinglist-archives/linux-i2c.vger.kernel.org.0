Return-Path: <linux-i2c+bounces-7168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2B98CFD5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C181F2541B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4789194AE8;
	Wed,  2 Oct 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djh3+XaL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744CE81723
	for <linux-i2c@vger.kernel.org>; Wed,  2 Oct 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860292; cv=none; b=Wz7clq7CW0JZEiIUYAARUSNyJhs7gJrOFwPbxQMLtE9DWjCiW/NSlGEQz5CugFaOGNjHF8BWaz9+/cLJNgD/DJmlh6oPFRP2ojreFylJP/2dOWKZmxD1Zdz4InWYctUNYD3/9XvvjGsNz/QBaBrOYWmwlPPvTgnmq5UBSEi1zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860292; c=relaxed/simple;
	bh=yEYEGwL+S7aUsRCbF2oLRsE7Z13KWKRPy1FcjV7MhoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDMLC1qwVS+OkKKlopAuRsjVxepx0sTYZjHEMjWEG4xUM8Ar68RZpT0RODg1Y/M1f/xGmtesI1MsBOc1gDr/7I0tMU6MKGU7giCfNqtJXCCmJj9sF2+P518POiP+gPYHvdezJ4MNI6zdwmZb5CzYF0HvyebwZuhUya/567C3dDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djh3+XaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CF2C4CEC5;
	Wed,  2 Oct 2024 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727860292;
	bh=yEYEGwL+S7aUsRCbF2oLRsE7Z13KWKRPy1FcjV7MhoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djh3+XaLLsJc8LIuIegHZdXcPq5VMY+pkU+Svf10b8Fz7wLtR9DkPe6kQkFJH0Cgo
	 evrm6BuqtpDxG1TqNgT3mVTrYIX5sO/SSSGI/YBJtGBSf8bldVeo4apNOwfnXNyt5p
	 zc+6EyQ+JmYWzBbmATcXfTjmuzxCb5SiBtVbKkeJ6ojXaRxelWpdGU72Q5pT3Isk5F
	 f2Iu+CBKC9fQwSA21bNN8+2XX2iWTWHIWMQcr+cI42b2pOFs1wVStygT4WXeEuisjv
	 x/Xg1lgvKEYgAIBpyd1538/CwvFVsVWgyxbTOKv8cl5MoHzZwJ7QSI70jziKN7dsnp
	 i6//wdLfFUqaQ==
Date: Wed, 2 Oct 2024 11:11:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Switch back to struct platform_driver::remove()
Message-ID: <7l273fmmroys4f7afdfuoc7bdkkszmh4pgx4eeryq2r7btcbqp@vbx4zidtj4xf>
References: <fde732497283c2a4b079731a84be583eafcdc781.1727537108.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fde732497283c2a4b079731a84be583eafcdc781.1727537108.git.ukleinek@kernel.org>

Hi Uwe,

On Sun, Sep 29, 2024 at 09:21:57AM GMT, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/i2c to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

merged to i2c/i2c-host.

Thanks,
Andi

