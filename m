Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2447484EA4
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 08:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiAEHR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 02:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbiAEHRZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jan 2022 02:17:25 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A362BC061761
        for <linux-i2c@vger.kernel.org>; Tue,  4 Jan 2022 23:17:25 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id l16so16649046plg.10
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jan 2022 23:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=0yoaDHTR+UWnH2hzHO85umfVIpfOB6O5jobq9jPkzE8=;
        b=KjWAViFeTRVtdh6oMaN3XZmD5eJiv13lJBXLvHlV92FYGwYvmgBWjBuJpeQjnxJuhI
         nqky01G0Vi1otM3/Oo9yt7zAAy81f8r613JS6Lu9OZWcntSsbHYYzjFZJYSFgv3qlIyb
         GGOfQzR6Qlhylsq/rVdGBSwUXDgbSMex7ky+xA23Bjeaj9tczFgsKlR1PRhBhckj2qu4
         b+f8iaMHMswgvsH8g10yh08d0UBuwqnGFFfgqHMQEgAUOWMqEsVUQB2RIgNWMvnqiV2K
         OryZHWZlMrRwdy8B95Ohae1Z8wO/DnlXNAsFrMVnAg9QVdoQIdMDSmjl7Ju5AHGmnYzL
         UIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0yoaDHTR+UWnH2hzHO85umfVIpfOB6O5jobq9jPkzE8=;
        b=wiTPn5eg9X0amzf+IUzWMqEke1UX35fJycA/TUZpmXnpED1g84rAvPkitlwdPEhgV6
         ahNumyFJCPew0TgS04W9MSsJPKj6+kRs7kJWNgsE1wDAKvAT27Wua8RzFp06DwYcr9NI
         EICFTkgoNPYi6ThVXcRsrDe/+oTP2zCZscY0IvBZmkUg0Vj2qVLJ/yqM7Cv4prL44VDP
         RZiD1B+c4Hra7QfxT+gcWYq1HJ49fZzu9tJWKsltF9+HFTmF3SVNln2iS0NPqyvYuyII
         RV6h2Kq2ESL2c/rgCIKj4Php9VKa2439ZxFRirPbGWbpcNZJgUPOcHR5s9yj6SyQDT1Q
         1Q8Q==
X-Gm-Message-State: AOAM5317FDCsUglvHibBNupWT7X5ZLjkPmWoAxyNJpPFmQNCDQAdH7GC
        Z4Hr0MWDSPLnl790fEI3+eJVAhulM+mdFn3LPNZ0kT3srj0/pQ==
X-Google-Smtp-Source: ABdhPJxL0meclPPIvcIrjcPBqJG9/+gYhu0BZT4yJRon0L1OuZEnDzQYClphRNWYErhVZW2E6Heja4/KGMcbAzpDyfA=
X-Received: by 2002:a17:902:8c97:b0:148:ce06:eff9 with SMTP id
 t23-20020a1709028c9700b00148ce06eff9mr52614567plo.5.1641367044744; Tue, 04
 Jan 2022 23:17:24 -0800 (PST)
MIME-Version: 1.0
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Wed, 5 Jan 2022 08:16:48 +0100
Message-ID: <CAGhUXvAPb6KXbs3ux+NUvH2v0N5k3nqz_kNcNLuOco=oHQhzVQ@mail.gmail.com>
Subject: Touchpad bug affecting several laptops
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello i2c,

several users are reporting touchpad issues on various models of DELL
and Asus laptops.

I have reported an issue here:
https://bugzilla.kernel.org/show_bug.cgi?id=214597

But it seems like it has not been inspected by any i2c expert yet,
hence many users see their Linux experience on a laptop completely
spoiled for months now.

I unfortunately lack the knowledge and skills to investigate this
myself, so all I can do is kindly bring this to your attention.

Although this report only has a bunch of commenters, many more
affected users are active on the original issue I reported on the
libinput project (linked in my initial comment), so for sure whoever
is willing to investigate this, can count on a numerous, motivated
user base for extra info, logs and whatever could be useful for
reproducing it and testing fixes.

Thanks a lot in advance and have a nice day everyone.

Andrea IPPOLITO
