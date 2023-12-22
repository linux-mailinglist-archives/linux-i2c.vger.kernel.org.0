Return-Path: <linux-i2c+bounces-960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C9281C897
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC8E1F21A55
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F08E156F7;
	Fri, 22 Dec 2023 10:56:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08398156C4
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703242553-086e230f2600920001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id UAAhxL1rg2uaExGr (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 22 Dec 2023 18:55:53 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 18:55:51 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 18:55:50 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <dd5bad07-8cb8-4465-a5d2-2f5659dea53f@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Fri, 22 Dec 2023 18:55:46 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] i2c: wmt: create wmt_i2c_init for general init
To: Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH v3 07/12] i2c: wmt: create wmt_i2c_init for general init
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <c3035b20e11b8c44eff7e9c4d4d69875313d0697.1698889581.git.hanshu-oc@zhaoxin.com>
 <ZYVkR8wSC7gc7kfO@shikoro>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZYVkR8wSC7gc7kfO@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1703242553
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 580
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118413
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2023/12/22 18:26, Wolfram Sang wrote:
>> +		irq_flags = IRQF_SHARED;
>> +		i2c_dev->irq = platform_get_irq(pdev, 0);
>> +		if (i2c_dev->irq < 0)
>> +			return i2c_dev->irq;
> Doesn't this belong to patch 11 where you introduce the new platform?
>
> Sadly, I can't apply this patch anymore because patch 6 needs to be
> dropped.
>
> Could you rebase this series on top of my for-next branch once I pushed
> it out later today? This will have the first cleanups already applied.
>
Thanks for your review, I will rebase this series on your last for-next 
branch.

