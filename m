Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C9A6B93F1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 13:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCNMfd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 08:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjCNMfb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 08:35:31 -0400
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4791ACFF;
        Tue, 14 Mar 2023 05:34:53 -0700 (PDT)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pc3qm-0002ps-0V;
        Tue, 14 Mar 2023 13:33:56 +0100
Date:   Tue, 14 Mar 2023 12:32:13 +0000
From:   Daniel Golle <daniel@makrotopia.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] i2c: mediatek: add support for MT7981 SoC
Message-ID: <ZBBpTS/ayjU1WfE0@makrotopia.org>
References: <cover.1678756608.git.daniel@makrotopia.org>
 <fdbd18ab71693b2b0dcbe1094bcfd1060bf21200.1678756608.git.daniel@makrotopia.org>
 <5f219379-cccb-d8ca-ed23-4106ca3ecf3a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f219379-cccb-d8ca-ed23-4106ca3ecf3a@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 14, 2023 at 10:26:56AM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/03/23 02:18, Daniel Golle ha scritto:
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 43dd966d5ef5..54cabd366403 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -431,6 +431,18 @@ static const struct mtk_i2c_compatible mt8168_compat = {
> >   	.max_dma_support = 33,
> >   };
> > +static const struct mtk_i2c_compatible mt7981_compat = {
> > +	.regs = mt_i2c_regs_v3,
> 
> I've found a downstream kernel saying that MT7981 uses `mt_i2c_regs_v2`,
> hence the question:
> 
> Are you sure that this is supposed to be v3?

Yes, I've seen that downstream kernel and it also patches
OFFSET_SLAVE_ADDR to be 0x94 instead of 0x4 (which is the only difference
between v2 and v3 regs).

So yes, I'm sure MT7981 and MT7988 use v3 register layout.

> 
> Regards,
> Angelo
> 
> > +	.pmic_i2c = 0,
> > +	.dcm = 0,
> > +	.auto_restart = 1,
> > +	.aux_len_reg = 1,
> > +	.timing_adjust = 1,
> > +	.dma_sync = 1,
> > +	.ltiming_adjust = 1,
> > +	.max_dma_support = 33
> > +};
> > +
> >   static const struct mtk_i2c_compatible mt7986_compat = {
> >   	.quirks = &mt7622_i2c_quirks,
> >   	.regs = mt_i2c_regs_v1,
> > @@ -516,6 +528,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
> >   	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
> >   	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
> >   	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
> > +	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
> >   	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
> >   	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
> >   	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
> 
> 
