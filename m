Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FD874C13C
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jul 2023 08:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjGIGQp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jul 2023 02:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbjGIGQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jul 2023 02:16:44 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3ADE4E
        for <linux-i2c@vger.kernel.org>; Sat,  8 Jul 2023 23:16:43 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id 3f1490d57ef6-c5ce57836b8so3907700276.1
        for <linux-i2c@vger.kernel.org>; Sat, 08 Jul 2023 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688883402; x=1691475402;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=Bp5MLvKPSk5zMbAC/lttAdgyhC6wqBrx20Zr6vebn+/0U+fjSDRgD/l9Z5tUmJ67TZ
         vtzfcWzCq9eFkMP1wm+iNthhOOTdTMAUfemY994pc1Vcsk4/nHlq8vIM1LCGXMdPOrUB
         U21MpugVWLPMpmOSYigcx5pHCVVItOA+ZqUaxPGgfysELso1+wGqj5Wnp62wcEm71XOm
         jOBl38WhtzxvBwD6cak1rDdOdkhOBhT4JC7yK2jyZ/IDmbDwPOivr0BGiSqOgEtQettM
         pmH+KLXC9g90nw9aDDvE8KlonfY/glvE4j5x+XvvndwhZJNCtombGtVRls7GTt5eWP3J
         39bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688883402; x=1691475402;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlwvXEoimVTfsyyyYai0GQlqo3zzXGhdH5Gfvmx5TY=;
        b=j7X5nEnbyb7hDlvbmn+2pSvQhE2k5DAnKM/V/DT33/rEVq3DvJ3XbE5oRQzbfrG9M0
         25z3macl5OyhyTZplGpLp8n2bzkudjPMKNknY0EEYf0/1e95uOpAFIlTAgbaJoRvHk1A
         X6G6bAarSiR0FFIHJnWwFI4yipoxWDu5iuJuWedUBi6sUfuJgl7BFUMJ45+IcXM4ammV
         fUdQkh1EuPVAG+LKm8VmRMl3yyQo2x+x0HKBYKeJnVzCSnvWO5xu+xIS1eSEF3L5mENc
         pCjlaq45RUYlOE709QubevWwxHkNrUjzuEqg0uTG1TYwihiVvbuRbdsCRGqQnMTsH/rV
         PxSA==
X-Gm-Message-State: ABy/qLZzuEOEep+c0QjBRFnxcBEM1edKugTOw0Q1+erHY5dRzm1LqpJR
        3I8HLztUboYkl2Cn9D3DZlKd2vujtS8i2XZpTpU=
X-Google-Smtp-Source: APBJJlHDyeGMLRJh1TqEFXuQL5gNHvL979NAqymoRu2852sJo5Wc5PVm71x+nJyUxH/c+0ShKcWO/9pWFC+1aec0z8Q=
X-Received: by 2002:a81:5f83:0:b0:576:b52d:4946 with SMTP id
 t125-20020a815f83000000b00576b52d4946mr9750194ywb.30.1688883402409; Sat, 08
 Jul 2023 23:16:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6211:b0:35e:b32a:1b89 with HTTP; Sat, 8 Jul 2023
 23:16:40 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <coulibalynina15@gmail.com>
Date:   Sun, 9 Jul 2023 06:16:40 +0000
Message-ID: <CA+8Vp3Va6YuVNky0j3E1UYrYwr56aeg2aKtMxvgOUsLM-3zVTw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear,

Please grant me the permission to share important discussion with you.
I am looking forward to hearing from you at your earliest convenience.

Best Regards.

Mrs. Nina Coulibaly
