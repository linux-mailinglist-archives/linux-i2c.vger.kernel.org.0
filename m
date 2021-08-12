Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C403EABD5
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 22:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhHLUe0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 16:34:26 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:32838 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhHLUe0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Aug 2021 16:34:26 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 2A09E208C6F9
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/3] Fix deferred probing in the I2C bus drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a863bf71-7514-d953-9bdf-e76c53341809@omp.ru>
Date:   Thu, 12 Aug 2021 23:33:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The subject should've had v3, not v2, sorry!
