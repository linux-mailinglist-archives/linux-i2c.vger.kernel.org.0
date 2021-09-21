Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE365413782
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 18:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhIUQYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Sep 2021 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbhIUQYj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Sep 2021 12:24:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57827C061756
        for <linux-i2c@vger.kernel.org>; Tue, 21 Sep 2021 09:23:10 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z24so57669018lfu.13
        for <linux-i2c@vger.kernel.org>; Tue, 21 Sep 2021 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uGB3KIWuUU5+UMhmxjUiQs+FGymSex7dUZpVcp4T9dw=;
        b=Bm1nRp21JyJReP1yYlxUgMG25ALeM66YI75gB0J79CC1/LkBaEYPn5GboYdTp2+8O6
         l3V+kkTUQ++qJPJx+n418dXu/OyorhyEGaTAIt0J3e7hk+q7gnVz3HA8Dr5OuOjgQWc2
         cx073pHVSY+BSKqpb/ytvZQRPksBCgnpeRRojL8Yq9aA3EroFA9nj966+8FoJo+mcffI
         ZsNKlICnlaA9wwmcBxxzX7+rMmooJoggwzu90+NA+pYEfjxGy0JO2MycIpzqiHm37uht
         CN4bX0alHqojNa+kKMDloU8pPe2HtmuFZRuJbOpjcal88HwJ5+RImVWr5IGteHJNL2wx
         ab9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uGB3KIWuUU5+UMhmxjUiQs+FGymSex7dUZpVcp4T9dw=;
        b=Y1BfTCr/LMST128K6Ai1TI/swd43fTRiZI+TDANmgmgYMsUh0nLtVqpH0Ax0kJZRNg
         rlF88D7RdDNQ1I3taGuoioNBsiJLa6DONICeWuW0qvetlYuDC7Sq7y9ATfIpkF6C2vNA
         E3erLkRJRxzhOTe49J0kHnxFFOuvLucmo5cPgnfdt3UVe9AZ2g535x0LReyW3eZZRcJ8
         Bj9z4833iV6G/eDpu77Mwv/PUiMAGRUDu+2iDJDElFtWfOutEn3gxIT9a1SlM/8bxL1U
         BYPJeV3Iuk8hPSaJ8XraEKeMh4DEgte4e/XWipTt/2Zt+TM8tPYlnMchEd7JI5E3nxMR
         w2sg==
X-Gm-Message-State: AOAM533P8Cbes16yT51oixQLEEPNJs+O3lKhtrft7ew3O99dN0q5fVqA
        rCEMhb8lwLt8Bt+wqOjRlOWt3FPeR353km7HfHkqkA==
X-Google-Smtp-Source: ABdhPJzKaepZfzeZo+OmR86T4T1kRGRS8Fl4K7TWvr5VSuyb/bkqERay8zcuxyXKtRA4wwTwhqTm3YxYntrkQhU0Z/4=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr22499331lja.145.1632241388707;
 Tue, 21 Sep 2021 09:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210920214209.1733768-1-vladimir.oltean@nxp.com> <20210920214209.1733768-3-vladimir.oltean@nxp.com>
In-Reply-To: <20210920214209.1733768-3-vladimir.oltean@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Sep 2021 18:22:57 +0200
Message-ID: <CACRpkdZ085p_qUOXUGiA5jru8fsj-ZqbEFtANGvaO-=FevktDA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] net: dsa: realtek: register the MDIO bus under devres
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 20, 2021 at 11:42 PM Vladimir Oltean
<vladimir.oltean@nxp.com> wrote:

> Fixes: ac3a68d56651 ("net: phy: don't abuse devres in devm_mdiobus_regist=
er()")
> Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> Reported-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
