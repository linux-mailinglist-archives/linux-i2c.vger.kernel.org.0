Return-Path: <linux-i2c+bounces-1098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0E823A7F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 03:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9808B1C2451D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 02:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE421865;
	Thu,  4 Jan 2024 02:04:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A54C67
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jan 2024 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704333883-1eb14e0c7f0eec0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id g6b9OO6KOU6HYfTq (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 04 Jan 2024 10:04:43 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:04:42 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 10:04:42 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <a3156a84-20da-488d-823b-7cdb149c7fa6@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 4 Jan 2024 10:04:39 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] i2c: wmt: split out common files
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v6 4/8] i2c: wmt: split out common files
To: Andi Shyti <andi.shyti@kernel.org>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <1871ceb5c3d6804c6a7f7a38327919861985c066.1703830854.git.hanshu-oc@zhaoxin.com>
 <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240103172103.oyt5piqfpnk5krc4@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1704333883
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1201
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118953
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2024/1/4 01:21, Andi Shyti wrote:
> Hi Hans,
>
> On Fri, Dec 29, 2023 at 02:30:35PM +0800, Hans Hu wrote:
>> Since the I2C IP of both wmt and zhaoxin come from VIA,
> /come/comes/
>
>> the common driver is named as i2c-viai2c-common.c.
>> Old i2c-wmt.c renamed to i2c-wmt-plt.c.
>>
>> The MAINTAINERS information will added in patch 0008.
> when the patch is applied there is no knowledge anymore of the
> patch sequence, please put these comments after the '---' section
> or make it generic: "The MAINTAINERS file will be updated
> accordingly in upcoming commits"


ok, will change this.


>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
>> ---
>>   MAINTAINERS                            |   2 +-
>>   drivers/i2c/busses/Makefile            |   2 +
>>   drivers/i2c/busses/i2c-viai2c-common.c | 234 ++++++++++++++
>>   drivers/i2c/busses/i2c-viai2c-common.h |  66 ++++
>>   drivers/i2c/busses/i2c-wmt-plt.c       | 137 ++++++++
> 'plt' stands for?


'plt' is short for 'platform', since it is not suitable,

do you think it is better to change it to 'i2c-wmt-platform.c' or 
'i2c-viai2c-wmt.c' ?


Hans

>
> Everything else looks correct.
>
> Andi

