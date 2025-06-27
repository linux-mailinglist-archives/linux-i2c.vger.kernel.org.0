Return-Path: <linux-i2c+bounces-11630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC5AEABCD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 02:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 331545666C4
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 00:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B2DE55B;
	Fri, 27 Jun 2025 00:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGDJK+xz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1118027;
	Fri, 27 Jun 2025 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984512; cv=none; b=PFhBeRb/9SFKldSLcWwf5PYdfefQ5RTIxEZKsqbmPj7R/FXEHdrAyZPh6Kn3O0XZlqquNHnfXpdBy2aoUQ2JV8HhBUUJBgcFXJ1LC9S6lwCU9R4uMUStnlTlPabZJ7MoDtrgf6HzLwptjRY36DVWA7yp50KZHPqR1iYzKOqvZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984512; c=relaxed/simple;
	bh=uutVD3ap6mDQgO+8SV4I4DfgbjdOGdAIzBHvj6x4AR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kw1/txDsXcLKb2I8KJktfV/wdJQK3Ly6gZed8cNp+D6Ap6DsLHM+XKnHPQQ2z+ux3AJk7yM4Q+l176kJlp9Plufx+z23wb16GgrYrftcH9BIk61JE3pea6idhEO0cla1rVj0cezd5sHYmhhnLDOWZ1oktiSeSt0RUMkDGN9cfno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGDJK+xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19991C4CEEB;
	Fri, 27 Jun 2025 00:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750984512;
	bh=uutVD3ap6mDQgO+8SV4I4DfgbjdOGdAIzBHvj6x4AR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EGDJK+xzcpavT2thPkJwQW22hMnEHuxCjtp+GNzPFJXV3nU57VjrEADgRNsm6c4ML
	 dd3nMnZohhEPztwhDsJorF9XnqdsjxiiEQ+gB7O2orQ4j3A9Ma++xomSt77RETrEar
	 ok0bVShY2xk2iqZpas3HBRqYo+50py96FoY6PL5OyY54ziE6vLmqRnP0heXdzXVXRV
	 +HnNvdHsyE8UgnvL0aDlDfV242JCfx5/hz/Ho2T9/hay8X8mmeUKOfl4Za9ImuJaw5
	 KSwMXdi1KQVkkj42uQJnm0ABeO5Q4tKEEhj+RNDBILbOiupsmIg6/Sk4hHdWPNSjQa
	 8smpT6rLvQGSw==
Message-ID: <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
Date: Thu, 26 Jun 2025 19:35:09 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@zohomail.com>,
 Linux i2c <linux-i2c@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 DellClientKernel <Dell.Client.Kernel@dell.com>,
 linux-gpio <linux-gpio@vger.kernel.org>
Cc: Raul E Rangel <rrangel@chromium.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/26/25 6:32 PM, Askar Safin wrote:
> Hi. This commit:
> 
> #regzbot introduced: 1796f808e4bb2c074824dc32258ed1e719370cb3
> 
> caused a regression. Dell Precision 7780 often wakes up on its own from suspend.
> Sometimes wake up happens immediately (i. e. within 7 seconds), sometimes it happens after, say, 30 minutes.
> 
> (The laptop comes with Ubuntu preinstalled, but I didn't test this bug on preinstalled Ubuntu)
> 
> That commit already caused a lot of other regressions on other laptops:
> 
> #regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4cb786180dfb5258ff3111181b5e4ecb1d4a297b
> #regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d63f11c02b8d3e54bdb65d8c309f73b7f474aec4
> #regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a69982c37cd0586e6832268155349301b87f2e35
> #regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=782eea0c89f7d071d6b56ecfa1b8b0c81164b9be
> 
> I will be available for testing in coming days, then I will switch to other things, and so will not be available for testing.
> If you want more time, then, please, ask for it, i. e. say me something like "Please, be available for testing in more 10 days".
> 
> Here is config I used for testing:
> 
> https://zerobin.net/?5c4e4b8f6e7a6a0d#W35/IXYAxzjFyp7yP71V0EZ6jcF83HOWB/52ldl5jig=
> 
> In other words, this is config I used for bisecting. In other words, the bug reproduces
> with this config on 1796f808, but doesn't reproduce on d86388c9.
> 
> This config was created using localmodconfig, so it is quite possible it will not boot on other computers.
> 
> Also, the bug reproduces on pretty standard Debian kernels, for example, on
> 
> http://deb.debian.org/debian/pool/main/l/linux-signed-amd64/linux-image-6.12.32-amd64_6.12.32-1_amd64.deb
> 
> with standard Debian config.
> 
> Here is "bad" dmesg:
> https://zerobin.net/?525f36df8d698fba#e3+DHsvv3Lsqmi91d1TqHx19mrilYNDR0bL8DbeNxw0=
> 
> I. e. this is dmesg generated during attempts to reproduce the bug on "bad" kernel, i. e. on 1796f808
> with minimized config provided above.
> 
> And here is "good" dmesg:
> https://zerobin.net/?09b26bfcfa523eff#zDMKsIGmfXBLgpml3qDjwW0NnclErstolYEjCMzmmsA=
> 
> I. e. it was generated the same way, but with d86388c9.
> 
> This is script I used for bisecting:
> 
> https://zerobin.net/?a2acfc92e5a33cc3#L7/Z0jY47FFFp7UJ1GPmbhmfrcMTr0zBZst82ubyDs8=
> 
> The script uses "rtcwake" to automatize bisecting. Note that the bug reproduces
> not only with "rtcwake", but also with normal suspend initiated from GUI without any timer.
> 
> This bug causes "rtcwake" to wake up BEFORE specified time.
> 
> Bug sometimes reproduces and sometimes not, so script above makes multiple attempts.
> 
> The script writes some info to /dev/kmsg , and you may see its output in dmesg above.
> 
> If you need more info, ask me. But again: I will be available within some days and then not.
> If you need more time, ask me for it.
> 
> Reverting commit 1796f808 on top of v6.12.32 causes the bug to disappear.
> 
> When I connect external wireless mouse via USB, then the bug becomes harder to reproduce,
> so I did testing without anything connected to laptop (except for power source).
> 
> --
> Askar Safin
> https://types.pl/@safinaskar
> 
> 

In order to debug this a few helpful things to add to your script:
1) Set /sys/power/pm_debug_messages before starting
2) Capture the value of /sys/power/suspend_stats/last_hw_sleep

BTW - When a wireless mouse is connected via USB I /suspect/ you aren't 
getting into hardware sleep state (or if your it's for not as long of a 
duration).  I'm not sure if that's a hint for this issue or not right 
now.  That's why I think capturing it might be helpful for this issue.


