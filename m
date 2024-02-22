Return-Path: <linux-i2c+bounces-1914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B623585F3CD
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 10:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551E31F21E70
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5785364C1;
	Thu, 22 Feb 2024 09:03:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA41364B7
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592593; cv=none; b=tLTdDFucUixpDYBSCxJTmFJXxGMI9utVqOKZzRQaTzz6sJfg/Oc3kX5mdDugA2/KvsimHMZtRJyyNF7IdIRRcXq035yuzINinLWtKT2QAu1oMb24uLGcF8juiY4c/VbK1ATBZA5GDjls5wGdqs2gFudixfTmV1qEADObyDsp7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592593; c=relaxed/simple;
	bh=U5nUD0kFdWdLdzLD3q5x0ocjtUJ1vhD60SUE0kEUCds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JWcU2aolpeXF2G6ScbtvveNRmjHHxoh+bxCWUYiXStMZ5blTqx7TteTojPCvdPBT7vVWxf/dWqtmS8ZiURaRzFcHt+Vdqyodka4VF1s1ubB1Sn30soUBocXaKfL9s02z5ZtfEOsxZGibwf1BFTQtCJ4a5zv+MoKe+uRQAzrt+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1708592585-1eb14e0c7d45b00001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id oaAbfktFmbJDEHDs (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 22 Feb 2024 17:03:05 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 17:03:05 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 17:03:04 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <439eb65d-88de-4e7f-9138-000aefc1c1e4@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 22 Feb 2024 17:03:02 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
To: Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXunlc5KQ5JlCA7@ninjato>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZdXunlc5KQ5JlCA7@ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1708592585
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1905
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121168
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Wolfram,


On 2024/2/21 20:37, Wolfram Sang wrote:
> Hi,
>
> On Fri, Jan 05, 2024 at 03:51:47PM +0800, Hans Hu wrote:
>> v6->v7:
>> 	1. some dirty patches were removed
>> 	2. rename structure member 'to/ti' to 't1/t2'
>> 	   to make it easier to understand.
>> 	3. add a comment about arbitration.
>> 	Link: https://lore.kernel.org/all/b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com/
>>
>> During each byte access, the host performs clock stretching.
>> In this case, the thread may be interrupted by preemption,
>> resulting in a long stretching time.
>>
>> However, some touchpad can only tolerate host clock stretching
>> of no more than 200 ms. We reduce the impact of this through
>> a retransmission mechanism.
>>
>> Since __i2c_lock_bus_helper() is used to ensure that the
>> current access will not be interrupted by the other access,
>> We don't need to worry about arbitration anymore.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> Uh oh, NACK. We shouldn't limit clock stretching because some touchpad
> controllers can't handle it.
>
> The first thing I suggest is to move more handling to the interrupt
> context, like filling the next byte after the previous has been
> processed. Then, you are not interruptible anymore.
>
> If this all fails, we need to determine a bus specific property, but I
> am quite sure the above conversion will be enough.
>
> Maybe it is an idea to first get the driver converted to support your
> platform, and afterwards the conversion to more handling in interrupt.
>
> Kind regards,
>
>     Wolfram
>

Thanks for your suggestion, the purpose of this approach is to
reduce the clock stretching caused by the system. Therefore,
I try to put almost all of the processing in the interrupt context.

Hans,
Thank you


