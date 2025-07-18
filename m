Return-Path: <linux-i2c+bounces-11965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64711B0A6E7
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 17:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B576418824B6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 15:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974DB2DCF7D;
	Fri, 18 Jul 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bUsVmuGH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273A2DCC02;
	Fri, 18 Jul 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752851643; cv=none; b=O2k5GxfdDzjzbAoWg8eGt2UCYPAdS4EO2n4JJT5otYcdHmG7cXgjMUJee2TaxREbtpVHfILndJbrSaw6kKLoZCZvtCR31iQJxE7nN1FACH82zMDCWyJO/g+HP58kG7ZD6jkt6mvxyi++VB7gE+9dE3NP/FHyBUEykNLF6VoepFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752851643; c=relaxed/simple;
	bh=OUqZ5wNGKKnCBC5vVfgW9TIFWi1WfowOiIwORtRVcko=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QSz4faaFih83+r+5M6WqoDvMFWcbLmL57J1puYQ+h9bz/PgRUySO+35Zxm+BUcuf4K80mVtgYVC49DGKsDh+fjlKMVJMOnztMZ08f7wNA1Ikg/Qqbmvtvj83w2q+ghokqlERTaqSbDfjRQqPHipOomfSYDMZ7RJm2yzlyChOX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bUsVmuGH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5b164062.dip0.t-ipconnect.de [91.22.64.98])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 93F852FC004D;
	Fri, 18 Jul 2025 17:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1752851638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1GZB9aCRyWzRbOios75n7sVmGOIc6KupMplYAeaYUw=;
	b=bUsVmuGHT+PPNs37J80yG6f8U4QWLWrdABljftFel8Z1VEtlvQeNUJp25LGh/sqh791yKH
	c6EuHltQJYRBqQkGm8UvGKp2nPNpBKuZ4r2XCONt28YgWGuX4dopRtOpBYA4u4Jn/3kpJD
	mPLZ4Cp5SXZCB4GLLcz7IwrvZN41chA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <14737334-507e-41b2-8d3d-88a3f7a02b04@tuxedocomputers.com>
Date: Fri, 18 Jul 2025 17:13:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Askar Safin <safinaskar@zohomail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux i2c <linux-i2c@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 DellClientKernel <Dell.Client.Kernel@dell.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, Raul E Rangel
 <rrangel@chromium.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
 <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
 <1981ab878bb.122f8227039020.1935112937005363340@zohomail.com>
Content-Language: en-US
In-Reply-To: <1981ab878bb.122f8227039020.1935112937005363340@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 18.07.25 um 01:29 schrieb Askar Safin:
>   ---- On Mon, 30 Jun 2025 22:40:28 +0400  Mario Limonciello<superm1@kernel.org> wrote ---
>   > Looks like your interrupt 14 is ACPI device INTC1085:00.
>   >
>   > Some quick searches this seems to be an Intel GPIO controller.
>   >
>   > Andy,
>   >
>   > Any ideas how to debug next?
>
> So what?
>
> I will repeat: similar bugs were already fixed here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=782eea0c89f7d071d6b56ecfa1b8b0c81164b9be
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a69982c37cd0586e6832268155349301b87f2e35
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4cb786180dfb5258ff3111181b5e4ecb1d4a297b
>
> So we just need to add similar patch. I. e. something similar to this:
>
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_wake = "ELAN0415:00@9",
> +		},
>
> Remaining question: how should I get these strings on my system? "NL5xRU" and "ELAN0415:00@9"?

DMI_MATCH(DMI_BOARD_NAME, *) will match to /sys/class/dmi/id/board_name 
(/sys/class/dmi/id/ also contains a lot of other strings to identify your device 
e.g. /sys/class/dmi/id/sys_vendor which can be matched with 
DMI_MATCH(DMI_SYS_VENDOR, *))

How to get "ELAN0415:00@9" is somewhere buried in here 
https://gitlab.freedesktop.org/drm/amd/-/issues/1722#note_1725104

Best regards,

Werner

> --
> Askar Safin
> https://types.pl/@safinaskar
>

