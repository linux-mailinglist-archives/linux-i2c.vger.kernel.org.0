Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F312E15AA
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2019 11:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390400AbfJWJWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 05:22:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16378 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390380AbfJWJWb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 05:22:31 -0400
X-UUID: 2fad99538d13476fb767350302f3ee46-20191023
X-UUID: 2fad99538d13476fb767350302f3ee46-20191023
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 315154814; Wed, 23 Oct 2019 17:22:25 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 17:22:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 23 Oct 2019 17:22:22 +0800
Message-ID: <1571822543.32053.2.camel@mtksdaap41>
Subject: Re: [PATCH v6] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Date:   Wed, 23 Oct 2019 17:22:23 +0800
In-Reply-To: <CAMpxmJWw39S40_UX_VyErP9GMJH1mAeE8PdzfiZHKVWZTdQ7mg@mail.gmail.com>
References: <20191023082156.1348-1-bibby.hsieh@mediatek.com>
         <CAMpxmJWw39S40_UX_VyErP9GMJH1mAeE8PdzfiZHKVWZTdQ7mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2019-10-23 at 10:44 +0200, Bartosz Golaszewski wrote:
> śr., 23 paź 2019 o 10:22 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> >
> > Although in the most platforms, the power of eeprom and i2c
> > are alway on, some platforms disable the eeprom and i2c power
> > in order to meet low power request.
> > This patch add the pm_runtime ops to control power to support
> > all platforms.
> >
> > Changes since v5:
> >  - remove has_supplies
> >
> > Changes since v4:
> >  - add system sleep PM ops
> >  - move regulator_bulk_disable before suspend()
> >  - fixes error handling
> >
> > Changes since v3:
> >  - remove redundant calling function
> >  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
> >  - change supply name
> >
> > Changes since v2:
> >  - rebase onto v5.4-rc1
> >  - pm_runtime_disable and regulator_bulk_disable at
> >    err return in probe function
> >
> > Changes since v1:
> >  - remove redundant code
> >  - fixup coding style
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 50 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 2cccd82a3106..1332bba93d32 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/nvmem-provider.h>
> >  #include <linux/regmap.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/gpio/consumer.h>
> >
> >  /* Address pointer is 16 bit. */
> > @@ -67,6 +68,12 @@
> >   * which won't work on pure SMBus systems.
> >   */
> >
> > +static const char * const at24_supply_names[] = {
> > +       "vcc", "i2c",
> > +};
> > +
> > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > +
> >  struct at24_client {
> >         struct i2c_client *client;
> >         struct regmap *regmap;
> > @@ -91,6 +98,7 @@ struct at24_data {
> >
> >         struct gpio_desc *wp_gpio;
> >
> > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> >         /*
> >          * Some chips tie up multiple I2C addresses; dummy devices reserve
> >          * them for us, and we'll use them with SMBus calls.
> > @@ -662,6 +670,11 @@ static int at24_probe(struct i2c_client *client)
> >         at24->client[0].client = client;
> >         at24->client[0].regmap = regmap;
> >
> > +       regulator_bulk_set_supply_names(at24->supplies,
> > +                                       at24_supply_names, AT24_NUM_SUPPLIES);
> > +       devm_regulator_bulk_get(&at24->client[0].client->dev,
> > +                               AT24_NUM_SUPPLIES, at24->supplies);
> 
> You still need to check the return value here - this call can still
> fail for many reasons.

I think we can easily check if return value < 0, rigth?


> > +
> >         at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
> >         if (IS_ERR(at24->wp_gpio))
> >                 return PTR_ERR(at24->wp_gpio);
> > @@ -701,6 +714,12 @@ static int at24_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, at24);
> >
> > +       err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> > +       if (err) {
> > +               dev_err(dev, "Failed to enable power regulators\n");
> > +               return err;
> > +       }
> > +
> >         /* enable runtime pm */
> >         pm_runtime_set_active(dev);
> >         pm_runtime_enable(dev);
> > @@ -713,6 +732,8 @@ static int at24_probe(struct i2c_client *client)
> >         pm_runtime_idle(dev);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> > +               regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                      at24->supplies);
> >                 return -ENODEV;
> >         }
> >
> > @@ -725,15 +746,44 @@ static int at24_probe(struct i2c_client *client)
> >
> >  static int at24_remove(struct i2c_client *client)
> >  {
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> >         pm_runtime_disable(&client->dev);
> > +       if (pm_runtime_status_suspended(&client->dev))
> > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
> 
> So you will now disable the regulators if they're already disabled in
> at24_suspend() but not disable them if they're not. This is clearly
> inverted.
> 
> Bart

oops... I miss inverted, sorry :(

Bibby

> 
> >         pm_runtime_set_suspended(&client->dev);
> >
> >         return 0;
> >  }
> >
> > +static int __maybe_unused at24_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> > +       return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                     at24->supplies);
> > +}
> > +
> > +static int __maybe_unused at24_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> > +       return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > +                                    at24->supplies);
> > +}
> > +
> > +static const struct dev_pm_ops at24_pm_ops = {
> > +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                               pm_runtime_force_resume)
> > +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
> > +};
> > +
> >  static struct i2c_driver at24_driver = {
> >         .driver = {
> >                 .name = "at24",
> > +               .pm = &at24_pm_ops,
> >                 .of_match_table = at24_of_match,
> >                 .acpi_match_table = ACPI_PTR(at24_acpi_ids),
> >         },
> > --
> > 2.18.0
> >


