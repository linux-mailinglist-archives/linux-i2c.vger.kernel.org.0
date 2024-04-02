Return-Path: <linux-i2c+bounces-2709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30E894E40
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 11:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86472835DA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 09:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1643B58ABB;
	Tue,  2 Apr 2024 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pCC4bfr3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB157305;
	Tue,  2 Apr 2024 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048688; cv=none; b=n3qtJF5qpdQE5O1EcgdH/k5Hef1IxUPvEtNb8oRqe6AZj/ZlJK4swbfcUzIG8AM/bt5tjYo8QfwmoIBLCUeT95DE395FCN9JFMZpafqsSW5Y8MvzpYLmlY6igTI8i3Mt7hpwtXCAxS6S/9xKyGUuIOdyHuevbsAjK9nMggXdYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048688; c=relaxed/simple;
	bh=YvAxsRirqP9WIUZqYwF0tiTfjgDxAvwrGrHJaBMhnbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJw0pWL92Na0iVJzfb+DbQLpuoRT3SiwP2Hzyq8x8XGkDZr9hSixS+AHGfNyVGcNFLIZCEoKEoqECIlKSQiadZA913auzQp1lAqgBYqa5SV3nvziOTuh4CE8g+FcX4eQxHsH9DJXkTLWR0fbqm4fN5jy9CVsBt4c71SP6cYuFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=pCC4bfr3; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/sLPoPRj7yaTMRifvssA4ocGQZQ13k50t3gTbGc6at4=; b=pCC4bfr3tEL7rd4uaTZq+6Fpyu
	d+b3YySnKJPGaKKYgvve+kH+pO/ODBmZxycpxzsqacSBSdWqeYQDiEntqiuyA5cau6k33vgQiFDsO
	qTlXke5NWkvtiCNdtwLxqrMeHOqaPZAmWI1PdAVLlcOnyjRqTOfUDAgYt7IIyRB97bgcLAVGHikxE
	6FDGpSBr+ssVKqsGTlUYERTuxv8xLEMlCVg1uHs/VSLGiOfXKS+hO9Wxmm/9/x+Mpwtl6Z95AWH3e
	Q6UlRsos1rowDkHF5p/nblE1JIq7nT7xR6M/TLYUUxuWJoHm2dDiLno9T0narThxj9NxMVoafbYWi
	Xo6yfp7Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39088)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rrZwT-00061T-21;
	Tue, 02 Apr 2024 09:56:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rrZwH-0006pd-Kx; Tue, 02 Apr 2024 09:56:17 +0100
Date: Tue, 2 Apr 2024 09:56:17 +0100
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
Message-ID: <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
> > Merging
> > =======
> > All further patches depend on the first amba patch, therefore please ack
> > and this should go via one tree.
> > 
> > Description
> > ===========
> > Modules registering driver with amba_driver_register() often forget to
> > set .owner field.
> > 
> > Solve the problem by moving this task away from the drivers to the core
> > amba bus code, just like we did for platform_driver in commit
> > 9447057eaff8 ("platform_device: use a macro instead of
> > platform_driver_register").
> > 
> > Best regards,
> 
> I tried to submit this series to Russell patch tracker and failed. This
> is ridiculous. It's 2024 and instead of normal process, like every other
> maintainer, so b4 or Patchwork, we have some unusable system rejecting
> standard patches.

Sorry but no. Stop being offensive.

> First, it depends some weird, duplicated signed-off-by's.

Eh? There is no such logic in there.

> Second it > submitting patch-by-patch, all with clicking on some web
> (!!!) interface.

Again, no it doesn't, and you're just throwing crap out because you
failed. Unlike most of the "normal" processes, the patch system allows
you to submit both by *email* and also by *web* for those cases where
the emails get screwed up by ones company mail server. That's why the
web interface exists - to give people *flexibility*.

The fact is, the web interface is merely a front end interface that
generates an email and submits it in the usual way by email - an
email that you can perfectly well generate that is *very* close to
the standard email that git format-patch generates.

The *only* difference is that the patch system wants a KernelVersion:
tag in the email _somewhere_ and it doesn't matter where it appears.
Git even has support to do this.

  git format-patch --add-header="KernelVersion: $foo"

Why does it want the kernel version? Because when we were running 2.4
and 2.5 kernel versions in parallel, it was important to know which
tree the patch was being submitted for. It has continued to be required
because it means when there's problems applying a patch, it gives me
the additional information about the base used for the patch (and it
keeps on being useful to have.)

> That's the response:
> -------------
> Your patch has not been logged because:
> 
> Error:   Please supply a summary subject line briefly describing
>          your patch.
> 
> 
> Error:   Please supply a "KernelVersion: " tag after "PATCH FOLLOWS" or
> "---".
> 
> Error:   the patch you are submitting has one or more missing or incorrect
>          Signed-off-by lines:
> 
>          - author signoff <krzkreg@gmail.com> is missing.
> 
>          Please see the file Documentation/SubmittingPatches, section 11
>          for details on signing off patches.

Lots of people use it without a problem. I've just run the parser
through its offline tests, and it parses email content correctly.
I've no idea what you're doing wrong, but it looks like something
pretty serious if it didn't parse the subject line.

Rather than getting stressed about it, why don't you send me an email
the first time something goes wrong so I can investigate, turn on
debugging to capture the problem email?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

