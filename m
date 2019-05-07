Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40FC16D6A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2019 00:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfEGWJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 18:09:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58184 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGWJ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 18:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7dysCa616JXiACnyZIUeJWuKqMgmDWSXPEUP+GsKS8I=; b=PEt+uDwuGjD6g9mBjjRsFqOXg
        L2IR0LhRqHS9qLACZfqOEa0Ycu49dGbSvpA9YwP2xIVfOcxj8O7M+pjfbVyGSTlmEpihhyMD8AUvG
        I8QQPQGzQuBuuntCfUI5fEEUrAXsWCEwdQtt98U3be/ak7FeF9xqaV1vUS2XnbZXVHPXBIUdMKSj+
        mN3iAC6EwE5eRYPQYv6cYT1jEBhRIVzTvQUlRXIMChiENREGE/x+CVWdGb/s/KySJgT54y5jo+QAq
        PZnbtvKFOeTnpkcYq8gWdkPfgwj878uVOMOUE2qMiaGJXLRrqS/0H3v+vh63VW42h30YDkdyaBujd
        ICoGj3gzA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hO8H6-0003Ld-0x; Tue, 07 May 2019 22:09:24 +0000
Subject: Re: [PATCH v8 1/1] Add support for IPMB driver
To:     Asmaa Mnebhi <Asmaa@mellanox.com>, minyard@acm.org,
        wsa@the-dreams.de, vadimp@mellanox.com, michaelsh@mellanox.com
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1557264413.git.Asmaa@mellanox.com>
 <3609b6b92f0a45f0364058c0d0078db209f0dd14.1557264413.git.Asmaa@mellanox.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <14d0e867-50c7-95bf-ec44-277ec3357ef5@infradead.org>
Date:   Tue, 7 May 2019 15:09:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3609b6b92f0a45f0364058c0d0078db209f0dd14.1557264413.git.Asmaa@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Just a few doc comments below...

On 5/7/19 2:30 PM, Asmaa Mnebhi wrote:
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
>  drivers/char/ipmi/ipmb_dev_int.c | 382 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 494 insertions(+)
>  create mode 100644 Documentation/IPMB.txt
>  create mode 100644 drivers/char/ipmi/ipmb_dev_int.c
> 
> diff --git a/Documentation/IPMB.txt b/Documentation/IPMB.txt
> new file mode 100644
> index 0000000..fd9d168
> --- /dev/null
> +++ b/Documentation/IPMB.txt
> @@ -0,0 +1,103 @@
> +============================
> +IPMB Driver fro Satellite MC

               for

> +============================
> +
> +The Intelligent Platform Management Bus, or IPMB is an

                                            or IPMB,

> +I2C bus that provides a standardized interconnection between
> +different boards within a chassis. This interconnection is
> +between the baseboard management (BMC) and chassis electronics.
> +IPMB is also associated with the messaging protocol through the
> +IPMB bus.
> +
> +The devices using the IPMB are usually management
> +controllers that perform management functions such as servicing
> +the front panel interface, monitoring the baseboard,
> +hot-swapping disk drivers in the system chassis, etc...
> +
> +When an IPMB is implemented in the system, the BMC serves as
> +a controller to give system software access to the IPMB. The BMC
> +sends IPMI requests to a device (usually a Satellite Management
> +Controller or Satellite MC) via IPMB and the device
> +sends a response back to the BMC.
> +
> +For more information on IPMB and the format of an IPMB message,
> +refer to the IPMB and IPMI specifications.
> +
> +IPMB driver for Satellite MC
> +----------------------------
> +
> +ipmb-dev-int - This is the driver needed on a Satellite MC to
> +receive IPMB messages from a BMC and send a response back.
> +This driver works hand with the i2c driver and a userspace

drop "hand"
s/i2c/I2C/

> +program such as OpenIPMI:
> +
> +1) It is an I2C slave backend driver. So, it defines a callback
> +function to set the Satellite MC as an I2C slave.
> +This callback function handles the received IPMI requests.
> +
> +2) It defines the read and write functions to enable a user
> +space program (such as OpenIPMI) to communicate with the kernel.
> +
> +
> +Load the IPMB driver
> +--------------------
> +
> +The driver needs to be loaded at boot time or manually first.
> +First, make sure you have the following in your config file:
> +CONFIG_IPMB_DEVICE_INTERFACE=y
> +
> +1) If you want the driver to be loaded at boot time:
> +

Are these instructions for a hardware/firmware developer?

> +a) Add this entry to your ACPI table, under the appropriate SMBus:
> +
> +Device (SMB0) // Example SMBus host controller
> +{
> +  Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> +  Name (_UID, 0) // Unique ID of particular host controller
> +  :
> +  :
> +    Device (IPMB)
> +    {
> +      Name (_HID, "IPMB0001") // IPMB device interface
> +      Name (_UID, 0) // Unique device identifier
> +    }
> +}
> +
> +b) Example for device tree:
> +
> +&i2c2 {
> +         status = "okay";
> + 
> +         ipmb@10 {
> +                 compatible = "ipmb-dev";
> +                 reg = <0x10>;
> +         };
> +};
> +
> +2) Manually from linux:

s/linux/Linux/

> +modprobe ipmb-dev-int
> +
> +
> +Instantiate the device
> +----------------------
> +
> +After loading the driver, you can instantiate the device as
> +described in the document 'instantiating-devices'.

what document is that?  where?

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
> +
> +This will create device file /dev/ipmb-2, which can be accessed

   This will create the device file

> +by the user space program. The device needs to be instantiated
> +before running the user space program.

thanks.
-- 
~Randy
