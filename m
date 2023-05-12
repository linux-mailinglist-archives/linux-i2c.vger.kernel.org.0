Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772DB700430
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 11:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240404AbjELJpd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 05:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240606AbjELJos (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 05:44:48 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C67612E82;
        Fri, 12 May 2023 02:44:09 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7577ef2fa31so1859657385a.0;
        Fri, 12 May 2023 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683884648; x=1686476648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=walULA5GXaP1Ds+NR7kLlfHXMwiCqcKU/HbSWG2/bBU=;
        b=sqSsC09DP5vS7f29/1grNSwWzCl2MVecmSgTwQ2EFc/FdL1aq9uk9gWgqfvJu4iBin
         F5y3GZkjjd6u72PAp6RCiaKXYgW09KIXbh8T9nuTVsLgi9gcQ8YyddZK0F3uxlEGRe+W
         65OZpsYAVDMK2zuehPyYeWsn0oWx/g3pN2uZNQPEYOYvEh87qU4mpLnwG8/JopofjP1I
         DxevgZWI5dzfErBoYQs9M6n22TEY0WC6Yt8p7l4SB0pxL+9Y+E8NEzv2GyAZIAyvpEr0
         YOJIiiVYbPr+ku3utP3GGT+wl0UFJiGBKztsbxLA+kF5Y9P3pHsL3pyaiegkeXeCaTcq
         MAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683884648; x=1686476648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=walULA5GXaP1Ds+NR7kLlfHXMwiCqcKU/HbSWG2/bBU=;
        b=G1xCK/VNs8Z01kd5hH+jPNEk3aKbUjckpExvV3upqQdTZWP+yybP4N5k5TXKIZYzeu
         9KCVQsUwF0uJ1/RlM6NIvVU8ZTQb0FGVPx/tkLgRLwGb5KHATCKUviW3k2VcEHuecw56
         mh/PH60WwWWVmtxV2EKrxI2Dwpf63Q2seJXQDiE/uCckgWGU/2rPxF2RLdyNA0TnTo7r
         JMsqwgvDHM22nxoeKgv9ldhhS5RmFBSnkY9YH9hCVPmolI21uEHaIeaLYwgRTQxae9cs
         IVa2SGUIhv4NyK1jSrMUrIbVgN/2YTIVjXd+TiT5d/bhRJPkNCptAdUp3xoCeFAOTr3t
         Q/Lg==
X-Gm-Message-State: AC+VfDysGIvREVcwXK4ZuQu86Hru0iJw0P9HZNRcYlO4MuFEfnMD3h1Z
        C5mZDysaGcdjaorHi5lO9+vCTsVBRMElDd2Rdy8=
X-Google-Smtp-Source: ACHHUZ4mqn546jiUsKSUmsQb4vfQOt2zvNLc3McQ/r/bigtLwhrNE/6Dt4wsuoRDCyRwuvMwDCPLoC3QQ+XLZbAmjPA=
X-Received: by 2002:a05:6214:b6b:b0:61b:6382:4579 with SMTP id
 ey11-20020a0562140b6b00b0061b63824579mr38845303qvb.9.1683884648528; Fri, 12
 May 2023 02:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-7-jiawenwu@trustnetic.com> <ZF1T62BnVFgR33w0@surfacebook>
 <000001d984af$c9bc89e0$5d359da0$@trustnetic.com>
In-Reply-To: <000001d984af$c9bc89e0$5d359da0$@trustnetic.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 May 2023 12:43:32 +0300
Message-ID: <CAHp75Ves+PdNk0KaSLiwd0ozXEZAH_tQLUS4VUm_1Hvk6vBP4w@mail.gmail.com>
Subject: Re: [PATCH net-next v7 6/9] net: txgbe: Support GPIO to SFP socket
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
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

On Fri, May 12, 2023 at 11:58=E2=80=AFAM Jiawen Wu <jiawenwu@trustnetic.com=
> wrote:

...

> > > +   switch (type) {
> > > +   case IRQ_TYPE_EDGE_BOTH:
> > > +           level |=3D BIT(hwirq);
> > > +           break;
> > > +   case IRQ_TYPE_EDGE_RISING:
> > > +           level |=3D BIT(hwirq);
> > > +           polarity |=3D BIT(hwirq);
> > > +           break;
> > > +   case IRQ_TYPE_EDGE_FALLING:
> > > +           level |=3D BIT(hwirq);
> >
> > > +           polarity &=3D ~BIT(hwirq);
> >
> > This...
> >
> > > +           break;
> > > +   case IRQ_TYPE_LEVEL_HIGH:
> > > +           level &=3D ~BIT(hwirq);
> >
> > ...and this can be done outside of the switch-case. Then you simply set=
 certain
> > bits where it's needed.
> >
> > > +           polarity |=3D BIT(hwirq);
> > > +           break;
> > > +   case IRQ_TYPE_LEVEL_LOW:
> > > +           level &=3D ~BIT(hwirq);
> > > +           polarity &=3D ~BIT(hwirq);
> > > +           break;
> >
> > default?
>
> Do you mean that treat IRQ_TYPE_LEVEL_LOW as default case, clear level an=
d
> polarity firstly, then set the bits in other needed case?

level &=3D ...
polarity &=3D ...

switch () {
case X:
  level |=3D ...
  break;
case Y:
  polarity |=3D ...
  break;
case Z:
  ...
  break;
default:
  ...handle error...
}


--=20
With Best Regards,
Andy Shevchenko
