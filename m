Return-Path: <linux-i2c+bounces-1329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D282E7D1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 03:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE47A283CED
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 02:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC71321D;
	Tue, 16 Jan 2024 02:01:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2229A9
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 02:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1705369419-086e230f291ff30001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id dvhN1nmX5mJE1o54 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 16 Jan 2024 09:43:39 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 16 Jan
 2024 09:43:39 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 16 Jan
 2024 09:43:36 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <122cd611-bb11-4092-b466-9e3cf4d81492@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Tue, 16 Jan 2024 09:43:33 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] i2c: wmt: create wmt_i2c_init for general init
To: Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v7 1/6] i2c: wmt: create wmt_i2c_init for general init
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <eb2249f78697bd295d720c14501554a37ab65132.1704440251.git.hanshu-oc@zhaoxin.com>
 <4237903b-4cf2-47d7-8305-624925941126@kernel.org>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <4237903b-4cf2-47d7-8305-624925941126@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1705369419
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 638
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.119482
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Krzysztof,


On 2024/1/15 23:17, Krzysztof Kozlowski wrote:
>
> On 05/01/2024 08:51, Hans Hu wrote:
>> v5->v7:
>>        nothing changed.
>> v4->v5:
>>        add previous prototype 'static' for wmt_i2c_init().
>>        Link: https://lore.kernel.org/all/ZYx0VPVmyQhtG+B9@shikoro/1-a.txt
> Why there is only changelog and no commit msg? Changelog goes usually
> under ---, especially if it is quite non-informative...


Commit msg comes after changelog. Yes, I should have put
commit msg at the beginning. Other patches also have this
problem. Adjustments will be made at the next submission.

Hans,
Thank you



