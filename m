Return-Path: <linux-i2c+bounces-9764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D331A58C9B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 08:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B15016A620
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 07:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7DF1CAA75;
	Mon, 10 Mar 2025 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iCfdHmgt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D441B4153;
	Mon, 10 Mar 2025 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741590989; cv=none; b=Xd5Q9hDc0CNw/XV5S0IN/M1bcIWcRvPkuiW1tkk68kMz0wX86fhbXpi1CiNp9W2B+EvWq06RNfGOb+jPzCa2p2ZBxDrFH4CU0XCweRrncuCZNIsUe7unB3FDNriSW+xlInfYR84pbC88i+SaF9QueliD/FWQ5P2atOOm/nruSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741590989; c=relaxed/simple;
	bh=ZSuThKs4RRRiIQBWC7D0j8baNXGHTK3a7S1ckfF9qdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch9TwQxIGgFLysx1DW/A+cTq7O4w/OJnORmfNIXz7BuxwV8Qz3OGmoTHwp9y467B4ctU3Z6pw1XI2rYVNR6527CbM/0p14NoYOeU4Se/5LAHrIDSjMiycktHHShYwA+YDOqV2bPqhUsWjoYLVqb0DnD/dbwOANiUtJFl1UQ75RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iCfdHmgt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A9FC82591A;
	Mon, 10 Mar 2025 08:16:18 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QO2kUGrrvhG; Mon, 10 Mar 2025 08:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741590978; bh=ZSuThKs4RRRiIQBWC7D0j8baNXGHTK3a7S1ckfF9qdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCfdHmgtbmqK8KQ3CKJXUznYpU7FQEJMgb78NWQR2d/qNTzzWwFfgdofObg9+B41p
	 LhZlu+K9VHzifZnDVyKdO/xKBRnl+xAU4s4pA4zaQ43aqHj+5N+4M6glv7M4ISRWVA
	 pCl9LPavMwU022eFNBiY7EgPRMCRkmPdT2dN2/yw93HLUaIFYF+/81NzB2ykfQrmMg
	 ABQNBBa4sgKYyoKPyu0cxjPNnNy5cDWLgH7T0czc/YvzGlmoQN6X4a8aO9BbitRkBM
	 dgaH/z7CjJ8qu7bAcXRtSFCWh2Btc1c23VlM4ZJjGlIbsGcjNgrvopi3JMirl4xfpd
	 m66kMTlO7QTmQ==
Date: Mon, 10 Mar 2025 07:15:58 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa
 E20C
Message-ID: <Z86RrlBTvt9d40Dk@pie>
References: <20250309070603.35254-4-ziyao@disroot.org>
 <20250310070023.52290-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310070023.52290-1-amadeus@jmu.edu.cn>

On Mon, Mar 10, 2025 at 03:00:23PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1m0_xfer>;
> > +	status = "okay";
> > +
> > +	eeprom@50 {
> > +		compatible = "belling,bl24c16a", "atmel,24c16";
> > +		reg = <0x50>;
> > +		pagesize = <16>;
> > +		vcc-supply = <&vcc_3v3>;
> > +	};
> > +};
> 
> This eeprom stores the device information written by the manufacturer,
> such as mac address and sn. So it should be marked as read-only.

Thanks, this makes sense.

> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Best regards,
Yao Zi

