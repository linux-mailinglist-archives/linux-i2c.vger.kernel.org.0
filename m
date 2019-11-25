Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25BC5109104
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 16:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfKYPcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 10:32:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59424 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfKYPcj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 10:32:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id CD720290003
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Fix slave device enumeration
To:     Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     rrangel@chromium.org, Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191121090620.75569-1-akshu.agrawal@amd.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <15b0a142-a62f-1783-fe46-f5654b618f33@collabora.com>
Date:   Mon, 25 Nov 2019 16:32:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121090620.75569-1-akshu.agrawal@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akshu,

On 21/11/19 10:06, Akshu Agrawal wrote:
> During adding of the adapter the slave device registration
> use to fail as the acpi companion field was not populated.
> 

I am wondering if this a fix that needs to picked on stable kernels? Which
chrome platform are you using?

Thanks,
 Enric

> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index c551aa96a2e3..aca8070393bd 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -273,6 +273,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>  	bus->adap.dev.parent = &pdev->dev;
>  	bus->adap.dev.of_node = np;
>  	bus->adap.retries = I2C_MAX_RETRIES;
> +	ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
>  
>  	err = i2c_add_adapter(&bus->adap);
>  	if (err)
> 
