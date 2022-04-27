Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258A851156D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 13:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbiD0LB3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 07:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbiD0LAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 07:00:43 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2E0374D46
        for <linux-i2c@vger.kernel.org>; Wed, 27 Apr 2022 03:39:07 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id u17-20020a9d4d91000000b00605a73abac1so778715otk.7
        for <linux-i2c@vger.kernel.org>; Wed, 27 Apr 2022 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=G/onoDc/HUbw8IB6LpYOdC9f6gf1TSzfX9nZDAX1X+nQQ7QnHNDOdE5x8lc+q/pBZI
         7LZ0FUfwPUHzhitmaYzuS6ewwEZjhPOu2anhkc9zy/+WUwH5wWQrUaLqzvG0Kf2htpnR
         /zFpPVd+sKxQkXKLOASOu41KEanJ9qd2qTW1ZXcV5dr5PLdcEkOvcEz4cQbmXuZq64wj
         +4wWPgn7YM23XiCFCCGYZu2MB3bQX8EWH8Av5Q8yImeVSNefyUm0fKXzRBnEnrQPDHt6
         FG+7fR2OA5nyd+7vHUu3ASJrxazPif2fwoRjARqSGIHryeslexFx2jgoYFvrRIwFFZ4q
         gLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=0lWaBsWDsh8Cpi/ADjYHRDnbCga5Ow2zCh0quHZ20ky+o5+2gpA8HylM65EHh9g4A7
         9Q4YW81VeilIIJ5x4ZhufEHaEM2/bnJ96yoPHxkQlHc1+DnCaEwyF5kWQW5wd/0S5siL
         OC4bRPbHwQWYAXfKEVPJqPBhTd6D4odtzPc0+U5nFLntdlaWsQZm8964Ro1pRSlwW50R
         iujxa4PfmjpqqLYALbnTY9k4b8dTYR500K4GEHyAlglWwME1AtMWvk84ElZBFtwf6wWw
         n9JR6Y1MAwhivaPRN0uw8uSSG2pu7hsN3CxImzwqYVvBqcPbVOuL1O0BP9eRQSSdEQD/
         o1/w==
X-Gm-Message-State: AOAM530gv+DLuaF0lqSihntWPe7OujOegU9R0jGY5e0HEnkkf3cv73+D
        2VM+5LVJNahP1Zd6yx1Ao+Ud4Uaxs8Z9tDzZhudnKIuInq4=
X-Google-Smtp-Source: ABdhPJy4MD+Qiff1wgpL5f83gEB7C7JF5oHiPDKgZ/W+akqU3oa7chWbTQjtUDA/RFLG5KnUOK6Q/9lH86XdWDeioRU=
X-Received: by 2002:ab0:6307:0:b0:35c:8290:55ff with SMTP id
 a7-20020ab06307000000b0035c829055ffmr7900974uap.122.1651053788716; Wed, 27
 Apr 2022 03:03:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a569:0:b0:2b1:1d7:5c64 with HTTP; Wed, 27 Apr 2022
 03:03:08 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikarm <kodjoafanou2001@gmail.com>
Date:   Wed, 27 Apr 2022 10:03:08 +0000
Message-ID: <CALgh3enR-_Ax1HmYih1yEXgr99RSZfkJxaat1_KFBLr9+QwGjg@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear ,


Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
