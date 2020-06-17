Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B0E1FCD6F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 14:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFQMbe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 08:31:34 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:42929 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQMbe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jun 2020 08:31:34 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49n4F0027Lz1ryp6;
        Wed, 17 Jun 2020 14:31:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49n4Dz6bV8z1r56W;
        Wed, 17 Jun 2020 14:31:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 5uG9kBo8NYjS; Wed, 17 Jun 2020 14:31:30 +0200 (CEST)
X-Auth-Info: s1SH41uo981LRmNP0EY/p2rwD0XzuvvybLVAN8boBEo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Jun 2020 14:31:30 +0200 (CEST)
Subject: Re: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <CAKfKVtFZnDv13CWJcSSP1tKmsG5P_Kn+RWQyFwdYh2dT6tfg_g@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <c03c23d1-1caf-ad32-b69b-7576521aaa1d@denx.de>
Date:   Wed, 17 Jun 2020 14:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKfKVtFZnDv13CWJcSSP1tKmsG5P_Kn+RWQyFwdYh2dT6tfg_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/17/20 2:25 PM, Shubhrajyoti Datta wrote:
> Hi Marek,

Hi,

> On Sat, Jun 13, 2020 at 8:39 PM Marek Vasut <marex@denx.de> wrote:
>>
>> The interrupt handler is missing locking when reading out registers
>> and is racing with other threads which might access the driver. Drop
>> it altogether, so that the threaded interrupt is always executed, as
>> that one is already serialized by the driver mutex. This also allows
>> dropping local_irq_save()/local_irq_restore() in xiic_start_recv().
>>
> The idea of the local_irq_save / restore was to make it atomic in case
> there are a lot
> of non i2c interrupts.

Make what atomic ? Two consecutive register writes cannot be atomic
unless there is some hardware way to do that. The XIIC has no such way.

> so it should still be needed right?

No, if there is a mutex around both the threaded interrupt handler and
this function, the register accesses will not be interleaved between the
two functions. I think that is what this local_irq_*() was trying to
prevent, right ?
