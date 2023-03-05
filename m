Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498F06AAFEF
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Mar 2023 14:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjCENhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Mar 2023 08:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCENhR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Mar 2023 08:37:17 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6650412840
        for <linux-i2c@vger.kernel.org>; Sun,  5 Mar 2023 05:37:15 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id c3so7877321qtc.8
        for <linux-i2c@vger.kernel.org>; Sun, 05 Mar 2023 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678023434;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPhVajQXAHXiBtIhnC6tYfEPxdRwtoGcOTVFE1WWvNs=;
        b=CJDMjHa7Gf8S49yjyg0g4Cs5oYyKflnAYbThXeImkioxieh3iv7lZh7fBsf7whDcqd
         +hfxgE/3MIawdSqiYew7rRxW7bTYDp8AccJCLsuWYEgwNhppDxNOXe6VsW2qqBH51LLj
         Q7xiyiKE13fPHEHtevpZ2TfDJvtZaFWYukJWvDi3Gq1nSoCoVw4s14a9TxGxbgsF7Xk4
         B8hpGlMb2ixnfvN0Vo47D/MAUfI8WeM4AqI8dMeJC3bZAp8aDN2VeO8tGfQdlv4bbB6O
         LH29cxVQw1MJEK0UrO8JnceJH4diKuUN+gEnaVHWssTw4rrODdPoZ9uW/RwtPGMcsr4T
         cJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678023434;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPhVajQXAHXiBtIhnC6tYfEPxdRwtoGcOTVFE1WWvNs=;
        b=WxXT/ikgp0AV4xESWOQKxNz6+ukT606J9pg0WcfK0czWbuTTAgA9Epiy5wtZXHhssL
         9G0FoG+8fLburY9keYbv9WyCHqqDFX3pjmvoE6FowFQ9HvTbM6wsw7/UA0L+6DOyKXaG
         1svNwmE1n4dqzNYTVsWnNk4yrL6UXAHpq/SeteMTQ/nj8d523gDjQFFtMKeAZO6hy4qY
         D30FVSiXEsp6SDUgo0SZLbOo5OZ29MdU1iBDA6SqqBSzQ5BGwqYrOy3wjVsDUZHe5Huh
         5gAV8zLGBsPGOMwjTLsFpjbY08IdSRL19KK1NOjenzFYpEwjhSm2AtlS1RjqfPAhAlyu
         ASVQ==
X-Gm-Message-State: AO0yUKUgRwnKworGCV5zKFK+w5DUYYs+cXIuOwShFYJ67TbJp55d8JRe
        7OIMG7ZNxqFlY1duhIN60Goh888Z5RSwq9+kORo=
X-Google-Smtp-Source: AK7set9gwa+7pdU/M/u2bz7oKmXd++Dr/sEA7f4cQHO6VS6zHD6dJXND79Y1onEZ9uEqsKzY0mcZrE00Q8IJts/gzN4=
X-Received: by 2002:ac8:4117:0:b0:3bf:f401:37e5 with SMTP id
 q23-20020ac84117000000b003bff40137e5mr2198717qtl.13.1678023434471; Sun, 05
 Mar 2023 05:37:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac8:66d9:0:b0:3bf:b9d4:c139 with HTTP; Sun, 5 Mar 2023
 05:37:14 -0800 (PST)
Reply-To: ava014708@gmail.com
From:   Dr Ava Smith <ava19910ava@gmail.com>
Date:   Sun, 5 Mar 2023 14:37:14 +0100
Message-ID: <CAE1P5ofHZ5-UELvu=dkChm9K-hTL=2c6uvYZVmat_EuYDnFdPw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:841 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7543]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ava19910ava[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ava014708[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 

Hello Dear,
how are you today? I hope you are fine
My name is Dr. Ava Smith, I Am an English and French nationality.
I will give you pictures and more details about me as soon as I hear from you
Thanks
Ava
