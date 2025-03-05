Return-Path: <linux-i2c+bounces-9731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F9A5017C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 15:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229C416C3A8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 14:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B995F24BBE1;
	Wed,  5 Mar 2025 14:10:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D182424A05D;
	Wed,  5 Mar 2025 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741183822; cv=none; b=st7TlV8PBH3Uvb1onW7ZGyF7rQR/Osa3Zgf8+fpt1JRQh/sw+rPp+PHqvKIUuQ2A+uJGCBiiKFA82hCdN+ZYZ6E8BklO0eiZ5fMxAje0r9QEb95xU9v6DKOgdWBdhZDx4oTNuPnlC7X91Q4zhofTJQ0gs4jl8Ew01l0MpsRVMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741183822; c=relaxed/simple;
	bh=UQ18aJdgRI/WjXL1woI+2m1dTLqSOyXlg2GhAnprZK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBzKPmCh47e18nWjYse1EJkc6Tz2PRWRQN+rJkAAPsaSaBNIBGMvNVjblonBdhkUmN3BxHNsYvsmiLU6G2oFLqzOivFegQFpvMmctKfeXQyZCUqZkiLwa8vBU+887rJkhaBGaU0ZBFpY2x8mocIw3ne8zLKS+87KULvBL6b0hhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ABAA3342FB8;
	Wed, 05 Mar 2025 14:10:19 +0000 (UTC)
Date: Wed, 5 Mar 2025 14:10:14 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support
 for K1 SoC
Message-ID: <20250305141014-GYB63227@gentoo>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
 <20250305030540-GYA62563@gentoo>
 <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda41d6d-fa08-413b-8f3c-ce044e171615@sifive.com>

Hi Samuel:

On 22:01 Tue 04 Mar     , Samuel Holland wrote:
> On 2025-03-04 9:05 PM, Yixun Lan wrote:
> >>>> +        clocks = <&ccu 176>, <&ccu 90>;
> >>>> +        clock-names = "apb", "twsi";
> >>> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> >>> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> >>> from above docs, there are two clocks 
> >>> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> >>> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> >>>
> >>> I'd suggest to name it according to the functionality, thus 'func', 'bus'
> >>> clock, not its source.. which would make it more system wide consistent
> >>
> >> Also in that same register is:
> >>
> >> 2	RST	RW	0x1	TWSI0 Reset Generation
> >> This field resets both the APB and functional domain.
> >> - 0: No Reset
> >> - 1: Reset
> >>
> >> Which means you need a 'resets' property in the binding as well.
> >>
> > right, there is reset needed
> > 
> > I'd suggest to add it as an incremental patch later, when we
> > implement real reset driver, and also complete the calling reset
> > consumer API in i2c driver
> > 
> > but, let me know if this is not the right way to go
> 
> If you add the resets property later, that's a breaking change to the DT,
> because existing devicetrees will not have that property. So you would have to
> make the reset consumer in the driver optional, even if it's not really
> optional, to work with older DTs. So it is _possible_ to add incrementally, but
> not recommended because it adds "legacy" code that never really goes away.
> 
Ok, that's fair if we want to keep DT backward compatible..

> It's okay to define the binding as requiring the resets property now, even
> before the reset controller driver is merged. You just won't be able to add the
> I2C controller to the DTS until the reset controller binding is merged. But
> since the reset controller is the same IP block as the clock controller, its
> binding should be available soon anyway.
> 
yes, this should work, thanks
I think we will wait for reset driver

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

