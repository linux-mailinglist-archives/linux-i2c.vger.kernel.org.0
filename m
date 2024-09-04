Return-Path: <linux-i2c+bounces-6216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541696C9E3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 23:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B12A71F28365
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 21:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B3417A599;
	Wed,  4 Sep 2024 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MhhBhRKG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87913B7BE;
	Wed,  4 Sep 2024 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486907; cv=none; b=NIahj7Nk12rKoVC3aJtSyRJjYi43mXtYAY6La8v/b4WQAsGDRAxsSRvqmIIST9iRfLGMGmL3oL8vyvXqhT6Ews45FUVUT2SONCFQ3vmis2sAARFv0TGpOTvLdmWl0+DsWWcm/e+gwmPNBJftZDaYcwr/rsFiYqmrEGopC/aF3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486907; c=relaxed/simple;
	bh=xslog8XjIZI7isCnFHctxFpz2Mdpd5GZ2GUIQpbAZ3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFJGrORvxD28Ky97zI7geGB2i6kzc5l00rf0hOmPwNqQ7mTVN1bgaUew96HoQgPL3+JoyBgA+YcUy/+Mj0fCRKCLwZO3FwPO+g4O7wZwxtQ14IXG53Cg/kpZwGwsfzH/XjIdkgZl0mu8uGZLbZG3RJsO8EEWLwG4lrimTECnh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MhhBhRKG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZPFlBqJcH08Jjxnq4snrrKR2XDfHTaWNnlnioXLkjWg=; b=MhhBhRKGy5SiJyei+w6QYCErKH
	ocCiWSrlVM4bCqeucOBG9nvRKTA6AazQvtw9pfBuQLBEMVNpGt+eXxLcnWZ/kpTfizsaRZ09hJTjs
	QCC47I+AcyGX79pRXK2lMyr2Srf7MX2rEu/vSOoXEp0EZXLs2fTj9z0iWxNBWryt/mug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slxxf-006bgE-JV; Wed, 04 Sep 2024 23:54:47 +0200
Date: Wed, 4 Sep 2024 23:54:47 +0200
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
Subject: Re: [PATCH v2 17/21] dt-bindings: serial: document support for
 SA8255p
Message-ID: <b64d3425-e7e9-4b28-bd47-ca6f99b39707@lunn.ch>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-18-quic_nkela@quicinc.com>
 <db4cb31f-b219-4ee8-b519-fdec7f7b8760@kernel.org>
 <634ab05e-3b8c-4cc1-bf23-0c68c1d28484@quicinc.com>
 <f42fe73d-1579-4fa1-89ed-9d2a4b7c7f6e@lunn.ch>
 <c9255fe1-dc62-44f4-a105-54e94abde915@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9255fe1-dc62-44f4-a105-54e94abde915@quicinc.com>

> No one is born with experience. You learn as you go. Please note that
> this series has gone through internal review before I posted it in
> upstream.

Then i'm surprise you were not told to submit lots of smaller
patchsets, one per subsystem, which are complete.

I get nobody is born with experience, but for a company the size of
Qualcomm, they can easily hire a few experienced mainline developers
who can mentor you, rather than having overloaded Maintainers teach
you the basics, and getting frustrated in the process.

	Andrew

