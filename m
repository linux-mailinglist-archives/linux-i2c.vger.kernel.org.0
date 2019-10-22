Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EA1DFB9B
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 04:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbfJVCZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 22:25:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41047 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729573AbfJVCZd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Oct 2019 22:25:33 -0400
X-UUID: caea0f03342d45e499b882d25fcff76c-20191022
X-UUID: caea0f03342d45e499b882d25fcff76c-20191022
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 361787558; Tue, 22 Oct 2019 10:25:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 22 Oct 2019 10:25:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 22 Oct 2019 10:25:26 +0800
Message-ID: <1571711126.561.2.camel@mtksdaap41>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Date:   Tue, 22 Oct 2019 10:25:26 +0800
In-Reply-To: <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
         <CAAFQd5DuETr-N8efWYz7F-qrw1R-gL6fss2Ag1XezapojiakhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2019-10-18 at 18:24 +0900, Tomasz Figa wrote:
> Hi Bibby,
> 
> On Fri, Oct 18, 2019 at 5:26 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> >
> > Although in the most platforms, the power of eeprom and i2c
> > are alway on, some platforms disable the eeprom and i2c power
> > in order to meet low power request.
> > This patch add the pm_runtime ops to control power to support
> > all platforms.
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
> >  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 2cccd82a3106..68ced4f25916 100644
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
> > @@ -91,6 +98,8 @@ struct at24_data {
> >
> >         struct gpio_desc *wp_gpio;
> >
> > +       bool has_supplies;
> > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> >         /*
> >          * Some chips tie up multiple I2C addresses; dummy devices reserve
> >          * them for us, and we'll use them with SMBus calls.
> > @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
> >         at24->client[0].client = client;
> >         at24->client[0].regmap = regmap;
> >
> > +       regulator_bulk_set_supply_names(at24->supplies,
> > +                                       at24_supply_names, AT24_NUM_SUPPLIES);
> > +       err =  devm_regulator_bulk_get(&at24->client[0].client->dev,
> > +                                      AT24_NUM_SUPPLIES, at24->supplies);
> > +       if (err == -ENODEV)
> > +               at24->has_supplies = NULL;
> 
> has_supplies is a bool, so the right value would be false.
> 
> > +       else if (err == 0)
> 
> nit: One would typically use !err here as the condition.
> 
> > +               at24->has_supplies = !err;
> 
> In this branch, err is always 0, so !err is always true and we can
> just directly assign true to the field.

Got it.
> 
> > +       else
> > +               return err;
> > +
> >         at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
> >         if (IS_ERR(at24->wp_gpio))
> >                 return PTR_ERR(at24->wp_gpio);
> > @@ -701,6 +721,14 @@ static int at24_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, at24);
> >
> > +       if (at24->has_supplies) {
> > +               err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> > +               if (err) {
> > +                       dev_err(dev, "Failed to enable power regulators\n");
> > +                       return err;
> > +               }
> > +       }
> > +
> >         /* enable runtime pm */
> >         pm_runtime_set_active(dev);
> >         pm_runtime_enable(dev);
> > @@ -713,6 +741,9 @@ static int at24_probe(struct i2c_client *client)
> >         pm_runtime_idle(dev);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> > +               if (at24->has_supplies)
> > +                       regulator_bulk_disable(AT24_NUM_SUPPLIES,
> > +                                              at24->supplies);
> >                 return -ENODEV;
> >         }
> >
> > @@ -725,15 +756,48 @@ static int at24_probe(struct i2c_client *client)
> >
> >  static int at24_remove(struct i2c_client *client)
> >  {
> > +       struct at24_data *at24 = i2c_get_clientdata(client);
> > +
> >         pm_runtime_disable(&client->dev);
> >         pm_runtime_set_suspended(&client->dev);
> > +       if (at24->has_supplies)
> > +               regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
> 
> It's a weird behavior, but pm_runtime_disable() doesn't guarantee that
> the device is actually resumed after the call returns. See [1].
> We should move the regulator disable before we call
> pm_runtime_set_suspended() and add !pm_runtime_status_suspended() as
> an additional condition to the if.
> 
OK, I will modify it in the next version.

> By the way, that behavior is actually contradicting other parts of the
> runtime PM core. For example pm_runtime_active() returns true if
> dev->power.disable_depth is non-zero, but as per the above, the device
> could as well be suspended. Rafael, is this expected?
> 
> [1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/base/power/runtime.c#L1316
> 
> > +
> > +       return 0;
> > +}
> > +
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
> >
> >         return 0;
> >  }
> >
> > +static const struct dev_pm_ops at24_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
> 
> Do we also need pm_runtime_force_suspend() and
> pm_runtime_force_resume() as system sleep PM ops or it isn't possible
> for the device to be runtime active when entering the system suspend?
Yes, you're right, I will add those two function as system sleep PM ops.

> 
> Best regards,
> Tomasz


