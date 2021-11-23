Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FCD45A15A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 12:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235715AbhKWL1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 06:27:30 -0500
Received: from gloria.sntech.de ([185.11.138.130]:52222 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234496AbhKWL1a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 06:27:30 -0500
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mpTuB-0008Cw-Pk; Tue, 23 Nov 2021 12:24:07 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Conor Dooley <Conor.Dooley@microchip.com>,
        linux-riscv@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lewis Hanly <Lewis.Hanly@microchip.com>,
        Daire.McNamara@microchip.com, Atish Patra <atish.patra@wdc.com>,
        Ivan.Griffin@microchip.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
Date:   Tue, 23 Nov 2021 12:24:06 +0100
Message-ID: <2736394.7QafvNDC63@diego>
In-Reply-To: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com> <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com> <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Dienstag, 9. November 2021, 14:04:45 CET schrieb Geert Uytterhoeven:
> Hi Conor,
> 
> On Tue, Nov 9, 2021 at 1:08 PM <Conor.Dooley@microchip.com> wrote:
> > On 09/11/2021 08:34, Geert Uytterhoeven wrote:
> > > On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> > >> From: Conor Dooley <conor.dooley@microchip.com>
> > >>
> > >> Add mpfs-soc to clear undocumented binding warning
> > >>
> > >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > >> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> > >> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> > >> @@ -21,6 +21,7 @@ properties:
> > >>         - enum:
> > >>             - microchip,mpfs-icicle-kit
> > >>         - const: microchip,mpfs
> > >> +      - const: microchip,mpfs-soc
> > >
> > > Doesn't the "s" in "mpfs" already stand for "soc"?
> > not wrong, but using mpf-soc would be confusing since "mpf" is the part
> > name for the non soc fpga. is it fine to just reuse "mpfs" for the dtsi
> > overall compatible and for the soc subsection?
> 
> I really meant: what is the difference between "microchip,mpfs" and
> "microchip,mpfs-soc"? Can't you just use the former?

definitly agreed :-)

Having the board named as
	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs"
sounds the most sensible.

As Conor wrote, "mpfs" is the name of the soc itself - with mpf being
the fpga part, so that would follow what boards in other parts of the
kernel do.

Heiko


