Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7AC3476D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfFDNAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 09:00:46 -0400
Received: from mxs2.seznam.cz ([77.75.76.125]:12773 "EHLO mxs2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727033AbfFDNAp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 09:00:45 -0400
Received: from email.seznam.cz
        by email-smtpc8a.ng.seznam.cz (email-smtpc8a.ng.seznam.cz [10.23.10.225])
        id 2feada5f1be42f6c2dedeac6;
        Tue, 04 Jun 2019 15:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emailprofi.seznam.cz; s=beta; t=1559653240;
        bh=UlDA7z971vAl4+SbfYen/ut8yWZSLZyfk9hZq1g72Do=;
        h=Received:Received:X-Gm-Message-State:X-Google-Smtp-Source:
         X-Received:MIME-Version:References:In-Reply-To:From:Date:
         X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type;
        b=tWqnP6O+CaeACg+E8CBDGE4b4yFE37U+jGhQr7zJHEpEUjWyQIrIS/y5NI4d51NrM
         0RQ9XJJDdx7XPuSKG7f9YY+z25MevQMm8COVlquCHWPocn2+aYTdCi2lij/QPgauDJ
         ZkRRqQjho9qlmDf+oajM3Pq/FUwNpt31F48G3qbc=
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        by email-relay24.ng.seznam.cz (Seznam SMTPD 1.3.104) with ESMTP;
        Tue, 04 Jun 2019 15:00:38 +0200 (CEST)  
Received: by mail-lj1-f175.google.com with SMTP id a10so16347533ljf.6;
        Tue, 04 Jun 2019 06:00:38 -0700 (PDT)
X-Gm-Message-State: APjAAAUmo/9OqNF1bb7oxnT7lqplPB4NuMI5NQBGDaYWuB0S8x2JUHgr
        0j6yjDhw6FkPFAglabnTblAZSKdSCEBXnvgHmI0=
X-Google-Smtp-Source: APXvYqx80dQ2dqy238/eYpAmtM1RTiUz9MvM39Alq6Xb2Ct3dz6p9fG3rXZq2x4wGZee4KcNOz1s7JBLMGZTl9ygIQI=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr7360878lje.143.1559653236886;
 Tue, 04 Jun 2019 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190604113407.8948-1-sr@denx.de> <20190604113407.8948-2-sr@denx.de>
In-Reply-To: <20190604113407.8948-2-sr@denx.de>
From:   Jan Breuer <jan.breuer@jaybee.cz>
Date:   Tue, 4 Jun 2019 15:00:25 +0200
X-Gmail-Original-Message-ID: <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com>
Message-ID: <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

> +#define MT76XX_I2C_INPUT_CLOCK 40000000

This is peripheral clock and should be reachable by devm_clk_get() and
later clk_get_rate() should give value similar to
MT76XX_I2C_INPUT_CLOCK.
I don't have currently recent enough kernel to test it or prove it,
but I see this in openwrt I2C driver for this platform
https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patches-4.14/0045-i2c-add-mt7621-driver.patch

Kind regards,
Jan
