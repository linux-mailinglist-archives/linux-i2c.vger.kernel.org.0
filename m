Return-Path: <linux-i2c+bounces-4257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64EE913486
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41B51C2122A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8483155CBD;
	Sat, 22 Jun 2024 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRQvAWN0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EE1E4A2;
	Sat, 22 Jun 2024 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719067861; cv=none; b=ldgEQt/EwsH9vgGxGxgUmn14OTVp2w63MNRPQ+fWneBr425nrgLfwvQeiR+bFc94UdcHdH36n5w5UDjOt6dpzXHoOeads6ZpB2tFiKOnnvl4KNQw0RBXDqeeRhb2Kj5QHhIwN6GrVm3zVUq8FmxW9TT7vPs7dmTelJWPAySjhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719067861; c=relaxed/simple;
	bh=rVLBmyFJnZuJIQIizknRnCF4Dd1p7KvJTBzf4//bhaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZZ/H/plOmwUwV1JhFg8n8qPg+27oyovTsbqalo/dyXb3RYZrBgD2EvAFI/KQB8iP9yCQXdkzQivbk+ZMdvoArr8OlmB3AwiY95fmhR+or36q18euvMwTpoY7L4zLXBYd3eEMUBbihZpOn+soqEXr84V82KcK2hRhdaIc4ru0Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRQvAWN0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FAAC3277B;
	Sat, 22 Jun 2024 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719067861;
	bh=rVLBmyFJnZuJIQIizknRnCF4Dd1p7KvJTBzf4//bhaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRQvAWN0aGhAY5rDOOkVQtBkfUIDtKI0XD18zx9tdIOL40kuF90zieTlaGldRBR1l
	 seLQJR0sCz1SGjzVW0kMBBKT18LKy6tIIfFs+3SrgXN9IqPzEy1iqNdK/xrZ2Kud3y
	 W5faUPWZ7SNHCXKCRe4MypqkJ2CpMfG1EQWBVpCFm0R+FVt9sOliazOVN9mxTkIhCq
	 opZn6F1bRYp/ulgJJA5g7EVirEjRzqvvuvFlq423lZi4Jn8W7JTQChnNPJwlN3AKjr
	 tQSCvjilxwqW8YiOFrDuCUZfiD5i4dtGUJoDTFKoX8M4tL/pqaRXCTu9E1mdD21PqX
	 wHG8DMCJlXFfA==
Received: by pali.im (Postfix)
	id C2AD6BF5; Sat, 22 Jun 2024 16:50:57 +0200 (CEST)
Date: Sat, 22 Jun 2024 16:50:57 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <20240622145057.ab7lsp3dtkjge6vd@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-7-hdegoede@redhat.com>
 <20240622133237.b5xsetcxnfu4vu6u@pali>
 <fbc82ede-f23d-422e-ac76-7363e84764ee@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc82ede-f23d-422e-ac76-7363e84764ee@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:21:28 Hans de Goede wrote:
> Hi Pali,
> 
> On 6/22/24 3:32 PM, Pali Rohár wrote:
> > On Friday 21 June 2024 14:25:01 Hans de Goede wrote:
> >> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> >> of the accelerometer. So a DMI product-name to address mapping table
> >> is used.
> > 
> > This is statement which I got from Dell for 10 years old Dell models.
> > 
> > I have already stated that poking of address in kernel is a big risk
> > specially for all current and any future dell hardware. Hiding it just
> > under the kernel parameter is still a risk, specially as neither its
> > name, nor description say that it is dangerous:
> 
> I think you are overstating how dangerous this is. lm-sensors detect
> scripts has been poking i2c addresses for years without problems (1) and
> still does so till today.
> 
> Besides the kernel message telling users about this option does mention that
> it is dangerous:

But description from modinfo -p and neither parameter name itself does not.
And neither no kernel message when the parameter was enabled.

> >> @@ -370,6 +511,7 @@ static int smo8800_probe(struct platform_device *device)
> >>  	} else {
> >>  		dev_warn(&device->dev,
> >>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> >> +		dev_info(&device->dev, "Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
> >>  		if (!smo8800->irq)
> >>  			return -ENODEV;
> >>  	}
> 
> > But anyway, why this code is being introduced?
> 
> Because users have been asking about an easier way to find the address for
> not yet supported Dell models:
> 
> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> 
> This is the whole reason why I started working on this patch-set in
> the first place.
> 
> > Have you communicated
> > with Dell about this problem?
> 
> Dell is on the Cc of this thread, as well as the previous v2 posting:
> 
> Cc: Dell.Client.Kernel@dell.com

And what do you think, that if you send tons of long emails with C code
to lot of recipients and add a carbon copy of all those your emails to
some corporate group address, that somebody on that group address will
read every one paragraph of every your email and tries to detect in if
there is not hidden some question to which you want to know answer?
No, with this behavior you are going to be put on the corporate
spam list by automated systems.

This looks like you just wanted to mark your personal checkbox
"I sent email to some dell address" and let it as is.

In past when I sent private email to dell I normally received responses.
Also they said to me that group address is (or at that time was)
monitored.

So it would be nice to start communication with dell and figure out what
is the current state of smbus address detection via ACPI/WMI/DMI/whatever,
instead of adding this hacks via poking of smbus addresses.

And in case the mentioned group address does not work anymore there are
still other linux developers from dell who could be able to figure
something out.

> Regards,
> 
> Hans
> 
> 
> 1) There were some problems more then a decade ago, but those were only
> at specific addresses on some really old (by now) ThinkPads and for
> the other case the i2c_safety_check() function was added.
> 
> 

