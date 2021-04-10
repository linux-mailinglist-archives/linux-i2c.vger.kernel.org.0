Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D252235B089
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDJU6P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:58:15 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:40000 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJU6O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:58:14 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 6399B208CD25
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/6] Stop calling devm_request_irq() with invalid IRQs
 in the I2C bus drivers
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
To:     <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Organization: Open Mobile Platform, LLC
Message-ID: <ca43d9f0-28c7-d23e-402e-bb2b0113517c@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:57:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/10/21 11:11 PM, Sergey Shtylyov wrote:

> Here are 6 patches against the 'master' branch of Martin Petersen's 'scsi.git' repo.

   Oops, left that line unfinished. Wolfram's 'linux.git' repo, of course... :-)

> The affected drivers call platform_get_irq() but largely ignore its result -- they
> blithely pass the negative error codes to devm_request_irq() which expects *unsinged*
> IRQ #s. Stop doing that by checking what exactly platform_get_irq() returns.

[...]

MNR, Sergey
