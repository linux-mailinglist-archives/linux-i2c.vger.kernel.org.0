Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF631AECA8
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 15:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgDRNAP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 09:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725804AbgDRNAP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Apr 2020 09:00:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61321C061A0C
        for <linux-i2c@vger.kernel.org>; Sat, 18 Apr 2020 06:00:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id ay1so2067591plb.0
        for <linux-i2c@vger.kernel.org>; Sat, 18 Apr 2020 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UW5RFeLiJCmDxmEc+XHFADLF3Ka4UZKf/GKxDSGaCcg=;
        b=Ep57MSX6XQEYHgbUwQeX+5CBjTPN0m/y/gAN4D744xeZtBIW+fHiodH3+Wl08EdREf
         r4MafspgKi9byzUPWsQ2TLGVmloLDM1xuHC6eyfK1mP1mG8jeHc0tcX6pE1Iaf73xhkE
         PXPOJDQwDAUURf9dBK3EEJyoa4l1MUYboNlV2rnnI/qkvU8fC1U578hfBGOD8ZbZ54zN
         a1z3vSSnb9aBaVnwkoz8sH/XP/8JrhPYZ7LHOwd3Od4EyjVohWPof7LHR2o4G6FBi77r
         f04ZHnNlaJu7UN/wPaR4EayGK9nYYdtZgEnhgVTcskK8aiO89r1KH9oAiMvkhASRjMp3
         YBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UW5RFeLiJCmDxmEc+XHFADLF3Ka4UZKf/GKxDSGaCcg=;
        b=duMbyrgduI/NSTP+uRslkCsf+GpDgPZu16HtmnyrJ8VriTkqb1Yg4YbSMTfdgn/ZBv
         VeBc5JkXFWDgLwZZPtldCOw17HgCvsFmTx81Pp4eaVXWebrn0GGur9JjhGZkuALIDRE5
         G8sZONpYX1dslpNpnPqYf07uJef363Za07wSQcbRUlJQnPwfdpurBRPLvFMldj4319HB
         vBWJHADmojFT23EUDv2G417uwUrcUF7vJi2i4NsCLMK39bbZmdR7kyjJ1a4AFzYpeYXR
         aGPTnBcYe3uBmaQG78Pb29r6McSC6HvOstE9VkZhPHDO8YI5MxD3k13Ht7NWP5qB/Mot
         FkCg==
X-Gm-Message-State: AGi0Pua7JVS/blKHsZnFiLANAhUyKN2xEzkBpCwheEkAd85x2VDLssSR
        CB7JgdYw3amgSkowZTKwd573Vdli/TPSuPF2y08=
X-Google-Smtp-Source: APiQypKx4TIVu4O9OqYrrgMgZtbeT5qntH+A7Cv3ZY5ZEmJh7NuehowL9UQudJPmGsi7hgLGC8XyutXr06/uMbv09n0=
X-Received: by 2002:a17:902:854a:: with SMTP id d10mr8109997plo.262.1587214814860;
 Sat, 18 Apr 2020 06:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134827.18674-1-zhengdejin5@gmail.com> <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5> <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
In-Reply-To: <20200418040653.GA7120@nuc8i5>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 18 Apr 2020 16:00:03 +0300
Message-ID: <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 18, 2020 at 7:07 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:

Leave only you and i2c ML to avoid spamming people.

> > > Wolfram, Thank you for accepting it. From my personal point of view,
> > > as long as the direction is correct, even small improvements are
> > > worth doing. Thanks again for your tolerance.
> >
> > Do you have plans to move on from janitor work to something serious?
> >
> Andy, I want to do=EF=BF=BD=EF=BF=BDbut I don=EF=BF=BD=EF=BF=BDt know whe=
re to start, Could you give me
> some suggestions? Thanks very much!

I have been collecting some items on my Gist page [1], where anybody
(depending on the skills) can find affordable tasks. Tell me if you
need elaboration.

[1]: https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc

--=20
With Best Regards,
Andy Shevchenko
