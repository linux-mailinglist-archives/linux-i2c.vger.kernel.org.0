Return-Path: <linux-i2c+bounces-11632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C2AEADA2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 05:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07B2D5632B8
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 03:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043C11A9B48;
	Fri, 27 Jun 2025 03:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmqm3dR/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9E19F420;
	Fri, 27 Jun 2025 03:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996698; cv=none; b=SRT2q5FfBITYV0Y1PAwKeNEsClgXgbVwvP+vLTdTW69UGvt9y5ByHAo/Cq3xdq1CYYx+VESFQ7ooU/pUGCqvBtiiTl533qFXqr/gvG5Oxouzfb57ZDQshREUGXkhnxBhgSLVd9SxvI73XmZZOPmeigkzCaXNWjPRlP7Pf+WM6e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996698; c=relaxed/simple;
	bh=j98qoPjak3wR5iuEcAqFbhakXDyF8DDvouUxcNq8yRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iqpy7+ki20R+yyGf/LnsMCExNEW2IXlgJEFxmCuVO+z5A2tXKSgStcsVTmnunab+hmiXREoz7gngfvb5zhTBPFwXBasOkiVP40sWf+9Pz1PLoujDuzgILdI9TLQKGQJeFhpYQDTz4jod9XakB9wkOlJX+BZTjpkCMafpxr1Gq6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmqm3dR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161CAC4CEE3;
	Fri, 27 Jun 2025 03:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750996698;
	bh=j98qoPjak3wR5iuEcAqFbhakXDyF8DDvouUxcNq8yRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gmqm3dR/SKhyAGApA2nrn7pDkVzzV3GMe25X2S9RO3FJS8Wu5IY9sZK8MQ3gxVHuB
	 foKuVH96q8aczFyUTWFzY3wAvjKbwtYCrAqCmw8mxMQZtKskD46LeyIZqAwd3BPrL9
	 nVfC8hiTDTFDB4sWoYBg8jPgHvvPHV3HaBQW6Fa0h3FNZ10L9F3gY+yewpvKFeLOvy
	 5D9OWTwXEde6LFC4s1D7hqG0szvgpDNyKq2xusxpqEiGEIfk4+i9ALqEZo7thJ/78J
	 u2xgYPBzDox8LIv2z8c3ZCCzcrMlLT4RUrZDNIL/RrtrtQMR1mpuYGgsdVe/WSjrCC
	 qHkcgNALxkFsQ==
Message-ID: <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
Date: Thu, 26 Jun 2025 22:58:15 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@zohomail.com>
Cc: Linux i2c <linux-i2c@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 DellClientKernel <Dell.Client.Kernel@dell.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, Raul E Rangel
 <rrangel@chromium.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/26/25 10:51 PM, Askar Safin wrote:
> Okay, so here are results of new expirements.
> 
> Now I write 1 to /sys/power/pm_debug_messages in the beginning.
> 
> I was unable to find "last_hw_sleep" in /sys/power/suspend_stats on these particular kernel configurations.
> But I print all other files in /sys/power/suspend_stats .

That's odd.  It should be made when the PMC core driver binds.  Maybe 
others will know what's missing here.

> 
> I used same minimized config as in previous expirements.
> I used modified script:
> 
> https://zerobin.net/?bccdd94f5f07bf85#8jop5IXDG32p0I7SBfEc29ng0/MdAFZgrqI9x+4A/Fo=
> 
> Here is dmesg for "good" commit "d86388c902b45fe2" without external mouse:
> https://zerobin.net/?90d41139996f1cd8#Xuy0UjyxtXrOyLxq4YMP/IzUB559v7ESEIqsd/4Fqo0=
> 
> Here is dmesg for "bad" commit "1796f808e4bb2c07" without external mouse:
> https://zerobin.net/?181b4d79c16fd9b3#nu0HyJX/r9cFtKitVxJB+3CZsGfwKHc6JLYX4OyZHR4=
> 
> Here is dmesg for "good" commit "d86388c902b45fe2" with external mouse:
> https://zerobin.net/?a13c513b12549f62#LPLtc3MA1iSEPUjaizDk6xwBgEitH16hZE/WUWdgr6c=
> 
> Here is dmesg for "bad" commit "1796f808e4bb2c07" with external mouse:
> https://zerobin.net/?cda0d7dd920ad66a#VHWKTp8motWKNJawyFC+v+qNP55an/ZR7HTlhmLJ7gA=
> 
> As we can see, external USB wireless mouse doesn't really change anything.
> No wonder, I have CONFIG_USB_SUPPORT disabled in my minimized config. :)
> 
I see in your bad config interrupt 14 is waking the system.  In the good 
config interrupt 8 is waking it.

What is in /proc/interrupts?


