Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CECA735908
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 16:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjFSOBE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 10:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjFSOBD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 10:01:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0997010D
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 07:01:03 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-3f900cd3f69so19956595e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687183261; x=1689775261;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=LFUPhZWr9OejkVe8vrK1RLqExmiJ6VnkjIuFxPfFF7fIaut2viC9mLZRInOQifGwtX
         vzSm2imouCpOegULFEYBoyrRMxSQbLYX0N2FxrYq31loa7++1oFDAcpuEE3cRbdLSYRx
         S6Qhi8gvP/CrYvKAj0mLiSJEUHnmTyt2CcHhh4SHBr0OZfHczkOpkY+WxNq0YaZl3uMS
         pttIbtZcldjutzw1VD7sVDYoOKJwGcO96jL2Jz9ZeoIO5tP6YBxfMa10lnZGOWgvITWV
         uq7DyYJykK4qOg5ZUKkrpSeFz+zOt1rooNBy25xCP0LMzHCBfGzLkTydHFCMeB8jLENY
         n1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183261; x=1689775261;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=ZMtJWb+oUcDfgiuIWwnwUD3Hql+SmMHL4cQbaNO0JBSXigCVYODTpOtmFdwSyuHKDh
         YXFuNHtxaeMCJcD4Ua52MmITBDOqwBiymdkF20kn5dLPZrnJxmDhjVqoyoxMald4Opk3
         i9x8aDgg/0RDQOH3zjVxfxyptFCqs+vpYITY39MYtKqctemv5qAt8OSPfhLTenlD7Qe/
         Pmzr+6beHJzYZ0qnfguMcKrfqJZtbyAaXtxzg/CZk2TWKVO2lBfzjrM/jmrbiW2eCO8l
         JTethMNMJcu/VeMBkoP2YnkFGrrOZgBOIek+Ouo/T7q0NjLxHo0ogMnnvKLaaqS5MYiz
         d+0Q==
X-Gm-Message-State: AC+VfDxVzByHNquHEYT3HYcEzOaVuSsukVrfy9aIzyCHxjyckWSCVORO
        um3Mb/WdHcs+v70fHDIj/HcRnVWxLOCisKSTl04=
X-Google-Smtp-Source: ACHHUZ56aW+CX9Lm3umDiAdWySJt7V833IxUI+qvPK1z85vSOUK7sRep1RLXgWx0PVvBEgsrQKI32Cf00sJK50HoFE8=
X-Received: by 2002:a05:600c:2313:b0:3f7:33cf:707b with SMTP id
 19-20020a05600c231300b003f733cf707bmr6717084wmo.1.1687183261194; Mon, 19 Jun
 2023 07:01:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:39c:b0:52:9c4c:58ad with HTTP; Mon, 19 Jun 2023
 07:01:00 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <yewte444@gmail.com>
Date:   Mon, 19 Jun 2023 07:01:00 -0700
Message-ID: <CANmt-qHC6YRV8xDfV-kDGLKxmKfi4yhwHW5j5pfuiMv-99xgrw@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:342 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yewte444[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [yewte444[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
