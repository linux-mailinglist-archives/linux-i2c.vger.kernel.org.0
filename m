Return-Path: <linux-i2c+bounces-5431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0D95388E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 18:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82149288001
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 16:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7465B1BA899;
	Thu, 15 Aug 2024 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xcgdGWJA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974461BA888;
	Thu, 15 Aug 2024 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723740488; cv=none; b=qkRZrVtM/ryP/5IJRx6bAqt6dzTIHJFg3Z5BqZteXgjz+bt1ZHTFZuEzQCVDT8C5PXNlCXXsDV/YcNXnMcJQTN3nU6iDfqYJ6FXNNCY/15LL7ERhZ2TAxXMhEehr5UwVKUl+J0cH85dE9NaOdZMvr+DS7sg6/gbuNUnZg+Tj91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723740488; c=relaxed/simple;
	bh=Q1OC/NEYSYZUerkp3zuU1pOQomn8wtGfvN913IM7gR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPU0lWlJnWbJ2DkQ7jCKE+BwkZxIhxaacZJpkzmUy9vNMvobfQNwk/rCmeqmMt1cTcb4tBLV1ZXFrNfcl4kc4HgSH9BeqINlKcllerfAZoWkQ0MKiH6vtJgE79ics2VrL5rdpjux5Q1zrMtU6V9FnnDhqeh9TwGBZFPk6/yo64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xcgdGWJA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UW7NGhbbVZFB4W/eRQdKKgB4HFlv6v7OSqkUP1DgWjU=; b=xcgdGWJAZtGBdmAfDttyTq+6C+
	gjfpgSg3G+A1R1zmBgE5JftQ3Zl7fCNQbqVhg0sztOAanWsxR/tXcuasOcDjFvHkvIfIzbiRAnTSF
	0wBXfnB7TJ6QlKkmbSZofD3GopHS68PEjOW58RoGec0gE5Z2SRq3P+Pas8uSQThvOUkFdckVpWkb9
	WojcyThpRA3inrFDlmQVI0pZQ4mra7wS6zT+CyWQJJHEFt1zQDSaf8Uh74VHRVsZbWU+cUjYioNjv
	znDrFbqfZevMIoKQCqCvgYOPkUrGR34VHyoUznj3Es9Fz5EHb+LJvNDn7COplqBQgAXstrLs3MATa
	IrfQhpoA==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1seddq-0005br-Jr; Thu, 15 Aug 2024 18:48:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: brgl@bgdev.pl, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ukleinek@debian.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH 1/2] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24C04A
Date: Thu, 15 Aug 2024 18:48:01 +0200
Message-ID: <12584345.NizCu2HIMA@diego>
In-Reply-To: <172340442666.7060.12608274118090495917.b4-ty@linaro.org>
References:
 <20240810211438.286441-1-heiko@sntech.de>
 <20240810211438.286441-2-heiko@sntech.de>
 <172340442666.7060.12608274118090495917.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Sonntag, 11. August 2024, 21:27:13 CEST schrieb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Sat, 10 Aug 2024 23:14:37 +0200, Heiko Stuebner wrote:
> > The gt24c04a is just yet another 2404 compatible eeprom, and does not
> > follow the generic naming matching, so add a separate compatible for it.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A
>       commit: a825dea2cd27a30e49816f18b7bc16545d5f0f89

just for my understanding, where is this commit living now?

Because linux next seems to know it [0], but also says that
"Notice: this object is not reachable from any branch."


Thanks
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a825dea2cd27a30e49816f18b7bc16545d5f0f89



