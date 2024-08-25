Return-Path: <linux-i2c+bounces-5778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A695E3D4
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Aug 2024 16:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85B61C20B5F
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Aug 2024 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9023A154C11;
	Sun, 25 Aug 2024 14:18:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m1035.netease.com (mail-m1035.netease.com [154.81.10.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649C29CEF;
	Sun, 25 Aug 2024 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724595488; cv=none; b=RzUiKLiF4xDn0CUqjsVXPrDikpn9Se2brkOk+XHRnyNos1TryQtGAPpqmPccoC6Esn3hdoXPh5Xg2ZITtt7LZ+vwO1eoQVuSr4t/V9/I0COP2DlAyyscFj4xyyRlJ7bDOcLWhknvgJjJ9NKSwa3Rkp4u6ZWp/f3vyHXo5Gtl3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724595488; c=relaxed/simple;
	bh=Tge7qNfQ7IBWwjRnKdpylWSoFux2yMMKX0erzV4q3Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bF42ww6KWrA9XLjFN5FnIPJZMgCjjOL12mzJVymPFv7Z1J6PwSALYcv842umLZweHKFGOWBb7S/gIiPvMJi8eI8bfocYeC25P9iZ7a7V3GzhuCAThfznvYk2m1hTdAlATkKk9Wh/04y2/R/Ty8MFuSfYOszDO0X4Ll4+ONgBtZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=154.81.10.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [58.61.141.165])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 50DE87E014E;
	Sun, 25 Aug 2024 22:08:40 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: detlev.casanova@collabora.com
Cc: airlied@gmail.com,
	alchark@gmail.com,
	amadeus@jmu.edu.cn,
	andi.shyti@kernel.org,
	andyshrk@163.com,
	broonie@kernel.org,
	cl@rock-chips.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsimic@manjaro.org,
	efectn@protonmail.com,
	finley.xiao@rock-chips.com,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	honyuenkwun@gmail.com,
	jagan@edgeble.ai,
	jamie@jamieiles.com,
	jic23@kernel.org,
	jirislaby@kernel.org,
	jonas@kwiboo.se,
	jszhang@kernel.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	maarten.lankhorst@linux.intel.com,
	macromorgan@hotmail.com,
	megi@xff.cz,
	michael.riesch@wolfvision.net,
	mripard@kernel.org,
	robh@kernel.org,
	tim@feathertop.org,
	tzimmermann@suse.de,
	ulf.hansson@linaro.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Sun, 25 Aug 2024 22:08:24 +0800
Message-Id: <20240825140824.200453-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <23624422.6Emhk5qWAg@trenzalore>
References: <23624422.6Emhk5qWAg@trenzalore>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxIVk9DSUNIGhlPShpKT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVSk1OWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9189de204f03a2kunm50de87e014e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6ARw5NzIxEhkzMVE8OBgK
	HB8wCU5VSlVKTElPTkJPQklKQkJJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPSlVKTU5ZV1kIAVlBSExMSzcG

Hi,

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> ...
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <725000 725000 950000>;
> +			opp-microvolt-L1 = <712500 712500 950000>;
> +			opp-microvolt-L2 = <700000 700000 950000>;
> +			opp-microvolt-L3 = <700000 700000 950000>;
> +			opp-microvolt-L4 = <700000 700000 950000>;
> +			opp-microvolt-L5 = <700000 700000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> ...

I'm curious if these frequencies work properly. On the bsp kernel,
'opp-microvolt-L<name>' is used by the PVTM driver, I don't know
if it works on the upstream kernel. Sorry but have you tested it
with mhz (https://github.com/wtarreau/mhz)?

Thanks,
Chukun

-- 
2.25.1


