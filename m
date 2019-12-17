Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8BD12259C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 08:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbfLQHiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 02:38:17 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37961 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQHiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 02:38:17 -0500
Received: by mail-ed1-f68.google.com with SMTP id i16so6218510edr.5
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 23:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5BILoFUsnbiutXxGw+euX6HPcc4knB0s3mzmzgspIQ=;
        b=DPVXiP44RHUxPz6UpgYpgrjn4KrtKhiCHTf/nZGx2sFYkO259sGVlmqCf6Mui/+jyO
         YWtOqIZz6VCZIzY0ModJSyDI5Ren+h9Eq410paCuCPeu7YHdSWl7fA9KE8WbKqiYi/6W
         62zTYwMZtdA+PqqUyJj6VacEyRng+oEhy4fwqOayHDQTwey9OkMS6rs5BoF2hjHVKeT+
         j+1BxKI/MIQ0DcR8cBUZb1iicii9ih9e75hcgVm+JjzNsraKDxoHvFF5LI63dsn8E41+
         Gi8PBtOtnpLAhs3CibZgCAZ+6Vz0PINUQzOe9KcgFnpHNWvKhqLI1+slgjRWovJ5lWNz
         YJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5BILoFUsnbiutXxGw+euX6HPcc4knB0s3mzmzgspIQ=;
        b=VibufewKAw+xOEmxFqNSNF9tSxXCFeFwV05IeniIWbRgKyDvuhqZXkJB9fGMh+kiKP
         r9gM1fs5seeRS5YTGpEJ2tlRbmGxqqktqoy0GcXI575o/sjGDVKnQflvvkY9CIT+SEPJ
         I2BZ1xvrYEzUwLMMxZc5QlGQHkT153MwmsrZBgucHj+UvC+tITol/Nzh6i/6kysNTHQc
         34lb2DnCaUtjpv8zLvLQWLfgq1OUx4vJsvuxkkhSL2GySc5hnkn6CH8yKYRH55ZteFSx
         s2jNNXbcj0YfoYSiOp8w2vcCtFyy77M8nINFOtIrfs4FkKW5CbejxZ1122OvuJ4L3c9j
         k7Rg==
X-Gm-Message-State: APjAAAW8PmX6aIzhJdlJndqd7e65wb0+YevB6mn2CLNAfFL2nkFO9sjJ
        DI0XGUEy9xBaO/0LvnnHrSwsMaGUejXvez0lRUx3OA==
X-Google-Smtp-Source: APXvYqxLk43zsNTsrG+AGqbSyEN7hKQZqm8+SK5q0E0gGcZX+NTD5DXzQ8TW2SnvqlnZK+esF+aTGu9evYdhcljPW6I=
X-Received: by 2002:a17:906:bcd5:: with SMTP id lw21mr3507555ejb.144.1576568295199;
 Mon, 16 Dec 2019 23:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20170916030252.10680-1-amworsley@gmail.com> <20171005120125.nnhomwg2e2twbaqm@ninjato>
 <CA+Y=x3=Ab-tZt-32Ve1qTB=REuQAZnGbX72ZeNpyX3EX7cR0pg@mail.gmail.com>
 <20171013184646.cy5gmpwrxbacje3m@ninjato> <CAFcVECJTUu7Kwd-2hx=4=iGwKFnpTAebR3ffjJHQLHKDZ3T4aw@mail.gmail.com>
 <CA+Y=x3nnQ0hQkBaGQ4+MDZsVgpdFCYqaMae9UrJ2vOOuAD9FdQ@mail.gmail.com>
 <CAFcVECK85xW_8oxVQGsHBGyZ4_5bcghpbonqDH-8tLp+Mwq=xQ@mail.gmail.com>
 <CA+Y=x3kpy0LE-mqjKWS8QWy7qzS2pNdDMHpDqZXRGvdt-UbYcA@mail.gmail.com>
 <CAFcVECLWwo+OxSGAGYJfMSesjNT51X+Cwk+E_-RQk7gsEXy2YQ@mail.gmail.com>
 <20171207104915.fdqkj35ga2yxeg3n@ninjato> <CAFcVECKVR5fmVipB1cN97COecULcHtJFrediTsriSuwrm_A_Nw@mail.gmail.com>
 <CA+Y=x3nZsfJ+hE5YjvYLM0tdaRX9hX1G6crAjOmmnks-9Rekqg@mail.gmail.com> <CA+Y=x3=NXpwmqk9RR4oZVkndo=kFwG5T39ktHAhFb=Q9m61Mjg@mail.gmail.com>
