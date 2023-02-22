Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE8869EC4E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 02:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjBVBUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 20:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBVBT7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 20:19:59 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC27303F4
        for <linux-i2c@vger.kernel.org>; Tue, 21 Feb 2023 17:19:58 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id bq17so6486011oib.8
        for <linux-i2c@vger.kernel.org>; Tue, 21 Feb 2023 17:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=EN8UP9MkkIFENrMyXeKMiWH+TfM/0XIfyQusKpIaMzzL5wcvTDkn3hAF3rKvmmIK0G
         kEuGCX4P08iJwUi05l/ei4ZNyAD5YkepF40mOtwUBKfiTfdcsDHrRq3TzcULRcpo8drF
         jyyuKALreygM8N6g0OR0oz/+BWldxss5/0EaOiVtpUkd102SdaODzKXKm1AEnXaAU3Wj
         Io5/qMofIg3M1WNM1PuPKtWoC8+xhwHPC0QPatG5hxKRN4B6QcYONNrHJYM4/UXFwnTq
         H9P0t+Hj4+OPIKcylVtXu5TrWMQR5/dg3aQtst06tSqP4UumcfiMCvidZkm+8FxpHEtF
         c0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=ipjVkqM/HIso2mjIFYJSUS1p0Ay+4L30FC2OSkNTAEkK0+D54a9MfZiN/7LZ0wI10X
         Vtmjp5BZdDBt9Uq8N1VhpirHOxF9RtrKfDSGWU8goRAHwz8R4u//pgU4zNNM+Sp4cvMq
         4pjMzvA10/2a1dNrB5abjjneWsTr6KMny/BTKpevrJyUtxDw0t2EKtCDTtKxhIXq8pSW
         xRL3dapIoxn7F8gqOI7J2Xy7UAjLkakDjfVhbUFwFXcJOsQE+tz4q34kfCdSR6QdMNUK
         ihOxrFt4toOlDX6iHA7KE/VzYoeHTyqga4X6cKAscNp/gSH0dEpz5HHNSHrX1nSzl2Hf
         2ZkQ==
X-Gm-Message-State: AO0yUKWE4nxCcMtyxnT2bNjVM6/IHLJPZvKZH/QZmldU0qE33H3ijNcy
        u+GV1D67IRVYd6PmmT3KiI55RES1zOK+6iGZNKU=
X-Google-Smtp-Source: AK7set9xf6uA12Z4pi4o+HfnzpkAgnCuWF1qjZbVcUi5m8jvMDZxF+K4FEjUIY75Eow3QNbny94nl6EpUA/8zsMQtnA=
X-Received: by 2002:a05:6808:e8d:b0:37a:ea20:561c with SMTP id
 k13-20020a0568080e8d00b0037aea20561cmr2032377oil.42.1677028798109; Tue, 21
 Feb 2023 17:19:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:cf9b:b0:f6:7c22:515d with HTTP; Tue, 21 Feb 2023
 17:19:57 -0800 (PST)
Reply-To: fiona.hill.2023@outlook.com
From:   Fiona Hill <hasanahmed62621@gmail.com>
Date:   Tue, 21 Feb 2023 17:19:57 -0800
Message-ID: <CALpxZtgFLMsz6wxWC47T_MXMiOpy=0ukiQ0BQCFkS8O_fk2ouw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:22a listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7739]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hasanahmed62621[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hasanahmed62621[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fiona.hill.2023[at]outlook.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Hello friend did you recive my messsage i send to you?  ple get back to me
