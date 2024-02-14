Return-Path: <linux-i2c+bounces-1710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13255855120
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 19:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F64292A8E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 18:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F34212D75A;
	Wed, 14 Feb 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qj8MQTm6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1093128397;
	Wed, 14 Feb 2024 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933482; cv=none; b=D9ppSVGUzUGDRAKMbCBdFCRgJSwdMsLNmD9lEUNA3JA3VFGvelck8eS0lvsdkfh+8YSQ/jRj7GyXDzaZX1TjuIN1y6NYJpYC84F/+NBcmlcqp0mKQiP9UWAvvSmYdP13rlFDmG+1hNj8pyksJRSsT7gAkeNYtLH93c8bYLJyHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933482; c=relaxed/simple;
	bh=UzWKN3xNNoSjZtcnrQwFz+RNpOUVMrgQrSSh0UctjTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QE4oOFqINrZHWJoEatX16+r7tjaEcnciFeuqSMf5rRNhEAmTkXlqZOVkt+/gzAVjkldeWeHk/obfsPVkBusDD2Z7qwqMFQSKBN0eXJJGoW7ly969AeBI9dOuRY8rcZucj+ylsaHjQtGfmkdhX6kCCRCgq6ly9JcagLQhnzoAwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qj8MQTm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C87C43601;
	Wed, 14 Feb 2024 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707933482;
	bh=UzWKN3xNNoSjZtcnrQwFz+RNpOUVMrgQrSSh0UctjTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qj8MQTm6al+ezCEmOoQ5ZnVHbMiels7Hg+6eUCS4WoGaOEESCwXd7Jrpg5fEa1mOI
	 9Qor+g+afLZXmIvRMZYb6PmuVELyjVpiVbUphkNqYjkN1zAhgLzxnpBLcBsacsTMkt
	 deQAaAdnx96nkma7t/N0udb3TT+SLzuED1nazrdrzo+jELWWxLma7ieESwdQltXlNg
	 0lSSg05z0js4HC7LEBMRdC/DrFq5F0RPSC2AVFjurph2V1Kx4zm+icrzVAe57FNTX0
	 5o36S5ix/Q1I0TuBSjFGTnJu4l6Er6bhQ0AQhFCgCqOjbZ1CCH86BzK9YUFCeyBQwD
	 K/2V+VNem3rlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baoquan He <bhe@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	David Gow <davidgow@google.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Prashant Malani <pmalani@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Barnes <robbarnes@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Takashi Iwai <tiwai@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/24] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Wed, 14 Feb 2024 11:57:33 -0600
Message-ID: <170793345816.27225.17596863593307803250.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 26 Dec 2023 12:21:04 -0700, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
> 
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
> 
> [...]

Applied, thanks!

[14/24] arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
        commit: f172a341ec1f66bac2866720931594e81f02ad4d
[15/24] arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
        commit: a4b28b9ecc99673da875e214b1a06f1e0f0a24fa
[16/24] arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
        commit: a7baa25bfbfdcd4e76414f29ab43317ded8d3e6e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

