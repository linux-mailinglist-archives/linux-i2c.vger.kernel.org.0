Return-Path: <linux-i2c+bounces-5773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B195DCBD
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 09:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C46283F8F
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 07:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7BC154C05;
	Sat, 24 Aug 2024 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GC9kHJnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038514D6E9;
	Sat, 24 Aug 2024 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486018; cv=none; b=nGE2wKm21xh/GaPgUgS6MdEdz/DKkp0W57aLUAXn3mHklMLqlLOXdTzvVfivTIgIex3jWuh5Zb8UpJGUiFymXwfC3+CcCiqfZBzgl3x5FeBggD1YmApGM0mrB+Haif+2fZLq3bm9Io7BpT2Vj5YjD1DI8HtCpDdbAnGh3veWFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486018; c=relaxed/simple;
	bh=yRF+b26qzZbAF/lj54mqxmxSAmsnvppo3aM396oz6Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi0XFTjtjG6AFBWUvttgYCoL4UMr5ZozqgcMOwbcJGJ6GGyOGtfymWodabBpUUTuTyFHY9FyXVzJOhjgf6B6SPfhI3EgQO+jZSDufVadCaCKeRbDltC6+obnES5DhGEDM+j65wY7OeBuSC6cMO2nkqIOZ+nF+7gGlAkvDg1mkco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GC9kHJnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40974C32781;
	Sat, 24 Aug 2024 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724486018;
	bh=yRF+b26qzZbAF/lj54mqxmxSAmsnvppo3aM396oz6Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC9kHJnz+ylQDLPiCSV9p1V2P5SYmpcIHXMeumKkTQpWR3I4djBw5t6awd8n+lh43
	 BQsxl4+R/IDmczuyWAn5JLsKKK+TxOHyRg359W4wkQFsCV49emeVklAqQBDgfTyUjB
	 /TpsruLYtzV/F0YzMiqKiqkrvciC/tdruR/ISte5xtus0gncKbOPoIh0zUsXnvJwwk
	 yFUa3sBs5H0PZmsMLcN6/IFMrnfYWbL45EIurmvwJZ0iXssWNXototDoBG70bZX38e
	 22Q8zhFWt6s71D5uBzZ34ujfrusS9hXLtwif6chlSGgRQJf/z/oejJqoOrTwvoFQse
	 aVO5Iuslho1Lg==
Date: Sat, 24 Aug 2024 09:53:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
	Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Alexey Charkov <alchark@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 10/12] dt-bindings: spi: Add rockchip,rk3576-spi
 compatible
Message-ID: <r474bbm3nnqwvgb6dumes5opxzw2sb7ck4ehqdhig7ejdabnxw@vgmafb7dayry>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <1995660.usQuhbGJ8B@trenzalore>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1995660.usQuhbGJ8B@trenzalore>

On Fri, Aug 23, 2024 at 12:07:10PM -0400, Detlev Casanova wrote:
> It is compatible with the rockchip,rk3066-spi SPI core.

Same comments...

subject: spi: dt-bindings:

Please use subject prefixes matching the subsystem. You can get them for
example with  on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


