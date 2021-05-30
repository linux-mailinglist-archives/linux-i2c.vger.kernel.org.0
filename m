Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548023951C1
	for <lists+linux-i2c@lfdr.de>; Sun, 30 May 2021 17:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhE3PzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 May 2021 11:55:25 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:52806 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhE3PzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 May 2021 11:55:25 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 09D9920F3AD1
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH0/2] Fix deferred probing in the I2C bus drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <dfa042b7-8b80-ee2b-451b-7cedaeadfd02@omprussia.ru>
 <eda766e5-3ce3-81ec-52b4-df75297b9941@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ff61c075-f844-8108-0686-69a0cb925627@omp.ru>
Date:   Sun, 30 May 2021 18:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <eda766e5-3ce3-81ec-52b4-df75297b9941@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/28/21 11:57 PM, Sergey Shtylyov wrote:

[...]
>> Here are 2 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
>> The affected drivers call platform_get_irq() but override its result in case of error
>> which prevents the deferred probing from working.
>>
>> [1/2] i2c: iop3xx: fix deferred probing
>> [2/2] i2c: synquacer: fix deferred probing
> 
>    Please hold on with this series; I'm gonna add another patch...

   Actually, I'm unsure about drivers/i2c/busses/i2c-pca-platform.c: normally it
uses polling iff the (considered optional) IRQ can't be set up (irq < 0 returned
from platform_get_irq_optional()) then polling mode is used. I have a patch to
propaate -EPROBE_DEFER upstream but I'm not sure what is better : sefer the probe
(and potentially falling permanently iff the kernel wouldn't able to finally set
up the IRQ or to start the I2C driver in the polling mode right away. Does these
doubts even make sense? :-)

MBR, Sergey
