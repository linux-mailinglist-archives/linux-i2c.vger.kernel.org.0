Return-Path: <linux-i2c+bounces-5157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1B948D6F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 13:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B780A1F21BDD
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4FA1C2317;
	Tue,  6 Aug 2024 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jHGVX4rE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E9143C4B;
	Tue,  6 Aug 2024 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722942413; cv=none; b=hAHUXKnp3VVXy5Pbx2PdFZoJD0j7LLvX80Lk6FS0X16aKjpxLi4EwgD98it0ViSk7UXrwXCUjMS01jVomAtVwaiQDVU5Mqn5RHgmp3Ul8Tw5Hir35EtRXRti+L0u1UHVOVsE1pJ5ACV4Kwm+j8bVX7PI0kFHHF6eFFlnXewmZz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722942413; c=relaxed/simple;
	bh=Sw5dr594Hkzi/16PGOf8YlqcJhmQf3Tt7Uejnpy/P4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aGytTmF8p3egHCRIvYxjD3tMpw5bui+GpCv9kXD9W7qcONLiX/kTHo5ZUAfm/HNGtY/grsC3idRTiocZ0Ao1alJCqDlxwv7+jyKVjRTuWgGVCXSy8+iBdZaqF7TCBmVHpAnBJJKvEhPy3UJJJVueF9al/YaxyQMgLkDSTuA8358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jHGVX4rE; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4765M7xU030035;
	Tue, 6 Aug 2024 06:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Nf2ivtkVUEro7FYxQCOMlIOvUdT5FT12s1OFg6w/Jkw=; b=
	jHGVX4rEbVKlg+f7xBD7bqbLfr4dT1zOElJGezKjwHd51IW/ejg8HIIJHL+5+imT
	2+g8PUKTHkwX6aS45EXAtl9QZvEQtSjYx83C08HzD9mzZPJ0mj+lmJXeizt3gi9E
	VzRZ/Q8Qi2cbFajAHIHBfN+mMGNq/4HedxNrUmnu/QosRy5S+mq7GUk6gIHTTISu
	wTeGKML3gNYRQXDhl5iPTbjNVJQC5dal99Upgaor7seiAccJfslh++NqkRKB3Z6v
	2S2728A3FvJnaroG+LjA0XcmX1npPRdBAh5K7H3ktJ9gJVCBk0AmcskkYdD2FaAE
	88X569/EdH1c5EflCRdM1g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40shxx2w6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 06:06:28 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 12:06:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 6 Aug 2024 12:06:26 +0100
Received: from [198.61.68.170] (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 997CF820241;
	Tue,  6 Aug 2024 11:06:25 +0000 (UTC)
Message-ID: <554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
Date: Tue, 6 Aug 2024 12:06:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
        "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
CC: <tiwai@suse.com>, <mika.westerberg@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
 <8734njl7my.wl-tiwai@suse.de>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <8734njl7my.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 01hi_DCgg6ZDBsSEtbpvHU5pv1i8nfQa
X-Proofpoint-ORIG-GUID: 01hi_DCgg6ZDBsSEtbpvHU5pv1i8nfQa
X-Proofpoint-Spam-Reason: safe

On 5/8/24 09:02, Takashi Iwai wrote:
> On Fri, 02 Aug 2024 17:22:12 +0200,
> Richard Fitzgerald wrote:
>>
>> Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
>> with Realtek HDA codecs. Some of these use the same SSID for models with
>> CS35L54 and models with CS35L56 so the ACPI entries are examined to
>> determine which amp is present.
>>
>> To avoid having to #ifdef around this code we've fixed the definitions
>> of SPI and I2C functions that were not correctly supplying dummy functions
>> when the real functions are not in the build.
>>
>> Changes since V1:
>> Added I2C and SPI patches to provide dummy functions.
>>
>> Richard Fitzgerald (2):
>>    spi: Add empty versions of ACPI functions
>>    i2c: Fix conditional for substituting empty ACPI functions
>>
>> Simon Trimmer (1):
>>    ALSA: hda/realtek: Add support for new HP G12 laptops
> 
> Hm, the 3rd patch requires both patch 1 and 2, and now those seem to
> have been applied to two different trees, which makes hard to apply
> the 3rd one.
> 
> Mark, Wolfram, will you guys submit PR for 6.11-rc3 including the
> patch 1 and 2?  If so, I can apply the patch 3 later on top of
> 6.11-rc3.
> 
> Or, I'd need to pull from both of you and apply the patch 3.
> 
> 
> thanks,
> 
> Takashi

We've just noticed that the SPI patches have gone into for-6.12.
We really hoped that we could get the main patch (G12 support) into
6.11 (yes, I know, I didn't actually say that we were targeting 6.11 -
sorry).


