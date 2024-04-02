Return-Path: <linux-i2c+bounces-2715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699ED894FB0
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 12:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1C31C22144
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 10:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074BA5A4CF;
	Tue,  2 Apr 2024 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="a+dIxUWS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97145A0E6;
	Tue,  2 Apr 2024 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052778; cv=none; b=XMF5LZwWGwd/69Gqr5jITfzwsTnX/7kvWfQlEN4bpdeOILJ2fk/+Bk+9Ebh6D8wh65QXK8cTr3548l9PpjIRHyvle0y/Ac/C2PEVzvAIOh19uSYG3APCz8WlqMh9ewebwTMWaomjnoLkC24xhTz3LdxnqW76PSg/vw8f2ymjcUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052778; c=relaxed/simple;
	bh=6tWgWwyf85NY3jJD4bgaJja1bHbY9Yjl0CYtyBNudKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u30ZwbtUr4B1tzeD4hgGO1Ske8ge5t8JZzR4srxOzoBNd1r3gJ0YWeiB8p99iIHkVbu9WXUK4rj6jIkZY55N9Y4erL7J7eNRzQjhITJvWMXE/emx5D8cU6E+ZqtlJz4omW83dF+RnYEWu7rCIsvo7cs9a+g1mUmkbnv5JqKqip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=a+dIxUWS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j/f6kzxpgdCo6jJXBzau49KzjwLDWV9z5kBAhEWJE7w=; b=a+dIxUWSHUQ65fx0JSa5mhVGgt
	ywD13AlybKlarQuOPyMIvsDnNK+SSe7YKyTTJqskl7/nbtCZSq4P5sQhBXwavE8QDSwYBqcwYCET8
	IsaduWw5HXM9Ld7Md07E2s7KKJNj/4EeGPINaoI+g+nIOooZYx45r2i3yJwKtmrFyp68WLi9ND3X8
	mAFWeLVk2K8XPs3p4sN3xXTCWTKnE3xyCNL/RZh1Qs7UyTNfErsbqkfJAzVGejXPO/mCAL6OFDSV4
	rNnBDQkFOsuxCdnCt3ZmMmZuqfERDEkk65oOVA/p6Qzduk7QGNRuuAYGIRyscYTQtKlPxiYAQEA7D
	nHl3bGLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39484)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrb8B-0006IK-1Y;
	Tue, 02 Apr 2024 11:12:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrb88-0006sy-8u; Tue, 02 Apr 2024 11:12:36 +0100
Date: Tue, 2 Apr 2024 11:12:36 +0100
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
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Message-ID: <ZgvaFNLTqgQrPeiO@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <324e9c02-c005-4e18-9872-8408695fb1fe@linaro.org>
 <ZgvWfhSEYIUaIn6h@shell.armlinux.org.uk>
 <65f0ed39-4c2f-4cea-b488-2a8ba6fdbeff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65f0ed39-4c2f-4cea-b488-2a8ba6fdbeff@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Apr 02, 2024 at 12:04:07PM +0200, Krzysztof Kozlowski wrote:
> You brought no argument for keeping the kernel-version-header
> requirement nowadays, yet you call me of not working constructively. I

So add inability to read to your failings, because I _did_ state that
_I_ still _use_ it.

End of discussion, I'm not engaging with you in your current
confrontational mood where you clearly don't want to understand
anything (or intentionally misinterpreting) I'm writing - making it
pointless to continue.

I even think you're intentionally misinterpreting the responses
from the patch system.

Overall, I can only draw the conclusion that you are playing politics
and want the patch system gone, and you want me to use "standard"
tooling that will _increase_ the amount of effort I need to put in.
No, that's not going to happen.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

