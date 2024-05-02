Return-Path: <linux-i2c+bounces-3379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B38B9EC8
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 18:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B471F225E6
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 16:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7416C858;
	Thu,  2 May 2024 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRjOtlaG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481928FC;
	Thu,  2 May 2024 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714668172; cv=none; b=Indq6ERGFZufeRx+7fKN/LVrnGQDPiiGSTGzhAdlsXIePIUCQYGJKHVzR8YID/SD8q+MTk/GiVqtG2oH9b0AFIbfyz2TRQ685AfwyhZtXhzH3iI27yFYmrcQAgWtA0xTus8aoB5ID2IBNgPEa6jXKU3C72wS1v8SoliLodUW7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714668172; c=relaxed/simple;
	bh=cj5bYAt98fbHNpOz6Lk3FAQsG3zOEVkQQT9pOnQDzFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8895zxvNclFezriu1CEhxGdL+QF/MnQ1z7aoRPzYHMI9lIsOvNHvxDlHfUo00mqngwazPU+aWL0pjcumvUV72rGLNAFYQkX9PX8+sjEBBBidXLaXIUE+f+3fzDI4GB2vjZ2qQtt9Ei2jluHJbOLpIuGfhVhNgGrM94h1QrdVsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRjOtlaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA074C32789;
	Thu,  2 May 2024 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714668171;
	bh=cj5bYAt98fbHNpOz6Lk3FAQsG3zOEVkQQT9pOnQDzFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRjOtlaGF85tupGTKMBErbPBlfCZuvG+Nh2mzE7TWe4Bt5pvoN7vV2n6UboqGVGKH
	 eqEK7yZtuGkH4lj5/US2yL9YCV10cJgn+Z4NEBngdaonz5aLmJ2kdKyVrnbtC0WgXd
	 +glMCl04Yw4Rt4hfOoQTUCc/lSIDy6LCnIA432+0wAxrjVHFooZxsg+kXa18YQCOL3
	 BDrCR54yV2qZj5B90JJ+UL1uk/HlQUgwTLRyzIMkpt2V/FbiS+u5Pw7WUDSw0ZhD+1
	 vofVfAIvFf8n/BTeDKSM7GcPlT/lIqptFrtrfjM1qPWFd8lg1UiJvG/RmINGiEzty6
	 XnMZzUYpA+pSw==
Date: Thu, 2 May 2024 17:42:44 +0100
From: Lee Jones <lee@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Message-ID: <20240502164244.GA1200070@google.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-3-florian.fainelli@broadcom.com>
 <ZihLhl8eLC1ntJZK@surfacebook.localdomain>
 <1d1467d1-b57b-4cc6-a995-4068d6741a73@broadcom.com>
 <20240502071751.GA5338@google.com>
 <6646b690-7b05-4a0e-a524-375b389ad591@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6646b690-7b05-4a0e-a524-375b389ad591@broadcom.com>

On Thu, 02 May 2024, Florian Fainelli wrote:

> On 5/2/24 00:17, Lee Jones wrote:
> > On Tue, 23 Apr 2024, Florian Fainelli wrote:
> > 
> > > 
> > > 
> > > On 4/23/2024 5:00 PM, Andy Shevchenko wrote:
> > > > Tue, Apr 23, 2024 at 04:36:20PM -0700, Florian Fainelli kirjoitti:
> > > > > Rather than open code the i2c_designware string, utilize the newly
> > > > > defined constant in i2c-designware.h.
> > > > 
> > > > ...
> > > > 
> > > > >    static const struct mfd_cell intel_lpss_i2c_cell = {
> > > > > -	.name = "i2c_designware",
> > > > > +	.name = I2C_DESIGNWARE_NAME,
> > > > >    	.num_resources = ARRAY_SIZE(intel_lpss_dev_resources),
> > > > >    	.resources = intel_lpss_dev_resources,
> > > > >    };
> > > > 
> > > > We have tons of drivers that are using explicit naming, why is this case
> > > > special?
> > > > 
> > > 
> > > It is not special, just one of the 3 cases outside of drivers/i2c/busses
> > > that reference a driver living under drivers/i2c/busses, as I replied in the
> > > cover letter, this is a contract between the various device drivers and
> > > their users, so we should have a central place where it is defined, not
> > > repeated.
> > 
> > I have always held the opinion that replacing user-facing strings with
> > defines harms debugability, since grepping becomes a multi-stage
> > process, often with ambiguous results (in the case of multiple
> > definitions with the same name.  Please keep the string in-place.
> 
> I am not buying into that argument and the fact that Duangiang was able to
> trip over the lack of an explicit contract between drivers seems like a
> bigger obstacle than doing a multi-stage grep. Anyway, I have no skin in
> this game, I just don't like seeing repetition and not stating contracts
> between drivers more explicitly.

Good thing no one is asking you to buy into it then. :)

I'm not sure how or if the code that failed to match was tested or what
went wrong exactly and I'm pleased that the bug was caught and fixed.

However, swapping out matching strings with a define is a regression
from a development perspective.  One which I've felt the pain of
personally in the past.  I've pushed back on it before and I'm pushing
back again.  We're not swapping out matching strings for defines.

-- 
Lee Jones [李琼斯]

