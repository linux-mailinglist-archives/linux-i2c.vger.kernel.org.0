Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1391C109C39
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2019 11:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfKZKX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Nov 2019 05:23:58 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47582 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbfKZKX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Nov 2019 05:23:58 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id E548026D97F
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
Message-ID: <6772efe4-3de1-efbd-15ca-268209c46b47@collabora.com>
Date:   Tue, 26 Nov 2019 11:23:53 +0100
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

Hi,

On 21/11/19 10:06, Akshu Agrawal wrote:
> During adding of the adapter the slave device registration
> use to fail as the acpi companion field was not populated.
> 
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>

Looks good to me.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

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
