Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D85953DF34
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 03:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346138AbiFFBBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jun 2022 21:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236454AbiFFBBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jun 2022 21:01:51 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01969366A4
        for <linux-i2c@vger.kernel.org>; Sun,  5 Jun 2022 18:01:50 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r206so17846615oib.8
        for <linux-i2c@vger.kernel.org>; Sun, 05 Jun 2022 18:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=FZBEUhwfUDy7El98duLevmUtdExYqFmO0w0ETeOI3TL+UCyXTcQrnebDlF2ON9iRl9
         7tXuZMb8b0H8wlaQO/AhTLhfbW68loGEKMtGWjktvkb7uw20OQ873CN3zbu47AnQ+kQ5
         oAve3GiBJypn2nmQiFHAv9ZJHKxetb+eGwNj+bMQRAawmslK6T8cGlyc8SA/CWP6uk1b
         ew5mkBAGx1EdwAUkPYB8JxHI+bYqiHCISGI3E32K1aP+gu8h4D0XuF+Y9GTOj/M2a3Eh
         XECAzd6IgpdBaqYsCxORjKmUZFBX3iVaSkrkLVPIP81nytL6XHXVX5jn7JpbaH/rPTvZ
         3JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=G/MhwuVnywK24k0G0dCEPcl6jOpjHoD/TE9NQJ4AU8BKTsoqoMM2VNRK8j98yuqa43
         IihxLidYDJsK8qE3bvGb9rEAE2MyINEfpnJHPtStery/Op0L7Rj/UxwalYkpbqqS8G8R
         3kE1z+2PMLNuaz5CrUoWJ8ePQQziViTw7lxc8WrNpFW017LL0eSsVjGmSg6UQIojYPOL
         VZBGnJCoNidAwpUW0pTQcIgjyWE9g/S2Wwpc38MdrrahLTzSadc3dD8c7Oc2Kb/Cl5SK
         nf9SsK06EZ61WGgMrokUV+l36xb5bOxV+PwM9aYcB9eBcFqKfpqB4sjsOe6Yjgkz9qg4
         LyyA==
X-Gm-Message-State: AOAM530bg55g65QEUPIN7j0tAdXptsPd2j9gHXno2m7P9QHxj/DkrO+V
        blCBrnVRuxNwRJj7Dst6xHjRPDq1agePxwJUGnc=
X-Google-Smtp-Source: ABdhPJwd5WE4MpIsu3Y4+Fg86fCTKRqJKstdy5RR+U1xDX59TXSBIaK9N/ehp3n/3H00U71veaslYgOpd2ca6VxVEe4=
X-Received: by 2002:a05:6808:2010:b0:32b:17fa:a7e9 with SMTP id
 q16-20020a056808201000b0032b17faa7e9mr12297544oiw.173.1654477309300; Sun, 05
 Jun 2022 18:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3402:b0:a3:67f3:5d49 with HTTP; Sun, 5 Jun 2022
 18:01:48 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mr. KAbore Aouessian" <kiboraouessian@gmail.com>
Date:   Sun, 5 Jun 2022 18:01:48 -0700
Message-ID: <CALGXYcTDX_ZnM3pTt3+jOrj8vfRHND6P3=Ghh9OBB2B-3YXKjA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Greetings,
I'm Mr. KAbore Aouessian, how are you doing hope you are in good
health, the Board irector try to reach you on phone several times
Meanwhile, your number was not connecting. before he ask me to send
you an email to hear from you if you are fine. hope to hear you are in
good Health.

Thanks,
Mr. KAbore Aouessian.
