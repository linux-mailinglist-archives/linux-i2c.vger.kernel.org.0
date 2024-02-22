Return-Path: <linux-i2c+bounces-1911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4685F376
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEF0BB2335F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766642C696;
	Thu, 22 Feb 2024 08:50:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A02C683
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708591843; cv=none; b=kW1hBZzBHSOV61Ute2wI5fXRhhhqYD6YDofUsp/YjoHmo/HJ1OrSio3dlohALBzb9Ta1MZ2fHfutLMDRDaxF/udgLu9P95yMFAdjTB0BVMM44kjVifCDnQJipzHdWaumTTlqfMYwW+nXbCz0+AB2hUMITd3yeQE9C7OqLHs0Svg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708591843; c=relaxed/simple;
	bh=h4beN8v/ndwz48ksEhdqwt6rJSRLKLNeAxgyLbZfqOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g2u/pc7Pv06aQAAdOrcPLyC2QHqovkAdZU/pdn+XuA/YzXrt5jtZe0sKhY1iHx9SL25A8A4JUGcd+4tWxporoVZ+Dzeag17zbQC5iDAT+htNp/vdFL7T2e6W1S0Oy+N1fZV//OXi5sNwlAMxEfho4VWUbRHanHo7WlrJdSehjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1708591831-086e230f2847f90001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id PsrvnMgaawYNZB90 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 22 Feb 2024 16:50:31 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 16:50:31 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 22 Feb
 2024 16:50:27 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <956c3d8c-2d10-4f70-b68f-69d185af13bf@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 22 Feb 2024 16:50:27 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH v7 5/6] i2c: wmt: add platform type VIAI2C_PLAT_WMT
To: Wolfram Sang <wsa@kernel.org>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, <cobechen@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <37b0418dee4e92542f84eab927d5692884ac8d2b.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXu-4HONHGl6cNc@ninjato>
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <ZdXu-4HONHGl6cNc@ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1708591831
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 384
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121167
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Wolfram,

>> +enum {
>> +	VIAI2C_PLAT_WMT = 1,
>> +};
> Minor, but why not starting at 0?
>
>>   struct viai2c {
>>   	struct i2c_adapter	adapter;
>>   	struct completion	complete;
>> @@ -62,11 +66,12 @@ struct viai2c {
>>   	u16			cmd_status;
>>   	ktime_t			t1;
>>   	ktime_t			t2;
>> +	int			platform;
> unsigned int?
>

will change it.

Hans,
Thank you


