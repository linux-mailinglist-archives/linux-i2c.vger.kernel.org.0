Return-Path: <linux-i2c+bounces-11629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38217AEAAA3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 01:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 812B1171316
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 23:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E0D223DD1;
	Thu, 26 Jun 2025 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="TSXCz/eE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A612DDA1;
	Thu, 26 Jun 2025 23:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980778; cv=pass; b=ud7l23ss370T2ZsSVkVfndJQEwtstJOtOhVPey+se+7xSUbwi+n/Q11V/MxCoZjK5681JzplrAJ0nZp8LZngxkJXCZufrgA3/rAuxj5UpvOgnTbI2pg4I7hLH4jAZrPOpR2ZABRWAoSlcfNEvpgZQ/6hxTNOC0yr0gZ8HnsdM7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980778; c=relaxed/simple;
	bh=Ev3s8XEoEHwcdZtMTv3mHyjKyesPHZVp2jCgkrBil88=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=VuotTAspcb1uV3opQ+gSumC7qeyG1qFJL5rJOBNCg8UOMNPKDLSuJS5WY6wNRsAoGFlcUZ2FvnvzdUSQxZ0koRzIGGNF0F88fsfbHefIITr7gkydkc+1cxyL0mC1nPN5uNzGiaA8jJuzSzROdlBTsHiMvYot46PL0JxCNN96H+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=TSXCz/eE; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1750980757; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJ5jy53ayYQxY8syXHR2X4VwYwKsFORU6L7isDIV/zK/qe3dFRoIgnfaRo0e5a/XuHyaeCQEYLrUJHaGQpOMRxa/3VloYMAz/Rf/CG70QH3ovVBsvxXD4m9yEtvPXpb+FCYZWMaOhKCoogYdpwqOiKXANaBk7de2uFpqtwGctIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750980757; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ev3s8XEoEHwcdZtMTv3mHyjKyesPHZVp2jCgkrBil88=; 
	b=CH3cyPR5DKmoPZGdcPczI0OocADN5txF2OQymyPUXcOcC20sBhfDgcr7mOgfzxheRb58XjcePfY4NKp5rts7bCbg1qrWAauj4SNP3vHx77bmtg87hQGSNSK4zjs4pWkBNlWPzjSn2cOaD21ulAeLUeGHNS7qVwVW4Yw7h8mID3M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750980757;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=Ev3s8XEoEHwcdZtMTv3mHyjKyesPHZVp2jCgkrBil88=;
	b=TSXCz/eEqUnetQjLpTWqok6bcR2atekFc4GSpi6wdv7Bd5zR1JYhOKui55BWED2I
	9uCoFsnzmQm84tef5qkwE0um97dTOYzs0oFHUGcxPhv787Lisb0P1+kJFQW7Lvql4aK
	HhxUzc9qD+ZJgwRXdBpcR43GHfQFPMKjvZ9pl+bU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750980755429663.0063364309506; Thu, 26 Jun 2025 16:32:35 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Thu, 26 Jun 2025 16:32:35 -0700 (PDT)
Date: Fri, 27 Jun 2025 03:32:35 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Linux i2c" <linux-i2c@vger.kernel.org>,
	"linux-acpi" <linux-acpi@vger.kernel.org>,
	"regressions" <regressions@lists.linux.dev>,
	"DellClientKernel" <Dell.Client.Kernel@dell.com>,
	"linux-gpio" <linux-gpio@vger.kernel.org>
Cc: "Raul E Rangel" <rrangel@chromium.org>,
	"Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
	"Werner Sembach" <wse@tuxedocomputers.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Message-ID: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
In-Reply-To: 
Subject: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from
 suspend
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011227668a4d703e23f02fa16e1528000004a791bf26215266ebc4243e4c760047c830c7363bd5e741a9:zu0801122722cb3639ccfccbe72677437100009817af134b3a213ac09876aec6aa24cfbf9618084f00374eb7:rf0801122cf48fba5383779c49ecf30c5700006211d342b3dfba3315a6dff6190eddeea9a152acd3073bcc83b400920434:ZohoMail

Hi. This commit:

#regzbot introduced: 1796f808e4bb2c074824dc32258ed1e719370cb3

caused a regression. Dell Precision 7780 often wakes up on its own from suspend.
Sometimes wake up happens immediately (i. e. within 7 seconds), sometimes it happens after, say, 30 minutes.

(The laptop comes with Ubuntu preinstalled, but I didn't test this bug on preinstalled Ubuntu)

That commit already caused a lot of other regressions on other laptops:

#regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4cb786180dfb5258ff3111181b5e4ecb1d4a297b
#regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d63f11c02b8d3e54bdb65d8c309f73b7f474aec4
#regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a69982c37cd0586e6832268155349301b87f2e35
#regzbot link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=782eea0c89f7d071d6b56ecfa1b8b0c81164b9be

I will be available for testing in coming days, then I will switch to other things, and so will not be available for testing.
If you want more time, then, please, ask for it, i. e. say me something like "Please, be available for testing in more 10 days".

Here is config I used for testing:

https://zerobin.net/?5c4e4b8f6e7a6a0d#W35/IXYAxzjFyp7yP71V0EZ6jcF83HOWB/52ldl5jig=

In other words, this is config I used for bisecting. In other words, the bug reproduces
with this config on 1796f808, but doesn't reproduce on d86388c9.

This config was created using localmodconfig, so it is quite possible it will not boot on other computers.

Also, the bug reproduces on pretty standard Debian kernels, for example, on

http://deb.debian.org/debian/pool/main/l/linux-signed-amd64/linux-image-6.12.32-amd64_6.12.32-1_amd64.deb

with standard Debian config.

Here is "bad" dmesg:
https://zerobin.net/?525f36df8d698fba#e3+DHsvv3Lsqmi91d1TqHx19mrilYNDR0bL8DbeNxw0=

I. e. this is dmesg generated during attempts to reproduce the bug on "bad" kernel, i. e. on 1796f808
with minimized config provided above.

And here is "good" dmesg:
https://zerobin.net/?09b26bfcfa523eff#zDMKsIGmfXBLgpml3qDjwW0NnclErstolYEjCMzmmsA=

I. e. it was generated the same way, but with d86388c9.

This is script I used for bisecting:

https://zerobin.net/?a2acfc92e5a33cc3#L7/Z0jY47FFFp7UJ1GPmbhmfrcMTr0zBZst82ubyDs8=

The script uses "rtcwake" to automatize bisecting. Note that the bug reproduces
not only with "rtcwake", but also with normal suspend initiated from GUI without any timer.

This bug causes "rtcwake" to wake up BEFORE specified time.

Bug sometimes reproduces and sometimes not, so script above makes multiple attempts.

The script writes some info to /dev/kmsg , and you may see its output in dmesg above.

If you need more info, ask me. But again: I will be available within some days and then not.
If you need more time, ask me for it.

Reverting commit 1796f808 on top of v6.12.32 causes the bug to disappear.

When I connect external wireless mouse via USB, then the bug becomes harder to reproduce,
so I did testing without anything connected to laptop (except for power source).

--
Askar Safin
https://types.pl/@safinaskar


