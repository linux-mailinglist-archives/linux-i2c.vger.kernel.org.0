Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7771F2A9
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 21:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjFATK0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 15:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjFATKZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 15:10:25 -0400
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF7213E;
        Thu,  1 Jun 2023 12:10:24 -0700 (PDT)
Received: from local
        by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1q4ngi-0007iO-06;
        Thu, 01 Jun 2023 19:10:20 +0000
Date:   Thu, 1 Jun 2023 20:10:11 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Message-ID: <ZHjtExYIdVFo3HnB@makrotopia.org>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 01, 2023 at 06:54:01PM +0200, Krzysztof Kozlowski wrote:
> On 31/05/2023 18:10, Daniel Golle wrote:
> > Add pck and mck clocks which are needed to access I2C registers on MT7981.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > index fda0467cdd954..550795f6573c5 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > @@ -78,6 +78,8 @@ properties:
> >        - const: dma
> >        - const: arb
> >        - const: pmic
> > +      - const: mck
> > +      - const: pck
> >  
> 
> Adding names does not magically add the clocks. This wasn't tested.

Adding the clocks is done in patch 2/2 which just wasn't sent to
devicetree@ and dt maintainers, but to the relevant mailing lists
instead. Was that wrong and should I always send the complete series
also to devicetree@ as well as dt maintainers?

Anyway. It turns out that arb and pmic clocks are intended for that,
so we can cancel this and I'll just use those instead.
