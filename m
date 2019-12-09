Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46AC116F37
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 15:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfLIOli (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 09:41:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45780 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIOli (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 09:41:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 5505B28B60A
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c
 tunnel to MFD Cell
To:     Lee Jones <lee.jones@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Akshu.Agrawal@amd.com,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
 <20191209131745.GM3468@dell>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6f6b0ac7-37d8-e2a1-3249-223905c2a5b1@collabora.com>
Date:   Mon, 9 Dec 2019 15:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209131745.GM3468@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

On 9/12/19 14:17, Lee Jones wrote:
> On Thu, 21 Nov 2019, Raul E Rangel wrote:
> 
>> If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
>> possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
>> has finished initializing and setting the drvdata. This would cause a
>> NULL pointer panic.
>>
>> Converting this driver over to an MFD solves the problem and aligns with
>> where the cros_ec is going.
>>
>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
>> ---
>> You can now see the device node lives under the mfd device.
>>
>> $ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
>> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
>> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
>> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00
>>
>>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
>>  drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

Note that there is a v2 for this patch and I did some comments [1]

Thanks,
 Enric

[1] https://patchwork.ozlabs.org/patch/1200560/