In-Reply-To: <CA+Y=x3=NXpwmqk9RR4oZVkndo=kFwG5T39ktHAhFb=Q9m61Mjg@mail.gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Tue, 17 Dec 2019 13:08:03 +0530
Message-ID: <CAKfKVtHG3eArV9Fd1a1UqqbP4e1Tz_ZeBrJJKfwMoP=c2PNqfA@mail.gmail.com>
Subject: Re: [PATCH] Fix Bug for cadence i2c interrupt overrunning buffer
To:     Andrew Worsley <amworsley@gmail.com>
Cc:     Harini Katakam <harinikatakamlinux@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,
Apologies for the late reply.

On Thu, Jan 18, 2018 at 7:53 AM Andrew Worsley <amworsley@gmail.com> wrote:
>
> On 8 December 2017 at 09:15, Andrew Worsley <amworsley@gmail.com> wrote:
> > Thanks. I regularly see the warning my patch prints out  on boot up as then
> > there is a big pull of random data from the TPM.
>
>    Just an update on this bug - I did a i2c capture with pulseview on
> a boot that included this issue.
>
> > On 8 Dec 2017 12:30 am, "Harini Katakam" <harinikatakamlinux@gmail.com>
> > wrote:
> >>
> >> Hi Wolfram and Andrew,
> >>
> >> On Thu, Dec 7, 2017 at 4:19 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> >> >
> >> >> > I attach a patch of the changes to the i2c driver showing my debug in
> >> >> > this driver.
> >> >> > As I said I am happy to send more verbose bug output - I have about
> >> >> > 36
> >> >> > odd runs with 9 occurences of the bug.
> >> >> > Once it happen twice in the one run
> >> >> >
> >> >> > I include the crashing line from the runs where the bug occured (I
> >> >> > added more diagnostics as the runs progressed):
> >> >>
> >> >> I'll check with out HW team as well and check your flow to
> >> >> see if we can reproduce it; will also check if the existing errata
> >> >> has larger scope.
> >> >> I'll let you know if we require further assistance with debug
> >> >> next week.
> >> >
> >> > Any news here?
> >>
> >> Sorry for the delay.
> >> I've checked the known errata and confirmed that it wont
> >> affect this use case. And we haven't been able to hit this
> >> issue on our HW (with eeprom slave devices).
> >> I will add my colleague looking into this further to debug.
> >>
> >> Regards,
> >> Harini
>
> I suspect a well behaved i2c slave may never show the issue. But the
> i2c cadence doesn't handle bad slaves safely
> so I suggest that length check is needed to avoid buffer kernel
> crashes due to mis-behaving i2c hardware.
>
> I got a board that this issue was *very* bad to the point that the
> TPM_RANDOM requests repeatedly returned the same data and so were
> failing the sanity tests. So I captured the i2c transactions using
> pulseview and very bad behaviour from the TPM. The problem disappears
> at 100KHz and very reliably occurs at 400k on this individual board so
> I believe this TPM is failing to keep up with the i2c clock and
> screwying everything up.
>
> What I am concerned about is that the i2c-cadence driver is almost
> always carrying on and returning data with out errors.
>
I agree we should attempt to fix this could  you resend the patch
removing the debug.

thanks and Regards,
Shubhrajyoti
