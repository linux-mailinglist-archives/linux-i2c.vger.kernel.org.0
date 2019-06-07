Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CEB38945
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbfFGLnd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:43:33 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12086 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfFGLnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:43:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa4dd50000>; Fri, 07 Jun 2019 04:43:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 04:43:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Jun 2019 04:43:32 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 11:43:29 +0000
Subject: Re: [PATCH V5] drivers: i2c: tegra: fix warning/check/error
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
 <20190607060358.GB1035@kunai>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <3f63d2b4-ef78-4d36-e369-a55fc9b7c205@nvidia.com>
Date:   Fri, 7 Jun 2019 04:43:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607060358.GB1035@kunai>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559907797; bh=0CPTPqFbNJLVd/zcg1bI/WcL5Wj11nPAs5B9pIjZrU0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KqIzgkgJLR/dO+caG/HD3JCYf1EwQNJ3r/Q4bW2eQ3Xu8vgNV6KlNbHLlgkHJmO+D
         +HFPObSpG7J38Q8TC0gGDnQbOXFn95EZ/ZRSEBjfcX3fRYcJ5JBhsJnJu3alJalBYr
         gSo+a94Pcz2BD6Yk25zkxka+G5FYAFWoM+CgivTWtarNkKKsCs78HwvntbJbfxIemI
         efKOyplD2CtlQLlI7Re0MG7ALs0o68+lmN+oIhfB5Q0QlzV7QrQBIuoXmef3qXwzyE
         Yc6uBGLyhNchjk/zmRaCvYNqnYJAmF7BBDN2/hBLTa8p07r0K0SnzmeIPA3miLG+oP
         FSblNaH62ElVA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/6/19 11:03 PM, Wolfram Sang wrote:
> On Thu, Jun 06, 2019 at 10:25:03PM -0700, Bitan Biswas wrote:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Ignore checkpatch WARNING for 80 character line limit at
>> places where renaming fields compromises readability.
>>
>> Delay of approximately 1msec in flush i2c FIFO polling loop
>> achieved by usleep_range call as msleep can take 20msecs.
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> You removed the word checkpatch from $subject, but you still did not
> split up the patch into logical pieces. The description above already
> outlines what those logical pieces could be.
> 
I shall split the patch into multiple logical patches.

-Thanks,
  Bitan
