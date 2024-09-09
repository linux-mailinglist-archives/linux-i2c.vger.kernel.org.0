Return-Path: <linux-i2c+bounces-6440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF279722A5
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 488481F22F73
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBB6189F27;
	Mon,  9 Sep 2024 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu91BxxR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE0416EB55;
	Mon,  9 Sep 2024 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910192; cv=none; b=GWUAqd5ROamKjrrB3ZWbaEwf8n58s9Zd3qjhSQhtpBhiMVpQMUT/LxwDxO0D74z4lwpc1wM3v89HHdhwLlJ4a7ZNMpfOsVaO7YbV3BQbdfTl8K6OE4EG4PXcXy2D6k02ypVioAQUWX6iINrH+qBsNN8Sk5XEychfyJpNFS72tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910192; c=relaxed/simple;
	bh=Ib6AQueuQcZUhoIakXOBxVKftve4r/ZybOV9bPitUCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVdqrodSeQYiwGiSA0a4VjniSXbnOJPoNF4aexbu+tGwy7cKzy/M1H4qqCBbbhmlCucbUJEfrzDuxRzpvRa+nhSSBvVyZIJ/OV1K5KTq/VHHq62WF3fnHd8gYDXqtkg8wcSoLeJSpuLi8znQkX2+vjnRjdEiw6dm4BxE3dzFQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu91BxxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1225DC4CEC5;
	Mon,  9 Sep 2024 19:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725910191;
	bh=Ib6AQueuQcZUhoIakXOBxVKftve4r/ZybOV9bPitUCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu91BxxRyYL4r/kpDJkkicoPDdD3jhlv5PvOFpaC2drY0WxIC+Dlrd54Wta4dRLcy
	 d1IMIjHAJO/XNklK7s2vwSMWAbIUw6T0sY3I8ZsNF43sJZBQ9UntxmjxBXW9wLxI2Z
	 gYGU8Gt1mTzYP9yCLml3VP/cYtNoie14Z8C0MNgCJwyMXsnMeVP9crPhyBiI+f+ux+
	 nPRgzpSxx2vvN0X125hnxGus3mG7ujJ5G4DOJAtPzVYWaNfgpsN4gxmGkN3wjuN0Fq
	 KHltQOFwYv7tyyP/Ifm5AU+L9ZEHAJTQ9bJs7205tgGsExJ5hHXJfMzh3y42Lv4XAS
	 3XuYrEGTmRQWA==
Date: Mon, 9 Sep 2024 21:29:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Subject: Re: [PATCH 3/5] i2c: Congatec Board Controller i2c bus driver
Message-ID: <ehobtvxpi4zjzt6wenxklqg4fcili3mugb2nqhwnvtsldqyzid@ayk2cuqn4k7s>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-3-fec5236270e7@bootlin.com>
 <tv6v7g3nkoedbu4olu2xi76qtfueebnfz7c2zx7t2wmpthqdt6@wmbo2lwv5qnf>
 <cbbd52bf-8758-42e9-8b35-48750137f2fd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbbd52bf-8758-42e9-8b35-48750137f2fd@bootlin.com>

Hi Thomas,

> >> +	if (bus_frequency > CGBC_I2C_FREQ_MAX_HZ ||
> >> +	    bus_frequency < CGBC_I2C_FREQ_MIN_HZ) {
> >> +		dev_warn(i2c->dev, "invalid frequency %u, using default\n", bus_frequency);
> > 
> > should this rather be a dev_info()? (supernit: please start with
> > capital leter).
> 
> The driver i2c-xlp9xx has a similar message [1] and it uses a dev_warn().
> So I don't know.
> If you think dev_info() is more relevant in this case, I'll change it.
> Supernit will be fixed in next iteration.

Not a binding comment, it looks to me more a dev_info(), if you
prefer you can use dev_warn(). In any case, at this stage, I
don't see this printed anywhere :-)

Thanks,
Andi

