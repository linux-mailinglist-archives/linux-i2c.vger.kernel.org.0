Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC0FA66C4
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 12:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfICKuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 06:50:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45621 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbfICKuR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 06:50:17 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i56O5-0005Th-MY; Tue, 03 Sep 2019 12:50:13 +0200
Subject: Re: [PATCH] ACPI: support for NXP i2c controller
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Chuanhua Han <chuanhua.han@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <31e7c1bb-d153-5feb-0b86-946caca5206c@pengutronix.de>
Date:   Tue, 3 Sep 2019 12:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:13da
X-SA-Exim-Mail-From: o.rempel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One more question,

On 02.09.19 22:56, Rafael J. Wysocki wrote:
> On Thu, Jul 11, 2019 at 12:35 PM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>>
>> Enable NXP i2c controller to boot with ACPI
>>
>> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
>> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
>> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> 
> Wolfram, any objections to this from the i2c side?
> 
>> ---
>>   drivers/acpi/acpi_apd.c      |  6 ++++++
>>   drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
>> index ff47317..cf8566c 100644
>> --- a/drivers/acpi/acpi_apd.c
>> +++ b/drivers/acpi/acpi_apd.c
>> @@ -165,6 +165,11 @@ static const struct apd_device_desc thunderx2_i2c_desc = {
>>          .fixed_clk_rate = 125000000,
>>   };
>>
>> +static const struct apd_device_desc nxp_i2c_desc = {
>> +       .setup = acpi_apd_setup,
>> +       .fixed_clk_rate = 350000000,
>> +};

I'm not ACPI expert, so need here some help for understanding. Here is ACPI table for 
NXP0001 id (found on the internet):
+  Device(I2C0) {
+    Name(_HID, "NXP0001")
+    Name(_UID, 0)
+    Name(_CRS, ResourceTemplate() {
+      Memory32Fixed(ReadWrite, I2C0_BASE, I2C_LEN)
+      Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { I2C0_IT }
+    }) // end of _CRS for i2c0 device
+    Name (_DSD, Package () {
+      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+      Package () {
+         Package () {"clock-frequency", DEFAULT_PLAT_FREQ}, //This is device specific 
data, Need to see how to pass clk stuff
+      }
+    })

Should kernel some how get proper clock-frequency from the ACPI? Or we still need to use 
hard coded .fixed_clk_rate in the kernel?


>>   static const struct apd_device_desc hip08_spi_desc = {
>>          .setup = acpi_apd_setup,
>>          .fixed_clk_rate = 250000000,
>> @@ -238,6 +243,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>>          { "HISI02A1", APD_ADDR(hip07_i2c_desc) },
>>          { "HISI02A2", APD_ADDR(hip08_i2c_desc) },
>>          { "HISI0173", APD_ADDR(hip08_spi_desc) },
>> +       { "NXP0001", APD_ADDR(nxp_i2c_desc) },
>>   #endif
>>          { }
>>   };
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index b1b8b93..99f9b96 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -44,6 +44,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/sched.h>
>>   #include <linux/slab.h>
>> +#include <linux/acpi.h>
>>
>>   /* This will be the driver name the kernel reports */
>>   #define DRIVER_NAME "imx-i2c"
>> @@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
>>
>> +static const struct acpi_device_id i2c_imx_acpi_ids[] = {
>> +       {"NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata},
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
>> +
>>   static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
>>   {
>>          return i2c_imx->hwdata->devtype == IMX1_I2C;
>> @@ -1052,6 +1059,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>>   {
>>          const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
>>                                                             &pdev->dev);
>> +       const struct acpi_device_id *acpi_id =
>> +                       acpi_match_device(i2c_imx_acpi_ids,
>> +                                         &pdev->dev);
>>          struct imx_i2c_struct *i2c_imx;
>>          struct resource *res;
>>          struct imxi2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
>> @@ -1079,6 +1089,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
>>
>>          if (of_id)
>>                  i2c_imx->hwdata = of_id->data;
>> +       else if (acpi_id)
>> +               i2c_imx->hwdata = (struct imx_i2c_hwdata *)
>> +                               acpi_id->driver_data;
>>          else
>>                  i2c_imx->hwdata = (struct imx_i2c_hwdata *)
>>                                  platform_get_device_id(pdev)->driver_data;
>> @@ -1091,6 +1104,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>>          i2c_imx->adapter.nr             = pdev->id;
>>          i2c_imx->adapter.dev.of_node    = pdev->dev.of_node;
>>          i2c_imx->base                   = base;
>> +       ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
>>
>>          /* Get I2C clock */
>>          i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
>> @@ -1253,6 +1267,7 @@ static struct platform_driver i2c_imx_driver = {
>>                  .name = DRIVER_NAME,
>>                  .pm = &i2c_imx_pm_ops,
>>                  .of_match_table = i2c_imx_dt_ids,
>> +               .acpi_match_table = ACPI_PTR(i2c_imx_acpi_ids),
>>          },
>>          .id_table = imx_i2c_devtype,
>>   };
>> --
>> 2.9.5
>>
> 

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
