Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B433D596
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 20:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391852AbfFKSju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 14:39:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45788 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391788AbfFKSju (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 14:39:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id s11so7956563pfm.12
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2019 11:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zW6AynUQeh/d1MGikSw6rg9037amHgOpXgjZc/bYyo0=;
        b=gtHTXVgSsCW+WzGSqP5jD5k72gd1VwNjkRGZ6kyTYVbl9OaWD2braqloLb++ZYFoaW
         dbCaH+n3AgU4PKdA57lePWtbt4HHHDl1ElnATdqGqXSF9yVrYo76JPhNKS088vzV7GDN
         1CJ9ag9coDwUukCnp8mQHRFG78or4KyQfmzxd4kqOkRAl4hT/CRoKK6A3i6xzLoNwdvE
         62v61Cz/xHioGQvUIEttFjfCFwI47zsJvlj8yjxAo4u0cGbHPDcxEQxUy941mb/k5jTG
         8Joplh3e5y46cHQeocodgZMMxMEeFdefwVPuwtV3pGGphvTDuMsWt0xAmXTH9035qn7M
         KyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zW6AynUQeh/d1MGikSw6rg9037amHgOpXgjZc/bYyo0=;
        b=i0vXHXuhp6kxtwCvy1LjDhtfzI18z3P7SBj92pbGS9P2NALDTgDnmD8yYy/eubSvM7
         G4JblU2Z1gSaHH3/61Q+pjg9Fhxq78bgsxvVjcX9C8SmsBBQ4ui8Kqcdzo8YEi0Orv/Z
         42fkC4VTD9MCLyCJoE2htetFi1f70Dk9cdvna6P1oZX4c4r/uSNppb7cso4Tlb1+gM/8
         0RD0NOlJtSxf4DI+Rhx2h3lZH33DGjRpnBfR236FlHCu/7mZ8rZfPb9JsfhZk/O/gGgn
         NAtYpkKQjFKpzdGE+ODRxvsXLF15lC2lOniCfGZSa/CsByYbT6sbEVy1JVayk5mPygzW
         dN9A==
X-Gm-Message-State: APjAAAV1P4ekTzY0q1S5FSFSO3DVvIKfVz9fvfmPSo37X7zM76OsJ7iR
        /59lxHKlhCG0R9hXj+Abe5eKMg==
X-Google-Smtp-Source: APXvYqy9pS4xgDWNZze0LOrbLEksodwMGCOdwtad24aELFBqknW6/q8wGUEyNWy9Ls67LZYFBEhhgw==
X-Received: by 2002:a62:e511:: with SMTP id n17mr73761345pff.181.1560278388728;
        Tue, 11 Jun 2019 11:39:48 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y22sm23485517pfo.39.2019.06.11.11.39.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 11:39:48 -0700 (PDT)
Date:   Tue, 11 Jun 2019 11:39:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Message-ID: <20190611183945.GP4814@minitux>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-4-lee.jones@linaro.org>
 <CAKv+Gu_s7i8JC4cv-dJMvm1_0cGzzhzf+Dxu0rxcF7iugF=vHg@mail.gmail.com>
 <20190610085542.GL4797@dell>
 <CAKv+Gu8rhxciy1cOG3B3pda9+p4R_COGrrqa7S_Rj9y2HeBxYw@mail.gmail.com>
 <20190610092245.GN4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610092245.GN4797@dell>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 10 Jun 02:22 PDT 2019, Lee Jones wrote:

> On Mon, 10 Jun 2019, Ard Biesheuvel wrote:
> 
> > On Mon, 10 Jun 2019 at 10:55, Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Mon, 10 Jun 2019, Ard Biesheuvel wrote:
> > >
> > > > On Mon, 10 Jun 2019 at 10:42, Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > This patch provides basic support for booting with ACPI instead
> > > > > of the currently supported Device Tree.  When doing so there are a
> > > > > couple of differences which we need to taken into consideration.
> > > > >
> > > > > Firstly, the SDM850 ACPI tables omit information pertaining to the
> > > > > 4 reserved GPIOs on the platform.  If Linux attempts to touch/
> > > > > initialise any of these lines, the firmware will restart the
> > > > > platform.
> > > > >
> > > > > Secondly, when booting with ACPI, it is expected that the firmware
> > > > > will set-up things like; Regulators, Clocks, Pin Functions, etc in
> > > > > their ideal configuration.  Thus, the possible Pin Functions
> > > > > available to this platform are not advertised when providing the
> > > > > higher GPIOD/Pinctrl APIs with pin information.
> > > > >
> > > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > >
> > > > For the ACPI probing boilerplate:
> > > > Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > >
> > > > *However*, I really don't like hardcoding reserved GPIOs like this.
> > > > What guarantee do we have that each and every ACPI system
> > > > incorporating the QCOM0217 device has the exact same list of reserved
> > > > GPIOs?
> > >
> > > This is SDM845 specific, so the chances are reduced.
> > 
> > You don't know that.
> 
> All the evidence I have to hand tells me that this is the case.  Even
> on very closely related variants Qualcomm uses different H/W blocks
> for GPIO.
> 

I presume with this you mean that e.g. the 835 laptops doesn't sport a
QCOM0217?

> > > However, if another SDM845 variant does crop up, also lacking the
> > > "gpios" property, we will have to find another differentiating factor
> > > between them and conduct some matching.  What else can you do with
> > > platforms supporting non-complete/non-forthcoming ACPI tables?
> > >
> > 
> > Either we don't touch any pins at all if they are not referenced
> > explicitly anywhere
> 
> I guess this would require an API change, which is out of scope of
> this patch-set.  Happy to change this implementation later if the
> subsystem allows for it though.
> 

Last time we discussed this the _only_ offender was the loop issuing a
get_direction() on all descs towards the end of
gpiochip_add_data_with_key()

> > or we parse the PEP tables, which seem to cover
> > some of this information (if Bjorn's analysis is correct)
> 
> Maybe someone can conduct some further work on this when we start to
> enable or write a driver for the PEP (Windows-compatible System Power
> Management Controller).  The tables for the PEP look pretty complex,
> so this task would be extremely difficult if not impossible without
> Qualcomm's help.  I wouldn't even know how to extrapolate this
> information from the tables.
> 

Yeah that looks quite different, so I'm not sure how to tie that into
the current driver. But I'm fine with adding this for now, if PEP brings
a different approach we can always rip this out later.

Regards,
Bjorn

> > (if Bjorn's analysis is correct)
> 
> Bjorn is about to provide his Reviewed-by for this implementation.
> 
> -- 
> Lee Jones [?????????]
> Linaro Services Technical Lead
> Linaro.org ??? Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
