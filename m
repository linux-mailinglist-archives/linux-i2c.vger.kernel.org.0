Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9FB3B37AE
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 22:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhFXUUD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 16:20:03 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:58018 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbhFXUUD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 16:20:03 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 2F6B62135FB2
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 0/3] Fix deferred probing in the I2C bus drivers
To:     <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Organization: Open Mobile Platform
Message-ID: <f50837d5-9eb0-61c1-6d3a-5f7d1e17b9ae@omp.ru>
Date:   Thu, 24 Jun 2021 23:17:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here are 3 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
The affected drivers call platform_get_irq() but override its result in case of error
which prevents the deferred probing from working.

[1/3] i2c: iop3xx: fix deferred probing
[2/3] i2c: pca-platform: fix deferred probing
[3/3] i2c: synquacer: fix deferred probing
