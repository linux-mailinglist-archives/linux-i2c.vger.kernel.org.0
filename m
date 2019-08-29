Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F81AA0F50
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 03:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfH2B7W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 21:59:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41773 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726081AbfH2B7W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Aug 2019 21:59:22 -0400
X-UUID: e15dac678e214f22bb7ac6309a6cad1d-20190829
X-UUID: e15dac678e214f22bb7ac6309a6cad1d-20190829
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1549162926; Thu, 29 Aug 2019 09:59:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 09:59:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 09:59:20 +0800
Message-ID: <1567043954.26216.2.camel@mtksdaap41>
Subject: Re: [PATCH v0 1/1] WIP: misc: eeprom: at24: support pm_runtime
 control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 29 Aug 2019 09:59:14 +0800
In-Reply-To: <CAAFQd5AHqGK2XXYiN6mTt8MeGPjYebpQQ2Zan-nSHCYTqUY1dw@mail.gmail.com>
References: <20190827012015.10440-1-bibby.hsieh@mediatek.com>
         <CAMpxmJV1LDSYtBQK2pYPwCnhSwQ825rjFsYxiYXwn+Qbhfg=TA@mail.gmail.com>
         <1567043490.26216.1.camel@mtksdaap41>
         <CAAFQd5AHqGK2XXYiN6mTt8MeGPjYebpQQ2Zan-nSHCYTqUY1dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2019-08-29 at 10:56 +0900, Tomasz Figa wrote:
> Hi Bibby,
> 
> On Thu, Aug 29, 2019 at 10:51 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> >
> > On Wed, 2019-08-28 at 12:53 +0200, Bartosz Golaszewski wrote:
> > > wt., 27 sie 2019 o 03:20 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> > > >
> > > > Although in the most platforms, the power of eeprom and i2c
> > > > are alway on, some platforms disable the eeprom and i2c power
> > > > in order to meet low power request.
> > > > This patch add the pm_runtime ops to control power to support
> > > > all platforms.
> > > >
> > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > >
> > > Why do you mark it as work-in-progress? Is it supposed to be reviewed?
> > >
> > Sorry about that I forget to remove it.
> > Did you mind review this patch at first? I will remove "WIP" tag in next
> > version. Thanks.
> 
> Would you be able to resend the patch without the WiP and v0 prefix?
> Otherwise some people may end up ignoring it. Thanks.
> 
Ok, got it.

Bibby
> Best regards,
> Tomasz
> 
> >
> > Bibby
> > > Bart
> > >
> > > > ---
> > > >  drivers/misc/eeprom/at24.c | 61 +++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 60 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > > > index 35bf2477693d..2843e4b4aacd 100644
> > > > --- a/drivers/misc/eeprom/at24.c
> > > > +++ b/drivers/misc/eeprom/at24.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include <linux/nvmem-provider.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >  #include <linux/gpio/consumer.h>
> > > >
> > > >  /* Address pointer is 16 bit. */
> > > > @@ -68,6 +69,12 @@
> > > >   * which won't work on pure SMBus systems.
> > > >   */
> > > >
> > > > +static const char * const at24_supply_names[] = {
> > > > +       "power", "i2c",
> > > > +};
> > > > +
> > > > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > > > +
> > > >  struct at24_client {
> > > >         struct i2c_client *client;
> > > >         struct regmap *regmap;
> > > > @@ -92,6 +99,8 @@ struct at24_data {
> > > >
> > > >         struct gpio_desc *wp_gpio;
> > > >
> > > > +       bool has_supplies;
> > > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > > >         /*
> > > >          * Some chips tie up multiple I2C addresses; dummy devices reserve
> > > >          * them for us, and we'll use them with SMBus calls.
> > > > @@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *client)
> > > >         at24->client[0].client = client;
> > > >         at24->client[0].regmap = regmap;
> > > >
> > > > +       for (i = 0; i < AT24_NUM_SUPPLIES; i++)
> > > > +               at24->supplies[i].supply = at24_supply_names[i];
> > > > +       err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
> > > > +                                      AT24_NUM_SUPPLIES,
> > > > +                                      at24->supplies);
> > > > +       if (err == -EPROBE_DEFER) {
> > > > +               dev_err(dev, "Failed to get power regulators\n");
> > > > +               return err;
> > > > +       }
> > > > +       at24->has_supplies = !err ? true : false;
> > > > +
> > > >         at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
> > > >         if (IS_ERR(at24->wp_gpio))
> > > >                 return PTR_ERR(at24->wp_gpio);
> > > > @@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *client)
> > > >         /* enable runtime pm */
> > > >         pm_runtime_set_active(dev);
> > > >         pm_runtime_enable(dev);
> > > > +       pm_runtime_get_sync(dev);
> > > > +       if (at24->has_supplies) {
> > > > +               err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> > > > +               if (err) {
> > > > +                       dev_err(dev, "Failed to enable power regulators\n");
> > > > +                       return err;
> > > > +               }
> > > > +       }
> > > >
> > > >         /*
> > > >          * Perform a one-byte test read to verify that the
> > > >          * chip is functional.
> > > >          */
> > > >         err = at24_read(at24, 0, &test_byte, 1);
> > > > -       pm_runtime_idle(dev);
> > > > +       pm_runtime_put(dev);
> > > >         if (err) {
> > > >                 pm_runtime_disable(dev);
> > > >                 return -ENODEV;
> > > > @@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *client)
> > > >
> > > >  static int at24_remove(struct i2c_client *client)
> > > >  {
> > > > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > > > +
> > > >         pm_runtime_disable(&client->dev);
> > > >         pm_runtime_set_suspended(&client->dev);
> > > > +       if (at24->has_supplies)
> > > > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
> > > >
> > > >         return 0;
> > > >  }
> > > >
> > > > +static int __maybe_unused at24_suspend(struct device *dev)
> > > > +{
> > > > +       struct i2c_client *client = to_i2c_client(dev);
> > > > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > > > +
> > > > +       if (at24->has_supplies)
> > > > +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > > > +                                             at24->supplies);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused at24_resume(struct device *dev)
> > > > +{
> > > > +       struct i2c_client *client = to_i2c_client(dev);
> > > > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > > > +
> > > > +       if (at24->has_supplies)
> > > > +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > > > +                                            at24->supplies);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume);
> > > > +
> > > >  static struct i2c_driver at24_driver = {
> > > >         .driver = {
> > > >                 .name = "at24",
> > > > +               .pm = &at24_pm_ops,
> > > >                 .of_match_table = at24_of_match,
> > > >                 .acpi_match_table = ACPI_PTR(at24_acpi_ids),
> > > >         },
> > > > --
> > > > 2.18.0
> > > >
> >
> >


