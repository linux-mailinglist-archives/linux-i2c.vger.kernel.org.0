Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7006897EC
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 12:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjBCLlG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 06:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjBCLlG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 06:41:06 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA2B9B6FB;
        Fri,  3 Feb 2023 03:41:05 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id lu11so14607300ejb.3;
        Fri, 03 Feb 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OpfCD/nYdWbkzAMhGA6hgTs89Fl0cSbPYWaIPLMsm4=;
        b=dsN7o1iwFoCKPfA0laC1qZhAUvPRDHEks1m0+39QRirq+/7iaIrjHsSDizvgGnDZ9L
         kbCZnoMYpyOaSJGNbJLGeiiAptWvorFWQUbF3b2Kq2TqsM6rQouF3B9ILeMosmhBFif2
         +pf06Ho+F9NJuIOgoGOPQRgqYB8fE/7dAcEsiyEFIBVSkyFayRTZzXgIZ0HcBWpdR+h7
         fln9eEZluS8ig4tkIPIQa8RHfH5MPlSlyczyptcuZtt3+J7H+WH26T/j2VQHP7cowkV6
         D9QonUGaIgmqS3+xyQ6AS+in9UPsoEoNIGF3COyfB9kngdWLNisSXRPSXMlrUGf4Z1ZU
         vX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OpfCD/nYdWbkzAMhGA6hgTs89Fl0cSbPYWaIPLMsm4=;
        b=VtoyN6bg++AstJ6hsbHegqOMMvDW9qNjVhyC9degQAFijpLLR9RSD96SWaurjQtYf0
         jDiMwyn9RnUKmhKNZbijTfBqSnKX/51DYvFhk0ZDZ4LXLmeGgN9Qfg1phzWf954J4Vll
         AaYtuZJJunaRUild11AzCdERwSUSJiE8hX1nUX7xx0Xai9RPRbrHDqPGoqxKYRK6pivc
         Dnxh+j043Znq+wLGBKUuXC02pJa44/8gs65O0Bgno/bbcLk4WnD2M/JOZgzuFFUXYeAt
         NDW+SC5WwLN8jX6Zgj6S/AOYsvuunAbO2TOFWNpgKJ7FlUnm28ywv27QBl86+dmjxq10
         abNA==
X-Gm-Message-State: AO0yUKUpaKLmPAbko4MCFfleZM6A7oglY5CjtmL4V77lM4RZQO2OHZF8
        AkSXxH+AVVbDyIC+0CptCHY+lB46AOCwDZebQBw=
X-Google-Smtp-Source: AK7set+y2wUtK/2KjhH2aoRvSw8s86PnaVFsAwkyCF0LLubxZmD5HOVAsUVA2eqx+ktrLDtbAowSynJem3PgpDUkTcY=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr2899883ejb.237.1675424463623; Fri, 03
 Feb 2023 03:41:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675167975.git.zhoubinbin@loongson.cn> <c6d7ee649e73536c62f665d11b0504029bd5613a.1675167975.git.zhoubinbin@loongson.cn>
 <Y9wqcWHBO9y/xKfO@ninjato>
In-Reply-To: <Y9wqcWHBO9y/xKfO@ninjato>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Fri, 3 Feb 2023 19:40:51 +0800
Message-ID: <CAMpQs4++P2yBG-+FH_DhNvWgd9ynhWSuYmaod=Z0j8eQJ3ResA@mail.gmail.com>
Subject: Re: [PATCH V11 2/3] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To:     Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 3, 2023 at 5:26 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Tue, Jan 31, 2023 at 08:37:31PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> Applied to for-next, thank you and all the reviewers!
>
> If you like to maintain the driver, please send an addition to the
> MAINTAINERS file in a seperate patch. That would be great!
>

Of course, I'd like to do that, and the patch is coming.

Thanks.
Binbin
