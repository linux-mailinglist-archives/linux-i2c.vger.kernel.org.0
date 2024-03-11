Return-Path: <linux-i2c+bounces-2328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA7877E62
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 11:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A476F1C20BCD
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 10:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A41E34CD7;
	Mon, 11 Mar 2024 10:51:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476771B599
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710154299; cv=none; b=J5nRiVtPHhLmiLUrk6kftyz1Bml35Ch5ma4w+wUy4m2eeVhfrGcv93IXyNE0oBWaDfj+ssqq+/zRy9BIt5F1vaACh54eu69xUQMNpxle71YjjZlb+eUmZsF3KqVSZRarhLS1BBqp/c4nZ06lCQkkS8/RTz+62Ste3WdNZDu2Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710154299; c=relaxed/simple;
	bh=lJ5BW82ZODeIzAUbNQPCsVkVlzNOyLD5HynlNqhWxVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PA92RBQ5UhJ79iTwN7whb+u21Lp7gkO3rhc9epdNVeKWtzki5HzSu9q5xVr/JLt5c1gkIUPWbDdmrbPt0dmIfI7eZNg8JpHFby7aEFdRvS0Hm1qe+3SlI3/mius9dNWotQinM0THbnPJ4eF+wy9jZBT1WxgCnngxHKi0SfKa6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1710154292-1eb14e2b81077b0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id 6GZW0vhyEjpidNZP (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 11 Mar 2024 18:51:32 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 18:51:32 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 18:51:31 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <700fbcf7-2686-48de-8185-e00c618e2577@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Mon, 11 Mar 2024 18:51:27 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: viai2c: Fix bug for msg->len is 0
To: Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v2 2/2] i2c: viai2c: Fix bug for msg->len is 0
CC: <linux-i2c@vger.kernel.org>, <wsa@kernel.org>, <hanshu@zhaoxin.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <a3c58b7f15276fab324dd1e158a9f00c195f6f0f.1710146668.git.hanshu-oc@zhaoxin.com>
 <3fb1398741536232a1e9b54a5de4072420046db5.1710146668.git.hanshu-oc@zhaoxin.com>
 <ttsii2v6awu3ttglvyjgbk3ybpfy6tetht456uu2qmw4f7dzib@pcw5qfxcgchx>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ttsii2v6awu3ttglvyjgbk3ybpfy6tetht456uu2qmw4f7dzib@pcw5qfxcgchx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1710154292
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1495
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121966
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


On 2024/3/11 17:46, Andi Shyti wrote:
>
> [这封邮件来自外部发件人 谨防风险]
>
> Hi Hans,
>
> because Mukes had questions on the v1, please do include him for
> the next versions.
>
> On Mon, Mar 11, 2024 at 04:46:55PM +0800, Hans Hu wrote:
>> For the case that msg->len is 0(I2C_SMBUS_QUICK), when the interrupt
>> occurs, it means that the access has completed, viai2c_irq_xfer()
>> should return 1.
> The commit log is still not enough. We don't konw which patch has
> introduced the error and why.
>
> Next time, please, try to be a bit more specific, trying to anser
> the questions:
>
>   - what is the problem
>   - how did you find out
>   - how you fixed
>   - how you tested it
>
> But, I see that the issue was introduced here:
>
>    4b0c0569f032 ("i2c: wmt: fix a bug when thread blocked")
>
> This patch has not been yet merged into Wolfram's tree.
> Therefore, I will ask you to let this go this time and we can
> take the whole series after the merge window.
>
> Please, fix all the issues you find, including the checkpatch
> warnings/errors (please keep one patch per kind of checkpatch
> fix).
>
> Last thing, please keep bug fixes separate from
> features/cosmetic/refactoring. They need to be merged separately.
>
> Does it work for you?

No other issues have been found so far.

All these suggestions you mentioned, I will pay attention to when
submitting patches in the future.


Hans,
Thanks


