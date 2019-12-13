Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8073D11EDA4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 23:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfLMWS7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 17:18:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:38812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfLMWS7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Dec 2019 17:18:59 -0500
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E42F2073D;
        Fri, 13 Dec 2019 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576275538;
        bh=SiOkwFwElyGHnHvBcMZ/ANt/N/f5alpmyUQarKA91OQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dKotVCWpFC6K6Ukvxk2yN/MboQoSH40mlCGZfL+AQgIb9KW5IC3bVZLIXGt4T+oh3
         ecyuHY/dIPlhQ/f9GEOZUCm+SKFkf9yrJYR6i5cpMtUoCVUuDENNciEplbAIwU00g/
         aAyok9YNGrZfd4kcO3+DgjorWklnpmoXVBoTo6ag=
Received: by mail-pl1-f171.google.com with SMTP id g6so1806836plp.7;
        Fri, 13 Dec 2019 14:18:58 -0800 (PST)
X-Gm-Message-State: APjAAAWIv0376eZ+df35DdHdXBY70yV1BEFlNunjs+vXg9CQtJkX3WM6
        8HA/4/wf49lj4gOKrdRRrzXPhvqSZVrLtM1SSQ==
X-Google-Smtp-Source: APXvYqyr51fniozMNKvMYlVmGS7rD5sWQN+BGHgVnRNmkNSL4e1Cz7vTZuUAWsBrt3ktL39fHBvUqLtIefHakH18m8s=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr13414497qvn.79.1576248718360;
 Fri, 13 Dec 2019 06:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com> <20191213081230.23494-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191213081230.23494-2-bibby.hsieh@mediatek.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Dec 2019 08:51:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sZQo+k0b_MhPz8oST8GcLaCcho3R+kNLLL2zFUit81w@mail.gmail.com>
Message-ID: <CAL_Jsq+sZQo+k0b_MhPz8oST8GcLaCcho3R+kNLLL2zFUit81w@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-binding: eeprom: at24: add vcc-supply property
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 13, 2019 at 2:24 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> In some platforms, they disable the power-supply of eeprom due
> to power consumption reduction. This patch add vcc-supply property.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
