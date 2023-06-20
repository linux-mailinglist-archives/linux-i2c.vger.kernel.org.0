Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFFF7363AD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 08:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjFTGgp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 02:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjFTGgo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 02:36:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0ABE6E
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 23:36:42 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1b52bf6e669so35063215ad.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jun 2023 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687243002; x=1689835002;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdxwweoK0KeyxrIRkhhBqs6Qf9iIESnDY6nQcUBQECk=;
        b=gtSwhAlKH6S0UnMglLcB7kmuNUa3fRk8EAmwrwu76R+Vy9wFoISuUap4q/a9WrY3Zd
         sZmU37leCalZU5t/cIUSgn9nrD4QQfLF4AFHrdQb28LKoACNPDdsNKLLq9P/VXJ9xjCr
         30OVsQ2kqlDX4vGL7idFvL/Kf/OOLsnYI2eA8/QKg7tNfttfYFN2T2FP27nxgcuYOLNh
         Ez4soQHfK82STFKM6bbfiPp9r0teTslXfyW7XKRpBvUF5sWgSknJdqQWa+cGjqMre5rP
         4mioO4BIQk7kQmb+OJQsABs0T9aHrDAx4qXWE/LEiF7PGSkSUr9fFPjljd9CBTI2j3Fn
         C6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687243002; x=1689835002;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdxwweoK0KeyxrIRkhhBqs6Qf9iIESnDY6nQcUBQECk=;
        b=RJJd5X9SSBF2BkvNKGhnbTBM6P6Q+u4hFvFB8VfkyyJfFDjDSbqevmU+GcYVtr1hh/
         PHV3rVtORBJ5/Sac3y48mCgHsoDN5OeH4gfqVxv9vFtQiVHWkQj4lq5GYAVnzYvDz/bo
         EmPMWszy28rO+V8uOl7JgCESa6/md2m352FByB/xb5+qRUGjk2s6x6GiFVpZ3l5TXBbw
         Ux/g3OBelR7bwNDwY5qf9/ke8vJQtnZqsWgU6c7Rdy1fD6uS92WH859qxMTfWZ/jVIhh
         m9hmn5+rkt1Z6OfXLjgFd6pbHF452HlOTTvneUWXPDYUA3Yg3x2y0Shd5wLLt3dSGTgE
         Z75Q==
X-Gm-Message-State: AC+VfDxhIrrlNTMWSDHOnypnDjhl5VKltFimpEYhbxe+SDdAGPgvvZOB
        yKqqWG12xSSmf63GJV/5uC3eJ2LlMte/yJWK7Is=
X-Google-Smtp-Source: ACHHUZ6izpm1spYPPUgQGNwEgP5FRwdezeyIbHocEUUU6hD/emR/Rx6gJMdRiBDWhvDN6KlEsRTAtSZFaRzcoU8+sS4=
X-Received: by 2002:a17:903:32c4:b0:1af:cbb1:845 with SMTP id
 i4-20020a17090332c400b001afcbb10845mr13828862plr.16.1687243001883; Mon, 19
 Jun 2023 23:36:41 -0700 (PDT)
MIME-Version: 1.0
Sender: mrs.munisafanasa@gmail.com
Received: by 2002:a05:7300:b117:b0:c0:763f:7fb5 with HTTP; Mon, 19 Jun 2023
 23:36:41 -0700 (PDT)
From:   Mrs Bill Chantal Lawrence <mrsbillchantallawrence58@gmail.com>
Date:   Mon, 19 Jun 2023 23:36:41 -0700
X-Google-Sender-Auth: ck2Ib1VGC540GGcw6p_wqc9wvKA
Message-ID: <CA+UxooC4Lqcc=xP2gQV8x9jForCvUsQkBvnrJTWfb_4MyVrXvw@mail.gmail.com>
Subject: Hello Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

hello....

You have been compensated with the sum of 5.5 million dollars in this
united nation the payment will be issue into atm visa card and send to
you from the santander bank we need your address and your  Whatsapp
this my email.ID (  mrsbillchantallawrence58@gmail.com)  contact  me

Thanks my

mrsbillchantallawrence58@gmail.com
