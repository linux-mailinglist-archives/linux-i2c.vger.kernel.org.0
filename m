Return-Path: <linux-i2c+bounces-11687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F45AED55C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 09:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE3B166A4D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 07:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552F2192E5;
	Mon, 30 Jun 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="XO2CmYYn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650243987D;
	Mon, 30 Jun 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267678; cv=pass; b=VZLNiLgY7171z6kwCQria3Uo3YMUTJLSRVRmGjeNyOTAdfP+bDfsCuqYWxt2wC3ARO78dCS62puP/5fJ7OcPo6CLzy/lfKlS6kNgwlMNGL9SrrQRA+hAPVJ44F9BcHsoG+arfKk3CLbZNzQZEUJIaMH1P9cj7/hPSRYYINElnkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267678; c=relaxed/simple;
	bh=Ny+909tFnzeBGP+zVu17ZybQEydTkcpvwzzTGjNzvpk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=h1i8/vpl7Y6TOUz7nQm0HS9+r43Nr8BMlnrePIKSJvZszVl/JwI/xw0BhalJazrReJNwg+Q+94zemzbySxUJ4bIS/EQ8aojfEMwRzwZ1P2Xx2FADOq7tDa8A0+HpT6t0V7RNfgmiGY3vstNW/cUOcZQVS1rMa7XDdkQWSf1y+Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=XO2CmYYn; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1751267657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G5kRKX+NlfiiNYF/RvR2HJ+o0BbZ6T42vBjuNjXkSGbpWoqcvOkMcjsiZPRlaUIztuMjkxzC5SKJJGWhLiswQ/N0IaJUnOFiAtlBXBJgFX9Jk3zQG3SQm5TFU2Eh3/ZMJw2c5y7kV3O8K09YPaqH4O0/huO7B6ogZonAiVMEnAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751267657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4g9b3rt0LEwBpyUQi7Y/ERedSAXvJddMYEJ9iWhZZck=; 
	b=fKgrTIfETgbN2vPrVjoieXYPDA0o/h4QL54s29T8GZgZfEdqt9NCV5I8gShoyweHPN92kkzDYZI8Xh5Z0mcq/GZ0yZ2A23yEx5CfHZtA9rcEBM3hFcHLm/wDp2v3AgbnfN7MkD9Z/aKFwgQZf6P9jNRo5Do3Xbn4xCm5q3sL6yU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751267657;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=4g9b3rt0LEwBpyUQi7Y/ERedSAXvJddMYEJ9iWhZZck=;
	b=XO2CmYYnpaNTIT8v0DM5tDTwqchQJz63wd5dtSdXi6fRlPyPqXt1OJDzi+yL9k0f
	IuY/A9lmXKMCzfJyy/Q60h71BI22k+AiDP9b3U8wr4YwAmRaz/YfFTRrfpaLx9o6UQb
	2YyxWAFIBDItpYFmjA4SiN3q05Sh/qHZ2af4zEuo=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751267656272638.7175982375178; Mon, 30 Jun 2025 00:14:16 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Mon, 30 Jun 2025 00:14:16 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:14:16 +0400
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
Message-ID: <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
In-Reply-To: <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com> <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
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
Feedback-ID: rr08011227d2834feaa81ae7a61d8469c300002f53f71d2a8c9c14bafd63bc721216f32cb3d939ae981de558:zu080112274d7945573b527403042c24c100003ce6475868fd94ceabf382ee747bde5b10245760e856ceda14:rf0801122bbe182296f0d2f8051a9483d70000aac597d692a69bceb28f8074c107afd614e0604984148a79d0703fa681:ZohoMail

 ---- On Fri, 27 Jun 2025 07:58:15 +0400  Mario Limonciello <superm1@kernel.org> wrote ---
 > That's odd.  It should be made when the PMC core driver binds.  Maybe
 > others will know what's missing here.

Command "grep -r -E -I last_hw_sleep ." in culpit kernel (1796f808e4bb2c074824d)
shows nothing. (This is somewhere around 6.1).

So, culpit commit is too old.

If you want, I can retest this thing on current master and on current master with
revert 1796f808e4bb2c074824d.

 > I see in your bad config interrupt 14 is waking the system.  In the good
 > config interrupt 8 is waking it.
 >
 > What is in /proc/interrupts?

/proc/interrupts from culpit kernel: https://paste.debian.net/1382819/

--
Askar Safin
https://types.pl/@safinaskar


