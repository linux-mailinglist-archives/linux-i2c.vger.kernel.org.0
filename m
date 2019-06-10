Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A213BEF6
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 23:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfFJVzg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 17:55:36 -0400
Received: from merlin.infradead.org ([205.233.59.134]:46842 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbfFJVzg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 17:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yLCho7MYE7PP3yMTF5kETkv2f1UQ4ZD8ueVgEJs9Kbk=; b=abo/3IhxXY6PeOe/qKCKtFCwA1
        GYGHvg+0KWrL86/t4tQ7io7hbbBSuzCf4N8QsUUbjmjQNUFvHt9viiH1YGD4usdvZXiKjLJbuSs/J
        DbNiV9S7yau6GtP8jsGE62KIu5c2K55I7ehWsbg+U33eBevZ3d2UGjXcuAA8EbIweqKoPh4XcK5ej
        rEeDfZFTjXRIl1eMk2Szwg6wBznWTobe9U4hqBh3fuKyPyWmrDpd2amDovEpvMbbNcPH0vZV2Tger
        oQ/RUdvQElx4yidCyvMTeA3kweuvevadkONhnDyS+jkYnBSqd9JB+VqUFf5/jrX9RIk1+HbwbVq/y
        fcZeJmXA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1haSGL-0008GY-Nr; Mon, 10 Jun 2019 21:55:33 +0000
Subject: Re: [PATCH v12 1/1] Add support for IPMB driver
To:     Asmaa Mnebhi <Asmaa@mellanox.com>, minyard@acm.org,
        wsa@the-dreams.de, vadimp@mellanox.com, michaelsh@mellanox.com
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1560192707.git.Asmaa@mellanox.com>
 <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <54f3c0e0-7aaa-9078-5328-50e8f709ebae@infradead.org>
Date:   Mon, 10 Jun 2019 14:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <319690553a0da2a1e80b400941341081b383e5f1.1560192707.git.Asmaa@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/10/19 11:57 AM, Asmaa Mnebhi wrote:
> Support receiving IPMB requests on a Satellite MC from the BMC.
> Once a response is ready, this driver will send back a response
> to the BMC via the IPMB channel.
> 
> Signed-off-by: Asmaa Mnebhi <Asmaa@mellanox.com>
> Acked-by: vadimp@mellanox.com
> ---
>  Documentation/IPMB.txt           | 103 +++++++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 364 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 476 insertions(+)
>  create mode 100644 Documentation/IPMB.txt
>  create mode 100644 drivers/char/ipmi/ipmb_dev_int.c
> 
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> new file mode 100644
> index 0000000..7160d53
> --- /dev/null
> +++ b/Documentation/IPMB.txt
> @@ -0,0 +1,103 @@

[...]

> +Instantiate the device
> +----------------------
> +
> +After loading the driver, you can instantiate the device as
> +described in 'Documentation/i2c/instantiating-devices'.
> +If you have multiple BMCs, each connected to your Satellite MC via
> +a different I2C bus, you can instantiate a device for each of
> +those BMCs.
> +The name of the instantiated device contains the I2C bus number
> +associated with it as follows:
> +
> +BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
> +				Satellite MC
> +BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
> +
> +For instance, you can instantiate the ipmb-dev-int device from
> +user space at the 7 bit address 0x10 on bus 2:
> +
> +  # echo ipmb-dev 0x1010 > /sys/bus/i2c/devices/i2c-2/new_device

This is confusing.

Can you clarify how the 7-bit address is extracted from that hex number?
Is the 7-bit address repeated (duplicated)?
Is the 7-bit address the low order (low bits) 0x10 or the 0x10 at bits
15-8 (or 14-8)?

> +This will create the device file /dev/ipmb-2, which can be accessed
> +by the user space program. The device needs to be instantiated
> +before running the user space program.

thanks.
-- 
~Randy
