Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B4B54992E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 18:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244727AbiFMQMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 12:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236451AbiFMQMB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 12:12:01 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4D52C110;
        Mon, 13 Jun 2022 07:05:15 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o0kgr-0000p1-1u; Mon, 13 Jun 2022 16:05:13 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     palmer@dabbelt.com, palmer@rivosinc.com,
        linux-riscv@lists.infradead.org
Cc:     Conor.Dooley@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, robh+dt@kernel.org,
        linux-mmc@vger.kernel.org, paul.walmsley@sifive.com,
        atulkhare@rivosinc.com, support.opensource@diasemi.com,
        andrew@lunn.ch, krzysztof.kozlowski@linaro.org,
        stwiss.opensource@diasemi.com, linux-riscv@lists.infradead.org,
        aou@eecs.berkeley.edu, ulf.hansson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date:   Mon, 13 Jun 2022 16:05:12 +0200
Message-ID: <2247394.ElGaqSPkdT@diego>
In-Reply-To: <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
References: <20220606201343.514391-1-mail@conchuod.ie> <20220606201343.514391-5-mail@conchuod.ie> <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Montag, 13. Juni 2022, 15:33:49 CEST schrieb Conor.Dooley@microchip.com:
> 
> On 06/06/2022 21:13, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > After converting the pmic watchdog binding to yaml, dtbs_check complains
> > that the node name doesn't match the binding. "Fix" it.
> 
> Hey Palmer,
> The three dt-binding changes were accepted - do I need to poke SiFive to
> ack the dts change or are you fine just taking it?

I don't think a node-name has relevance to vendor decisions ;-) .

Looking at bindings/watchdog/watchdog.yaml we clearly see that
the node name is always watchdog or watchdog@foo, so this change
is clearly correct.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> Thanks,
> Conor.
> 
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index c4ed9efdff03..1f386b07a832 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -90,7 +90,7 @@ rtc {
> >   			compatible = "dlg,da9063-rtc";
> >   		};
> >   
> > -		wdt {
> > +		watchdog {
> >   			compatible = "dlg,da9063-watchdog";
> >   		};
> >   
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 




