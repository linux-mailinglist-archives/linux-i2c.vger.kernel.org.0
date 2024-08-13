Return-Path: <linux-i2c+bounces-5359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E136951096
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F471C221B6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF7E1AC459;
	Tue, 13 Aug 2024 23:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPZQwFpQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22201AC44A;
	Tue, 13 Aug 2024 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591576; cv=none; b=a9yekCqABZDO6oe6svEtKJZsKbQAIF8fH3uuEnMZLgY1dOFtouATiKpSh00jLsrfjdXZirqt7dcgo+hip9YQ/LRgm+02vyne6GqA9VdlgPLGRmyQtTXPyfX5tL7jR+mI7rsdYUo8k9gNcLxYZS/q1yRGCRYxgSN4If1FhUPqlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591576; c=relaxed/simple;
	bh=Pj/vEH4rXCY0exxF5jQLlKMEj2jb+mpQ3RAwRKHYaJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br59gfssqi05Ib0NjZRG9ZSW/l9iYwwF4O4XNTCN8rmH9hrNyBxuxAox1tXJvpx8pYlyvAgAtgei5MeX40nZs3WnRROFJsWxisdVxs/FGay4D8Dca/TLTSRY5yf32iZv7FZIDLEoutw0EMOauqKoLsX6qFSbGHwPpCK1cRZl+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPZQwFpQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC15C4AF13;
	Tue, 13 Aug 2024 23:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591576;
	bh=Pj/vEH4rXCY0exxF5jQLlKMEj2jb+mpQ3RAwRKHYaJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPZQwFpQsmm0C8BxkOv/mGzOUzbXEm0+YY9j7gT8wHO9Q07ls7BxX2vDilkUuArTp
	 KCm51TCN+CquHi3OcKLMK1F2TyDJ9Bs80JmbmD91Okh7kexq5IoGglWlsoEQNzZ70i
	 OP/e+55OUenMzNOjGBurncfJ/YT816DHwVAaNb+gMg89bCeAnz/y1WQbvUBl6ZZC19
	 /GDD9DbJLWKsMSe0AjWYK1fHngXjKsLmoOwyiJArMEqT5hfonhspA9djKkyV+zildu
	 K2rXWNhir8JN+z260LMd3CiaBuMMWOtnTIlPP/cbOZ9qd6xu8ij5IPR+CaHSo320y8
	 wKvCXeRFmJDMA==
Date: Wed, 14 Aug 2024 00:26:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Congatec Board Controller
Message-ID: <6ooikjhonxxvey36b3wvtl6klppw6g3nqrdfzl6u6ey7ipptel@r5k6ywecthaw>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-5-fec5236270e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-congatec-board-controller-v1-5-fec5236270e7@bootlin.com>

Hi Thomas,

On Fri, Aug 09, 2024 at 04:52:09PM GMT, Thomas Richard wrote:
> Add the Congatec Board Controller drivers and header as Maintained by
> myself.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

