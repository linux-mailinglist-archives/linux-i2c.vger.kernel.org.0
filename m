Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA31D6F339E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 May 2023 18:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbjEAQnQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 1 May 2023 12:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbjEAQnL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 May 2023 12:43:11 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A015173F
        for <linux-i2c@vger.kernel.org>; Mon,  1 May 2023 09:43:10 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64115e652eeso27940431b3a.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 May 2023 09:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682959390; x=1685551390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri5O66x209P4BuShL67PrVcQqCP14/P2H7cWnKrf7zA=;
        b=gjlhz5Ml1CqrWOwIkM4S8xGz6fBrragowtE4Jb2EGM9lEpfT60hYs92mSWwzcNR4S5
         MdCzON4CNHWycWJ3MEcNXTPSMhyEn7b1FPFJZUwEVCsl76myZiFSsdB0CYM88chGSkRj
         UXyjzeQlUQ3ZE55/3L92aPe63EtzWNnoxUiw2OxmRNfTiwPgcd0Ul/3sY8RwFr7ltIXd
         xz0UVD40QqMUY7d/OCJ4+Fa1fGa6p6ed8a3UKu9h55EOo+PChE8z3faOpz0N1OKtDdo8
         bAgrHQ2Xv0nuucy3yrXomOB8XKVk+ZxCDuXtrftLUgeGSIe0KiAITEUkqzfjpX4TJH36
         inJQ==
X-Gm-Message-State: AC+VfDz5jP3BZw7wYyEsloO350RRnqCusuzXrEc++3tByvqhUrow9zbk
        hQU/z9EuIeLXK5riwPBP2tmXUzxOrtI=
X-Google-Smtp-Source: ACHHUZ6fqao3rsU5NUOW/KdldWQm0WIZQgqd7yRk6H+XgeE+Dw/ZJ9j1o+Nxq+GUYrRc+/KgzEXBKQ==
X-Received: by 2002:a17:902:f14d:b0:19e:b2ed:6fff with SMTP id d13-20020a170902f14d00b0019eb2ed6fffmr15578896plb.31.1682959389435;
        Mon, 01 May 2023 09:43:09 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id l16-20020a17090aaa9000b0023d0d50edf2sm1215165pjq.42.2023.05.01.09.43.08
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 09:43:08 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64115eef620so27944241b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 01 May 2023 09:43:08 -0700 (PDT)
X-Received: by 2002:a17:90a:eac2:b0:24d:dcbb:6307 with SMTP id
 ev2-20020a17090aeac200b0024ddcbb6307mr8467368pjb.6.1682959388134; Mon, 01 May
 2023 09:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAE8T=_HGM+gKQguOasGSKi5YXh91S62QYA2=MC45CLJPYxrVAg@mail.gmail.com>
 <ZEISllc9y2bot/ZT@ninjato> <20230429171522.05c671f8@endymion.delvare> <20230429180634.7f94b29e@endymion.delvare>
In-Reply-To: <20230429180634.7f94b29e@endymion.delvare>
From:   =?UTF-8?B?SmVhbi1GcmFuw6dvaXMgUm95?= <jf@devklog.net>
Date:   Mon, 1 May 2023 09:42:57 -0700
X-Gmail-Original-Message-ID: <CAE8T=_FN6WUg5+CwQYnR5yXJtefxx8t85TTMzJ_weaKc2GnDUw@mail.gmail.com>
Message-ID: <CAE8T=_FN6WUg5+CwQYnR5yXJtefxx8t85TTMzJ_weaKc2GnDUw@mail.gmail.com>
Subject: Re: [ee1004] Failed to select page 0 - G.Skill Trident Z5 NEO DDR5,
 ASUS X670E board - 6.2.11-arch1-1
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you for the research. I was under the impression decode-dimms
supported DDR5 already. but I really misread the patch. It's only
adding support for listing DDR5 as the memory type, and nothing else.
I may look into getting this done. Strictly as a hobby with limited
time.


On Sat, Apr 29, 2023 at 9:06 AM Jean Delvare <jdelvare@suse.de> wrote:
>
> On Sat, 29 Apr 2023 17:15:22 +0200, Jean Delvare wrote:
> > I took a quick look on jedec.org in search for information and found
> > JESD400-5A which covers SPD contents for DDR5 and it enumerates 1024
> > bytes. This is twice as much as what EE1004 EEPROMs can hold, so DDR5
> > modules are definitely not using EE1004 EEPROMs. So far I couldn't find
> > the "equivalent" of EE1004 for DDR5 modules so far.
>
> Found it, it is named "SPD5118 Hub and Serial Presence Detect Device
> Standard" and is published by Jedec under reference JESD300-5B. That's
> a 126-page document. In comparison, the EE1004 specification was
> 35-page long.
>
> So I expect there will be a lot of work to get it to work. And I don't
> own a DDR5-based system yet, so I can't even test.
>
> --
> Jean Delvare
> SUSE L3 Support
