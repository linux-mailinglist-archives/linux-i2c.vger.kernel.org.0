Return-Path: <linux-i2c+bounces-11631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F4AEAD8B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 05:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E074E2869
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 03:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C6819E83C;
	Fri, 27 Jun 2025 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="OTP/ch+F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A22AD2D;
	Fri, 27 Jun 2025 03:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996305; cv=pass; b=VDYuXg1hSoxaEIJ1A5c7tw2osTQq1SsuvIELgPJfX+5hF4Yd4JzcWgUyrwtW++njbOBHhoU4Ejj3VSK8qtx85M7lhsOiDh0GcuAn6gMRCGp1eK6H/BgQunFfmdWFeeqYT42fN/aFINAe/AojzzpptLXn57QMiUUKvCI31PVdVzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996305; c=relaxed/simple;
	bh=5AYcBrideLs4hDAn9zuRWjDRQaY7IfcE1BJ+L3LUIUs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=GyO0VEUVUqABlntICa/S0mNIPNeJMX9LOoP0n+w5/WyZyvG14LYQCHG5Ke6CQ3txKymd/zUshOpss403H2xejRvp6a6RGVGTmu/eSasQ8V/V75LoYc5EGqpmqzKtpRy2+X9xMvZq0gUbTly4Orbs9vym5aEblfEB1GSFaYTqzWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=OTP/ch+F; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1750996282; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a9VINmaxLbisjgFXX3+g57q5xks90pKm/hFnHoJsxIMkJmugl1JsGyTb5nkPYpDtEqJ3FxOF0UB5IZi/hw1d28m5MpCcIigOBNAmvv/+hiRcx+zJfiXfwqTxli0u4Jwv8kGU2L4pJFMHRwLQVwIAY2AG1fN0jb42w+CVV7bT70s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750996282; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5AYcBrideLs4hDAn9zuRWjDRQaY7IfcE1BJ+L3LUIUs=; 
	b=TSEtq5OylRIBiWRT2GWxy2kRGuziEqfH9/I8CTrRy7lQmrCkU5HeoKw4W7AJ79ANkZxrBHfz05kfwp1skgZjR/U+o9APDuQmsBT0oT3IbXA6lYeIn+5m3ctmaO6i5vxSxbwyArcZSUw1h8Lct2ewkZk2LXJt9/tM2VZUss7levA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750996282;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=5AYcBrideLs4hDAn9zuRWjDRQaY7IfcE1BJ+L3LUIUs=;
	b=OTP/ch+Fcgg1E6qULfuCqxOhgIndH4RosFP1aLLrSGFEXG2fBZevuni8mz8AmeCv
	AngUL9Wn4mTCtH+bzUmNgotuHXhYDUjDbZp1DEEY4NTDfoy3cy+G4Y8jAZBX6cOv0oR
	LgYyBfIZ9g3BmBPuDfWKiLtbqMOIhoL4Aw2yu4s0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 175099628184387.56678600701446; Thu, 26 Jun 2025 20:51:21 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Thu, 26 Jun 2025 20:51:21 -0700 (PDT)
Date: Fri, 27 Jun 2025 07:51:21 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Mario Limonciello" <superm1@kernel.org>
Cc: "Linux i2c" <linux-i2c@vger.kernel.org>,
	"linux-acpi" <linux-acpi@vger.kernel.org>,
	"regressions" <regressions@lists.linux.dev>,
	"DellClientKernel" <Dell.Client.Kernel@dell.com>,
	"linux-gpio" <linux-gpio@vger.kernel.org>,
	"Raul E Rangel" <rrangel@chromium.org>,
	"Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
	"Werner Sembach" <wse@tuxedocomputers.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Message-ID: <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
In-Reply-To: <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com> <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
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
Feedback-ID: rr080112274f48b69713fe3fba97faaa16000047410b64f453a5ff951e4610c2519fd5b59000be79ef552d9b:zu08011227060bb99a6d6a18eaef967a040000f1adc5e739dfadb567ffffd3b48cd7a2a4079a5a00b0da6259:rf0801122b14bb9dc632592ca1a2e9e51d0000e6a2fb7c0811e37372739fd5c9b0f8dce4bc127d88f7732d720f4beaec:ZohoMail

Okay, so here are results of new expirements.

Now I write 1 to /sys/power/pm_debug_messages in the beginning.

I was unable to find "last_hw_sleep" in /sys/power/suspend_stats on these particular kernel configurations.
But I print all other files in /sys/power/suspend_stats .

I used same minimized config as in previous expirements.
I used modified script:

https://zerobin.net/?bccdd94f5f07bf85#8jop5IXDG32p0I7SBfEc29ng0/MdAFZgrqI9x+4A/Fo=

Here is dmesg for "good" commit "d86388c902b45fe2" without external mouse:
https://zerobin.net/?90d41139996f1cd8#Xuy0UjyxtXrOyLxq4YMP/IzUB559v7ESEIqsd/4Fqo0=

Here is dmesg for "bad" commit "1796f808e4bb2c07" without external mouse:
https://zerobin.net/?181b4d79c16fd9b3#nu0HyJX/r9cFtKitVxJB+3CZsGfwKHc6JLYX4OyZHR4=

Here is dmesg for "good" commit "d86388c902b45fe2" with external mouse:
https://zerobin.net/?a13c513b12549f62#LPLtc3MA1iSEPUjaizDk6xwBgEitH16hZE/WUWdgr6c=

Here is dmesg for "bad" commit "1796f808e4bb2c07" with external mouse:
https://zerobin.net/?cda0d7dd920ad66a#VHWKTp8motWKNJawyFC+v+qNP55an/ZR7HTlhmLJ7gA=

As we can see, external USB wireless mouse doesn't really change anything.
No wonder, I have CONFIG_USB_SUPPORT disabled in my minimized config. :)

--
Askar Safin
https://types.pl/@safinaskar


