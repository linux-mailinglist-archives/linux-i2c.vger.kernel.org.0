Return-Path: <linux-i2c+bounces-11510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F6ADDE09
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 23:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E97897A5501
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 21:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28122F272C;
	Tue, 17 Jun 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmarUdqc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E272F30CC;
	Tue, 17 Jun 2025 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195903; cv=none; b=YyXbgnKGU5fBBnG/viMoxabLCi3Oi3x5KdGDZDPqdovyFh2d4pQhPg0tAwIu0psdWQvCdzngwhPfs8FfK+aElKZCwH914IEtvbv4pctSFyOP3+2HpYZaq2twYhSmBYB4yW58RyTCAldb/qBJIKuQXEWHicI/Mz1A3RMy49dru9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195903; c=relaxed/simple;
	bh=1YfwZW+S936XwdA8SGfJ1ZJvlipD9uTXygNO4srMawo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWrl/fwZcbwWBEcKxMkQFCJPUAghwLr4ETQ3G0/zqBGUnvzaVwO+umBbCrqaHe9Wt2xY1m0b6lkI/Jp7FrJr2E00mA8gPxcCrk3hPGMaKqW877GTFTqBfep3XdCaFEKktQZnkAFa+SxNOGWu57oLURUcQOEumwlHExYURyd/FKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmarUdqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBBFC4CEF1;
	Tue, 17 Jun 2025 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195902;
	bh=1YfwZW+S936XwdA8SGfJ1ZJvlipD9uTXygNO4srMawo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmarUdqcOEke0FSqL0Xg4J8Lsf3Wt1uxrnUTrBql9tooIzqRSqrJXRb/RthUG96tM
	 UhmIuCJamZ3RxGpHFDGNgVGHqRgU1HHltdd03/dUDd3yZXgKOp1z4NJsBzWdqKZRoT
	 Nhpr9RanMRtnDUygTTyNdDrv/EZ+9j1PkN20sbSIICvlIom/jxXKO7Iy/l/5DOxHrK
	 Bbs/ObfLHkXDYrqiBgMagOsKvqyvb6JzIr1I9Liskj/HU2yXXiA0ZapCnbVd5Mg2Kc
	 jqYO7cFto/25mDOQtAHCbJcXHeN3ftaqa2xSE6M8SFyV/zeuKzmBhVcfLIJFp6Mr6z
	 Mn6XCuVHjg8Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	"David S. Miller" <davem@davemloft.net>,
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
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	David Wronek <david@mainlining.org>,
	Jens Reidel <adrian@mainlining.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
	~postmarketos/upstreaming@lists.sr.ht,
	Connor Mitchell <c.dog29@hotmail.com>
Subject: Re: (subset) [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and Google Pixel 4a
Date: Tue, 17 Jun 2025 16:31:26 -0500
Message-ID: <175019588888.714929.17490930593303808143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 23:17:01 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Qualcomm Snapdragon 730/730G/732G
> (SM7150) platform along with the Google Pixel 4a (sunfish) device. Since
> the most critical drivers were submitted and applied in separate patch
> series, this series is largely composed of DT bindings and device‑trees.
> 
> To date, we’ve tested SM7150 support on the following eleven devices:
> - Google Pixel 4a (sunfish)
> - Samsung Galaxy A71 (a715f)
> - Lenovo Tab P11 Pro (j706f)
> - Xiaomi POCO X2 (phoenix)
> - Xiaomi POCO X3 (karna) / POCO X3 NFC (surya)
> - Xiaomi Redmi Note 10 Pro (sweet)
> - Xiaomi Redmi Note 12 Pro (sweet_k6a)
> - Xiaomi Mi 9T / Redmi K20 (davinci)
> - Xiaomi Mi Note 10 Lite (toco)
> - Xiaomi Mi Note 10 (CC9 Pro) & Mi Note 10 Pro (CC9 Pro Premium) (tucana)
> - Xiaomi Mi 11 Lite 4G (courbet)
> 
> [...]

Applied, thanks!

[01/33] dt-bindings: arm: cpus: Add Kryo 470 CPUs
        commit: 7b768d1235dbd98ef7268596995d86df31afce21

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

