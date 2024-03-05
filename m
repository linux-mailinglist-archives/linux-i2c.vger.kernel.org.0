Return-Path: <linux-i2c+bounces-2190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0EC8713CD
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 03:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E13D1C233F3
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 02:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC38028E0D;
	Tue,  5 Mar 2024 02:46:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D462286BF
	for <linux-i2c@vger.kernel.org>; Tue,  5 Mar 2024 02:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709606762; cv=none; b=bRRRy7+L7CWWRSEL48wpw27bUj8uEe7UM4wzI1p78g1BL81rioDz7UJ5/AYaYdUpPJz570hOXtaaQTh1Q/oL8M1JWX6BMfY9Qcya97rEoAnPwTCgLvC7n7jKh5SZbk+UJhzVyqEk2VKFmOtDHWF4ZA+1bfcfCOYYH6f3vbpXDf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709606762; c=relaxed/simple;
	bh=UeyKAaMH3xaLWQ798d0626VFWE1lfi7M4YlxbYIfJLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bioLKH4tqhTTLsSRUSa/lPPScw3DsYD++k+Npt/7tu+t6gJ+tjxe0jyziHtF7wc+kR4An7HU+mB9htO0ufk06N6/qcTgD5aYzNIsFPi6u0ysVoo54h6I6XyU3rZrSd9knqPXq/Iw6ieWK2GZeunzRO035xtnfcU/F/92ehwd8UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1709606756-086e2316ed077a0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id 4PfVG5i1dTIEzoHo (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 05 Mar 2024 10:45:56 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Mar
 2024 10:45:55 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Mar
 2024 10:45:54 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <c0eb2886-6250-4f67-8b17-c6ba953a42d3@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Tue, 5 Mar 2024 10:45:51 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>
X-ASG-Orig-Subj: Re: [SPAM] Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>
 <ZeWZHSt-qm5wH3wn@ninjato>
 <7jopk32t6ygaxgo27ln2bsqhgsces5d2hxxri6g3la6datrlxd@llfdg36ldr4b>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <7jopk32t6ygaxgo27ln2bsqhgsces5d2hxxri6g3la6datrlxd@llfdg36ldr4b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1709606756
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 972
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121678
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Wolfram and Andi,


>>> +           /*
>>> +            * if BIOS setting value far from golden value,
>>> +            * use golden value and warn user
>>> +            */
>>> +           dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
>>> +                           params[0], fstp, params[2]);
>> Well, if you want to warn the user, the string should be more
>> descriptive. Maybe "FW settings might cause wrong timings" or whatever
>> these values mean. I don't know.
>>
>> The issues I mentioned could be resolved incrementally from my point of
>> view. Or with a new series. I don't mind. So, in general:
> Same goes for few minor checkpatch warnings.
>
> I will accept incremental patches to fix them... they are mainly
> allignment issues.
>

OK, the issues you mentioned will be fixed with a new series.
For the current series patch, do I need to push it to the latest
for-next branch? Or will you push it?

Thanks,
Hans


