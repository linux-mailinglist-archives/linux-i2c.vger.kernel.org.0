Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E159698FC6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 11:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731794AbfHVJf3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 05:35:29 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:35164 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729416AbfHVJf3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 05:35:29 -0400
Received: by mail-qk1-f179.google.com with SMTP id r21so4527324qke.2
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2019 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NO22HbaMZJynJgD6+PgDdcz0IJRAkX2Q/TUAe3LAdCw=;
        b=COEUpB7lH+sa1Wm04QhSBmeEb8LEjrit6+KDHW0QV3SkhpdO+Ce09Rz+f5uPxJLN+u
         PvMmv4NQgj4yXMULkRZbPjXReODK5MwhM0rU94n4s3sxouvbYUUhCxBwPE8eRv4ZupU3
         KQx7RAWff5qZ1RW5IQeQjBsJA5gjRhDWjOiSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NO22HbaMZJynJgD6+PgDdcz0IJRAkX2Q/TUAe3LAdCw=;
        b=PyzRnNVdGiuO0jlZ/ovEjUXN2dqYAty+oJKFI2BBYXsRlqzmPRuhUNA3BqKw+DeaNl
         NFHkMzzJ4t19zhPaHNCtPRnPpcWYxPMYhHizUCVhfKbDQ3/F+bcJjuMMsOIUt8eeUfHE
         jZrRYJYu2XCGjBGuYme0lSYIiHMZEhBJUOBBAy10Eif5V0nx23VJLD5inDmn2WEcUovO
         nF4axMeKr1JYcwKvu51G1slseVHEVaR7PcE/Th3hfikT/5tfEhz5R2BVSEBdzpqoECYg
         CcZi8XoCZUV4Fv9abxOGnlLF15dO1NbcybQro650sG9hl8UtywvDUMcT0LNw9vgsaV1G
         M1Qg==
X-Gm-Message-State: APjAAAWsHb/FFMGO6A9UKYIWVfpERdaL/nTiBfYVUj8LMNz3UYAAUNlI
        NpHqb9GEEIkJNAxaiE87c8jiM939QK/CuHzX2iPeIw==
X-Google-Smtp-Source: APXvYqyJ0CJid6ew+jYjIZdViygDbZ1nSFTHSvRIEbJVqYXbQji9bHodn6KVX4KP8QmHSXLnWIh+hxt/IGhXvLaxdp0=
X-Received: by 2002:a37:47cb:: with SMTP id u194mr33199821qka.342.1566466528133;
 Thu, 22 Aug 2019 02:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190822055737.142384-1-hsinyi@chromium.org> <1566462278.26641.1.camel@mtksdaap41>
In-Reply-To: <1566462278.26641.1.camel@mtksdaap41>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 22 Aug 2019 17:35:02 +0800
Message-ID: <CAJMQK-hr5m_YETnObsgw8M5etm+9xL_KY=54V6==fSbY191F_g@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: mediatek: disable zero-length transfers for mt8183
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qii Wang <qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 22, 2019 at 5:24 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> Why do you need to change this part?
>
> Joe.C
>
You're right. We don't need to change this. I'll revert this back.
