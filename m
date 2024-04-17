Return-Path: <linux-i2c+bounces-2998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C868A8548
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 15:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A699E1C20F34
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 13:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B223F1411DA;
	Wed, 17 Apr 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fphK7jFf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918A13E02D;
	Wed, 17 Apr 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713361856; cv=none; b=jZEmiXcKqDfHtEoyvZP34At7bXAtp3t+nEYRhoLJtODCIvq4VtNzuwWoUsguJHj7WVlE31/gnTkT2sELxbuqt1pcREqwBA0P09wHOrDpNsuCQqTRGcYOiFWHBfSLnX3LmqqL89yivOTFvHiaWc/f0ICAC43bfXlviuI//OJGvfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713361856; c=relaxed/simple;
	bh=Ct7mYtX/3didraJsnHzIV3XLyTwwaRWO8DPvNIVVRD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAmV8LO+GSv4nlzxPnUBF4YokMc9d0p1r0+MzuZIWx5n/f7vWF9O0KMTQTxmVnObu62f1Wjrd69tHBHUOFedsvcl2KiE+yXJMkHVi7srJwyMp6jvOgu/ezCb1rWofvaxPDuyRklDd1RZ2ua5P38hXiPm592G5nPIiszxXCe8YBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fphK7jFf; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UTuNyDC74aMGnpALnaMRzG0hlRkuyuTWVng3Ktfqx4k=; b=fphK7jFfOdWOFdlS8QMEUYrK21
	zM/EuLgy7KpOwoiTXGNn3ntuLskQwCxS8ak+QSpfEngqmG5XEQcwW6xETWOMgBakoECI2fzWCEz+A
	gDwl3kKuS189hFLPCxjyMmCQnqioD02G0m/iBEvZgpBqpIcWJVezU4u6l8/lyPa7lbtUpEMC32VpZ
	+TbKirOE9Igb6/7A5kzeCgIZNzoXk6xtV4WhNTYyRE/NNtKMsFD4ptwd7BgL1w3UTxD0LOpj7CX9L
	ENhVrEKvh00XSc03nP061krgyYLpdih4+rK392zB/cTj7b1hLYoameFGbVBdxZWDRmxPgIk+K0tw7
	1UKHfcQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52554)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rx5g7-0003JF-35;
	Wed, 17 Apr 2024 14:50:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rx5g1-00060W-Pa; Wed, 17 Apr 2024 14:50:17 +0100
Date: Wed, 17 Apr 2024 14:50:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Message-ID: <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
 <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
 <8a8a8e8b-8256-4d33-a39b-9e3cbc4ccff2@arm.com>
 <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Apr 17, 2024 at 03:29:26PM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2024 12:41, Suzuki K Poulose wrote:
> > + Greg
> > 
> > 
> > Hi Krzysztof,
> > 
> > On 30/03/2024 18:00, Krzysztof Kozlowski wrote:
> >> On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
> >>>
> >>> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
> >>>> Merging
> >>>> =======
> >>>> All further patches depend on the first amba patch, therefore please ack
> >>>> and this should go via one tree.
> >>>>
> >>>> Description
> >>>> ===========
> >>>> Modules registering driver with amba_driver_register() often forget to
> >>>> set .owner field.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [01/19] amba: store owner from modules with amba_driver_register()
> >>>          (no commit info)
> >>
> >> Patchset applied here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba
> > 
> > How do you plan to push this ? Given this affects most of the drivers/, 
> > do you plan to send this to Greg ? We have changes in the coresight
> > tree that would conflict with this "tag" ( I haven't merged them yet, 
> > but is in my local queue). I want to make sure we can avoid the
> > conflicts. I am happy to merge this to my local tree and base the
> > changes on this, if this is going in for v6.10 and all are in agreement.
> 
> I pushed it to arm-linux patches but it hasn't been picked up.
> 
> I propose you take entire set then.

You are again being, IMHO, abrasive with your attitude. So far, every
interaction with you has been abrasive and bordering on abusive.

You haven't asked me whether I will take them. I will - just not at the
moment because 

I HAVE MEDICAL APPOINTMENTS LAST WEEK AND THIS WEEK WHICH MEAN I AM
NOT SPENDING ALL MY TIME ON THE KERNEL.

Have some bloody patience rather than behaving in your standard
objectionable manner.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

