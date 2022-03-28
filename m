Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4571A4E9251
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 12:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236973AbiC1KLE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 06:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbiC1KLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 06:11:03 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4556E4477F
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 03:09:23 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w4so14344268ply.13
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=UIbSwXETQo8py8NKWWoOzTbdb19k4UaVxjqlebXhaiE=;
        b=UH5BenksiQsPzEarBBpvtI+DTye7obdn+GL51djnBAcS1MebVUGF3hry9o4uOMH5Vs
         EiBh2CgDATjBho6TZeNEk0ESva0l4dzWyGpdpSqLbBLQaFBQISQ/xYquaSTF9vtzR+4h
         1oEqSXMUOOPKVnNW7QcnpqTrSIh1qzmYARq+/29/R5Wvx5/jhPTsIT8PsJ91nbnZ6nqc
         vcIifud7GDtkZCNymUq1R9G+jkFM+/71g8y7FrSbq5nvbINTudWQzY77qsTvJL+EHW/h
         BuZUE9Lktbi0LKckbllJ9Vxy8tUM6K0SdKbtCxK5a2UGstY9vymXpOj83SU8HnbUlyk1
         eyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=UIbSwXETQo8py8NKWWoOzTbdb19k4UaVxjqlebXhaiE=;
        b=heMZnyZpJV+Jw6i87hciSvkwr2r5zl7noqo+WOjJyXe3tWPRBSPqMy2HTkyG4JyVjk
         TtLm1Bnywf447zzeXJUprlr2Z9kiOEcdf71lvdViQYqkfjU+l3Ucu+6H5dLstR9jjp8A
         EUyNakZ3SPuLfAxk6XjvYW+94aQc7RXIzct5OYpLLp6waQ0awrp/Kcj3kyyIM91DMFx1
         L/yfqgaZeaBMhD1XxuIre9cm/9rCJ1UmZ09GccJKu/SgU/qr68aS9BDYlRDr+MHU153J
         B+n1EeikP1rQxogI0Jvf215zUVHpcnT8QctfpNxjz1y3g79PFGxzyClkeG6JaRl19aHc
         H8Sg==
X-Gm-Message-State: AOAM531ntz0vCF9S73SwNAmz2exAz3faXKlIudCnP9323ThSazXUQMa6
        iI3hYjKeqo6bir19LiGDyse2YYPNpW4d9IMSFW0=
X-Google-Smtp-Source: ABdhPJxVQK8wZiIhOrY0jRfUMeLqlgCnzMAaeZ6ID/Yc70cDitOgudk3xJ/aZgskBnWd00fKtXnj4IOaKviklFOcpGU=
X-Received: by 2002:a17:902:c412:b0:154:4012:4beb with SMTP id
 k18-20020a170902c41200b0015440124bebmr24855194plk.107.1648462162838; Mon, 28
 Mar 2022 03:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:380f:0:0:0:0 with HTTP; Mon, 28 Mar 2022 03:09:22
 -0700 (PDT)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <sylviajones046@gmail.com>
Date:   Mon, 28 Mar 2022 03:09:22 -0700
Message-ID: <CAGH1ixsCTgMUHjRnSsRVfxnUMTdG2W6YNmD8xEZKQBUQmVbmcg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Hello, did you receive my message i sent to you ?
