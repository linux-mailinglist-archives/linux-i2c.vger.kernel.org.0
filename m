Return-Path: <linux-i2c+bounces-2804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152D89ADE3
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 03:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1A6281A6D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 01:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB290EBE;
	Sun,  7 Apr 2024 01:37:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B39A3D
	for <linux-i2c@vger.kernel.org>; Sun,  7 Apr 2024 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712453833; cv=none; b=ai4sWscAJV2NDwArirdXvz8lM6Yo+jM20rnCOO7Wy/p93421rf5vzX1Oc3TiRhAydJ3TUk6EMte5jttEce2N/XhvJoT7H+nHNqINGb/znV5hFTvSinFntW+3G5PBNAmINJdVNmB555fzOh61X36PdirrYjJGrl+nkyZKw8cqFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712453833; c=relaxed/simple;
	bh=SqSB9jHHY2aEOkM++ycaZsGGhiyPRUq3ipJbmMYJxE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ds0sNwFF95QwhT7qsgwVZ7DSgkxeXET/fvBZxScxibmuutRsTHOgzCBKMKhBuSEdVtUM/s7/rB7yMNAPwW35xRC/szBcEbSL6dXjVs04Qj3X5rO87yRldbcGvpEtSkWJMYdOdOHOuPn1MCa9lntgO7G6S39zC7Yb1lOGmtyZyFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712453822-1eb14e2b83266b0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id SjC3WIO0gzfvxMAI (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Sun, 07 Apr 2024 09:37:02 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 7 Apr
 2024 09:37:02 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 7 Apr
 2024 09:37:01 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <cbbfc9f6-c5d9-43f7-8d83-56ab28858384@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Sun, 7 Apr 2024 09:36:59 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
To: Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
CC: <linux-i2c@vger.kernel.org>, <wsa@kernel.org>, <cobechen@zhaoxin.com>,
	<hanshu@zhaoxin.com>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
 <8b2a2e56-439a-414d-a592-6f58015c4fb8@zhaoxin.com>
 <i5jeghpblde4bzwuxidd2rxaqyvbb5npvl7ra4swc2tysonb2k@ms42yijtkakw>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <i5jeghpblde4bzwuxidd2rxaqyvbb5npvl7ra4swc2tysonb2k@ms42yijtkakw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1712453822
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 813
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123168
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


> Hi Hans,
>
> On Fri, Mar 08, 2024 at 09:22:16AM +0800, Hans Hu wrote:
>>> Check the changelog for more details. The little adaptation are
>>> limited to patch 1, 2 and 3. The other patches don't have any
>>> change.
>>>
>>> The series has been applied in i2c/i2c-host-next[*].
>> V9 does not appear to have been applied in i2c/i2c-host-next[*]. So, should
>> I submit a v10 version? which its structure is: * patch 0-6 is consistent
>> with v9. * patch 7 is new to fix issues as you mentioned before Thanks, Hans
> I just want to make sure that we have an understanding on this
> series.
>
> Now that the 6.9 merge window is well over, are you planning to
> resend this series?


Yes, I will submit the v10 patch based on the latest i2c/i2c-host-next[*].


Thanks,

Hans


