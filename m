Return-Path: <linux-i2c+bounces-1913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381D85F3B2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F2F1C23672
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 08:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8E033CD2;
	Thu, 22 Feb 2024 08:59:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2528374
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592391; cv=none; b=OALqUzfgKJMqpozgk3+q4uub+uqNPtI2w5cqXu0nPIXZPPku0XKn65rmQdP+x/8XOTnibNm/SLN6hPWvOvQ2eq4TmvzFLCBPISvrRStCuK1EeqSxBrmRNjfUfjC7ihCQoTX6QCNIWyrJqnq0clF24E0Kbpjph7jLafWu2unEJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592391; c=relaxed/simple;
	bh=j1QbGH31q0pcJaPd6eOTNxVmptzR5d6AxoGsODyWE8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AUojpYDzKltXzR3TA3Y2IslUVFd8NsHEUxoU4SdSm96TEaE7889XAaT/WTadIzfoDpd4sHYseyi7FuZRoGlEUH4T4EUWUz0MI2YSfdnK7QBiawcan7FoQkFwId0kvxWJAus+IMa34qjQDGpLZe8Nr4aqW/ghX5+HA7wSc8tsqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1708591758-1eb14e0c7c45a60001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id posG752fqSht6wte (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 22 Feb 2024 16:49:18 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 16:49:18 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 16:49:17 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <454cdbe5-7704-4563-bfd2-0096502175f0@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 22 Feb 2024 16:49:13 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] i2c: add zhaoxin i2c controller driver
To: Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH v7 6/6] i2c: add zhaoxin i2c controller driver
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <9b5882c7ef2462710903b7f10252ec85c4292104.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXwOEC-4BqJ31OU@ninjato>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZdXwOEC-4BqJ31OU@ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1708591758
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 461
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121167
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Wolfram,


>> @@ -67,6 +68,9 @@ struct viai2c {
>>   	ktime_t			t1;
>>   	ktime_t			t2;
>>   	int			platform;
>> +	u8			hrv;
>> +	u16			tr;
>> +	u16			mcr;
> Hmm, since this is zhaoxin specific, what about adding
>
> 	void			*pltfm_priv;
>
> and put 'hrv', 'tr', and 'mcr' to a struct 'viai2c_zhaoxin' local to
> i2c-viai2c-zhaoxin.c and populate pltfm_priv with it?
>
> Rest looks good so far...
>

will add it.

Hans,
Thank you



