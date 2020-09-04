Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D8F25DBBC
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 16:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730488AbgIDOak (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 10:30:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728983AbgIDOaB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 10:30:01 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 483C320829;
        Fri,  4 Sep 2020 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599229800;
        bh=3S93tF/ignIiM43QgnWujtoIATS7BPwQ6dqnISHKtyA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XV8ablvO+fK4xp0xfyjNshid/tVnEyWkQtkPPPQfeOF4f87nnqaEtvL5J755xhn5Y
         T5s0H9LmmJLHzNgJaQS/q8PEa6Ex55mnbh205MBq8BwCISmLTIVUN/06P5Lsh1rmmP
         yVYluI8pZ0Mpv/+/QxVc9jIlMf3kVUZD1gFBL/Jg=
Received: by mail-ot1-f46.google.com with SMTP id g10so6004397otq.9;
        Fri, 04 Sep 2020 07:30:00 -0700 (PDT)
X-Gm-Message-State: AOAM530AW4cqcRMIU7ePwSlzwDFWbMBtrueGzo9sh0y8ixvNppfbL1pP
        VC4DM44osg+2FGyTtOohiIQsfcH/NqTaYelZbA==
X-Google-Smtp-Source: ABdhPJy0LBatfFdNSWrwrnthwVqtmbC3ydSQ8JsKPP8Rsx3nxJylJbVfefD5DwCJwyvZvCLpFqLpQJtRkwEJ4gGjHPs=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr5794412otp.192.1599229799600;
 Fri, 04 Sep 2020 07:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200829111800.2786-1-krzk@kernel.org> <20200829111800.2786-6-krzk@kernel.org>
 <20200903164117.GA2922218@bogus> <CAJKOXPc_abP=YU9cWFfPsFLrnb9N1PBEEbaSWPLLvYHZ_GmsGQ@mail.gmail.com>
In-Reply-To: <CAJKOXPc_abP=YU9cWFfPsFLrnb9N1PBEEbaSWPLLvYHZ_GmsGQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 4 Sep 2020 08:29:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKUHZvqT7WH4B=1NZ32o2HJ14-0wL4TYN7sQYx-fyjCsA@mail.gmail.com>
Message-ID: <CAL_JsqKUHZvqT7WH4B=1NZ32o2HJ14-0wL4TYN7sQYx-fyjCsA@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: i2c: imx: Use unevaluatedProperties
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 2:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 3 Sep 2020 at 18:41, Rob Herring <robh@kernel.org> wrote:
> >
> > On Sat, Aug 29, 2020 at 01:17:59PM +0200, Krzysztof Kozlowski wrote:
> > > Additional properties actually might appear (e.g. power-domains or child
> > > nodes) so use unevaluatedProperties to fix dtbs_check warnings like:
> > >
> > >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
> > >     '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
>
> I can reference the generic i2c-controller schema and add missing
> properties but what to do with children (pmic@25 and many other)? I
> see that all of the other I2C controller dtschema files solve it by
> skipping "additionalProperties: false". Is this the way to go with I2C
> controllers?

If there's a $ref to the i2c schema, then using unevaluatedProperties
is correct.

Rob
