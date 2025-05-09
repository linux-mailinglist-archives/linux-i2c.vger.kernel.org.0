Return-Path: <linux-i2c+bounces-10918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AFCAB1FC5
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 00:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87603BA794
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 22:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834CB263C74;
	Fri,  9 May 2025 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYKV3aNs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C83261565;
	Fri,  9 May 2025 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828817; cv=none; b=YDFZ0pGErLwGJLhJ/LSfHLRVM3XfzkR8lT03RmKoqlxwZySE4eUwUU+nie+gvAVp7e+FRDLPUHcPSSN4INqbXBlxBmhZgHExtUeQy98hXMDrRfx6IASFxSTymrN7z5XN6K346FZipInFEJ231U6xmv2IxqhikbTTRc1xNHWXZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828817; c=relaxed/simple;
	bh=JEtojtxozBeZKb4L4slRczK0pe/giC0x9qDchrNk1q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DMEZicljxU4WleBdeNhhJlfDS5+SiICeb0rhebwqK3gwI8QV05POED5l11jsjITj966Kw1MdswzGyyfmKqy7XiUrvfjRJbAgKlnw+2AcMyKLfBL3F1636/0eQvZb9ebwsu/hOkJQ5mUHePloSwt1BK+Mx8QHL4vgy+2lL8Nklvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYKV3aNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862ABC4CEEE;
	Fri,  9 May 2025 22:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828816;
	bh=JEtojtxozBeZKb4L4slRczK0pe/giC0x9qDchrNk1q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IYKV3aNsMm0whQPXKjXlBEOn2trCbtazdDfHlO5yPtdyE5J3GweuFhzrUbr7Snoww
	 qqZF7RYOoIR380q1jSD71Ck0351FOW3wBU334Ik2Q8iw6QLTEG3x62c0dOEubnlHGU
	 uDwQ2z3vTuJcEfDVgiuuK7uYNS+RlyuRpoFTmbRRkVTsb++SFB42yPStgJALge6Uh1
	 iF8eehmqqX8IawRvuD2N01tJxqP6opnaPgKie0o23LHTLxL8bziAXGZWya9r08SVRj
	 YaudW4inWVVWlif6YhdroDU16ct+tjyIvqBrqpaI4K+X8q6bXBgXXjr35mKh6wnh0W
	 8QSTtY9VxavPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	David Wronek <david@mainlining.org>,
	Jens Reidel <adrian@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 17/33] dt-bindings: nvmem: qfprom: Add the SM7150 compatible
Date: Fri,  9 May 2025 17:13:23 -0500
Message-ID: <174682880484.49052.7211478690993150122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422213137.80366-1-danila@jiaxyga.com>
References: <20250422213137.80366-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 00:31:21 +0300, Danila Tikhonov wrote:
> Document QFPROM compatible for SM7150.
> 
> 

Applied, thanks!

[31/33] dt-bindings: arm: qcom: Add SM7150 Google Pixel 4a
        commit: bd4718d97d308fdc20ddcd471444b3e398ce877d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

