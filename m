Return-Path: <linux-i2c+bounces-1916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426985F5EB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 11:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28372282C12
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5424405D4;
	Thu, 22 Feb 2024 10:42:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321F3FE3D
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598549; cv=none; b=n+Icg/wnHfXvmfK6Eq+cptDDSqFci6zwmG8ryZIEWdSBo9a6Mr86L+E2IJ9pwjfc4Bxi3oUfAzW3ib3GHwGTbPZylFKz1uc2yOBZhazSSof/jeEwmjDjYUQCH8YBMXM3BBY7E/aIYIp4ziy2wFehp1FGmc31sTA3CIvbTrkHTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598549; c=relaxed/simple;
	bh=CPTPjlAM0rUokrXzyo3uyoV1fJxDr40Y0Wp47h6UIqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VpVfK7nEgV9p1QCZzyTPb27FhgsDPt/fqA7D4P8d6ltMr5Xr72i3obveDZAwrwvwXkxBw2CTENM1UNacSUS+UL7vqARCX/PvhYrEFIlLHJ+9TZpvi1E+AHcQQZWgJw4rhJCpkUblPeArLhcXF6XusOmPQS1iDuiinZ+STNMJezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1708598543-1eb14e0c7c45c90001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id uglfx3UJUlJe2DNz (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 22 Feb 2024 18:42:23 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 18:42:23 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 18:42:22 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <bf3eecf8-59d9-41ef-b58a-5198146ac631@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 22 Feb 2024 18:42:20 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
To: Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXunlc5KQ5JlCA7@ninjato> <439eb65d-88de-4e7f-9138-000aefc1c1e4@zhaoxin.com>
 <ZdcVwJ6iOTEGWYz7@shikoro>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZdcVwJ6iOTEGWYz7@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1708598543
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 425
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121170
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


>> Thanks for your suggestion, the purpose of this approach is to
>> reduce the clock stretching caused by the system. Therefore,
>> I try to put almost all of the processing in the interrupt context.
> Well, I think per-msg handling in interrupt context is enough. The
> transfer (consisting of multiple messages) handling is usually best left
> in process context.
>

OK, I understand now.

Hans,
Thank you


