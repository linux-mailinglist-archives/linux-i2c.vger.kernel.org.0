Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60D3E55A2
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2019 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfJYVKD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Oct 2019 17:10:03 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34100 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfJYVKD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Oct 2019 17:10:03 -0400
Received: by mail-oi1-f196.google.com with SMTP id 83so2539115oii.1;
        Fri, 25 Oct 2019 14:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=d7m38wEP3cWWPKZavVh4QqPT2NxfQZN9J+ih9n10QDc=;
        b=Bgj0Hb5kkq7sw5xcNCEvNYyFvw18S7PrMLu3rewoGpPByjM2NazFD0XL6g424LJSML
         aIgI38S5G94S+DUdAA4Xgd0Pu1ftCB3ZmpHKOS1PdY5PWXUIuOCpRbyRmYA+0PGOcC+f
         Fhw4l7augwpNJd7XIxsR1e41XbHfZvbQVg508pwkNOx56CHriEO2i+jNFMzdRzkqMgL8
         wtO05cSTFQkyBpqK3YZAu2RwaYgQhDA1GlgP9+C2B2KZ5mNDjq3Y9UABfgIMrGPXZLsC
         Q294uao7YxDKVW2RImTsAtutPUDAmCGNprI2Zqx9f+3XIY/K8/eAPjlsgSRKhya6ZG6c
         zfSg==
X-Gm-Message-State: APjAAAXlQbZr9Zcoc4G55tHIgumMS4sgaQF6+m52pwTEwST32jIbAcEh
        f4jRn/IrE688MbKKxT8Te0l8W6g=
X-Google-Smtp-Source: APXvYqwMdDzj7VpTwlpKBzbm1vx4GRa3h4b/Ol8HbT8QPQu0jiUwRDiRAWIWfNdFfGcGA55gSFCUgQ==
X-Received: by 2002:aca:7595:: with SMTP id q143mr4820191oic.103.1572037802036;
        Fri, 25 Oct 2019 14:10:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b12sm1095339otp.72.2019.10.25.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:10:01 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:10:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
Message-ID: <20191025211000.GA8235@bogus>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com>
 <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
 <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
 <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
 <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 24, 2019 at 06:32:38PM +0900, Tomasz Figa wrote:
> On Thu, Oct 24, 2019 at 5:40 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > czw., 24 paź 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> napisał(a):
> > >
> > > On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > >
> > > > pt., 18 paź 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napisał(a):
> > > > >
> > > > > In some platforms, they disable the power-supply of eeprom and i2c due
> > > > > to power consumption reduction.
> > > > >
> > > > > This patch add two supply properties: vcc-supply, i2c-supply.
> > > > >
> > > > > Changes since v1:
> > > > >  - change supply name
> > > > >  - rebase to next
> > > > >
> > > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > index e8778560d966..578487a5d9b7 100644
> > > > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > @@ -167,6 +167,14 @@ properties:
> > > > >      minimum: 1
> > > > >      maximum: 8
> > > > >
> > > > > +  vcc-supply:
> > > > > +    description:
> > > > > +      phandle of the regulator that provides the supply voltage.
> > > > > +
> > > > > +  i2c-sypply:
> > > > > +    description:
> > > > > +      phandle to the regulator that provides power to i2c.
> > > > > +
> > > >
> > > > Something was bothering me about this patch so I came back to take a
> > > > look. Can you explain what i2c actually stands for in this doc? I hope
> > > > I'm misinterpreting something and it isn't that the driver disables
> > > > the regulator powering the i2c bus controller?
> > >
> > > In our case it's the regulator that the I2C bus is pulled up to.
> > >
> >
> > Then it has nothing to do with a generic EEPROM driver IMO. I think
> > you need to add the control for this regulator to your i2c controller
> > driver and create a power domain where the EEPROM would be lower in
> > hierarchy.
> 
> While I agree that the generic EEPROM driver may not be the best place
> to do it, neither is a driver for a specific SoC i2c controller. The
> hardware design is not specific to any particular i2c controller.
> 
> Perhaps we need the generic i2c core to take into account an
> i2c-supply? Wolfram, any thoughts on this?

Sounds good to me. Maybe 'bus-supply' instead to indicate it's supposed 
to be for the bus and not other things. It should reside in the I2C 
controller's node (or mux ports) though.

Rob
