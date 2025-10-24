Return-Path: <linux-i2c+bounces-13790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCCC06D58
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9E21AA438C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF4132143D;
	Fri, 24 Oct 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/4F9kA1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F732E1C55;
	Fri, 24 Oct 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317973; cv=none; b=aE5HtBcdPD4ZohYRmj1owoLxSn9yAltCjL5zDOPFFKMZhzhThQi8CLc5RsUOPStvkOii/QLgyxrrs2UgsoExiQng9cuHJs5cMrhpNYqk+/A2PRATjdy0TwLvc9tKFlnljaInD8HcG6dWn1fr3sTjJegZl+8H/zylSJaftCvrKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317973; c=relaxed/simple;
	bh=YlGEYTT5nrHovfloLOOpUQRYN+fXsCYG2LixOaa5378=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxr7yr+o1I/wnT4Rr+hBymoEhbTryPj+01ueS5mfguJisANNXPG6y/dGx+kszEnGzwHwRiaXCz/kBZNJbtByo9Hc1vIJbJfdzoc8k1oZ6OiSLURQ94hWizKYi2gvLMucQziFiNdx8DbWxPKcyGjAu57oPUXTXTlPQ2Io1qhFhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/4F9kA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A2C4CEF1;
	Fri, 24 Oct 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761317972;
	bh=YlGEYTT5nrHovfloLOOpUQRYN+fXsCYG2LixOaa5378=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/4F9kA1e7P2p4l5Kvey8Q2WS1TGvL+gAQgqglnM7cmRBIbBVx1y0KF3FxqlHN3hw
	 DgUerun10okT687v2FNFL1mveKVGAuMBci/DNS7IeNQx4dHxCN0LMvEmYDSzUSJTwu
	 gUY+8uEjZe4tu24kb84PL0W6wXuKbAvKH4nxG++v9LyeMh0H4C3ueJByez8hbGKbS6
	 xqXi3KAU0karokUs3nlG9tBvMchWD6lkMGi3JAGU/AYT1rog8Vem1Xs7Tu1xe8NjIV
	 loFh9k/M45Xg8oOhyvuELi7rogTRTE+/JFOTfxl9M529IWpSCrO4/yVB5ofkwHPO1f
	 K+WsCVS+PAmZQ==
Message-ID: <d87ac82b-0ca9-417d-a239-c68cfdfa4c78@kernel.org>
Date: Fri, 24 Oct 2025 17:59:06 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251023143957.2899600-1-robh@kernel.org>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 5:37 PM, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
[..]>   .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
Acked-by: Georgi Djakov <djakov@kernel.org>


