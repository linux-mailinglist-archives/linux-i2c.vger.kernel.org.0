Return-Path: <linux-i2c+bounces-10787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD72AA9E6D
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C26D17DA96
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B01A27467C;
	Mon,  5 May 2025 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DdC3AwJ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1058270548;
	Mon,  5 May 2025 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482009; cv=none; b=c+gC+dYLNTQ3INVWvOqjwM4060unLnkHt117x7f5z4gskZ/voRmkERaRWqKXhxrbtsfLupwR9BZgaNCFiq2RJzl5FPnqjQ0aR30UnTidNuY/Is2KXcEVuGpb9KUueVUGpVWOvlerI8gxNu+rr2CSJLvfBhQVsOKwTztO1DnlAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482009; c=relaxed/simple;
	bh=+FQHZZM7aoI7UialL3yB5/dJRd4nVbYfzohSTv3bLmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsdmj9T57cW8fjg3VsJ4WXLaQ0eWBwt0+ucO46mRX/wMnaR4KdUZyQrWJ3UvdFfmjbVcbs9XLcgmWSwty55o0DTLF4YUDF6PP6pR0/Dl1KWP4MiLM4RRBcUNuG9Au2kTY7ncBQZEp9ivUFuv2mhqSMSJIHsH1PBMHaxy69oRyD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DdC3AwJ7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ky2FY8wQi0hoWGwOjDyfpng6BVXAqJP2zLIjZqhEWZA=; b=DdC3AwJ7cAtgun0b6u5kgbdY5+
	MYldwYok5u4hquFQNeMD6gHgOoDzmnS6HmEoYWikdz5TTtdpWkxyuxqbnf0+974VNsQkyPyRI3MHC
	mgmpcwVl9gL2hAM8qKL3nGifuLykHuNPDmKRhDbgKPfR+PCYAh65SMOPqk7KxYDM/Aba3XLKVo3K/
	2thz9Nm6ua3t++DMLO5DdMOiJxUxU4sWfysIHA57NwHEdJLfn6/olIf0jGes5ZOnnXz4jh/qGsa5q
	LQoJsKmRVOCf68Bk+Uymma2vKbF40Rgr4zKXwb5QGx7nshJkyBC464hQySo9EiSxpuLXKMK1g/+7B
	av8er3RA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uC3kW-0000QT-94; Mon, 05 May 2025 23:53:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Support I2C controllers in RK3528
Date: Mon,  5 May 2025 23:53:09 +0200
Message-ID: <174648198304.1334687.5769287856260852986.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Apr 2025 12:01:16 +0000, Yao Zi wrote:
> RK3528 integrates eight I2C controllers which are compatible with the
> RK3399 variant of i2c-rk3x. This series documents the controllers in
> dt-bindings, describe them in SoC devicetree and enable the onboard
> EEPROM of Radxa E20C which is connected to I2C-2.
> 
> Changed from v1
> - rebase on top of linux-rockchip/for-next
> - dt-binding: collect review tags
> - SoC devicetree
>   - sort i2c and gpio in /aliases
>   - provide default pinctrl for controllers with only one set of
>     possible pins
> - Radxa E20C devicetree: mark eeprom as read-only
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
      commit: d3a05f490d048808968df1e0d3240ab01fe82211
[3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
      commit: 101fe8b5627c68b3f2f941266e26ac355131e2fe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

