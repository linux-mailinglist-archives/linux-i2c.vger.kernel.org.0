Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867351ED197
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgFCN6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 09:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCN6S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 09:58:18 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 009D2206C3;
        Wed,  3 Jun 2020 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591192698;
        bh=tu0umueWXJQyn5GQ9x7J6/ozi3B9DZXrKnvEP3mbPZ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=O70gpSkZOoGft8T1bS5TY9Jbdz76Kf5Mt6SGt9S8EnqWUsflObTwxpJ/hK4sb6MRn
         hlTp7NepxexRQ8Al63nPu5yOpBgB9aXjcQNZ8RrOhQwWmKs9SrOjq+1Y28+eG2rYY3
         gafQnzfISLUAT105yMle0QJHlXLafxE0TPuLycG4=
Received: by mail-oo1-f48.google.com with SMTP id i9so517696ool.5;
        Wed, 03 Jun 2020 06:58:17 -0700 (PDT)
X-Gm-Message-State: AOAM533vlKmh1JX3/WGHtYmNVfxxgaXu8+C78i+bznHqMX2IV6cKqmmq
        8gcBrzQCR8iurH6Unq+v+cm/iuUxN7sDOnPecw==
X-Google-Smtp-Source: ABdhPJywJXOvUF7s+LNGI1f+bDTEKre/euKaSqdcytI1e+8skWqTrY7hVKw25RlHog2tMeKNuFsdPBRqXns2qKFWnCE=
X-Received: by 2002:a4a:dc83:: with SMTP id g3mr88066oou.50.1591192697357;
 Wed, 03 Jun 2020 06:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
 <20200529220228.GA3052199@bogus> <20200529230252.GA4798@kunai>
In-Reply-To: <20200529230252.GA4798@kunai>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 3 Jun 2020 07:58:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+xOMnBQvUqG57StvE=tY1RiseAJmKsN=1LpPY43Ai1Xg@mail.gmail.com>
Message-ID: <CAL_Jsq+xOMnBQvUqG57StvE=tY1RiseAJmKsN=1LpPY43Ai1Xg@mail.gmail.com>
Subject: Re: [PATCH] i2c: add 'single-master' property to generic bindings
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org,
        Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 29, 2020 at 5:03 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Rob,
>
> thanks for the review!
>
> > Could you just have different timeouts for clearing stalled bus. You
> > know quickly if 'single-master' is set, but have to wait longer if not?
>
> Timeouts are a difficult topic with I2C; there is no timeout defined.
> However, if you want to start communictaing and don't have a 'bus idle'
> condition, then the new property makes a difference. With
> "single-master", we know the bus is stalled. With "multi-master" it
> could be another master communicating.
>
> > Note that we need to add a bunch of these properties to dt-schema
> > i2c-controller.yaml. I hadn't done that because I want to dual license
> > in the process, but lots of folks have touched i2c.txt IIRC.
>
> What is your motivation for dual licensing?

Non-GPL OS's use DT.

Rob
