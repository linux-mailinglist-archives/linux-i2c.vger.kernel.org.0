Return-Path: <linux-i2c+bounces-1028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28DB81F40C
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 03:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF65282181
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 02:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4370910EF;
	Thu, 28 Dec 2023 02:05:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E810E4
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703729140-1eb14e0c7c069b0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id ADagWOQbVUFv0uNN (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 28 Dec 2023 10:05:40 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 10:05:40 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 10:05:39 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <05c886c4-1cf2-4bee-b4b4-387bfe87e063@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 28 Dec 2023 10:05:36 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] i2c: wmt: create wmt_i2c_init for general init
To: Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
	<andi.shyti@kernel.org>, <cobechen@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH v4 1/8] i2c: wmt: create wmt_i2c_init for general init
References: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
 <acef54645a54bb85b2ae81b530f155c4dcdf9086.1703647471.git.hanshu-oc@zhaoxin.com>
 <ZYx0VPVmyQhtG+B9@shikoro>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZYx0VPVmyQhtG+B9@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1703729140
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 717
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118654
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------


On 2023/12/28 03:00, Wolfram Sang wrote:
> On Wed, Dec 27, 2023 at 12:39:44PM +0800, Hans Hu wrote:
>> Some common initialization actions are put in the function
>> wmt_i2c_init(), which is convenient to share with zhaoxin.
>>
>> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> I get a build error:
>
>    CC      drivers/i2c/busses/i2c-wmt.o
> drivers/i2c/busses/i2c-wmt.c:289:5: error: no previous prototype for ‘wmt_i2c_init’ [-Werror=missing-prototypes]
>    289 | int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
>        |     ^~~~~~~~~~~~


Sorry, I only checked after the last V4 patch using sparse/cocci/smatch. 
Fixed V5 will be re-sent within an hour.


