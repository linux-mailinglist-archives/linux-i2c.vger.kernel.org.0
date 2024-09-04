Return-Path: <linux-i2c+bounces-6201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF296C4E8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 19:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA252821C7
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 17:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EBB43152;
	Wed,  4 Sep 2024 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QeHU2VqD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F01E0B99;
	Wed,  4 Sep 2024 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469540; cv=none; b=kX+Zw3LifiW1APVbtcwNlhVGVKVWlFaDjngsOpKlSN2/3qMwiZVMKGqPlrZ+Xi0aTVsDzls/1A1K5CkeN7Z6d1LPHEOmctfboYjVHZzIEPNKPzaiDBeIw5iUJYodh98kEBVybcq6AQ2gsAcMxJT0lO723p/oQGksTNro8ie7RtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469540; c=relaxed/simple;
	bh=oy9LV2bQIBQbEAh0NLEId8+z6bJK02DWNYiWELJcdjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5ndEiJfRM8a9Zsk+mhn7kC3gC3Dza3JbAdSnzW6xQtZkI7m5mrPL9JsXDo/zX7yA8wvCN1TSZZoas17eS9XqJjlfGY2BfEu1rWwvK5HE6DnvjZj9ZcrZR7oSNMTodT+g/ZdbyX359+RMao1D6MICYOpVu/FKjk18UaJ0hBORFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QeHU2VqD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Tr1Ump1BzzFUw5+xs8DSrxzMIPParfqqW8lY6X5We+Q=; b=QeHU2VqDbToVKqszqHxkK9GQ65
	AFkGfKdr6dyuxNkguJGSNkWet9YBOBg6m1bA3fbCfyEE/sTM0a3ssp+ql3oRZdRbCTKUSws2rClTJ
	vwhEsaY4mQDSxuKpxIgeaX5GkP12dIG3E580nmfosg6Dw6r8Ta6fgmszDJxzmBYkEr6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sltRa-006aPS-7h; Wed, 04 Sep 2024 19:05:22 +0200
Date: Wed, 4 Sep 2024 19:05:22 +0200
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
Message-ID: <f42fe73d-1579-4fa1-89ed-9d2a4b7c7f6e@lunn.ch>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-18-quic_nkela@quicinc.com>
 <db4cb31f-b219-4ee8-b519-fdec7f7b8760@kernel.org>
 <634ab05e-3b8c-4cc1-bf23-0c68c1d28484@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <634ab05e-3b8c-4cc1-bf23-0c68c1d28484@quicinc.com>

> The driver changes will soon be posted. They are being reviewed
> internally.

And what do you do when internal reviewers tell you that everything is
wrong and you need to change the binding? You just wasted a lot of
peoples time.

Please don't post patches until you know they are correct, complete,
build W=1, and pass all the standard static analysers.

I suggest you try to find an experience Mainline developer who can
mentor you.

	Andrew

