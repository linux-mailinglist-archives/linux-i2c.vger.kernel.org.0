Return-Path: <linux-i2c+bounces-6215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A486396C9BF
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 23:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588B8289297
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 21:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E855517279E;
	Wed,  4 Sep 2024 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hCJDBgqk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54408148850;
	Wed,  4 Sep 2024 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486590; cv=none; b=ZZ2ELGvxAgnbbwjz+cXSryLhKTq2kNryAVs4I4AIivXanHgy6eZ+r3SBPJD+gukmDKM0atofqFrZgW/FUI7Vjc5FJBAZofEK+NStHLFWBt2lZlmlL3cYhgpSlHmbTscrhWLgLGH0rVJByHE67xYvAN6MoQeWXZJdm4KY0mP7xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486590; c=relaxed/simple;
	bh=1LNI88micgNHgbbB7KdA4HGKNqRpTitebIbdizJqpRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHDqKzhFNLmmMXFl4knZam0qHytl2jwgzYVcmn9SxWJtLx5rCz5AD9IVy8Uqu8mN8ZM/GXucjQXWty9ijd0rL4OoOdQpaIBxY4QNOmoRNpSVmgPpOruEo2btpktA++SO8iz72NCvrJ2VJJjzdFKYA53AfSEmVq/L1vOfB1DZWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hCJDBgqk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AM5l2g0QT9mXGqo3zZQMk1RexCjW5+duz7bC5MyWC2g=; b=hCJDBgqkKj6+sZte+boleCq8wn
	N11rgsHjD8DL2T5xNS/SZ7wOAAoklvGVK0sM18thAlFvDyJlg46cc/J89wnvdlv8oU2eb/0YqsbSP
	ZZxbAy/bMoP2XKnJWFKyciBNixYdyNG/AhMLYvEGIncBRWWFjN8eneH+ubMfCW/vClps=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slxsX-006beQ-IN; Wed, 04 Sep 2024 23:49:29 +0200
Date: Wed, 4 Sep 2024 23:49:29 +0200
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
Message-ID: <a5fc36c6-6ca5-424a-b68a-f5695af00562@lunn.ch>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>

> Qualcomm QUPs chips have serial engines that can be configured as
> UART/I2C/SPI so QUPs changes require to be pushed in one series for all
> 3 subsystems as they all are dependent.

So leave that until later. And when you do, explicit mention why you
are cross posting to three subsystems, because the hardware is
designed like that. And suggest a way it could be merged, which
subsystem should take the lead, and the others just need to provide
Acked-by. The Maintainers might disagree, want to do it differently,
but i find it always helps to state this from the beginning, otherwise
sometimes no Maintainer take the lead role.

But this patchset appears to be much more than QUPs. You should be
able the break the rest up into smaller patchsets, one per subsystem.

	Andrew

