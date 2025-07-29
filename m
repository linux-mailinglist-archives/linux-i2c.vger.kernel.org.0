Return-Path: <linux-i2c+bounces-12072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2637B1554C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 00:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D35F18A445E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 22:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED9F27A130;
	Tue, 29 Jul 2025 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG8CkcAZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17D125B2;
	Tue, 29 Jul 2025 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753828382; cv=none; b=XTUYr507ok5DKoPWfwQjCktmNHXsRAXA9cItSkyIhjnqW8OqR5s5X/fPMQzBVpCs64zS8wLuApXR+Ey6y/YDS6jwQUzH+if/YqeS0A7Y5AHK3J1ezbP7MoCG8i66/1cESalga8Pu8q9jPpLQsC19LKnRTzZEyOYnXo0ue6D9Dx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753828382; c=relaxed/simple;
	bh=WaeVTukSS1L5gqdvUBuqMfwo95AwKoyLXHK6FYRKhEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAAu0MKUJ1luGsqicHydEjh3r0MVfIxYQitXmItzDHYOQ+w0pB2qz5I75JZR3X6hPR+zBOuINNXs3u81WdFU7nUM7Im9/EcNiyNlvccojIl0SyMOcbedxRb+7cygP3Jc9QQlP9xLEoSndFaIzOsjslktkb0HZGfx2aL1xImTSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG8CkcAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F63CC4CEEF;
	Tue, 29 Jul 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753828382;
	bh=WaeVTukSS1L5gqdvUBuqMfwo95AwKoyLXHK6FYRKhEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG8CkcAZflQ5UKTilOC3qgbe/N63nlo3M389nB5QMS/j7q4BMHPnJQNK6+7IaeopX
	 oGFhvfp61MkSoJFMASRgeSPU8tPkZZVWJiaY3hkWqcHa7HIMLAY3AECuGWZKqMNAAa
	 /euTcHEIQD52ExFBCRjYXW2DKzhr0EI1QApCFuarJ67jR4Qtyx/rTmTeXbVZDx0dPY
	 g98HOkM4FTMfRxnwHDaNDc0IoquI0H/u/SGvyKWljortgOIXUokRRHJgn/+Ydw2DqK
	 VEAQNB9TIo0R0yXFn9AoCs+tws9gfYyQvS01UX1wSF9/dRb/jIAvEvM1YXILgDNYoK
	 SoleSr5s11OcA==
Date: Wed, 30 Jul 2025 00:32:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
Message-ID: <4dbhhssnqe4wh5h2n5k5y5bweb3hhdv2tn6ejmw35gvvdo76zv@lgmwb74hb5wo>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>

Hi Nick,

On Tue, Jun 10, 2025 at 09:45:20PM +0800, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Just this one, merged to i2c/i2c-host.

Thanks,
Andi

