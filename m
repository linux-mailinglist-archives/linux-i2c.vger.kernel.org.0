Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573DD35659C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbhDGHld (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 03:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbhDGHlc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 03:41:32 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991C1C06174A
        for <linux-i2c@vger.kernel.org>; Wed,  7 Apr 2021 00:41:23 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 82so8529795yby.7
        for <linux-i2c@vger.kernel.org>; Wed, 07 Apr 2021 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=G/kl6r+27VACVB/v9iRrNaxVDyRWzQ7Xf64fpfKZK4s=;
        b=Ch6ftcQBwgB6CAF+vyowde3yf3eCujs8JkMQL2XTyIV4ELQ1Xa/2davO43OH9vo03t
         VWxbFg5LC6KZS0GB2YAkUBYvT3ScQWtZRRlV5l09AHRhT3oxUO72HGvZf2lGotFYnAf+
         IktnCLBBFh/iTkDxOrneoQJ/3u4Ox0i5qjqwr5qx+zmgsM4tfAsJVGDrFPSJMVv9iC6n
         oslS8r+WLD0qhndBA46aN+fGaBL+kUdmIBLLOKWOVvczpNHzngeWXKdRdY2TiL/lsov5
         g4tEGtQNE5GIJ/Wz8RxHua47gkoYNZkbFM7G/AN0ATrBYIP/U8jhZR4xc+V7NtBbYjMO
         GIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=G/kl6r+27VACVB/v9iRrNaxVDyRWzQ7Xf64fpfKZK4s=;
        b=K2+I1JmKpBRBAbF4eGKILg0l62kqXO1SdjTOs/46DTV/Jc7GChhDyWtRrGF8PcPsHB
         RBNGJEm986Kd4mzHW3m0aoXubXNIB+ftRgaD2HCsdcjD0jqXsfDMThzENsX6XE1+Oqkj
         3bUdM1XqT0F/rpeZwblMDjQnKPvDA9kZ7biPi16U1T9igsUZD5GzaHT4jNJqebo5N+P3
         b3DC23fdHW2p+C7CM7HsGHW3PLSCMhIYViuI497IldtlcB0BWxJlq3G1LC6Qoo3uh6tU
         SrTPzaZzn6irsIBDg8G3MfM9NYIpESitqykTZQ/MGyqJLUgM/LiOdzeJ219408L/4jLo
         EJCA==
X-Gm-Message-State: AOAM533QJtxSd8/sx52+FhEMOdMX928n+QSfikae3OfdDxnLzMwJVpoF
        ACHiASvudjaFwgZkml+XHgKjTIWCAVUZTUlHYz5qkQ==
X-Google-Smtp-Source: ABdhPJwhg74aV8nwZyITxZfzm0u8F0AEC0FHWs4iKNb7+zw1ZaAr9mDM4vRjdBC9sUpkJWeYIkaKnZFzALuPOr0t8qc=
X-Received: by 2002:a25:768c:: with SMTP id r134mr2700386ybc.366.1617781282961;
 Wed, 07 Apr 2021 00:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-3-heikki.krogerus@linux.intel.com> <20210406193855.GB3122@kunai>
In-Reply-To: <20210406193855.GB3122@kunai>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 7 Apr 2021 09:41:12 +0200
Message-ID: <CAMpxmJVykT1GvSC4hng14DeD5VDLTaQ1otB-s8sgu17oxhCQSQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] ARM: davinci: Constify the software nodes
To:     Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 6, 2021 at 9:38 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Mar 29, 2021 at 01:50:37PM +0300, Heikki Krogerus wrote:
> > Additional device properties are always just a part of a
> > software fwnode. If the device properties are constant, the
> > software node can also be constant.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Sekhar Nori <nsekhar@ti.com>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I like to apply it soon. Can we get an ack, please?
>

Looks good to me.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
