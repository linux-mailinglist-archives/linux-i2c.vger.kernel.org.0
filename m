Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7AD5FBE9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 16:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfD3Ox3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 10:53:29 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41185 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfD3Ox3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 10:53:29 -0400
Received: by mail-ua1-f66.google.com with SMTP id s30so1620727uas.8;
        Tue, 30 Apr 2019 07:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTLeDmf40HKyuygAD04IjYkWSGll1fsdZzZH9HwXX+w=;
        b=g2UWEuLiOrM+pijkQRVZo9+nkREwNOSluuEV3GQ6mH/MYCGGiyLevyXCmYptmxxhT/
         sSZAVzBydEF/lSgsbxmej97lowHXMTHkiwo+OVJzN3JtuCPXYRkaVfa7rLwUfAm25zBm
         S3EUOnDTsEH1Pna/mvKLQQ26CywKqAzILoDDaUmQsBXm5zt3x8dzEHPxXPfRJfssr2CR
         yIvs9L9RXNIaJ0LA6FZRKXQ9Tsfgh/S/6zCx5vGhs3ihrPuV4Us3/qpVfd5HHZy0mexQ
         f/2ZLKGCc8c8hCfdHUwLrVg7U7EyCHPtr6sWX0Qe2h79/QUuUtwui2wbmZEh36g/qFdZ
         gscg==
X-Gm-Message-State: APjAAAUqt7TNsKBt0O5RhIXa8ihIqPHGhwED0/+9cDb7MpGvBHFDt3Fk
        w2gvErnEcHaXnBkzxKhgc9uoNeHKnCt6QcoAzaI=
X-Google-Smtp-Source: APXvYqwF0Zbtifq6u8tBBo2RW3XLYNv7pCPith08+k0vO8l3qrEdgc5Ka0pNcs3HfC21rFBjLCYphaQSO9o1caCaH5o=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr6828806uao.78.1556636008367;
 Tue, 30 Apr 2019 07:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-6-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-6-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:53:17 +0200
Message-ID: <CAMuHMdXYfemNCfzci9fAcPWpdHOeKJNkTirrrB+97t5Aj2Bzxg@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: r7s9210: Add SDHI support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 3:33 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add SDHI support for the R7S9210 (RZ/A2) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
