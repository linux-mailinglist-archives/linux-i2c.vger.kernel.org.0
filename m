Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039E4489662
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 11:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbiAJKbr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 05:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243967AbiAJKbW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 05:31:22 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AB6C061751;
        Mon, 10 Jan 2022 02:31:21 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id z22so6529276edd.12;
        Mon, 10 Jan 2022 02:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=SGJVFwbtcacUQay73yW9oHCDfqGazDMwGqllKcglAwM=;
        b=YfzjfiayfKRHqWbMdh+LjQ6JzzlIHaYVGKUXcvqA2xTHKnGJx0fxILIJZ6pTsfyrUb
         9Tthl4FrSIiUeu1hdobFfLESfSCfkEHl0VkK+Svri0JBF4ZeFh9/qvz57uCho7BX4i85
         UjkFo1v6gsgRW7h/02b4Vvfn8NmDKLnUaizMTFZhwAPwhL5zHS1cXQ8WRDtgrqVRdd+N
         l2WFTC2YRwayCge6CUrv75NBpOTMqMWnPo0H3KJTbNDlXBcP7eGfQGU0/qrdUq9sfJtI
         v8BPOngvuITbIx8+TppkOc3ijXT/QLE7h9BvCas0hO5ObrOKORW3biohsfIdlqS79unU
         kfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=SGJVFwbtcacUQay73yW9oHCDfqGazDMwGqllKcglAwM=;
        b=0m2Z8IpqH2YnkBwVnnqINCwnhVhdpku9ZYY6cDmP8L+xyXJudNfZwWqNZ/IxJNMcrl
         An/QzJiOyr8ykk8KatjSWef1fzWqYNXNCd3VjG0+f0jLac/U3+sfXW1AsZ5PkVgbAg+T
         AnqsRlwxZIQgRuJapbfgCtkQAnjc7l5uw6tj6QbPDcxy7oyUv8KCP1VqteJu/a3m8pa2
         uZDEsh3zWP/5EnBw4R+dNT1u2DUUWCzjpGa/+CkTN9SmRkMWs4CIyFuIEsXAzUJ1AMEV
         kBbFeGi27L1Umcd8WfsbUfM2PL4cvALo5wSO+852qXGYaX1sRNQwOHUDjj0/YCPTTY0z
         SxcA==
X-Gm-Message-State: AOAM533ZqIKYDnpigXz41ynNh3TnYRNveIC2pCZ5kJW5y9c8jW/kyjdl
        HAEvRC7aXVQSdppfjsUkLjK5F1JniKdC96TXevI=
X-Google-Smtp-Source: ABdhPJxPcliPurdz/fhXogPo8OwgELGvNjZ+jctPk48uYdAWg/6N1n5HYVegEJnc9suEGJrLnytPpNCfCNdmuBEpF0E=
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr8102608edw.122.1641810679971;
 Mon, 10 Jan 2022 02:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20210715221828.244536-1-Terry.Bowman@amd.com> <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion> <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com> <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato>
In-Reply-To: <YdoG+en5Z/MaS/wu@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Jan 2022 12:29:32 +0200
Message-ID: <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
To:     Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Terry.Bowman@amd.com, Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 10, 2022 at 6:25 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> > I think you'll need approval from someone with authority to accept the
> > suggested change in include/linux/ioport.h. No idea who that would be.
>
> ioport.h has no dedicated maintainer. I would modify it via my tree if
> we have enough review. I'd think Guenter, me, and maybe Andy
> (Shevchenko), and Rafael should be a good crowd. So, I suggest to do
> your v2 and add all these people to CC. It is usually easier to talk
> about existing code.

I have briefly read the discussion by the link you provided above in
this thread. I'm not sure I understand the issue and if Intel hardware
is affected. Is there any summary of the problem?

-- 
With Best Regards,
Andy Shevchenko
