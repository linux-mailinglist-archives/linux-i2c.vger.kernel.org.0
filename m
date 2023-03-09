Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2803D6B22B0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 12:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjCILWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 06:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCILVw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 06:21:52 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C508EDB4F
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 03:18:01 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id w23so1509645qtn.6
        for <linux-i2c@vger.kernel.org>; Thu, 09 Mar 2023 03:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678360678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I4fxv7dHZbwQ/PFxozh2YF2GJcuEqI4Qk+wsNcnohc=;
        b=Mlp4zXdr0lUA+BvO/4VTONyolA2W1Ylcr6V/yu1bztKy0K4i/A9WrpXdfx7msRWNX6
         HLLpSVjFRK37D/5VscYfQFaFCP52wxYozQ/HZi1nm+9PBppxYe5cAZB7Sy7NqGSX2e+j
         OV6wiEr4AysIGTAu/0EBoxJgGxcYq+fRKRnEzptk/UDPUI6uG39VoCAL9XoJ1bZsZvFY
         2Y19edYuBnlkGXZaaBquUtrXgqFl1DZGLGHU+AHp/itzOAtV0bE+oTdoPkOULIy6PQuc
         ClXtV6APGT7DX87fxCrK/k/MTsCxLqLPJjwGlj6Qekk6Zd2mhxqtAAa20LfnowDC5Noh
         Pdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I4fxv7dHZbwQ/PFxozh2YF2GJcuEqI4Qk+wsNcnohc=;
        b=BlHbFwZT8J9g8NEL/MSRWvZeFhbaRKAvF1tajaVhrx/AFLaqVNrNLvuXPy5Begvb1l
         nhDg2v4BiEbydicVmcHO1Mq+1HlWARplIAOxr/IL4mmNzT2MMZAV1hsDg6su11+WYpDo
         I1mviTkNEpYkzLecNGT/OngKxIutCA8IOo26cjnX2oytRSwNb41O3SkVors3+KkwIVMR
         MRXA7R38ndA0x9KQS7MIU8JvDHxrJC6Pfcf6KqH3rsWIEzmga+nZMuHEGTMFgHwQyqbF
         6HGBop0XHExDYSkCXm0sPSFtj562mXZGOlvuxh4XOrkuRe+m3Db/yVkrQpbIuTjBBmQb
         VCNA==
X-Gm-Message-State: AO0yUKU5Si2H5f++XfEXiVO8II+Tj5GI4rQT12gKbrqQLvcG1Ua7qzOB
        /R2+cvr+aJp1L8GzMytrkjjyTjm0+MKMKS6d+18=
X-Google-Smtp-Source: AK7set/fjotVA+8WzKi5DNPkjB2SeEOp6KHuujOXwQl4px7ceywY7C9pAOsrbO2FgDVXz+Lh3SpZjyBMtHYELxAfGOg=
X-Received: by 2002:ac8:701b:0:b0:3bf:d520:1d59 with SMTP id
 x27-20020ac8701b000000b003bfd5201d59mr5594321qtm.1.1678360678448; Thu, 09 Mar
 2023 03:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Mar 2023 13:17:22 +0200
Message-ID: <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 9, 2023 at 11:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> If pm runtime resume fails the .remove callback used to exit early. This
> resulted in an error message by the driver core but the device gets
> removed anyhow. This lets the registered i2c adapter stay around with an
> unbound parent device.
>
> So only skip clk disabling if resume failed, but do delete the adapter.

Still worrisome. I would disable clock independently, but the questions are=
:
1) why the heck we need this dance with PM runtime for disabling clocks;
2) why can't we use devm_clk_get_enabled() or so in the probe;
?


--=20
With Best Regards,
Andy Shevchenko
