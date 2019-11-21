Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D801050C8
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 11:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKUKmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 05:42:36 -0500
Received: from mail-ed1-f50.google.com ([209.85.208.50]:34354 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUKmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 05:42:36 -0500
Received: by mail-ed1-f50.google.com with SMTP id b72so2390194edf.1
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u59F/QWqmUswTzURejJNeg3oXLZZH4QhTEcPLT9jzNA=;
        b=V04c/TjYbg3QjGIBR4sDtpQCwVJPOMVNt8Eb0DaFgezLyPJZgJxELyYaw1cOnEW+z3
         YoSjIb8vH2yKE/Vl+EVfDCRVyeetlOAiLImL5PyhNEG2KFxIS/SSzfPm9abSsImw6q0/
         icQFti8lVClJfgbCnp+1i0lVfPi73+et3PWKT7a1H2Jwxye7I8eFb920ItePFgl4ZrMu
         OVqAR9LK6mBkfWFNNBRZDXnJ1nzlwiDPR3bu2vGEKO6DGnOJVPRo9uUkhaU1jpH4cRvh
         sRbJrzIZ+kVuYn2bERUPNx6+8TRRQb0fw/ZA9hAppGW0P/EsFocCGaxibbq2+kXlxhM6
         dsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u59F/QWqmUswTzURejJNeg3oXLZZH4QhTEcPLT9jzNA=;
        b=WtNii96+OVC+xaiYfk/hqu5D3V3Ym/iOaZVMfBu9fgW1VD+GQjCeXtzhiUq6ljCNmP
         8942N9/vzhYitI4b5elCyekQLx09r+RbJ0JjWSlT77ZQOlxB48sfTmTn8y2/Cq5s6dGV
         SX7L8LfybjWUC5y4aBzrtQynBjGyMsGDnt+fZcQwBmU5V3DxOoS7+j7aBRu6F0PQDy6I
         Dsf9q0DrrdG60SYt6R3oK6J8lTX8B6TqxSOSWPPuGum66qj5g8FoLdLWK8eOy36NwcLD
         0R9gUTNoPiGN7q3984MvfstC/XsvKf7jExd8kooI90pUild02yhzFyAqlxw784GwI4FB
         P+xw==
X-Gm-Message-State: APjAAAWoOe22eVgMlhChTJPywR2RltZXNR0L+fdqYBvL0Ge1lrA7reIP
        r9mQl+ujSU0yttumsztZ1YoXNIpdZeSWbPZb3mo=
X-Google-Smtp-Source: APXvYqxdYQ9JPXvxuPU55WISZbVWSRDQG4dtORdaOwAkHUWg8DnaTCe3qlgB+rNJnjUwK7a79Wgde6NtHv4Mm2VJuYQ=
X-Received: by 2002:a17:906:698b:: with SMTP id i11mr12686438ejr.97.1574332954524;
 Thu, 21 Nov 2019 02:42:34 -0800 (PST)
MIME-Version: 1.0
References: <1551069922-15896-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <9fb136da-070a-f881-bc01-037f0fc4fb13@xilinx.com> <20190309095252.GD1340@kunai>
 <CAKfKVtE9aFBfLdodtkzM43yro4nN--OY5wTLaXCMjYAFsh4+8w@mail.gmail.com> <20190314090654.GA907@kunai>
In-Reply-To: <20190314090654.GA907@kunai>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 21 Nov 2019 16:12:22 +0530
Message-ID: <CAKfKVtFzRWrRupOdyu46G+ZieDTUqm_UEzvJLoL8jutXrgj6kw@mail.gmail.com>
Subject: Re: [PATCHv4] i2c: cadence: Fix the driver in interrupt flurry case
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Mar 14, 2019 at 2:36 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > > What if another CPU core processes the interrupt handler?
> > >
> > The issue is that  due to  non i2c interrupts the  clear is not
> > released and the timeout is reached.
> > If those interrupts are serviced on the other core should  not be an issue.
>
> Makes sense. Can you add a comment describing this to the patch?
>
Somehow the patch didnot reach the list resent now.

thanks and Regards,
Shubhrajyoti
