Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8873E193E09
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 12:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgCZLir (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 07:38:47 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46366 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgCZLir (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 07:38:47 -0400
Received: by mail-pl1-f195.google.com with SMTP id s23so2001509plq.13;
        Thu, 26 Mar 2020 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=R0qU1vfFJtq/8uG9IZGBPMdQ0ZUew1mrKKw6hutamAQ=;
        b=DQZmDaLxybbCIR7OhJBlYkbfh0VC2lyHZ20SSGUBLSGqUYDxLQ8242wwrhvmMIkb+S
         kauniwR17uUed8TQ9jHasiNY9F0hFIQ+iOXlw+Z3KaBoTjCoZBiR8qmIhLhgn0N/zuzM
         22Gb5fG2swp7zD4zWaEa3wgW3PwSj369qegoLcBMjvsICPfjheRv0y8uxvwVUSBIG5Bg
         +OF0emN61e/tbswYEZI3gzkS/0ortnuXK/NQ29CCygBvb3JByEMDtFdtk+d7akr6J7KW
         7kSiz9I257CjR4R0WzKrrxKa8jSsmeOkN6bk6alieSvYuWHfQGIt4IjoxeM4+Q3z0DVJ
         WLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=R0qU1vfFJtq/8uG9IZGBPMdQ0ZUew1mrKKw6hutamAQ=;
        b=TG35DA6Wx5F5ZDnGSnHiyIHmAe6axhVHm4TejRPLdvSt0tcrhp07F2Cfpr1zmZB2FH
         Kdk/2XM1nL8hQp8cAL5YRNumKmBHcZuEu8Zf7Cy5+6OAWCRNCrHe1ToyJ2qBkXca1Gzj
         EtX6nzLepdy1cshC1yK8T3sD9lfvCtXq832SGx1JXCbofXyEHtNTgEOIO1yHVwJiaSGJ
         DSiF6WI4Ni0vIVS7cBrupayecRK1VecImxJt7l/i3PgKCeiNAyfEidislz343s1Wo0Bh
         VFy+jF4dBAVI+omT0Ba2EDQ8ApOlS4SZADJbd7XSgQboC3pbkrBKFxc56f9p/9TN0OTM
         6Rgg==
X-Gm-Message-State: ANhLgQ2iXmVKSyzbbp0TT14nu1JJsl5Wqmz8uBv9tR4yeiRiMuD1y5l/
        iRex1yXMl3NwXZvJoBZ6ZldW3jol22FS+1kBz9o=
X-Google-Smtp-Source: ADFU+vvCH5BmVxfLH5Lsgo06YaFz8cXJ4Ew5KtuIz1eSdJLbu86yn4cADJqPrChVHtpWYi3ypBWuWoz1w1lJOmB4knk=
X-Received: by 2002:a17:902:5acb:: with SMTP id g11mr317572plm.18.1585222725777;
 Thu, 26 Mar 2020 04:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
 <1585161361-3408-3-git-send-email-alain.volmat@st.com> <CAHp75VdPCWdpGo=2n9g0ivti-g2m4jZ=cG4BKHBLk8BVDzaCyg@mail.gmail.com>
 <20200326101219.GA21190@gnbcxd0016.gnb.st.com>
In-Reply-To: <20200326101219.GA21190@gnbcxd0016.gnb.st.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 26 Mar 2020 13:38:38 +0200
Message-ID: <CAHp75Vc896RpnrX6+yb0LfXVroLJO5XX6Gt5V4BJZjdFYOXYnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: i2c-stm32f7: allows for any bus frequency
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 12:12 PM Alain Volmat <alain.volmat@st.com> wrote:
> On Wed, Mar 25, 2020 at 06:53:45PM +0000, Andy Shevchenko wrote:
> > On Wed, Mar 25, 2020 at 8:38 PM Alain Volmat <alain.volmat@st.com> wrote:

...

> > > +       int i;
> > > +
> > > +       for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)
> >
> >
> > Perhaps
> >
> >        int i = ARRAY_SIZE(i2c_specs);
> >
> >        while(i--)
> >
> > ?
>
> I propose the following code to make it a bit easier to read/understand:
>
> static u32 get_lower_rate(u32 rate)
> {
>         int i = ARRAY_SIZE(i2c_specs);
>
>         while (i--)
>                 if (i2c_specs[i].rate < rate)
>                         break;
>
>         return i2c_specs[i].rate;
> }
>
> If you agree with that I'll push a v2.

No objections.

-- 
With Best Regards,
Andy Shevchenko
