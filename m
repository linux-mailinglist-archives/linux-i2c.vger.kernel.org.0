Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371033951E8
	for <lists+linux-i2c@lfdr.de>; Sun, 30 May 2021 18:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhE3QC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 May 2021 12:02:59 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:36458 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhE3QC6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 May 2021 12:02:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 197AA2326C85
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH0/2] Fix deferred probing in the I2C bus drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <dfa042b7-8b80-ee2b-451b-7cedaeadfd02@omprussia.ru>
 <eda766e5-3ce3-81ec-52b4-df75297b9941@omp.ru>
 <ff61c075-f844-8108-0686-69a0cb925627@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3985ef30-dc42-a6c3-6d69-2347837cd34a@omp.ru>
Date:   Sun, 30 May 2021 19:01:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ff61c075-f844-8108-0686-69a0cb925627@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/30/21 6:53 PM, Sergey Shtylyov wrote:

[...]
>>> Here are 2 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
>>> The affected drivers call platform_get_irq() but override its result in case of error
>>> which prevents the deferred probing from working.
>>>
>>> [1/2] i2c: iop3xx: fix deferred probing
>>> [2/2] i2c: synquacer: fix deferred probing
>>
>>    Please hold on with this series; I'm gonna add another patch...
> 
>    Actually, I'm unsure about drivers/i2c/busses/i2c-pca-platform.c: normally it
> uses polling iff the (considered optional) IRQ can't be set up (irq < 0 returned
> from platform_get_irq_optional()) then polling mode is used.

   I started to be tautologcial, should really re-read the msgs before seding... :-)

> I have a patch to
> propaate -EPROBE_DEFER upstream but I'm not sure what is better : sefer the probe

   Propagate, of/c. :-)

> (and potentially falling permanently iff the kernel wouldn't able to finally set

   Wasn't. :-)

> up the IRQ or to start the I2C driver in the polling mode right away. Does these
> doubts even make sense? :-)

MBR, Sergey
