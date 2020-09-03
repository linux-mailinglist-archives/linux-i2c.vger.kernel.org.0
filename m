Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FB725CAF5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 22:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbgICUgx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 16:36:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729406AbgICUgr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 16:36:47 -0400
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D424320678;
        Thu,  3 Sep 2020 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599165407;
        bh=1SAc/pkQ+YvF2FbSZWmb9yACOrCSFl+Cocz2H8qQb9s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GBkpHkU2mNLKVOS/n/yqttR70A8MEzwnA9pn1u05EHDkX4XcWUSfUVZkx7ThPoXOc
         cOmPUjFm5o0MmRK6kvTOhILNt0h3An0CEiW3YsoWfXt110ZrjP+Rf5jCjnm4Fnjs87
         8Ex/F7hfg91BygIg8YxrY4JHq3CyVTmZXo0DMmAU=
Received: by mail-ed1-f50.google.com with SMTP id n13so3986700edo.10;
        Thu, 03 Sep 2020 13:36:46 -0700 (PDT)
X-Gm-Message-State: AOAM531RyyFbMZHaVev3FRsiSj78+oZplZI5pzwkXEHdj54bfStT7xvX
        IwnnzOI/aH30WIeGWD6dLzj7HecBOfF1rMCvpsI=
X-Google-Smtp-Source: ABdhPJzxpPlGTe4YpW+4SBi3UyLCfVVsjl/2HCF6ABdQkyPpZO/E8Ki7WEbnMMz1NKYFTDSRsOdBqsPbQLS79oRkX0c=
X-Received: by 2002:a05:6402:1a48:: with SMTP id bf8mr5017832edb.298.1599165405346;
 Thu, 03 Sep 2020 13:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200829111800.2786-1-krzk@kernel.org> <20200829111800.2786-6-krzk@kernel.org>
 <20200903164117.GA2922218@bogus>
In-Reply-To: <20200903164117.GA2922218@bogus>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 3 Sep 2020 22:36:34 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc_abP=YU9cWFfPsFLrnb9N1PBEEbaSWPLLvYHZ_GmsGQ@mail.gmail.com>
Message-ID: <CAJKOXPc_abP=YU9cWFfPsFLrnb9N1PBEEbaSWPLLvYHZ_GmsGQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: i2c: imx: Use unevaluatedProperties
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 3 Sep 2020 at 18:41, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Aug 29, 2020 at 01:17:59PM +0200, Krzysztof Kozlowski wrote:
> > Additional properties actually might appear (e.g. power-domains or child
> > nodes) so use unevaluatedProperties to fix dtbs_check warnings like:
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
> >     '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/

I can reference the generic i2c-controller schema and add missing
properties but what to do with children (pmic@25 and many other)? I
see that all of the other I2C controller dtschema files solve it by
skipping "additionalProperties: false". Is this the way to go with I2C
controllers?

Best regards,
Krzysztof
