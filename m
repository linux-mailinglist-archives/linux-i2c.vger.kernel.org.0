Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E83037C27
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 20:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbfFFSWx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 14:22:53 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17864 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 14:22:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf959fa0000>; Thu, 06 Jun 2019 11:22:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 11:22:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 11:22:51 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 18:22:48 +0000
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <20190606115705.6j2oigsm2imvvqh7@ninjato>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <70a73e4b-c5d2-9c5d-7b18-f4325c6360b3@nvidia.com>
Date:   Thu, 6 Jun 2019 11:22:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606115705.6j2oigsm2imvvqh7@ninjato>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559845370; bh=jTycISHvzYZBtb3jGCxiwfAEQxyD+9f6C6EbRDfPvsI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KyIHywvRzsGtBRAA89zkQCmwCCCTLAqw0dJfZxHFD112/7Urh5Q45r35x9vFcnm/W
         24FfQblvJ+eYfOvy1CfE9E9UaFfUx1Ih+NFkS7Ha3dBGoLk0LzanVE5pIUUpyRhnbb
         xvnQv9aGFGnOYuM9rL9nAovYCR3mIw8pBkzRn5ApwFMpvoZJtxZAU3ZY77CcZgqazP
         NzLNMcpf16E+NsB/6j5kqNpq6a1gIysDCZKbF/QebIR7dcGpIgkjLQ1k/VrJMNds9G
         A6ruOkuddpm6gNcmySp3Ywc2Q5uMsx/uD24TjhkG7RbAOzmHnhwOH9fKcsWSGr2Njr
         uTevDTBLtoH7Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 4:57 AM, Wolfram Sang wrote:
> On Thu, Jun 06, 2019 at 12:35:23AM -0700, Bitan Biswas wrote:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> 
> I wonder why you didn't fix this checkpatch defect?
> 
> WARNING: A patch subject line should describe the change not the tool that found it
> 
I ran checkpatch.pl on the source file only hence missed this warning. I 
shall fix this in updated patch.

-Thanks,
  Bitan

