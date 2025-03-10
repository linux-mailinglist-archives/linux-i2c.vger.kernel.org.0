Return-Path: <linux-i2c+bounces-9765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB3A58CCF
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 08:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D2FA188ED63
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75D81D63ED;
	Mon, 10 Mar 2025 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Yj/q1LrQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB11D6DA1;
	Mon, 10 Mar 2025 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591382; cv=none; b=ZhboNN4Ez5jv68wUD/8Is802YHgpW4oXoxbTN9LBBZRstGP1SPVmkVxOlLK+RtEXTQ7xOwxKJt8ZfOtTfWWRMt9wFO0BCCJtA0tm8OeVh7KvVv3qgJCU1IoZ9bJfF3CGtBnbxdms8XX7azOyhRdSnELiXRPzEdapXbhGWl9dh9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591382; c=relaxed/simple;
	bh=ernuOloDM88O4OqBSQAmgvrlP6Ekdag/9GbGQz9YjjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9gzyvUDnt4kNbJxLs7TZIzcqOdDKwoXnO14MGN2XecDgKqQzHZ2D50Htt0c3qTA5AcsHkeuUO/1EF7/V+b3XeWaADuFkQyZHGpjjbubR20QCo1P1VMqBBPjAoISGZmcW8lFdG2eF25f4SapZrUdeh18xnSMk5fNz/T1RYS7qRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Yj/q1LrQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2F03425BCC;
	Mon, 10 Mar 2025 08:22:59 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMGQERGogw6S; Mon, 10 Mar 2025 08:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741591378; bh=ernuOloDM88O4OqBSQAmgvrlP6Ekdag/9GbGQz9YjjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yj/q1LrQrDqhoAQxcFGJitqVJn0Wd0MC2+TfDG2DkygRosf9vfRzzLbO12hs34tDP
	 23dnklqB4edGqqxDfIFDuTC01YosBXfFK/Cq8TRJHsxhtVrGZxmtmBCVGK5DZKVtwr
	 ujhWSayOid/kDRa9mHIG0lZZqaDpVecLmmRnLpVt59Wn9Wm3CMbmp9LSacLPUW445m
	 0DFwI0SfuCbs8gKtMptl08ovavQZsiJWrjxRBGMwLdhfS9XEJwQ2RPPJGRXnuSOTo+
	 Vtrt4etL/rqP57sDrUC+CIo2cvW6kAP2F+2rFcCDcqB5f4e0gVILarRn2GNlpOgX8V
	 o833i3xp+NRcA==
Date: Mon, 10 Mar 2025 07:22:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Message-ID: <Z86TRS4iLm66AqW6@pie>
References: <20250309070603.35254-3-ziyao@disroot.org>
 <20250309080025.15825-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309080025.15825-1-amadeus@jmu.edu.cn>

On Sun, Mar 09, 2025 at 04:00:25PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +		i2c0: i2c@ffa50000 {
> > +			compatible = "rockchip,rk3528-i2c",
> > +				     "rockchip,rk3399-i2c";
> > +			reg = <0x0 0xffa50000 0x0 0x1000>;
> > +			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> > +			clock-names = "i2c", "pclk";
> > +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> 
> It would be better to add default pinctrl for all i2c nodes
> using m0 group. (Only 1 group of pinctrl for i2c4 and i2c7)

Seems i2c2, i2c4 and i2c7 could be assigned to only one set of pins,
for them I'll add default pinctrls. For the other controllers, I prefer
to keep pinctrls in board-level devicetree, which is easier to read.

Other Rockchip SoCs (like rk3588) seem to provide default pinctrls even
for those capable of multiple groups of pins, so I'm not sure whether
it's necessary to keep the style synchronized. Will add if the
maintainer considers it's better.

> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Thanks,
Yao Zi

