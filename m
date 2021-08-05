Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F0A3E1C2B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 21:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242295AbhHETJ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 15:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242452AbhHETJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 15:09:20 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C329C0613D5
        for <linux-i2c@vger.kernel.org>; Thu,  5 Aug 2021 12:09:04 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z5so9006614ybj.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Aug 2021 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=66klr3RRk6o66gBKNdZEM7W2NMGH3F3MK/aEyxf87PI=;
        b=n/RdEz7x4Hdz972oDHKkOLKisyM+jGDoux+WTvW8scFrttaTpF7jvhZvrEe7sA0E/9
         AA5A5hzv/R7EUmAyoHMqBw1MeqDbJFfK1idnqIjR26dLjaJiwb6qdHMck+n2WqUqZZw/
         TB1Hab00zIU6gIG8ODCyQIV5VKvKstBT8cqdWR/3VMIqObWAAdCkWmp7YDPM381priUE
         IYlETrBGENW2IEIL5h6+nEJvgZHohoYMLp275zXc7+u8ZoFtBYPbzbOIFPxhKdj4kYl4
         CApL86Zh+6UveyxJtjeM6FqW6Hh97L8R+Jcpq7ZpWm7ZrKkAYhIAFArfgyssbthugUDm
         6UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66klr3RRk6o66gBKNdZEM7W2NMGH3F3MK/aEyxf87PI=;
        b=pSOfQd1+iExLPAH3eiuD5D93M7zU5nTL3YDv0GlaKtyz2tnVoQ7w1TUPhhWMkFoUzX
         N9WA/SXZ/GL6pmJWVb/ey3gRcM5cvz3oKFr2mU7/F8tckyoRwHAkL/41xp9Jz8rSj4uX
         +5sFvTxVqVSIPhty42yoRB/vfWH3AOT30Eh2TJdnI46KKNMw0TQeF3l3Mu4tyo0/0qru
         lKO18wiRlfIF04/yNCJHGA+EDvW/eHLY3n4ZP+RuRU5ypHGwa8QfjcOEa9dgg7/BKpZd
         ZLwWpAgVCKoYnaA5vs9jClxUm4skG9nyB6FjYQS2tT8zIa0KYKdNeXUAGANcx0nuiY1E
         SQTQ==
X-Gm-Message-State: AOAM530DSIMAsHZSenz5xbimzayrlCTA/R2B0/Cg2v8z2L7ppwK3gJTG
        +syLR1Nv2mHixm/mBodomQgsWVW794pvLykb1kvMZg==
X-Google-Smtp-Source: ABdhPJzW09jDFnZCROZvMGrpzmvOaLe++zLkGJEfyvO5tZXGesyIoWyTosfywba8jYtMHoOawEh2J1DGnf1TAwFpxf4=
X-Received: by 2002:a25:db89:: with SMTP id g131mr7906029ybf.302.1628190543546;
 Thu, 05 Aug 2021 12:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <1628105086-8172-1-git-send-email-raagjadav@gmail.com> <1628105086-8172-3-git-send-email-raagjadav@gmail.com>
In-Reply-To: <1628105086-8172-3-git-send-email-raagjadav@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Aug 2021 21:08:52 +0200
Message-ID: <CAMpxmJXsOHR0xTsMNqdqydboRiaj7iRnCSQT98uGX2woUUPVEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05
To:     Raag Jadav <raagjadav@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 9:25 PM Raag Jadav <raagjadav@gmail.com> wrote:
>
> Add bindings for ON Semi CAT24C04 and CAT24C05 eeproms,
> which are compatible with Atmel AT24C04.
>
> Signed-off-by: Raag Jadav <raagjadav@gmail.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 914a423..4c5396a 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -98,6 +98,12 @@ properties:
>            - const: nxp,se97b
>            - const: atmel,24c02
>        - items:
> +          - const: onnn,cat24c04
> +          - const: atmel,24c04
> +      - items:
> +          - const: onnn,cat24c05
> +          - const: atmel,24c04
> +      - items:
>            - const: renesas,r1ex24002
>            - const: atmel,24c02
>        - items:
> --
> 2.7.4
>

Applied, thanks!

Bartosz
