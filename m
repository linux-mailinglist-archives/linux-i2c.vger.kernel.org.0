Return-Path: <linux-i2c+bounces-5435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2EB953B5C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 22:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0358E288222
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3234014A096;
	Thu, 15 Aug 2024 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xo633ORw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE85824A0;
	Thu, 15 Aug 2024 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723753137; cv=none; b=KdqWdsnjSnfiTQlud3A4h2eGHrcrQegQLtdcCuOIcNPVX/mJNIyCwsaPA8Naa6Gjd5NVsV24AgE3X25P4OIpksYygcpOVOtA97OdlWe8J5DV7pF4th/Ws8cV21EYA1AgtQDeZexsFgiUJ6FPE5lLRJXMGB/4mi0diA/0KCbSzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723753137; c=relaxed/simple;
	bh=3m8otJRF6jRd1Bx3WuDHcn8po7oiasVGQ/l5jpJFOq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkqwspFkvpnkQYcOXHnxlhoXRPERz/2UaMN9D7MLpw7u76WHZmGzhG4tenEKntJt1bZkn+TjsXI9aYJubEgD4lXFxUfiMJrmSOlCugiVJNzlMSTTE4JBS0E19U0YQH/vrsEcN9nEeZnDwaLqwZ3Rx05rO4Gyb0wjJDdDIrDFggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xo633ORw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uqEr/qNiSE/VighPLXDluXnxQv1rRIHaob4FAUC7g1E=; b=xo633ORwslz61HBY1z5Tk7O2O9
	7kQLjXRLnMqHFZ6cMRYE9vqBOgN2Y6vU2W2+Xa+sZbtIAuKvKkaoayY89a7AGuYdxV5U+7xhPtvjd
	DHAm3rNk4seX2xvkFhPLO7L9CILCuGdd1MjWxUTtf9ZnP72jHb55zgBst6glZ+knZlmFMSFvthbBK
	dG2RifZQm/enLAuDI+j+0qayUsW7yhDTXd3ueAlls8fD0GorheeR/BeUSQk0b7TXZlXgZNsWCl6Be
	h6jKdxsJ8eGooVe1DtjZKg+/fjBXAraOU99WvhemLmrC50rj23t8W/siT2BKdG0lEsZ2yZ+i2tlA+
	MF806jlg==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1segvn-00089v-EQ; Thu, 15 Aug 2024 22:18:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: brgl@bgdev.pl,
	Heiko Stuebner <heiko@sntech.de>
Cc: krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	robh@kernel.org,
	linux-rockchip@lists.infradead.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] giantec,gt24c04a eeproms for qnap ts433
Date: Thu, 15 Aug 2024 22:18:43 +0200
Message-Id: <172375308157.820196.5953024909313392880.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240810211438.286441-1-heiko@sntech.de>
References: <20240810211438.286441-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 10 Aug 2024 23:14:36 +0200, Heiko Stuebner wrote:
> Add the binding and dt-nodes for the product-data eeproms on the TS433.
> 
> Heiko Stuebner (2):
>   dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A
>   arm64: dts: rockchip: add product-data eeproms to QNAP TS433
> 
> .../devicetree/bindings/eeprom/at24.yaml      |  1 +
>  .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add product-data eeproms to QNAP TS433
      commit: da6f4130234448122fe3e66c8116f7d9eea8a5c7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

