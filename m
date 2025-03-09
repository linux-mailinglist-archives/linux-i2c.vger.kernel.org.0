Return-Path: <linux-i2c+bounces-9760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2653A5816A
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 09:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2EE16BA24
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 08:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4B7175D47;
	Sun,  9 Mar 2025 08:00:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7B136A;
	Sun,  9 Mar 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741507241; cv=none; b=LrGjdUHy6UFIqTCEQ4CywlN+n6Am9j+INYSSp3jXFliU1TLNZ18Zdgk+oEUFCgD5LFCBSX9J9zfftX7wgDpuQVeREa3UmRt3a04JQ9pRn+r2TQWCyZwQax8ZSoZrQS+yGnEPaTgVf4da9e9dnkgRfS7Q/Exp6G9qgIyRRFiMCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741507241; c=relaxed/simple;
	bh=8ebHqbGzxOQH8RAdTcUNMElnJDlicrnx+krGy2rt8RQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T8Z29n9ZvWKYkKA8b8gOQseesnFOvWkRpKney5v0TS4CpRh+cSjCtHsr5BRjVw1t4b4kwD3kXfVqQQGDx9izbToRI4JO/AbObXdGn+gOzmv5lRclFOjsn0iEXSoxwu2vGeaPh1n5b6lie1sDsu/w7b9POzFIS/Q9Y2XjARj2gLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id da0595fb;
	Sun, 9 Mar 2025 16:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	andi.shyti@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Sun,  9 Mar 2025 16:00:25 +0800
Message-Id: <20250309080025.15825-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250309070603.35254-3-ziyao@disroot.org>
References: <20250309070603.35254-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR0aVh4eGEJKSk9DGEpMQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a9579eb7c2703a2kunmda0595fb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6Mzo4LjJPCC8fKSIoHjQc
	ARxPCixVSlVKTE9KTktMSUhKT09DVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9OTTcG

Hi,

> +		i2c0: i2c@ffa50000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa50000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;

It would be better to add default pinctrl for all i2c nodes
using m0 group. (Only 1 group of pinctrl for i2c4 and i2c7)

Thanks,
Chukun

-- 
2.25.1


