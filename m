Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE7F712EDA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 23:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbjEZVRP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 17:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjEZVRO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 17:17:14 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A958A7;
        Fri, 26 May 2023 14:17:13 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-62388997422so8270886d6.1;
        Fri, 26 May 2023 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135832; x=1687727832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKjW/ltLnRsSKhXbLHDZF2pKsY+K7Tih6UzAixZfHXw=;
        b=gdc2tFFVGPfNpZxvol/MvToNCV3SHMn7SejsmmLeqkS6ssL1+DBhpnrIU3P0HtkF8g
         qKhJCsoWq12fQ1PHlec72kGeQbd6H8QPgwsx8MYbsEWYhN3OuVArFGEln4al4RosuSjE
         ilzDT9t2seUNvb4mZn0pFE0dCeGJ0+c7J6Ef6CgyjoboHhpRH5kCKmmnbIN/dsHCNmGl
         cvNdmg2IrC8ZxSm95pT8rC+nCMjcE8pfWBx/sq4nqHxC4ccjxoIBsl2mgSvO9iB3eQd2
         CkuHLHinIyAoqXlmp+NoMIGyP9ReKzH7HSWrt74rOqTbRiOoAWio6wRlbhvFAXJKo1IN
         1hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135832; x=1687727832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKjW/ltLnRsSKhXbLHDZF2pKsY+K7Tih6UzAixZfHXw=;
        b=Y8FkNcTOc8qN2bdc7MSEQkSDo6SZp+m1zV+mHeZ8rS1vmI+YDjyzon/vqIuU0JtZxQ
         zv6/pkqetVDRRYWFqd9qFApJwbN7s53+/rcSO2F0Kgcav2VbO9YTtZCMUenzBTH5jgl8
         sq0sJbJgfX8e/td1op564lSar851zXMgUuKuml7eLyn2ohElzzIsP2cR5veh/oRLtUX8
         G+NuYAR1NJQ7tjz7p0Sh38tUzyw95Tun4Pz3s2jAAzriAMo8IECXsOXmiti4Ft5Q27RQ
         8dONP5nt6g0RpqnZYA+fkuLEFpFyA9ErKoJctCfa17lV0dAVXRoOTeFE6wQcpu4If4mB
         SAPQ==
X-Gm-Message-State: AC+VfDyZ+BL8IUvgFM6+wOH/2DC+bMo/nD75beI6mKKKS+LSE2kGJAu/
        ld1IBlVMnEAVMD2WOPT58x4KDfCKmWkWw7Uh7Gw=
X-Google-Smtp-Source: ACHHUZ7T/wgA9geQhrwkRZ54tMRUrRL6T4pCkEhOJfPvda+DOPRb5TSBhi+duItcefg7cwyieYLeB0dtYgVeqKt0elU=
X-Received: by 2002:a05:6214:2a83:b0:625:e039:5af8 with SMTP id
 jr3-20020a0562142a8300b00625e0395af8mr3492664qvb.57.1685135832622; Fri, 26
 May 2023 14:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com> <20230525152203.32190-6-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230525152203.32190-6-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 00:16:36 +0300
Message-ID: <CAHp75Vc=HgNT8WL6pPU3cJy_J5_aC8pomBpSPbe_hDEiJugUvg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] HACK: i2c: aspeed: Comment the clock and reset out.
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        linux-cxl@vger.kernel.org, linuxarm@huawei.com,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 25, 2023 at 6:24=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Needs tidying up - hopefully can do clock right
> using on going work from Niyas
> https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+=
Clock+Management

For the current code base the easiest way is to switch to _optional
for clock, or request them based on the type of the fwnode. (Personal
preference is the _optional() API to call). For the reset isn't it
transparent already so we got a dummy control (as for regulator)?


--=20
With Best Regards,
Andy Shevchenko
