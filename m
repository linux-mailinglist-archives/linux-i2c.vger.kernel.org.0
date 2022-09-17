Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F52B5BB858
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiIQNEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 09:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIQNEB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 09:04:01 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C605D33A0C
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 06:03:58 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id 129so25426082vsi.10
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=B/bzVap7w2nbpPLUVaGrgo7Id2TJpqaHDpbbBhcEalA=;
        b=q5aA3WvPSjQ7Zy7M4aiyu4N1g3XjcnIscfKSHNQRpKP3NREswEokOT/NspAsgo3WA4
         lPKUk9Noy1+D2CYW5JPlNu0Kna+kHNAThVM5yMoOmuoyQefz6K+yLg8NI/UrVph7szA2
         yJBqVTvhqohmGS/WpsFgU+WR0kMbQnqkxFa2H/kC4RcPuL6ggGQyuibrj7/IaDG2BNAK
         6rE5ZCAlYL1XyLjyC4Xxma1qxdKN84ngRkmOBMocdGUV8wGXmH/fw1E5DXmeAZnRelQc
         pzsUZ3KHDh726meGUP0Mm2FoJ74qBWR360oaw9yMokvGMCZZ8CT/HiP0e8QF5GQAtP2+
         0Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=B/bzVap7w2nbpPLUVaGrgo7Id2TJpqaHDpbbBhcEalA=;
        b=1tJkXCviQNH02nPCeNKmOE2seJ9Px9Y21MQoAnKxud107tFKtTe9vgJeCwd8x72QGd
         fZDHzDQMljHRCIp5g5i8Yur/ECuD257zWoG8lP2HgSdgJ+Aszjq3OB8m+UMlNG0K45Y4
         Hvzwyz4X8m9i5bym9OM02E+ju7qJ1l0updZCy9aagGrxwSF7EEP0vO60MfxQaZIyS+hT
         IUF7lOiFKcoDfOSFg2N22KwGGDneUcHKj0j4PYcOCllQKwn72ROW+QvkUiYt1lNm0JXE
         5e1mTsFj9/Jod44asQF+1sRuikJ0x24u3pSCxOat2LDkFGwJ8bWOya4ypZGaYRXZoJQt
         dc3Q==
X-Gm-Message-State: ACrzQf1eWsoBP2WvwGAMj7BMtlMb20+mXurulQp1yOYnxhWDdpI7QkIh
        cBnSkFpetsBvk9/p/9we61c3Mx7buPW+7dECS5g=
X-Google-Smtp-Source: AMsMyM5p9ijDwtdGNy42LuHDlgPP/HQoGFUde1IoQ1so4VS2gQJAZOqi9Lc6mAGeUKxts2LXyNwdRLdDZ+wVw4LL9Jk=
X-Received: by 2002:a05:6102:1511:b0:398:73bd:9b4d with SMTP id
 f17-20020a056102151100b0039873bd9b4dmr3659504vsv.33.1663419837895; Sat, 17
 Sep 2022 06:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:1a19:0:b0:2f5:5f8f:da6a with HTTP; Sat, 17 Sep 2022
 06:03:57 -0700 (PDT)
Reply-To: daviesmarian100@gmail.com
From:   Marian <ikoroezinne0@gmail.com>
Date:   Sat, 17 Sep 2022 13:03:57 +0000
Message-ID: <CALHpY07tdqrvJQsmuOR811CwK9CVMyh2aLcPbD-bNV5fQh0CFg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5013]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ikoroezinne0[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ikoroezinne0[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [daviesmarian100[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Hello
