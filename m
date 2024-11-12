Return-Path: <linux-i2c+bounces-7946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045529C5B96
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 16:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B745628328B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DB2200BA5;
	Tue, 12 Nov 2024 15:13:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B01200B8D;
	Tue, 12 Nov 2024 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424427; cv=none; b=T1R3Zq9O4nm9Ufu5Awa8w09io8lWYbQN2i7V04P27CFyC3yR+WMKmPRAnPUAOwJG6IsPYFj+z6UbYd4IfXYaSL3n2lq7hmfAPiYib0G+4zUiLzA4ha1lS5+Eox9rdosud05DnzH7Ma6pO6wvjCNpkxVpqkksaU2YRFdwNYxdKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424427; c=relaxed/simple;
	bh=aGBj/pHbyRQgKVN+0CKfnhm9V5Fu+ncAduTmjT2NXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBTnnKj8IJz7SRcKI66ZwdZ2attnJd1uPV2qVhO92XWtHTNr2GHPS7moBHwU4L82mPDXaxKnPHf/1kXfqkcPO7DWJP3OCg6qCN7MoyFuJ/mGj7/TrA14KpIU78QvP+QqSdXJJGTET63Jz61GMqx2wHmWKfo5Hfr4tjHf9a/BH6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tAsVf-0004rT-00; Tue, 12 Nov 2024 16:08:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7C558C0142; Tue, 12 Nov 2024 15:56:29 +0100 (CET)
Date: Tue, 12 Nov 2024 15:56:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andi.shyti@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 3/4] mips: dts: realtek: Add I2C controllers
Message-ID: <ZzNsncbTgPynQqaY@alpha.franken.de>
References: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
 <20241106001835.2725522-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106001835.2725522-4-chris.packham@alliedtelesis.co.nz>

On Wed, Nov 06, 2024 at 01:18:34PM +1300, Chris Packham wrote:
> Add the I2C controllers that are part of the RTL9300 SoC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v9:
>     - None
>     Changes in v8:
>     - None
>     Changes in v7:
>     - None
>     Changes in v6:
>     - Drop wildcard compatible
>     - Put status = "disabled" at the end
>     Changes in v5:
>     - Update compatibles
>     Changes in v4:
>     - Skipped due to combining patch series
>     Changes in v3:
>     - None
>     Changes in v2:
>     - Use reg property
> 
>  arch/mips/boot/dts/realtek/rtl9302c.dtsi |  8 ++++++++
>  arch/mips/boot/dts/realtek/rtl930x.dtsi  | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

