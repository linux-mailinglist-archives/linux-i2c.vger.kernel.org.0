Return-Path: <linux-i2c+bounces-2322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EE877B52
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 08:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159BC28156B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 07:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5031173F;
	Mon, 11 Mar 2024 07:27:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730B11711
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710142077; cv=none; b=tWdGjcrMqHmt9La++2LYmDrTw1yDxg6MEcH2G1oLG6A/0nrk6scPXI3OETJ/p5JMAVWNtk7CUVzk7CCD8mFCx+OGp6wgu9m/6m9HRioegveAYk5OK6S6DO8rbldLAimLxZHpKSvbG2YLlP+TMYPmqMW7IPiwFvQoCznXwqrsisE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710142077; c=relaxed/simple;
	bh=gEhjroQOjIeASHQChWsw/8NNhgUdBNNXrOTANb8YeZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pRMiPK7Zx2PtrSfK93FRqox8NeeYmyjORMJA1QnnRdO6XIuZ32wyWNoniWN7ai8fyJg2gA9Xo/57NTGgETgamGymoXeyT2NTXRaXz47sjEKviQ1dhTjnTWJUj1lBtFh5Btv8OAjHH8XvwJ8/lxMH0d2Z10MLwmY+x6fs1IEocdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1710142067-086e23661707fd0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id fNE6QaB3fjHtxcXn (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 11 Mar 2024 15:27:47 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 15:27:47 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 15:27:44 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <3c165918-1f85-40cb-8bce-1e1ff924b379@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Mon, 11 Mar 2024 15:27:40 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	<andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH 2/2] i2c: viai2c: Fix bug for msg->len is 0
CC: <hanshu@zhaoxin.com>
References: <20240311032600.56244-1-hanshu-oc@zhaoxin.com>
 <20240311032600.56244-2-hanshu-oc@zhaoxin.com>
 <97503419-f6a9-4939-89ee-195ce21b5d1e@quicinc.com>
 <36ec34ac-14b9-4dda-b39c-5544ce1dc372@zhaoxin.com>
 <9469a44f-dc2d-475f-ac6c-199e8c4594dd@quicinc.com>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <9469a44f-dc2d-475f-ac6c-199e8c4594dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1710142067
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1597
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -1.62
X-Barracuda-Spam-Status: No, SCORE=-1.62 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_SC0_SA085b
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121959
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.40 BSF_SC0_SA085b         Custom Rule SA085b

Hi Mukesh,


>>>> This is a bug that was accidentally introduced when
>>>> adjusting the wmt driver. Now fix it
>>>>
>>>
>>> what exactly is the bug which you are fixing here ?
>>>
>>
>> This bug was introduced by myself in a recent commit,
>>
>> id: 4b0c0569f03261aa4c10c8f5b24df6c1ca27f889
>>
>> https://patchwork.ozlabs.org/project/linux-i2c/patch/20240306212413.1850236-5-andi.shyti@kernel.org/ 
>>
>>
>>
>> The function viai2c_irq_xfer() is working in the interrupt context,
>>
>> if it returns a non-0 value indicating that the current msg access
>>
>> has ended, otherwise it has not ended.
> Should be otherway around ? zero indicates success as per general
> practices.


I understand your suggestion. The return value here indicates
whether the transfer should end or not.
0 means not, and non-0 means yes(error or successful).


>
> Also i think accordingly your commit log should have the explanation.
>

Yes, I should give a more detailed commit log.


>>
>> For the access that msg->len is 0, when the interruption occurs,
>>
>> it means that the access has ended, it should return 1;
>>
>> Otherwise wait_for_completion_timeout() will timeout.
>>
>>
> IIUC, msg->len = 0 it indicates your transfer is completed and then you
> want to return 1 indicating current message transfer is successful ?
> Please ammend the logs reflecting the scenario to match with the code
> changes.
>

No, msg->len = 0 here means this is I2C_SMBUS_QUICK access.
Yes, return 1 indicating current message transfer is successful.


Hans,
Thanks


