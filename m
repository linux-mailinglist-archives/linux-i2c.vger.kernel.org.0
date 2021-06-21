Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559DE3AE19F
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jun 2021 04:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhFUCUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 22:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhFUCUP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Jun 2021 22:20:15 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931E6C061756
        for <linux-i2c@vger.kernel.org>; Sun, 20 Jun 2021 19:18:01 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a6so5367672ioe.0
        for <linux-i2c@vger.kernel.org>; Sun, 20 Jun 2021 19:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sC+CWqmXSvQbdEzFj6mik48sZrpR2zcfHhg4ZTETBBE=;
        b=kU1bnKG9ZtCmpLWsP6YXUdugCf0ACmvDyukn1JMuevjRIfI5H8OQa4cTUPk1+nByFz
         BYt6TVpKcaY+2DZ3UElO6WX3dn8XlZTncNElItaOFM2G+yJq325tZWhFECqIytxm9zIG
         Lw9VW4OXdrx8DApt914a1xHAlvilxRVueAIK2U2oky7b/C4D7Hj2e05tLR6XV6qNVgJj
         El+gS3BtIyITh2lIfJ14Jrm3tOJ9UIvRv9T93fc4eMdfC/TLzmoknVxmnMTl/M3EXiK+
         SWZz5XdakhYh4FW1A7dcQmf095EbpDt6QlmalAQncWGAyZ38yAr21fZDbccKx56bIgdP
         gOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sC+CWqmXSvQbdEzFj6mik48sZrpR2zcfHhg4ZTETBBE=;
        b=ImgvlhPyDotSHw/E/+QMro49fFxMR/qorGpt9SeEuGdVkI2xpwz9YDl28lHgQmq+r6
         0ibXzh0pv3ZLnvK5h27TY/Tl3Bke5HzdvGyv3gAR9dBr5T+AGrR4vXiGQbBtTa+Czg+u
         aV0luEholF+pJb2tCXWYynPfn2FwJeYMFLz3CUIBV92+TlQOcD3HZkzKhxsNo1RumTp7
         qL44zuv5CZRbhTxBj9Zj0q6gC6IL+hBZaokh+RgCs2q25F2lEsTnVsSzXGOQr8va3Cj4
         dICGw4R2V+s2ZpU0isgxnUI91I48HNGAFsUstxmLNjJa6iMw1YgNvgEOf/zDdmoAzjJf
         ouig==
X-Gm-Message-State: AOAM532JkBQqz5b2/8Ufhw6KCT5t6kR8aZhnmLHBaVFXKXun9e1r9NI4
        JffSr8eZH1RV4QCx0bqR3LO0N5VEAIuqKfD4b/6BZw==
X-Google-Smtp-Source: ABdhPJw362ru0c9lLnP975ktgy0BRnIsfVZHKqh07ExNCmbCaUdaW2PAjvmuiDnJ0QjIWUWJZx+zduzSSz6vpSUvFPA=
X-Received: by 2002:a05:6602:38d:: with SMTP id f13mr18110750iov.109.1624241880641;
 Sun, 20 Jun 2021 19:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624094597-23993-1-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1624094597-23993-1-git-send-email-kewei.xu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 21 Jun 2021 10:17:49 +0800
Message-ID: <CA+Px+wUo1T6qesMudkOo7+9EP6bLOT4Akzj8DOEg5EG_kQcHjw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Isolate speed setting via dts for special devices
To:     kewei.xu@mediatek.com
Cc:     wsa@the-dreams.de, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 19, 2021 at 5:23 PM <kewei.xu@mediatek.com> wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), the I2C timing calculation has been revised to support
> ac-timing, revised to support ac-timing adjustment, however that will
> break on some I2C components. As a result we want to introduce a new
> setting "default-adjust-timing" so those components can choose to use the
> old (default) timing algorithm.
Could you provide a proper "Fixes" tag.

> @@ -544,6 +558,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
>                                        OFFSET_HS_STA_STO_AC_TIMING);
>                 }
>         }
> +       mtk_i2c_writew(i2c, ext_conf_val, OFFSET_EXT_CONF);
This looks like another fix.  Could you separate this into another
patch or explain more why it needs to be in the patch?

> @@ -1284,6 +1355,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> +       i2c->default_timing_adjust =
> +               of_property_read_bool(np, "mediatek,default-timing-adjust");
Need a DT-binding document patch for the newly added property.
