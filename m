Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797E0654DF2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 10:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235452AbiLWJAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Dec 2022 04:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbiLWJAh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Dec 2022 04:00:37 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 146D6357BC;
        Fri, 23 Dec 2022 01:00:34 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Bx1vAxbqVjJQ0IAA--.17901S3;
        Fri, 23 Dec 2022 17:00:33 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxzr4ubqVjuz0JAA--.14684S2;
        Fri, 23 Dec 2022 17:00:31 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V8 0/4] i2c: ls2x: Add support for the Loongson-2K/LS7A I2C controller
Date:   Fri, 23 Dec 2022 17:00:48 +0800
Message-Id: <cover.1671688961.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxzr4ubqVjuz0JAA--.14684S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXrW3uw4UXr4xWry3tw13Arb_yoWrCFy5pa
        98u398Kr4qyr17KFn3JF1ruFyFgws3Gayjgr47Gw13uanrWr18Aw4fKa4a9r17Cr98GFWj
        qFZ0gFn0kFyDArJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
        aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
        6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
        CTnIWIevJa73UjIFyTuYvjxUcbAwUUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all:

This patch series adds support for the I2C module found on various
Loongson systems with the Loongson-2K SoC or the Loongson LS7A bridge chip.

For now, the I2C driver is suitable for DT-based or ACPI-based systems.

I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
and Loongson-2K0500.

Thanks.

Changes since V7:
- patch (3/4)
  - I2C_LS2X should be added to the Kconfig/Makefile in Latin
    alphabetical order;
  - To avoid repeated type conversions, 'struct ls2x_i2c_priv *priv'
    replaces 'struct i2c_adapter *adap' as the function parameter,
    e.g. ls2x_i2c_start();
  - Refactor ls2x_i2c_stop() with readb_poll_timeout(), mainly with
    LS2X_SR_BUSY to indicate the status (success/timeout) of the stop
    command;
  - Remove extra parentheses;
  - For consistency, the variable 'r' in ls2x_i2c_probe() is renamed to
    'ret'.

Changes since V6:
- patch (1/4)
  - Add Reviewed-by tag.
- patch (3/4)
  - GPL-2.0 -> GPL-2.0-only;
  - Add property.h;
  - writew() should be used to operate I2C_LS2X_PRER, and drop the
    suffix of I2C_LS2X_PRER_LO/I2C_LS2X_PRER_HI;
  - Drop ls2x_i2c_priv->dev, for it can be completely replaced by
    'adapter.dev.parent';
  - Reasonable return value handling in ls2x_i2c_xfer_one();
  - Dropping the I2C_M_STOP flag judgment, the stop parameter of
    ls2x_i2c_xfer_one() represents the last msg;
  - Add comments for subsys_initcall();
  - Code formatting, such as dropping unnecessary blank lines.

Changes since V5:
- patch (1/4)
  - Add property.h.
- patch (3/4)
  - Put the ls2x_i2c_reginit() in front of irq requst;
  - Refact ls2x_i2c_adjust_bus_speed: discard the magic value of
    the divider register and LS2X_I2C_FREQ_STD is used to calculate
    the frequency;
  - Drop useless parameters: priv->suspended, and also disable I2C
    interrupts during suspend;
  - Drop ls2x_i2c_remove(), for the adapter will be auto deleted on
    driver detach;
  - Drop MODULE_ALIAS;
  - Code formatting, such as alignment.

Thanks Andy for your comments.

Changes since V4:
- patch (1/4)
  - Drop unneeded headers: of.h;
  - xxx_props -> xxx_properties.
- patch (2/4)
  - Add interrupt headers to fix syntax error found by Rob.
- patch (3/4)
  - Drop atmoic loop in ls2x_i2c_master_xfer(), I have tested it on the
    appropriate environment with no problems;
  - Define the corresponding bits in I2C_LS2X_CTR to avoid magic
    numbers;
  - dev_get_drvdata() is used to get ls2x_i2c_priv() in
    ls2x_i2c_suspend();
  - i2c_add_adapter() -> devm_i2c_add_adapter();
  - SET_SYSTEM_SLEEP_PM_OPS() -> DEFINE_RUNTIME_DEV_PM_OPS();
  - Code formatting, such as alignment.

    Details: https://lore.kernel.org/all/Y4e%2F6KewuHjAluSZ@smile.fi.intel.com/

Changes since V3:
- Addressed all review comments from v3
  - Change the changelog text to make it clearer (1/5);
  - Fix some minor bugs, such as formatting issues (2/5);
  - Fix some formatting issues (3/5);
  - Deep refactoring of code for clarity (4/5).
     Details: https://lore.kernel.org/all/Y4S2cnlAm3YYvZ8E@smile.fi.intel.com/

Thanks to all for their suggestions.

Changes since V2:
- Addressed all review comments from v2
  - Drop of_match_ptr() in i2c-gpio to avoid potential unused warnings
    (1/5);
  - Introduce i2c_gpio_get_props() function as the generic interface
    to get i2c-gpio props from DT or ACPI table (2/5);
  - Refact ls2x i2c code, similar to removing excessive goto tags (4/5).

Thanks to Andy and Mika for their suggestions.

Changes since V1:
- Remove the function of getting the static i2c bus number from ACPI "_UID";
- Fix build warning from kernel test robot.

Binbin Zhou (4):
  i2c: gpio: Add support on ACPI-based system
  dt-bindings: i2c: add Loongson LS2X I2C controller
  i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
  LoongArch: Enable LS2X I2C in loongson3_defconfig

 .../bindings/i2c/loongson,ls2x-i2c.yaml       |  51 +++
 arch/loongarch/configs/loongson3_defconfig    |   1 +
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-gpio.c                 |  28 +-
 drivers/i2c/busses/i2c-ls2x.c                 | 366 ++++++++++++++++++
 6 files changed, 448 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ls2x.c

-- 
2.31.1

