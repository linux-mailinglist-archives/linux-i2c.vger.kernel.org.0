Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56C74B12F7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 17:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244361AbiBJQhD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 11:37:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244314AbiBJQhA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 11:37:00 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3221ABB4;
        Thu, 10 Feb 2022 08:37:01 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: krisman)
        with ESMTPSA id E765C1F466A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644511018;
        bh=tmt/RUTO3WQQdc1xrkJt2F1mfYI1qJzuFPYRdC6aEGI=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=TrpH3D44v62W53owTLnERl6bRFcJUoOqSZFhzA9Z2NAZ04ntgsq5uuDzkRhShmCaP
         x3CpQpx6sZXFSQvfM+V4/gxrbKbm6YKLWpNK+BgqdHVcmGqkwceRJjITJNfEH4YFWk
         k5xhrMWx12pNnozBT4UE9Nps3G/hcSQA+xdCpltiFp7uIp1huXA65A3tZFtDSaTFPD
         dMKTpCjqTcpl3VYOSuG6cUjz97gevFUQ3HGlb4WobN2TwlWXbutOmHJ1u2qDx6/iUI
         rqQ7JA2n0InfGrSqjRJxvur/oboM3itQboY/8VpU/Pgyun8zZqRdNlUK1J0uyP8Fdx
         +1jZd7q1i0sOg==
From:   Gabriel Krisman Bertazi <krisman@collabora.com>
To:     Shreeya Patel <shreeya.patel@collabora.com>, brgl@bgdev.pl
Cc:     linus.walleij@linaro.org, andy.shevchenko@gmail.com,
        bgolaszewski@baylibre.com, wsa@kernel.org, kernel@collabora.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
References: <20211116093833.245542-1-shreeya.patel@collabora.com>
Date:   Thu, 10 Feb 2022 11:36:54 -0500
In-Reply-To: <20211116093833.245542-1-shreeya.patel@collabora.com> (Shreeya
        Patel's message of "Tue, 16 Nov 2021 15:08:33 +0530")
Message-ID: <874k56znix.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Shreeya Patel <shreeya.patel@collabora.com> writes:

> We are racing the registering of .to_irq when probing the
> i2c driver. This results in random failure of touchscreen
> devices.
>
> Following errors could be seen in dmesg logs when gc->to_irq is NULL
>
> [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
> [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
>
> To avoid this situation, defer probing until to_irq is registered.
>
> This issue has been reported many times in past and people have been
> using workarounds like changing the pinctrl_amd to built-in instead
> of loading it as a module or by adding a softdep for pinctrl_amd into
> the config file.
>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209413
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

Hi guys,

This seems to not have reached the Linus tree on 5.17.  If I'm not
mistaken, it also hasn't reached linux-next as of today. Is there
anything I'm missing here?

This is required to prevent spurious probe crashes of devices like this
FocalTech touchscreen, FT3528, when using pinctrl-amd. We've been
carrying it downstream for quite a while.

Thanks,

-- 
Gabriel Krisman Bertazi
