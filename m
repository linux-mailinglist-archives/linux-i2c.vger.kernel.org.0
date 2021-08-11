Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD123E99A0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 22:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhHKUW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 16:22:56 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:57186 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhHKUW4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 16:22:56 -0400
X-Greylist: delayed 576 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Aug 2021 16:22:55 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 73A5B23345A7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/5] Correctly handle plaform_get_irq()'s result in the
 i2C drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>
CC:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        George Cherian <gcherian@marvell.com>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Organization: Open Mobile Platform
Message-ID: <83767306-be1b-3bcd-723c-92483b4cc612@omp.ru>
Date:   Wed, 11 Aug 2021 23:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/4/21 5:32 PM, Sergey Shtylyov wrote:

> Here are 5 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
> The affected drivers call platform_get_irq() but mis-interprete its result -- they consider
> IRQ0 as error and (sometimes) the real error codes as valid IRQs... :-/
> 
> [1/5] i2c: hix5hd2: fix IRQ check
> [2/5] i2c: mt65xx: fix IRQ check
> [3/5] i2c: pmcmsp: fix IRQ check
> [4/5] i2c: s3c2410: fix IRQ check
> [5/5] i2c: xlp9xx: fix main IRQ check

   Wolfram, hat's up with this series (its status in the patchwork is still "new")? 

MBR, Sergey
