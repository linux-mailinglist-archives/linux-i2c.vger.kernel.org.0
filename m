Return-Path: <linux-i2c+bounces-10933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA5AB3E2F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 18:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 265337AAFBE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 16:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A413E2777E5;
	Mon, 12 May 2025 16:54:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DC225A2C7;
	Mon, 12 May 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068886; cv=none; b=gNNFWj6AnUW+n8BfJtVDLe9VdQp5Pv3F2eYbi+zyEMV2bBngfs1QdD2vv01wrQ3ElRcbntLhxMUUayv+C31Ct4MKEqHK8e5BSHm98GYrFIISHYM6Dj8dqWGgXg1SktidNW097xTIAXYJ1bttu4B0Bq20ekJyuBkWfxLxbGiiX54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068886; c=relaxed/simple;
	bh=GHfBzMz6hvOT4FNqopeQP9A6JOY7MLEh312/qsRWIQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaLWhraFrr2QZyd1mkAQStejcCw2GGOniGUG+Cie5HWijvECIklSw4E9wDuS9uoboGFB9N/JSCae7dhcIoiPbxh4v+5szCS8LUj4C6vkNzlyemRLh+WRepX8PiSf1OyJUrR6p/BK4kxr6Hc67mR9YQzedwPwZSaHAgFZLssBXOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F219FC4CEE7;
	Mon, 12 May 2025 16:54:44 +0000 (UTC)
Date: Mon, 12 May 2025 18:54:43 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Georgi Djakov <djakov@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, David Wronek <david@mainlining.org>, 
	Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 20/33] dt-bindings: i2c: qcom-cci: Add the SM7150
 compatible
Message-ID: <20250512-incredible-radiant-jackrabbit-d0c77b@kuoka>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-4-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-4-danila@jiaxyga.com>

On Wed, Apr 23, 2025 at 12:31:24AM GMT, Danila Tikhonov wrote:
> Add the SM7150 CCI device string compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


