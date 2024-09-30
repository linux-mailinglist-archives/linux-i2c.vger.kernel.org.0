Return-Path: <linux-i2c+bounces-7094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E07989FEA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 12:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FED21F21342
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3EB18E752;
	Mon, 30 Sep 2024 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jmcndWAs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B618E34A;
	Mon, 30 Sep 2024 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693764; cv=none; b=GBo6b+udY4s4U/qMqQW8HDEJ7cSNv6F94ZCfoxtMBzcgEtraduuOmPYL1yH1wpji3QGxjyFwi4bQhWeq+z+XZKU/Hk0/WFP4Z1uA03ZScNWCibs+7AKV2/2F9PxXeeiMjS1v45a8FWCtTP0a1QGmnfSoBFGJ0pQ/HvKiKWSODeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693764; c=relaxed/simple;
	bh=enx0t/mMcyMvIh9x4raZftNDqWmtr6KXYWQb/rTWqC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHqfl7noUnFg99kfhaBgdasd0oKVuIgxGgmlz/EGo83xILiwFgj2nQuiiWPt+NTRCq2pIhedcNpWJdsnsaXspPxNk1x1LBcJXps5tYvqce5hZC5FwD9BGBAMVa2ipKIS/E2iHq0jpMw/ZEgTWUyGnlICX922+PfWeB5t4yganF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jmcndWAs; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zwK4YryDqyIxlfaR0E3c8XedTcwBJ6x3UuNyckuRMrs=; b=jmcndWAssjcTggJ/+DNytsItBg
	hixKQPx3jwzq8qsJMqJrXeNxqZpdGuCrU9kXfqEIqOH4PJ5LXo7wsqD9Z5i5+O9r6BLr9fcKVTdAJ
	Vaax8WznebtZdiHBGR2kRMIXLd1tOQ/3i+ns2BefChBmV3Gf008ioac2DHRvHB7u9/QTGkgZoCBt/
	O60cxMRUeRjuNHZvpM9wvn6vN+KiyU6rrv9Rv0AGDhW9i1evk8eEVriVTOjGgdT0YdXommdpIMwVq
	iyMBrTLuoXxk8ACdvEvqD7c0kspPHBp1NblsmRlRy2We+B8IA4TNKwtBWJ4bSo9X37wawxFrU/vLJ
	XZkuGhsg==;
Received: from i5e861925.versanet.de ([94.134.25.37] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1svE4F-0004Xd-2M; Mon, 30 Sep 2024 12:55:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Peter Rosin <peda@axentia.se>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/8] Add tsd,mule-i2c-mux support
Date: Mon, 30 Sep 2024 12:55:37 +0200
Message-ID: <172769365128.1880381.5478194496537421569.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 06 Sep 2024 17:54:11 +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices which
> are reachable through an I2C-mux.
> 
> The devices on the mux can be selected by writing the appropriate
> device number to an I2C config register (0xff) that is not used by
> amc6821 logic. This required us to add a new compatible to the amc6821
> driver, from which, the new platform device "tsd,mule-i2c-mux" is probed.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-jaguar
      commit: 08866412e325feb87ad70a6b19ff0d165f59b401
[6/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3399-puma
      commit: 84a4e9bf4c1ebe5e71baa5a94b13e168f35e85f5
[7/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-tiger
      commit: 21b2e2365f1462d3dc8fddfd0703c2f675d55381
[8/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on px30-ringneck
      commit: 157707e00085083079cdc9f5014ac31cc3319128

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

