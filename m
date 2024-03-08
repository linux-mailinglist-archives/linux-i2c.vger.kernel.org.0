Return-Path: <linux-i2c+bounces-2270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F87A875BEC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 02:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2431F22574
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 01:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860C4224CC;
	Fri,  8 Mar 2024 01:22:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101D20DFC
	for <linux-i2c@vger.kernel.org>; Fri,  8 Mar 2024 01:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709860950; cv=none; b=ptJFG4r3pz/BDtb0qQbgEq9iOvkW+1hXjLaadqxO5Ysz/RgHPVGrCKZsajshahCJCFK+gm2IBEuV3MhmN5oc9NZrOisiHbQa68KeUy3m8T0cGaTS9vDO1YWVj/HnUHlWunR1uen+wcl+1sZk2DqqrFEbDH697r5pg3WZw/TXK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709860950; c=relaxed/simple;
	bh=gbtWLS0jMwD18JtMfFPxhO/Di4gDfDyFkqb+Ixg7eEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IzRLJcc41FyUL1zO1p2Z38N4c8dK44ZvLKajWBfQ3cWjohjqPIrh+zM0Ezlk2/FT06l4KSkG9KVIdnZVmZ4pQ/PtOm/K2BX7duTUX+gCGegtuNoVrr9GJiYqs+EYt65nYAswi2e1peGJXiGdArM0s++HKbp8H6hoPKVKqYV57jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1709860939-1eb14e2b8103e50001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id mAM8bJLjAkOO7zFI (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 08 Mar 2024 09:22:19 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 09:22:19 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 09:22:18 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Message-ID: <8b2a2e56-439a-414d-a592-6f58015c4fb8@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date: Fri, 8 Mar 2024 09:22:16 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
To: Andi Shyti <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
Content-Language: en-US
From: Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <20240306212413.1850236-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1709860939
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 452
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121808
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Hi Andi,


> Check the changelog for more details. The little adaptation are
> limited to patch 1, 2 and 3. The other patches don't have any
> change.
>
> The series has been applied in i2c/i2c-host-next[*].

V9 does not appear to have been applied in i2c/i2c-host-next[*]. So, 
should I submit a v10 version? which its structure is: * patch 0-6 is 
consistent with v9. * patch 7 is new to fix issues as you mentioned 
before Thanks, Hans

