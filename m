Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6A955988F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 13:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiFXL1x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 07:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiFXL1w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 07:27:52 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921237A1B7;
        Fri, 24 Jun 2022 04:27:51 -0700 (PDT)
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5PRT-1o3Jth1xbh-001OUO; Fri, 24 Jun 2022 13:27:48 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-317a66d62dfso21616247b3.7;
        Fri, 24 Jun 2022 04:27:48 -0700 (PDT)
X-Gm-Message-State: AJIora8w2Du1p1XaboUvCpukNIH+dPZ1V306d4DKFv0TI1knxJKDmnyj
        1Yot8dUiC6yAs17J8WzlydropyxQb3g6MvUayag=
X-Google-Smtp-Source: AGRyM1v14iF6NNz3vw8ycakRouyXEFjwBmSKCXynx+3UnAmxeEnElHTBu/kJqiz7LDtkMnF/i/KJJh2js2BAGRhmzjQ=
X-Received: by 2002:a81:b93:0:b0:317:791f:3c0 with SMTP id 141-20020a810b93000000b00317791f03c0mr15711874ywl.42.1656070067217;
 Fri, 24 Jun 2022 04:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101736.27217-1-phil.edworthy@renesas.com> <20220624101736.27217-3-phil.edworthy@renesas.com>
In-Reply-To: <20220624101736.27217-3-phil.edworthy@renesas.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 24 Jun 2022 13:27:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
Message-ID: <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8zcNFJy/CtuF86EaqnF/y7xvFmZLM+ofVvr9+AWoh37FFuHQmiP
 0hL9A9eaICVd24aaqWlXLPKwCMhCqjCScBRc35uYc+BnZfUI4IFC+e7+6Uzt1ZBpieuXL2R
 ozG1rG+ayVsblxCAEUnYf4RkDOU2A5lGpAEkzvpIwPNzv0S8CbZoyMTl95xpnt+sckWWNMm
 lzm0PUfnt7IWcI9YQTRgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5cCbls/1dLU=:vwmv8ElykarjwneZtnz/vc
 p9hMpY7IYPVvm/2n6c9gp5M2kFwcXDgfymhxydyjkDSmIqbX4RCLjkwkerOruwBeYyA34oBrp
 Y3ipQAGKmF52dAMNVWAnB5GnK7idk305rWURs/95MWZNXAFnqkLRCXpJjCCn7ZhajDf81dQgP
 E/S2KvlpACYmcKEsrpLOqsgtB5dXh2fWAlfw3QQNuK3lBCiP1Lc0x4HJfEvtWptqkg2EsCxz5
 SS88hmsjTbnoGysgmyLygShjmH4u82ZmwitFd0qWz3kqVCQLnMRSaa9r0zos5qtC5ARgKLOq7
 Fu8kGxyYFp9qLKtX0t/sYtlkodRIzCCnpYpCg2ckr/IMevaiSDhFvKLsy5qDX0qK24dVxMYLj
 M10LJUbrTWvqr/kCnLz09Z1C6o1hAUDgLmAsJ9rBtApZY0by8SDH4HOOPNh3YaPDzDEYav+5f
 /psVjlEMSCBdIvo0vEBGlQ4UU3PYRc6Hm1efk0uzDtg/cQmJFHILT0ddnKsBFbDXpD/dy6DZ2
 fuVYiuWfO0p3S+2iaV8o8Rf0ZVeLsnCIwTciDtCU3KVMST9fwN088gZ4j00xfvzHb3412kjel
 CPabsLFTR7v3dLD3gnEN1WwOkXXz0CCDmq/S7Aos0ptJW/J6dJL6XUaqLTz9QpkhwmEZco0o0
 iBLomFHfurnmu72WjdFUL+neMLRRH3YhETTLZWq2B1ki15Yq5AJc5IoUUOrK1n4yRp5UPAfKU
 mEdSUKFC0tRefO8/U2orAS5ocC2zcQF9+8F1vxf3oARqxuz3SskvIkOk9rJB8IUqLS5lGm7KR
 yA3T3zVPuvTmw/ZfOAU7sklwem0nf1ysjM4Zea+ZmnzBjA2XYZ24wUufHT1+v/0f+qVDKktTD
 CY4SfZM6RXnVJ26LpYug==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
>
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

I see nothing wrong with this, just one suggestion for a cleanup:

> +#ifdef CONFIG_PM_SLEEP
> +static int rzv2m_i2c_suspend(struct device *dev)
...> +static const struct dev_pm_ops rzv2m_i2c_pm_ops = {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(rzv2m_i2c_suspend, rzv2m_i2c_resume)
> +};
> +
> +#define DEV_PM_OPS (&rzv2m_i2c_pm_ops)
> +#else
> +#define DEV_PM_OPS NULL
> +#endif /* CONFIG_PM_SLEEP */

Remove the #ifdef here, and use the new NOIRQ_SYSTEM_SLEEP_PM_OPS()
in place of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().

         Arnd
