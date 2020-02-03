Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8BD150046
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 02:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgBCB2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Feb 2020 20:28:48 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:38296 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726905AbgBCB2s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Feb 2020 20:28:48 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 96950B086FBBC784CEE6;
        Mon,  3 Feb 2020 09:28:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.223.23) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 3 Feb 2020
 09:28:38 +0800
Subject: Re: [PATCH 1/2] i2c: designware: Add ACPI HID for Hisilicon
 Hip08-Lite I2C controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linuxarm@huawei.com>, Sheng Feng <fengsheng5@huawei.com>
References: <1580643255-38214-1-git-send-email-guohanjun@huawei.com>
 <20200202195204.GV32742@smile.fi.intel.com>
From:   Hanjun Guo <guohanjun@huawei.com>
Message-ID: <3f8fb782-478e-05a1-4375-862d9a4780bc@huawei.com>
Date:   Mon, 3 Feb 2020 09:28:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200202195204.GV32742@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.223.23]
X-CFilter-Loop: Reflected
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020/2/3 3:52, Andy Shevchenko wrote:
> On Sun, Feb 02, 2020 at 07:34:14PM +0800, Hanjun Guo wrote:
>> Add ACPI HID HISI02A3 for Hisilicon Hip08 Lite, which has different
>> clock frequency from Hip08 for I2C controller.
> 
> The series is good for me, but I think you should reverse the order of the
> patches in it.

I will send a updated version as you suggested.

Thanks
Hanjun

