Return-Path: <linux-i2c+bounces-3075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4778AE60D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5976B282B98
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA2951C5C;
	Tue, 23 Apr 2024 12:30:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998E1D545
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875429; cv=none; b=pH8XM+NB2vgbyO6ujC9gkXt+HH9ZAEq00jWe3pvJeowRdZCwUps183rT51WYuJzoqvppyu787L5gjO2eBeZxhhzTC3sh5E1KyUPjowOgglu7YSZmxGovrzkFpGAa+EbuiHOHog3IjbZdKfctcm+e4DqkUWifW1jB5E97PC1+pTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875429; c=relaxed/simple;
	bh=LM3EGfOkJipAaEd880S6zo6XXX/QjULO+dlQjabXu9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QuL48aut8MQsYQuzTy3LwO5hoIFgNpqNWC1I6jftW6iSadky1jMclGyRH88uyZn6c4zu1MjHUzLjaNyFn99uSh29smeGJeHT1yezxAnlSoc52TgvoRjs/7rM13vCGqf5l+4Pn+vI9PIY73TPtgC244U0UVUpbLcQVpiBgKD7jS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1713874565-086e23661751450001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id fjgUliGibVvDIDca (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Tue, 23 Apr 2024 20:16:05 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 23 Apr
 2024 20:16:05 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 23 Apr
 2024 20:16:04 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <87b33408-ce66-49d1-8ebb-6aa8f535afa6@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Tue, 23 Apr 2024 20:16:01 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] i2c: add zhaoxin i2c controller driver
To: Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v10 0/6] i2c: add zhaoxin i2c controller driver
CC: <linux-i2c@vger.kernel.org>, <wsa@kernel.org>, <cobechen@zhaoxin.com>,
	<hanshu@zhaoxin.com>
References: <20240306212413.1850236-1-andi.shyti@kernel.org>
 <cover.1712479417.git.hanshu-oc@zhaoxin.com>
 <pvou2xxuhzjal5ptxpuvir4crl4k2hnqsvjj2lca3xativ2oll@kdsvwmk263kr>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <pvou2xxuhzjal5ptxpuvir4crl4k2hnqsvjj2lca3xativ2oll@kdsvwmk263kr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1713874565
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 536
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123898
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


> Hi Hans,
>
> it all looks good, except for that unrelated cleanup you added in
> patch '1'.
>
> If you are OK with it, I can take the series and remove the
> cleanup.
>
> Please keep in mind that splitting patches in smaller chunks
> helps reviews and future bisects, even if the change is a trivial
> cosmetic improvement.


I'm OK with it.

I have learned a lot from submitting the i2c patch this time,
and I will keep in mind all the suggestions you and others have.

Hans,
Thank you very much!


