Return-Path: <linux-i2c+bounces-1108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34680823EDE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 568D81C21590
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15765208CA;
	Thu,  4 Jan 2024 09:45:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C1208B9
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704361548-086e230f29107a0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id D5taFiaKAV2Zs4lk (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 17:45:48 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 17:45:48 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 17:45:47 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <8a437732-b74f-436d-b267-f274f917e638@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 17:45:45 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] i2c: wmt: split out common files
To: Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v6 4/8] i2c: wmt: split out common files
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
 <a3156a84-20da-488d-823b-7cdb149c7fa6@zhaoxin.com>
 <didspodgkj3rthhydnwvhrbpomxx375si67pmfl6vuysrcuurp@a4qbekhbc5el>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <didspodgkj3rthhydnwvhrbpomxx375si67pmfl6vuysrcuurp@a4qbekhbc5el>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1704361548
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 906
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118967
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


On 2024/1/4 17:22, Andi Shyti wrote:
> Hi Hans,
>
>>>>    MAINTAINERS                            |   2 +-
>>>>    drivers/i2c/busses/Makefile            |   2 +
>>>>    drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
>>>>    drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
>>>>    drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++
>>> 'plt' stands for?
>>
>> 'plt' is short for 'platform', since it is not suitable,
> it's suitable, sure... but not immediately understandable. Your
> choice if you want to change it.
>
>> do you think it is better to change it to 'i2c-wmt-platform.c' or
>> 'i2c-viai2c-wmt.c' ?
> I would rename things to:
>
> i2c-via-wmt.c
> i2c-via-common.c
> i2c-via-zhaoxin.c
>
> But of course it's not binding.


if so, I choose to 'i2c-viai2c-*.c', because there's already a driver 
called 'i2c-via.c'.


Hans,

> Andi

