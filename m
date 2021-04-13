Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD6A35E82B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhDMVYg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 17:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhDMVYg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 17:24:36 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B7EC061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 14:24:15 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so4853685pja.5
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 14:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
        b=qwu/z3wTrpp5MMaWa7l3cQz4itDaaPHW3JyggVWUDu3sP+rMVEPc7SnPa4fTdHWXWk
         US2+KYZ4o7q6l9qGxwduHbyi5n0IeuW62U3Suibh8TnTfgI0IZOCKOb9aLASA7+pEW42
         ggG9UjpBKBRfvFNiusX16PXpetzhMCieq36otySqrUqD+GMZ/kZDZuDSLhtyi9NRA3xF
         L1zea2cz+qTwKpPP6B/UmmalWKtvDjg5VOLuMzhJrRpIhlXV/3gIYO6Tkf5eHNOh6T5o
         zMcmKvlsqba+0XKpDOephk9dxALnyh2Lf0h0AxtruUZOc6HscSq5KEQj8eDCNlh4mFyU
         iwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
        b=eGyeiiP0rpv+rEufO4PBfpMNnI1v/q8ocalODNSz5BN67tvgCn4ANEOGJgoeYw3k8b
         ZJ6zwbook5cy3YhQ8H3DtvQoSdMy1HlQpzIWTEhwFx+UvnK6wybrGpl9cIIvjif1wKag
         76pJXWRCFNX8UoGMok0w2GFF0CAEIg629JAlefa8oDwCZYHxLBYMHmOyhwF3C/LmhjCk
         pQ49Yf4g0+BXrqRZTYt6g/sDfcx4ritHbAgvfIazFwvxy8BH5LfAuQ7f8+mkV3sKG5xo
         PqAKoJxNSZBGGvWFS71kUQD+CuVcLRTXpxXfvzNoFG0x9ysRMDdHgGV+dwP7cTHJevci
         nryQ==
X-Gm-Message-State: AOAM531hF8r+9wNBEUucp2Nx6PnvxGYkEg4B8a93iD6QxyrkuPxG2YWZ
        /4qnwTTgTysJi1BavuYMAt4mt10zuxGFsSQ7YMrlBg==
X-Google-Smtp-Source: ABdhPJxORhjMtdH97VTzoYhToT5Sfmca+N6V6zwa7pA3FPVL1L6OGFpc6sJYDeZN7H6NBHUzbo9M08UkzVohS29TCfc=
X-Received: by 2002:a17:90a:ff02:: with SMTP id ce2mr2072837pjb.217.1618349055195;
 Tue, 13 Apr 2021 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com> <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Apr 2021 14:24:04 -0700
Message-ID: <CAFd5g452cbyy0Cu=z952X_WMNUoh5TtHvUpDQpA4-APodxZnpQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] i2c: aspeed: add buffer mode transfer support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 24, 2021 at 11:04 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Tested-by: Tao Ren <taoren@fb.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
