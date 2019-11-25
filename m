Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7273B109193
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 17:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbfKYQGb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 11:06:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbfKYQGb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 11:06:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 83B382901A0
Subject: Re: [PATCH 1/4] i2c: i2c-cros-ec-tunnel: Pass ACPI node to i2c
 adapter
To:     Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2dcedacb-8d08-6a58-23af-e834ef9e80fd@collabora.com>
Date:   Mon, 25 Nov 2019 17:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 21/11/19 22:10, Raul E Rangel wrote:
> The I2C bus needs to share the same ACPI node as the tunnel device so
> that the I2C bus can be referenced from ACPI.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Hmm, isn't this change the same as https://lkml.org/lkml/2019/11/21/208 ?

Should I assume this deprecates the one pointed above? Who is the author? Please
maintain the Signed-off chain.

Thanks,
 Enric

> ---
> I would have added a Fixes annotation, but I wasn't able to find the
> hash for https://lore.kernel.org/patchwork/patch/1151436/.
> 
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index 958161c71985..ac2412755f0a 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -272,6 +272,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>  	bus->adap.algo_data = bus;
>  	bus->adap.dev.parent = &pdev->dev;
>  	bus->adap.dev.of_node = pdev->dev.of_node;
> +	ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
>  	bus->adap.retries = I2C_MAX_RETRIES;
>  
>  	err = i2c_add_adapter(&bus->adap);
> 
