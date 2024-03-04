Return-Path: <linux-i2c+bounces-2146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08721870362
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9CE285356
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 13:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15F03EA9B;
	Mon,  4 Mar 2024 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naGONxvi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335C2EB0F;
	Mon,  4 Mar 2024 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560473; cv=none; b=UDMVhjIICKihWxElnHsHP47R7+NC2b/tUBqX3EXRn3q7c4Zov2djNG4gQXo0Z2rx7q96NfR4+GFpHQWSKrgpzPPP7lBiBa+24R8UQtVEDCa9+IiNozHIRblJid97ppjjk4Pch77Igm9zqCnzv6ftGzc6iIJzJUorig8CrETwOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560473; c=relaxed/simple;
	bh=mWRjn7hvcn6TDv6eSOXSuLbqd/PVmvXDiSISYrczEcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/VxSqsW67w5rpNz6U52qHwDhdYm+BUfU6bK5G6UPvt4TDCbzyk9UNGdGK6bAaaP4hNFVyPjt2hvRoxE9i3u9s3cj3X4qbnRZFym2AS3F5vaXPl9u/YGBjRvzbnVueeCJ5G3JLD9e8ug5zmm2MOdOdVrPPrysEJQHtA3l4GA+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naGONxvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDBEC433C7;
	Mon,  4 Mar 2024 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709560473;
	bh=mWRjn7hvcn6TDv6eSOXSuLbqd/PVmvXDiSISYrczEcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naGONxvixu1JN3g9GxpNn1Nnh3iTkNTzYFs9D1EkMV0hrEejQT5nG3J+uIOIOdd+i
	 BTKQv3zQAswJJIHDHASL8ufiBaSVJcswdSrouOkjFurPtUmpnWQaWL2LjfvCSv7BuV
	 1om5rZBGVIf4xpqZ+MgSPoU/J4VZw7Y/arvZNRZCXGTbjI+Ir6cF2zM/uosa3Nseac
	 /5AiOjqLOl6wP6gXE/dUvVmPc9pxH0+tAouQpZmWq+G0dECRvi6Hz//5DTUi8PICxX
	 jemN+rnZA8cJLwJ7UwaKTzw663VZ4wpia6oURBKK1YJ6CgGPZ42ovO0A9l6Wy99TDw
	 z7G5GUwkzCKAA==
Date: Mon, 4 Mar 2024 14:54:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [SPAM] [PATCH v2 06/11] i2c: nomadik: support short xfer
 timeouts using waitqueue & hrtimer
Message-ID: <uq6n6s4ksuxvkonowouhr747cnu4ccwvhgpl6r7txgdtnimqnz@sl33zjshzemk>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>

Hi Theo,

...

> +static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
> +{
> +	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
> +		unsigned long timeout_usecs = priv->timeout_usecs;
> +		ktime_t timeout = ktime_set(0, timeout_usecs * NSEC_PER_USEC);
> +
> +		wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done, timeout);
> +	} else {
> +		unsigned long timeout = usecs_to_jiffies(priv->timeout_usecs);
> +
> +		wait_event_timeout(priv->xfer_wq, priv->xfer_done, timeout);
> +	}
> +
> +	return priv->xfer_done;

You could eventually write this as

  static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
  {
	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
		...

		return !wait_event_hrtimeout(...);
	}

	...
	return wait_event_timeout(...);
  }

It looks a bit cleaner to me... your choice.

Rest looks good.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

