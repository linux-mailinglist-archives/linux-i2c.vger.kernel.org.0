Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D237085A1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 18:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjERQIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 12:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjERQIS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 12:08:18 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7AAE1703;
        Thu, 18 May 2023 09:07:54 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-62382e86f81so9530866d6.2;
        Thu, 18 May 2023 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684426074; x=1687018074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS9jxbX+axnd5bXEEt+yYkY4RgqfmtnBW/kiKHdToco=;
        b=RsIy4SqDAhs+Z7brn6+gm+ZtvbIvLaGnwn7ycHDoupSbN6TJ/JTdQafv01IQrE/x+x
         FEEKJaTffP/U+5lo8JIdJNZuFaHSbbx0K0i+wk4bGjPyvO/xcHMAwKWzOX1n1z9AqWw6
         d89I4aDWGda/q2YWc/fAUGMxeeRW7AYHzyTqAxP3HbaPgdka/z/E0zVNw/R1uVi2/7x7
         NlRXnUtlHL67oymngkSqyYl9GiqddLc3r0M8PLYI/oeabmdu2A434IKjp705035sKSAv
         x/YHnfQYq50AEWND/XI58ylxHnlNPIehsd7ckmNqahmozbCDoSia0uKXwng2UnhxRshF
         ZTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426074; x=1687018074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS9jxbX+axnd5bXEEt+yYkY4RgqfmtnBW/kiKHdToco=;
        b=drSF2p3nwmyV7f+W8CrLSLaHbEpuiHx7IGGRDhEuw00qyaZCdM5iXwPPTLsl0QpXiv
         vwBAIgpm0NKic2DEGZBgUtIOJRyz1GaCgIEZQY0SLs5hPw2MHHZzbHlVGWjpkIJGr6v/
         UqRvLY5yTkaBf23V9xYOPjOnVughytJuFKmTglJTFozT4WOl/8AntvrYVsy8bVzW7acS
         xZ66Dq8X7TcjIaJdkaZZh+ALoZPCC2Y2VwHpRMtutgF72Qck0UhugVdNYN/X2PyTqdAy
         gsQMh2XNQQmH9IixNh0JioWdSpOHZ3YKAZXfyiIoG1swnfVIgsircZzNRhei3xiGhQh3
         K2Sg==
X-Gm-Message-State: AC+VfDzFKX4ADLSfjPf88BURkZEzdza6Tks9xtHwVS5i4vygNiknae7z
        znl0fy2fy2t+vXo1Q6W98qxnDf4Yk7alxBCa9s0=
X-Google-Smtp-Source: ACHHUZ6gvnF9S58bI9pMsY8aym+a2Y3x0SRrUvkSDKjyIMs6BNRBmAPO+yIf3NBlEM10iLBAKoliFjo5twRV2xGuSJs=
X-Received: by 2002:a05:6214:1c83:b0:616:54c7:316a with SMTP id
 ib3-20020a0562141c8300b0061654c7316amr291124qvb.8.1684426073958; Thu, 18 May
 2023 09:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook>
 <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com>
 <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com> <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch>
 <025b01d9897e$d8894660$899bd320$@trustnetic.com> <CAHp75VfuB5dHp1U+G2OFpupMnbBJv=aHRWaBHemtPU-xOZA_3g@mail.gmail.com>
 <E27AF534-C281-4247-8A9B-FA06C8F30AB1@walle.cc>
In-Reply-To: <E27AF534-C281-4247-8A9B-FA06C8F30AB1@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 May 2023 19:07:18 +0300
Message-ID: <CAHp75Vd+CyWuH6RvzMHLMKXs2Kd_QtUJYR7RD+hkx8pxSzQTLA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
To:     Michael Walle <michael@walle.cc>
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, Andrew Lunn <andrew@lunn.ch>,
        netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 18, 2023 at 7:03=E2=80=AFPM Michael Walle <michael@walle.cc> wr=
ote:

> I'm currently (and for the next three weeks) on vacation. Sorry in advanc=
ed if the format of the mail is wrong or similar. I just have access to my =
mobile.

Have a good one and thank you for chiming in!

--=20
With Best Regards,
Andy Shevchenko
