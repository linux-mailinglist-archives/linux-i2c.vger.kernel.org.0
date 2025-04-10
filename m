Return-Path: <linux-i2c+bounces-10249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EBDA83BBA
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 09:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB254A1B38
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 07:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C9E130A54;
	Thu, 10 Apr 2025 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyUJJgDL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F79146A68;
	Thu, 10 Apr 2025 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271553; cv=none; b=bKrLbsRs6yVkeOAOp6BcfBxVYpJeUgmQhv1EP0fRlPLbFUsoJ3XatxKD6EA9sIyuPC5arWSlR8Tl+zm/mPD/Lw6HI4szoe0ULbARbFpoyqDRqw+iPXLtwougLluEYyVh/IcuxOBx1gWtS0Cfh6jM0T86Qnca3kiTfyLQI7tIQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271553; c=relaxed/simple;
	bh=1XNMYSjNtDMPaGEg8puYUqkJwzBZdMcsPGo17LVKcuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvmUDc+zQ3zIgrxlPJ84dyJlMgMff+DrpbVkBq52etw2tcUlgN4QN38agTxuWtF7ZRVoR2VcOJFrqJ8vmai4Hv2N8aJ6+qi3Hh/GDNiZjO/fDu/n6A4cxGbZIhRJ0Du5lQAUpuMlAkjmTgeELFwwZa7EXMnUWv0WsobYqUYnBe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyUJJgDL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF13C4CEDD;
	Thu, 10 Apr 2025 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744271553;
	bh=1XNMYSjNtDMPaGEg8puYUqkJwzBZdMcsPGo17LVKcuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyUJJgDL2xfMcVj0cHpaIVWlpJvxeDCh+PBYbJj9mg6S8m1jopy7tU9iFTcd0kpoB
	 awZjniVSXFyclgj5ny9eaZAzRoe92BSeESF/PVxrc8GwD29XMZao1/EpoJprSM2GEe
	 gpRALW5M8o9XrSB6XL+HaLHHfBhAmLajT1L6cRJABZd/M2alUPLoUFYMloZLv7Sn+h
	 SEMFJBa8hXl1uipXDTRghCnrD3Gd0nwvDyu10HjztcjUMgIjthziySa4aW72I4b+ZL
	 JZ/qxfXHGGhOpn7N8WG2iOOh0jvHKY301qupDrzcq+Ge/09byfzRymqVhcOSbBcDBN
	 D1t0zT8wpfVow==
Date: Thu, 10 Apr 2025 08:52:25 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: a0282524688@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v9 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250410075225.GL372032@google.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
 <20250409082752.3697532-2-tmyu0@nuvoton.com>
 <11d2541e-580b-4060-ad92-ed721e98793e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11d2541e-580b-4060-ad92-ed721e98793e@kernel.org>

On Thu, 10 Apr 2025, Krzysztof Kozlowski wrote:

> On 09/04/2025 10:27, a0282524688@gmail.com wrote:
> > +
> > +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> > +					 unsigned char err_status)
> > +{
> > +	switch (err_status) {
> > +	case NCT6694_NO_ERROR:
> > +		return 0;
> > +	case NCT6694_NOT_SUPPORT_ERROR:
> > +		dev_err(nct6694->dev, "Command is not supported!\n");
> > +		break;
> > +	case NCT6694_NO_RESPONSE_ERROR:
> > +		dev_warn(nct6694->dev, "Command received no response!\n");
> > +		break;
> > +	case NCT6694_TIMEOUT_ERROR:
> > +		dev_warn(nct6694->dev, "Command timed out!\n");
> > +		break;
> > +	case NCT6694_PENDING:
> > +		dev_err(nct6694->dev, "Command is pending!\n");
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return -EIO;
> > +}
> > +
> 
> Missing Kconfig. Exported functions are supposed to have it.
          -------

KernelDoc

-- 
Lee Jones [李琼斯]

