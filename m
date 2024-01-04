Return-Path: <linux-i2c+bounces-1109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51477823F27
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 11:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A86B23D57
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A6D20B28;
	Thu,  4 Jan 2024 10:02:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892720B14
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704362564-086e230f2910810001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id ar863clwU4RtgycZ (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 18:02:44 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 18:02:44 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 18:02:43 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <9a1dc790-52a6-45b2-97ec-5445d537e5f3@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 18:02:40 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
 <249630b9-e1d7-4f3a-b053-02edcc50bf42@zhaoxin.com>
 <hlsrxgsmrnhieswh3rdytrs4a5qzkrw4h7pcsupmwkrtoijhyo@begus62i5p77>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <hlsrxgsmrnhieswh3rdytrs4a5qzkrw4h7pcsupmwkrtoijhyo@begus62i5p77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1704362564
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1309
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118968
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


On 2024/1/4 17:18, Andi Shyti wrote:
> Hi Hans,
>
> ...
>
>>>> @@ -58,6 +58,8 @@ struct viai2c {
>>>>    	u16			tcr;
>>>>    	int			irq;
>>>>    	u16			cmd_status;
>>>> +	ktime_t			ti;
>>>> +	ktime_t			to;
>>> don't these need some arbitration?
>>>
>> I don't think it needs to be arbitration.
>> the controllers are independent of each other,
>> each access is locked using __i2c_lock_bus_helper().
>> Am I missing something?
> no, it's fine, it's me who missed that. Do you mind writing a
> comment?


ok, will add a comment like below:
+    /*
+     * During each byte access, the host performs clock stretching.
+     * In this case, the thread may be interrupted by preemption,
+     * resulting in a long stretching time.
+     *
+     * However, some touchpad can only tolerate host clock stretching
+     * of no more than 200 ms. We reduce the impact of this through
+     * a retransmission mechanism.
+     *
+     * Since __i2c_lock_bus_helper() is used to ensure that the
+     * current access will not be interrupted by the other access,
+     * We don't need to worry about arbitration anymore.
+     *
+     */
+    local_irq_disable();
+    i2c->to = ktime_get();


Hans



