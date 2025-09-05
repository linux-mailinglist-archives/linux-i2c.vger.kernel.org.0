Return-Path: <linux-i2c+bounces-12678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1FB45152
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D73227B22FF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 08:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143833002C4;
	Fri,  5 Sep 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIyBx6iS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC22FD1A4;
	Fri,  5 Sep 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060806; cv=none; b=YlFCy7sc7ABPkSJzBOIQ0R2o7wkGq3e7A47kvSah9x6wpfoSkwMDa8WzChyV5Y8nFIsZpSZHlgML12rK+TEKVj+wsqU95deQSMPqmkxa+xi9688J2FNJ1U/LX43/vk2YeRMC7IZqPWgNWmI7z9gNWONv5xvaY3luqgkD48Y1EnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060806; c=relaxed/simple;
	bh=CLdI6ur32afEiqGlVI3tRuJmZiIibp0yrP4zf7xjWyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuV0DnG2R6P/WA5U6i50YhgJT4Tc/KTbCoCoSMZHtaswCm3n0k5VqFkp20mYl57OcMyRHB9EdxL2tYTW39tG4bW7BGZH+l3x59JfmNPuPgSePaDj64u0WzT0kMySU9ziDM0L63IJluulLWpGmAr8ESz5Fj2FaINchee49QURDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIyBx6iS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0657C4CEF1;
	Fri,  5 Sep 2025 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060806;
	bh=CLdI6ur32afEiqGlVI3tRuJmZiIibp0yrP4zf7xjWyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIyBx6iSgZ9Kn2f2NyibdwkBYeeFf6rKD6Bn1S2Om0IdJ+TIbQyLwO/MmW9cQls8R
	 yjOyC53OqpDbotMzePlWX7BsPu8EGo68qrQuiugDRhbtdhvLXUIl+cIbIycwD0asSO
	 593JZZPtRHHi886wZ2Qh/RysPIFsewc2QmjHRXOLgJX4VlSRvVLBYS6YMyh6EZqr5U
	 0zJ9Xz4mNRS8Orsc/uIBpnyjBL2KNr8TzdpIE/6ig2rKAT5B9OWDKhLCQA8ak0Mlmm
	 3VWaPdwjgmj0TtMIZRFJIYnx0pRctas/r68vP+BjXm9c+iAdMjvcVoxm6zVyH9SHBL
	 sX7fhHCBG48YA==
Date: Fri, 5 Sep 2025 10:26:43 +0200
From: 'Krzysztof Kozlowski' <krzk@kernel.org>
To: Faraz Ata <faraz.ata@samsung.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, rosa.pila@samsung.com, 
	pritam.sutar@samsung.com, dev.tailor@samsung.com
Subject: Re: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Message-ID: <20250905-cocky-woodoo-copperhead-9dadfd@kuoka>
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
 <20250904072844.358759-1-faraz.ata@samsung.com>
 <5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org>
 <08cd01dc1d9e$00d416d0$027c4470$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08cd01dc1d9e$00d416d0$027c4470$@samsung.com>

On Thu, Sep 04, 2025 at 06:45:08PM +0530, Faraz Ata wrote:
> Hi Krzysztof,
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, September 4, 2025 1:35 PM
> > To: Faraz Ata <faraz.ata@samsung.com>; andi.shyti@kernel.org;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > alim.akhtar@samsung.com
> > Cc: linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; rosa.pila@samsung.com;
> > pritam.sutar@samsung.com; dev.tailor@samsung.com
> > Subject: Re: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
> > compatible
> > 
> > On 04/09/2025 09:28, Faraz Ata wrote:
> > > Add "samsung,exynosautov920-hsi2c" dedicated compatible for HSI2C
> > > found in ExynosAutov920 SoC.
> > >
> > > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > > ---
> > 
> > Where is any user of it? I looked on lore and found nothing.
> > 
> I will send dt patch shortly.

Still no users. I will mark it as changes requested in the patchwork.

Best regards,
Krzysztof


