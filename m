Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C871E3CF67
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 16:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389733AbfFKOuu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 10:50:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388362AbfFKOuu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 10:50:50 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA6BD2089E;
        Tue, 11 Jun 2019 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560264649;
        bh=MpYPAaIV13S2Yylnp2EyZ431PTaW/WjP6IAwHXeD6IY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ReLwKN5pZRc7uGT6tVskU8kc0sdNJCY1Vees7AqtPNFwL1R7wczuGjJknKJazUkuf
         Q+ovaZh+VQPHMBeChWR8c2NtMA4B3UKDWZh7FptmE3s7uAtmdq5INuouQ8bIoKctoc
         pzqV5z9FKyvOPMVFc9Kam+7v1hTM3NHsgDELh6aQ=
Received: by mail-qt1-f172.google.com with SMTP id h21so14812926qtn.13;
        Tue, 11 Jun 2019 07:50:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVNFlviLNzyv6R71A+wGff0vTa3ImlHHLDdQ2H/8evP/jKkwH4Q
        T21/JX3Yo/Sw4yWXYAs12bRhAL83bD8ceFG4aw==
X-Google-Smtp-Source: APXvYqyJUBDtqhRg65MZJLGpagrESYWGxQEF/Opjh/WxDQ0lr19H2G/og3yzhLmg7b7P0Cv1k8sNGFJrHhVtjcNM90U=
X-Received: by 2002:ac8:2ec3:: with SMTP id i3mr19914156qta.110.1560264648991;
 Tue, 11 Jun 2019 07:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
 <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com> <20190611090641.byr6mpywkfmbhrbk@flea>
In-Reply-To: <20190611090641.byr6mpywkfmbhrbk@flea>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Jun 2019 08:50:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3cua3u2gNTzHEdgFU0On5J9ziPZeFNiTpu5HS=SJoDA@mail.gmail.com>
Message-ID: <CAL_JsqL3cua3u2gNTzHEdgFU0On5J9ziPZeFNiTpu5HS=SJoDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 3:06 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Mon, Jun 10, 2019 at 03:34:18PM -0600, Rob Herring wrote:
> > On Wed, Jun 5, 2019 at 6:29 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > +properties:
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> >
> > These 2 are covered by i2c-controller.yaml, right?
>
> Indeed, I've removed them.
>
> > > +examples:
> > > +  - |
> > > +    p2wi@1f03400 {
> >
> > i2c@...
> >
> > That should fail on the schema (I need to get the schema checking of
> > examples finished.)
>
> That would be great :) The compilation of the examples alone already
> caught a good number of examples that weren't even compiling.

I'm primarily waiting on a dtc change to be accepted[1]. Feel free to
review/ack.

> Speaking of examples, one thing that would be great too would be to
> allow the usage of our C headers. It's not supported at the moment,
> and this often ends up with an example that is less readable than the
> actual DT.

It should be. You just have to add them. See
Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml for
example.

Maybe the common interrupt and gpio ones should be added by default.

Rob

[1] https://www.spinics.net/lists/devicetree-compiler/msg02709.html
