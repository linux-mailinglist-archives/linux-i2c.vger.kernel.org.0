Return-Path: <linux-i2c+bounces-9857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E79A64770
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 10:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655F1167742
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7441C2253A0;
	Mon, 17 Mar 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GHhMjUkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C8221F15;
	Mon, 17 Mar 2025 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203895; cv=none; b=mIyw4EwlHEPe1w/vZ+qpNrJSyB9SLPFFuiOwOTqeD+ZIgSdYTr7r19qHP+Sj/S48fKqaAY1LmPLoCC2/8oSEnHj6kb9lw1AcUQ4WzuBB+m2RYf0KqjFZrO3WLbXdTfeLEgy9UESfzNzwpXhIChQ1xV4Obb6qmMdahqNldoG2DA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203895; c=relaxed/simple;
	bh=+4zPUx0kQSKXi1ZvcbycXiWrUYi81/C5cENvkvhKUvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AL0mLDRx6eX2xy9PXi/EYWeuwbw5XU/qH9stMHkBngGV0hu7M+zK26o7h4WiTdNvwVY2CfHNrpyhj8SVHwDkx/1E3LBSUNaD48mHMCKwN1mDrdbiy9imZG/XcuAiQMJ1Re5DO8xjI0YhnOm4m3hB9zm/4NlYIcNwuN7V/iVsaJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GHhMjUkE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 76B411FAC1;
	Mon, 17 Mar 2025 10:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742203890;
	bh=nNFvOK+RZrkvVJMfEFsMJGZrC69UbptfPi7iGIbIpD8=; h=From:To:Subject;
	b=GHhMjUkE1SYICR249gZ1cv4wdADxFzIMLs4rtcNruiQz0AV1hkxvN5eqOx2hKIcLB
	 s4nxmIm2qNvTQZwutQV04YeMNgNmxWh093nmPQZL4Zmzopmf2JNXJuTSDBP3VSxKxh
	 LSKWEG24bpz8f+yRUQwL82AmU4SIBQ0fc05YvbHYRl7kmRsRqvjxfp7gYpIfhNQMBQ
	 7AHlVNcQ+y/WCta10a/zyo4iVQaNTIeFHfEXFIFqygEncHJcqCV9cYVQFlw3KrQ1Ie
	 0ut2la1Lr+InkHaCc7gc3tHGkR8XyKwG9isKHHZ30KepJse4/1WQI8KrOkwAcpCy2f
	 vANxo1+/RXFuw==
Date: Mon, 17 Mar 2025 10:31:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andy Shevchenko <andy@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <20250317093127.GB17428@francesco-nb>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <Z9Lxw4qVApejzeAE@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Lxw4qVApejzeAE@smile.fi.intel.com>

On Thu, Mar 13, 2025 at 04:54:59PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 03:43:29PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > This series adds support for the Toradex Embedded Controller, currently used
> > on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.
> 
> How many do you have that will come with like 99% guarantee?

None? What I know is that

 - Toradex is building SoM since 20 years and not planning to stop any
   time soon
 - Recently we decided to get into the SMARC market
 - From an engineering side we decided that it was the best decision to
   have a small microcontroller to act as an embedded controller, sitting
   between the SoC and the PMIC, handling reset, power-up/down sequence,
   strapping options, I/Os and potentially more
 - In our roadmap we have more SMARC based products planned
 - The firmware interface is designed to be generic and handle future
   boards
 - We expect to use the same driver for any upcoming board using such
   embedded controller, the EC firmware and the DT will be the only
   differences.

But, I do not have a third product in my hands now, so, I have no such a
thing as 99% guarantee. Honestly I have only one thing in my future with
such a high probability ;-)

> > The EC provides board power-off, reset and GPIO expander functionalities.
> > 
> > Sending it as an RFC to gather initial feedback on it before investing more
> > time in testing and adding the remaining functionalities, with that said both
> > the code and the binding are in condition to be wholly reviewed.
> 
> This doesn't explain why you need a separate folder.

Can you be more specific here? You mean the `toradex` directory, within
`drivers/platform`? The only reason is that maybe we'll break the driver
in multiple files, but we can as well just get rid of it. We did not
think much at it.

BTW, the idea to have this driver in such a way was partially inspired
by drivers/platform/cznic/, that was merged a few months ago.

Francesco


