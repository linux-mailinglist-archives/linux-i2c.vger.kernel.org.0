Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA06A16EEE0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 20:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730984AbgBYTTg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 14:19:36 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:37733 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBYTTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 14:19:36 -0500
Received: by mail-pj1-f53.google.com with SMTP id m13so128180pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYRJlgXmUyclP4eYH8OvDIdap+q+/WDF/KFpEgL6TEg=;
        b=D9+bgmLRVNidRRPbjIcW0LnHWKsV5pjwmAMMhKXdqAHjbZj9rLHwbsCRwSbR1GFghx
         XjK+UpXT0CsDcGpN8FpV6cxK8XlONUKgwqd02ZTcF1FZUyZ/Kb8T0MiHN92CY6YJrf9e
         UryaBG+EtdiSqzWC4UOtkEUbXgORXa+xgsl4SC9e2dVp2CKJFQDUITp10RyJKlbzIH7p
         aLEMKbDdCe5bXaFT2XUBMTEdhKXd5kut3BK6Hb98eMn+ycDSpzPifzNV92VL/wudhD2p
         KnGmX1EY9JtWhlUWLm8XtD1bInjEyXzR/1+9mtBMHoDqUl5Ly+fqysxMmkhCbpbCiwSx
         cDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYRJlgXmUyclP4eYH8OvDIdap+q+/WDF/KFpEgL6TEg=;
        b=t/QO+/9WC7uckXkppmzUxacjwl+scnuHwNdphpNs9wp/iHVLxdoLkzQZGpX67FYzUL
         u8f7yNnVBsESvdsCqZv/i6ckd5mrklup49cALN1kHC4+YQ5peQb/7BIjwMfW7ZOUzI2g
         TJkiFeCsxYziTzEKDjN+pXSDkpfhbckBVphvyMS4m8aVRI2AV3g9Jl12Up/fbVeGcMjQ
         8B/raFkuhH4Tgp79zceoDf1rO8fXec0+b6+zqrqmfsSeiljRy2MXTpayBrn/Nw3i2Yde
         heaFMzlLlmu9MGYGEnSs+vwpHQs73qrzmquLP35n/uIWXXSIvi+EcjleVS6U0sEyUgwQ
         RkxA==
X-Gm-Message-State: APjAAAXJqUvpGgNf43IwH6Ff+KCfbccqA2WmNkyqqvao58eVBzoJPAqM
        BsyvTd6nXlORfcqttTfDrwtVyHBudv4KlZMulHcEsQ==
X-Google-Smtp-Source: APXvYqynvpJsBhRquSqsnjud6EMIcbWLDTtJxWF6YXJ0G1G3afx8Rqfd6DqsVvZbGqF/W/agnTfgf2jRjxu1bg5HkZ4=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr535781pjt.131.1582658375237;
 Tue, 25 Feb 2020 11:19:35 -0800 (PST)
MIME-Version: 1.0
References: <CAHb3i=uXLgjT-emHeJzHGG5L_0z94ZwDYcX5vtaDf8+Eh90ziQ@mail.gmail.com>
 <CAHb3i=vA76p6iXt0Q8ZECSj8r_Ltv_c7U1W21r_aD4HsLuJPrA@mail.gmail.com> <CAHb3i=shEPFMmVJG=MTP-t9UqNfxMoyVqRnr9WDFMg1S=_TeSg@mail.gmail.com>
In-Reply-To: <CAHb3i=shEPFMmVJG=MTP-t9UqNfxMoyVqRnr9WDFMg1S=_TeSg@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 25 Feb 2020 11:19:24 -0800
Message-ID: <CAFd5g45aLgZ9=YzJPVWELkmeSf_8WdngXn_7-32sw_xOSTD7sg@mail.gmail.com>
Subject: Re: npcm-I2c driver
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 2:29 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> Hi,
>
> Just a reminder,
> please take a look at this patch.
> This patch is a new driver for npcm-i2c.
> The patch has been waiting patiently for several months now...

Observation as a bystander: I looked at this and my first reaction was
that it looked like Wolfram was waiting on a response from you. I just
looked at this again now and realized that you had responded to
Wolfram with a question.

What you want would probably be more obvious if you sent a ping email
in response to the email where you are looking for a response. Also,
responding to the original email makes it easier for reviewers to
respond to your email rather than have to look it up in their inbox.

Also, please don't top post.

> https://patchwork.ozlabs.org/patch/1198846/
>
>
> Thanks,
>
> Tali Perry
> Nuvoton Technologies
>
> On Wed, Feb 19, 2020 at 11:39 AM Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > Hi,
> >
> > Just a reminder,
> > please take a look at this patch.
> > This patch is a new driver for npcm-i2c.
> > The patch has been waiting patiently for several months now...
> >
> >
> > https://patchwork.ozlabs.org/patch/1198846/
> >
> >
> > Thanks,
> >
> > Tali Perry
> > Nuvoton Technologies
> >
> >
> > ---------- Forwarded message ---------
> > From: Tali Perry <tali.perry1@gmail.com>
> > Date: Mon, Feb 17, 2020 at 3:52 PM
> > Subject: npcm-I2c driver
> > To: Wolfram Sang <wsa@the-dreams.de>
> > Cc: <linux-i2c@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> >
> >
> > Hi,
> >
> > Just a reminder,
> > please take a look at this patch.
> > This patch is a new driver for npcm-i2c.
> > The patch has been waiting patiently for several months now...
> >
> >
> > https://patchwork.ozlabs.org/patch/1198846/
> >
> >
> > Thanks,
> >
> > Tali Perry
> > Nuvoton Technologies
