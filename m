Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F39146757
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 12:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAWL4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 06:56:41 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45816 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgAWL4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 06:56:40 -0500
Received: by mail-qk1-f196.google.com with SMTP id x1so3046633qkl.12
        for <linux-i2c@vger.kernel.org>; Thu, 23 Jan 2020 03:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F/2KPQtSzRotZCU3BsbyYy1dT+kOVxFeIJwpYbN73B8=;
        b=E/m1+GsFQspn4ij7nkTwwBzr6wXwTGgh7m96Zphb0PWWDNl3M56Kjg44CXJy9w4RPr
         uT1FWlRX6Z3wFFJkWIsXswVLyCOrWuyXi4r7+6c5Zum2iXYouF+c2Z7yxEHvqE6/gvsZ
         QkCFlzH05pHmytTKYHM+gPv1/ISo0KNyZxpfV8sxd+3d+lXWmbNQHxpAZzRVKQmvqa5s
         jTEfsBZ8eHLFdFccviv6HU/M8kh2cAcjrpvA2cHr2nFc4UZuG2jAVTzdYQNleJAR2Eh/
         ogLHPIRtYzLMjoV0jnmmFicEZaCKq32FEsrWSjgBBS8JFszWuwlhKo39MbL1dbygUuVB
         LybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F/2KPQtSzRotZCU3BsbyYy1dT+kOVxFeIJwpYbN73B8=;
        b=LroXTTJbTzGOQZnLV3v6U8P9sJ7v83nOvzi4SO/LkAeieA5fMz+Knl4Lz89Wn0ArRc
         pPRaf+49wu0ChaMv0Q8eoUnxx+LBIlRGveD8rLfcfH3TXS1xiupdzJ5Ikzrdg3LBe3U0
         wOo5fdobFdu94PYGImd21u4Yi/MDakgMCDqvwocVSDkmG44oFKZX4wnlEm9TSYK/cOCN
         ZLGzgcEIrCRFNVRBdLldZ5QNiv0F4TUb6mkh/xHzmBtMC5Er8Dv9eHVHormUP7Y2yHct
         mG845JcZPcR/ERnznNkUX4uKhKdb3AS8CYc3nk/0LNrkZEI6vggGPKhf1W2po6ywh6X4
         3tbQ==
X-Gm-Message-State: APjAAAXiR0dpYZT8ijz4fjd/onwdY4I1L2MVLz3BwEsplkzoTTnM2KSE
        ev98F6YP664Ed1Jc95yCz9YQrsqp9+D5mhEsMWkbPg==
X-Google-Smtp-Source: APXvYqztJGL6tq3pImYUBMLNHZIzAMZ2hwl4thd2Gg1yP3KP0rJmmVe5XB5SW2veik39aCl3QCyPc0NbE/qCHlbYg1U=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr14812018qkc.21.1579780599771;
 Thu, 23 Jan 2020 03:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-4-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-4-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 Jan 2020 12:56:29 +0100
Message-ID: <CAMpxmJX=qh3oSgOtB6ciKG2tJW5VvYXEqw7ZWPM21_ynaXe++w@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 16 sty 2020 o 03:56 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom are alway
> on, some platforms disable the eeprom power in order to meet
> low power request. This patch add the pm_runtime ops to control
> power to support all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Patch applied.

Bartosz
