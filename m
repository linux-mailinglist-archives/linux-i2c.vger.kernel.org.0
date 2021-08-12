Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380E23EABD0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 22:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhHLUdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 16:33:18 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:56718 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhHLUdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Aug 2021 16:33:18 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 29F2520C59B4
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 0/3] Fix deferred probing in the I2C bus drivers
To:     <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Organization: Open Mobile Platform
Message-ID: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
Date:   Thu, 12 Aug 2021 23:32:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here are 2 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
The affected drivers call platform_get_irq() but override its result in case of error
which prevents the deferred probing from working.

I've dropped the patch fixing the i2c-pca-platform driver as I considered a fallback
to polling better than (not guaranteed to work) deferred probing...

[1/2] i2c: iop3xx: fix deferred probing
[2/2] i2c: synquacer: fix deferred probing
