Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F60A4DBF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 05:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfIBDbC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Sep 2019 23:31:02 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:64872 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728926AbfIBDbC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Sep 2019 23:31:02 -0400
X-UUID: bf1fb7c38046498f9289ba2d598a6c69-20190902
X-UUID: bf1fb7c38046498f9289ba2d598a6c69-20190902
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 587805404; Mon, 02 Sep 2019 11:30:56 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Sep 2019 11:30:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Sep 2019 11:30:58 +0800
Message-ID: <1567395056.8069.0.camel@mtksdaap41>
Subject: Re: [PATCH] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>
Date:   Mon, 2 Sep 2019 11:30:56 +0800
In-Reply-To: <CAMpxmJW7bb9i9tffgwSOm5rUejo0LutmS+bsEFcA0Rv1MHrAgw@mail.gmail.com>
References: <20190829020446.27176-1-bibby.hsieh@mediatek.com>
         <CAMpxmJW7bb9i9tffgwSOm5rUejo0LutmS+bsEFcA0Rv1MHrAgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the review and comments.
I'm going to send v1 patches later.


Bibby

On Fri, 2019-08-30 at 13:58 +0200, Bartosz Golaszewski wrote:
> czw., 29 sie 2019 o 04:04 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> >
> > Although in the most platforms, the power of eeprom and i2c
> > are alway on, some platforms disable the eeprom and i2c power
> > in order to meet low power request.
> > This patch add the pm_runtime ops to control power to support
> > all platforms.
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 61 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 60 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 35bf2477693d..2843e4b4aacd 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/nvmem-provider.h>
> >  #include <linux/regmap.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/gpio/consumer.h>
> >
> >  /* Address pointer is 16 bit. */
> > @@ -68,6 +69,12 @@
> >   * which won't work on pure SMBus systems.
> >   */
> >
> > +static const char * const at24_supply_names[] = {
> > +       "power", "i2c",
> > +};
> > +
> > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > +
> >  struct at24_client {
> >         struct i2c_client *client;
> >         struct regmap *regmap;
> > @@ -92,6 +99,8 @@ struct at24_data {
> >
> >         struct gpio_desc *wp_gpio;
> >
> > +       bool has_supplies;
> > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> >         /*
> >          * Some chips tie up multiple I2C addresses; dummy devices reserve
> >          * them for us, and we'll use them with SMBus calls.
> > @@ -663,6 +672,17 @@ static int at24_probe(struct i2c_client *client)
> >         at24->client[0].client = client;
> >         at24->client[0].regmap = regmap;
> >
> > +       for (i = 0; i < AT24_NUM_SUPPLIES; i++)
> > +               at24->supplies[i].supply = at24_supply_names[i];
> 
> Please, add a newline here.
> 
> > +       err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
> > +                                      AT24_NUM_SUPPLIES,
> > +                                      at24->supplies);
> 
> This fits nicely in 80 chars - no need to break the line here again.
> 
> > +       if (err == -EPROBE_DEFER) {
> > +               dev_err(dev, "Failed to get power regulators\n");
> 
> I assume you want to make the supplies optional by only returning on
> EPROBE_DEFER, but why the error log then?
> 
> > +               return err;
> > +       }
> > +       at24->has_supplies = !err ? true : false;
> 
> Just a simple at24->has_supplies = !err is enough.
> 
> > +
> >         at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
> >         if (IS_ERR(at24->wp_gpio))
> >                 return PTR_ERR(at24->wp_gpio);
> > @@ -705,13 +725,21 @@ static int at24_probe(struct i2c_client *client)
> >         /* enable runtime pm */
> >         pm_runtime_set_active(dev);
> >         pm_runtime_enable(dev);
> > +       pm_runtime_get_sync(dev);
> > +       if (at24->has_supplies) {
> > +               err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> 
> Unrelated to this patch, but I'm surprised we don't have optional
> variants for bulk regulator operations.
> 
> > +               if (err) {
> > +                       dev_err(dev, "Failed to enable power regulators\n");
> > +                       return err;
> > +               }
> > +       }
> >
> >         /*
> >          * Perform a one-byte test read to verify that the
> >          * chip is functional.
> >          */
> >         err = at24_read(at24, 0, &test_byte, 1);
> > -       pm_runtime_idle(dev);
> > +       pm_runtime_put(dev);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> >                 return -ENODEV;
> > @@ -726,15 +754,46 @@ static int at24_probe(struct i2c_client *client)
> >
> >  static int at24_remove(struct i2c_client *client)
> >  {
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> >         pm_runtime_disable(&client->dev);
> >         pm_runtime_set_suspended(&client->dev);
> > +       if (at24->has_supplies)
> > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
> >
> >         return 0;
> >  }
> >
> > +static int __maybe_unused at24_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> > +       if (at24->has_supplies)
> > +               return regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                             at24->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused at24_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> > +       if (at24->has_supplies)
> > +               return regulator_bulk_enable(AT24_NUM_SUPPLIES,
> > +                                            at24->supplies);
> > +
> > +       return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(at24_pm_ops, at24_suspend, at24_resume);
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
> 
> The rest looks good.
> 
> Bart


