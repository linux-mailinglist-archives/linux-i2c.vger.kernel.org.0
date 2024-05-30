Return-Path: <linux-i2c+bounces-3709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1528D4432
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 05:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E064B24AC3
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 03:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA5F13958C;
	Thu, 30 May 2024 03:34:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ABC482ED
	for <linux-i2c@vger.kernel.org>; Thu, 30 May 2024 03:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717040065; cv=none; b=JjH87YZzZ7/RE0h2zcksEJqEaaQvL2MkG3eaaRYDiZXChlfJYtBFfdvzyoa7fuuu8ZV4I3Tr/CWeFI4fw6KvmWasdCHho0BPNOemojJec5dCnCjrw/efHp0sHQs607Ym3c8OXnt/Z5bFc07iOeSbDuXk2JyFE8YvbRMcMZe5Dpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717040065; c=relaxed/simple;
	bh=I+gA1VALC/dsj/LOOcdsy13jtpwnN+4gtVzC5x2bTdc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=oWhHIegZi+bi8AmW6vDrZry23EoUZ8QMMbhBlsZBX2oV7t7E5sag2HsfjxlzqWMN/h6av0L0qc3HlD0i827I0xTLGpyB233v+8Jl6VNicz/iYzpTwhUT2emnStOJE5Y49Ak9ByqeLc/w8qFNXu5tsBO6imdQJGdHzJUEzlouVVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1717040047-086e23110614af0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id La51jRmswieDhimY (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 30 May 2024 11:34:07 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 30 May
 2024 11:34:07 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.27; Thu, 30 May
 2024 11:34:06 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <a8d9c382-7cdc-4775-b921-251c90819a29@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Thu, 30 May 2024 11:33:39 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Hu <HansHu-oc@zhaoxin.com>
Subject: [PATCH] i2c: viai2c: turn common code into a proper module
Reply-To: <20240528120710.3433792-1-arnd@kernel.org>
X-ASG-Orig-Subj: [PATCH] i2c: viai2c: turn common code into a proper module
To: <arnd@kernel.org>, <andi.shyti@kernel.org>,
	<wsa+renesas@sang-engineering.com>
CC: <wentong.wu@intel.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<hanshu@zhaoxin.com>
References: <20240528120710.3433792-1-arnd@kernel.org>
 <fadeb87cdff64e84967ffb83621ebcd0@zhaoxin.com>
Content-Language: en-US
In-Reply-To: <fadeb87cdff64e84967ffb83621ebcd0@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1717040047
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1513
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125534
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Arnd,


> From: Arnd Bergmann <arnd@arndb.de>
>
> The i2c-viai2c-common.c file is used by two drivers, but is not a proper abstraction and can get linked into both modules in the same configuration, which results in a warning:
>
> scripts/Makefile.build:236: drivers/i2c/busses/Makefile: i2c-viai2c-common.o is added to multiple modules: i2c-wmt i2c-zhaoxin
>
> The other problems with this include the incorrect use of a __weak function when both are built-in, and the fact that the "common" module is sprinked with 'if (i2c->plat == ...)' checks that have knowledge about the differences between the drivers using it.
>
> Avoid the link time warning by making the common driver a proper module with MODULE_LICENCE()/MODULE_AUTHOR() tags, and remove the __weak function by slightly rearranging the code.
>
> This adds a little more duplication between the two main drivers, but those versions get more readable in the process.
>
> Fixes: a06b80e83011 ("i2c: add zhaoxin i2c controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/i2c/busses/Makefile             |   6 +-
>   drivers/i2c/busses/i2c-viai2c-common.c  |  71 ++-------------
>   drivers/i2c/busses/i2c-viai2c-common.h  |   2 +-
>   drivers/i2c/busses/i2c-viai2c-wmt.c     |  37 ++++++++
>   drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 113 +++++++++++++++++++-----
>   5 files changed, 140 insertions(+), 89 deletions(-)


I tested this patch and it works fine, so I am OK with it.


Hans


