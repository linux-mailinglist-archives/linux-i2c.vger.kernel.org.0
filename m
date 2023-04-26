Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3211F6EFC97
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 23:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjDZVm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 17:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbjDZVmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 17:42:55 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A8D1FF2
        for <linux-i2c@vger.kernel.org>; Wed, 26 Apr 2023 14:42:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso3730515a91.1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Apr 2023 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682545374; x=1685137374;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=XNkZz594STdPHyX1p4sbWcT+/ufrjT0xvbgRrgWb3e2bUH7hRP0L/tfcdGAha9itOO
         q2evXgKmm6ti4Tco14pqA2bzKAyam2OGYxmsgQsmDvWqu+3YLKHCHYgZFE9R6NPkJz8m
         lfne6IEJw1+A8Y3D6nrh6Keqlvh6LOSo0DQmfoM9XwxTsw415XHO/qphrcKb4WovwTko
         GMA6gxQLmgm/LIwYzb4prbCJaoDkcp6DBPLEgGfcWEHUKtGVprIsTEuruJKV6bbX6nDn
         XrREbZBHiJu989RyMGy2M6qamTyZNkUqCplqESSSeetVi2bDd3Uc4BN/mwoIQMxQtv5O
         Fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682545374; x=1685137374;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=ZwFUa+EL0S+QKDvxRON9xNuF+Vyy0rcP7zbTJ1KAHutc8ZG5r6l2eOpsIUR0/BuuKF
         QMPirJtKr0YDMYeGkbiYmXC+fJsKyzTepBUj1t49tIkEeletDLED3IUQoZADtEY7ImlA
         Vn98vMbKUMLl8Asu66vl8eUvb5ERBKcnJXu/xf5MTynW2Eq6+bk0GII8+DvkL66s0Prl
         SfmTsHxJqMbxzUurrPVmFJkeOjojgSu/of5ycgR2Rc3eAGI6wEjJoLcykm3eLhKTIiNP
         rMWq9e/XyrDQM0c5N6kOm3N0MdxpaAVHspIagXYTroYpZkyDLaV07+/+PT4igm6EKPFx
         6T0w==
X-Gm-Message-State: AAQBX9c1jSPfJsStSlOhagsVbaOh+CyPW2yjfmg7UMAHlWh8svWPCBB/
        Us6YB0m28cXiADA4y6xIM6dCwIKKpXlvchrvn30=
X-Google-Smtp-Source: AKy350ZYt3fB9LROtObaexIp6GG4m2tcMkEElwocq1wzdkgNZzW1ov+iELSoCUpNt9JvM7K7XxPvVfLCjvxrg/Y2ICE=
X-Received: by 2002:a17:90b:1e07:b0:246:b2de:f13f with SMTP id
 pg7-20020a17090b1e0700b00246b2def13fmr22998894pjb.24.1682545374030; Wed, 26
 Apr 2023 14:42:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:c99:b0:62:e5da:deb0 with HTTP; Wed, 26 Apr 2023
 14:42:51 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <jamseopara22@gmail.com>
Date:   Wed, 26 Apr 2023 21:42:51 +0000
Message-ID: <CAB-St+LycjLvcQzu+CADijKmZwECO2BsJyZRvtVsJbVq4E7YDQ@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
