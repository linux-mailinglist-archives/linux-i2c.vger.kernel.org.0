Return-Path: <linux-i2c+bounces-6200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666996C494
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5A21F2283D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EDB1E130A;
	Wed,  4 Sep 2024 16:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yc/ysxRm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6F1E0B81;
	Wed,  4 Sep 2024 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469142; cv=none; b=mZBeK+fMpOTFctpNpesmvYM2xslmJitmPAq2vM1T8mzzcrzjXcw5AgSRZdTQE0IcFblOpHQgKxByYVT2gCrrUeKVVi61eX6+RTftmWl25QlVgmrdJGHjJk0/rFLyiiamLbS80mHe9jem3LZK8zgN89xH3VD+Aih9VYF3NWjWGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469142; c=relaxed/simple;
	bh=YS28tikCu5RBoFVjYN87IZvBgX8zgrwILvtnKBkBj8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=garAkECmlWh91mNDlffPXG+1yz4/D6p6unVrLTyglm7PNXpKCsiKK4GjCeu/ZU0XPvhhnidC0qZJ3ki9vGabotx1jXyNPKIBUc03nMr1yEagzLynv6AWTut4n1YX6l/L0mN2y/2ivcno6nWfAWfEEjlqOf7leI/xmLTKRl8XJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yc/ysxRm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6mUT7HeH5pJhZadZ7NJVJF3DvJo0kVgsgpOmf20AEcY=; b=yc/ysxRmw1zVU7Y2RoU/tHHGxN
	KFY/nT7odTCVp/pQStZaEb+naSYSY9V005OKBMGO9OhYd1T8EpO6o/lyIbtffnH3CD8XYELmbBoM5
	0RY5IDDpV1KqTbFA0yNl8xZg4cuu7RDi+a9dQMTbgCRj55G6aXjoqwmlLqC3dZdQm70k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sltL4-006aLT-Kz; Wed, 04 Sep 2024 18:58:38 +0200
Date: Wed, 4 Sep 2024 18:58:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>

> Sorry, didn't realize SPI uses different subject format than other
> subsystems. Will fix in v3. Thanks

Each subsystem is free to use its own form. e.g for netdev you will
want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:

This is another reason why you should be splitting these patches per
subsystem, and submitting both the DT bindings and the code changes as
a two patch patchset. You can then learn how each subsystem names its
patches.

Please pick one victim subsystem and work on the patches for just that
subsystem. Once you have them correct, you can use everything you
learned to fixup all your other patches, one by one.

	Andrew      	 

