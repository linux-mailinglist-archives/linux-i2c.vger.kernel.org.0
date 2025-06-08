Return-Path: <linux-i2c+bounces-11276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11710AD115C
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jun 2025 09:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65846188A34C
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jun 2025 07:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0770B1F4CB0;
	Sun,  8 Jun 2025 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QE/2JRFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C371F461A;
	Sun,  8 Jun 2025 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749366873; cv=none; b=mH57p+cCkFYEQgH/rInjkhJq98AMFjpvm0gLNmNb5hV9Qgh7Y9Bbvp8x0VBDRPlB781J8s40yiFiqDUBtUp3RGg27fZ5hvRfiXdCRJrkv+0XFczU+OGHaA3y8XEWK9IYvXOMOoMBpkOCT8JwZxyigoziwXDtXuM0nMYQErE23sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749366873; c=relaxed/simple;
	bh=3ZI09uclr5AQ08h1LrNem9gDFYgY94t23d7M4fgp/cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRjiC/lfJUezEd7ycMEcZCVuGJfupUFfgmeHzt5EWGRaaxND60a70talxBALznX2P7Dv01LdL2NAmRGriG//XllXbfh5LdmGiGSpd3G2u6nCFMekOfqO6qxtA/GPiuZImeuAa/VKZU5qXW09jT24jJJYUy5mivPmz4tHXAgXxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QE/2JRFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE393C4CEF0;
	Sun,  8 Jun 2025 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749366873;
	bh=3ZI09uclr5AQ08h1LrNem9gDFYgY94t23d7M4fgp/cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE/2JRFSnq7mjvPcuvH53/X+P0DNHLwbAPlMmoDBBZCvzQZVyUvCJxGgSGvoUJQOz
	 WoFR6OsRu6dHH1FGD3RYeC0uHhmMel2l5Qgnz2tMgpJf5XUZPbvUs2g3FHiuphgXd1
	 ThNy/GLOq4fi7xf8JNCn/FuHbcamsakOI/Hi/HX4=
Date: Sun, 8 Jun 2025 09:14:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
	security@kernel.org
Subject: Re: PMBus memory overflow
Message-ID: <2025060848-reset-recovery-f67a@gregkh>
References: <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
 <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
 <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
 <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
 <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>
 <2025060749-attendant-trout-d2c8@gregkh>
 <695ebdae-7292-4a83-8aff-763da184921e@mattcorallo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <695ebdae-7292-4a83-8aff-763da184921e@mattcorallo.com>

On Sat, Jun 07, 2025 at 09:25:44AM -0400, Matt Corallo wrote:
> 
> 
> On 6/7/25 4:19 AM, Greg KH wrote:
> > On Fri, Jun 06, 2025 at 04:57:37PM -0400, Matt Corallo wrote:
> > > Adding security@kernel.org cause probably they should make sure this gets fixed.
> > 
> > That's not how security@k.o works, sorry.  As this is already public, no
> > need for security@k.o to get involved at all, the normal development
> > process happens here now.
> > 
> > So, submit a patch and people will be glad to review it!
> 
> Thanks, figured I'd ask. Sadly there is a patch that folks seem to be okay
> with to fix a buffer overflow but its just sitting.

Have a pointer to that patch on lore for the maintainers involved to
review?  Note, we are in the middle of the merge window, so no new
changes can be added to our trees until -rc1 is out.

thanks,

greg k-h

