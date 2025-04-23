Return-Path: <linux-i2c+bounces-10599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0750A98FBE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 17:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9186E1B85E74
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 15:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BF528EA4A;
	Wed, 23 Apr 2025 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SNHD406j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AFA283680;
	Wed, 23 Apr 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420551; cv=none; b=hq589xpgK1WPbtjKkpMDaRI3fSTjBBVrFU2Xci6QD3Fj+tuoqiMkxTkb6FmJ6tdNgYBZCz9ribq8p0A2mjfFuwfx3cRPD687eCvy3X3MV7U+u4IKtc3/waDQwdS6uuf/BIXN/CD6qcDWIXYzJedmn2TZFaqbOZQaAUdqeZGM6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420551; c=relaxed/simple;
	bh=9lbS6NFVV60cvSDLK1COpVDjjL2o/3HjYKEkjhk3J7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VcBMaHPHwFJ/0agEZmb3zleTQ0Mur1gwgxfP3xyQndco/qTAWC5J2dDFLf2X6C1qjYH0x42UTuYnN3DuVGxZT+645muslvwv95sNMboTuQ0CIAVPkRxRXGlmp/5Ib9S4771/9vH2dTMQ113ZzaTV59XL0keCmAwsqr+aGVYddcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SNHD406j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4394441A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745420543; bh=9lbS6NFVV60cvSDLK1COpVDjjL2o/3HjYKEkjhk3J7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SNHD406j0r3aIOywKru2rdq7LfbtVgjFedfUnDQk+k5a/1t3bfZ9m+iEj3XruX3as
	 UtUPGFucvAYGkadqdNQLYDQshEV+BeqgCMdnTyf9pgxmZzTv+Ec4SRnF76NCaP+s2A
	 heUVD9luRT+tEZd2GTSHKm4X/luQa1XdfyAX1QTS845oVVtimSowCxnpO50UyceLM5
	 S8mGUjLTUz5p42vrgdtSZBDE8RVZYcB9Egjir7os5NCg023o3BF0zN6G/vptyYn4D4
	 yFJvR8HMvyM6mVkTD9RJsQ3ixOtuRb/QJdGEs9N/uzmnn2cAttz307cDv0HPUEoIeI
	 uv7VJTAGzh2Ng==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4394441A9F;
	Wed, 23 Apr 2025 15:02:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Yazen Ghannam
 <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC"
 <linux-i2c@vger.kernel.org>, "open list:AMD PMC DRIVER"
 <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] AMD Zen debugging documentation
In-Reply-To: <20250422234830.2840784-1-superm1@kernel.org>
References: <20250422234830.2840784-1-superm1@kernel.org>
Date: Wed, 23 Apr 2025 09:02:22 -0600
Message-ID: <87frhysyyp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mario Limonciello <superm1@kernel.org> writes:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Introduce documentation for debugging some issues on AMD zen hardware.
> As one of the debugging techniques read and add information for
> S5_RESET_STATUS register.

I've been assuming that this work will go through the x86 tree; please
let me know if you'd like me to pick it up instead.

Thanks,

jon

