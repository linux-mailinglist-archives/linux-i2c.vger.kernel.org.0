Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F329C528052
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 11:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiEPJB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 05:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235153AbiEPJA7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 05:00:59 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACF921A7
        for <linux-i2c@vger.kernel.org>; Mon, 16 May 2022 02:00:56 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id z144so14746236vsz.13
        for <linux-i2c@vger.kernel.org>; Mon, 16 May 2022 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=m8QZCq6d+0WnsrTXmg1q5yEUmIzEgJzq+hl7H5yGRSHVsiH+cln9G3zk5arwZ2+KlD
         dCNZOVj33SLM6C/vwkoHwyhfT8G9KCF59FuBHZ/13k7w+bpLX2F2yM6v0OPuLdpJPigZ
         UmDLM/9Bx4YOoO2qI+rgvAXwYS3az7UsWMLtFyU0cKJpJkRiCi+bu+a1mHYwunJk+TOw
         Zr4EwWFY8aIy7KT2CufjBF1zQiM3fJ3TQ57+xJkJ5EprBsyqofFqKNwk1drUa3rDc9SZ
         E68KvoSIYcjLkk0mF4+TYBQI7cYuPyNWG5TyVn44CCxkcSM7H0yPcP8ppe3wbcoNjU4Q
         KDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=kZ51rdKk9cWQ/HKtM+wQbVGy/a51MDMpg3aXtFwUAdcbiO3KBq4cScB6lDatVwaxkV
         u90Y3Od2Xex5a9hRhVfZUQd5L4ftGIOwGWYGJjtTkOZE0vynRFNnw1aEqLkmy7ZaqAIG
         bPLiI+kXedeFApIJF4nn0cPjYXMdqZHpx1C81hiHogJ9LgdClORBMcQf83AI13yVbxj5
         2B/5JOU4+0NWMPxG0qk7bDQ/z8AFZEmcgxml2UckkYxgAELcKyClpx7VY4KB3piY4G2S
         EPFoTrPsRznCMVyfXgwa63FDpVSBVz/FJ44HAsHbr1+dWZLIwStFGANeasr4bi0ndlPy
         Ua9w==
X-Gm-Message-State: AOAM532wqg6PYJW8PTPEC2IsTqb6xkfVr/Xfd1AE3XgsLJEVoTTjPaI1
        ggI/dZI6xeh7VJY5KaEUFzrPQkNaEmfT2pZfFdI=
X-Google-Smtp-Source: ABdhPJzNHJ0FSE01SQiYi4wkRDTRC+mgEfbnp9+z/EYf+7fnMhRTLKqmokwtdie6v+Gz/W8vHNivDM448ZVvKFyno8s=
X-Received: by 2002:a05:6102:2390:b0:32c:be33:6f35 with SMTP id
 v16-20020a056102239000b0032cbe336f35mr6018681vsr.87.1652691655490; Mon, 16
 May 2022 02:00:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6102:1347:0:0:0:0 with HTTP; Mon, 16 May 2022 02:00:55
 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikram <woloumarceline@gmail.com>
Date:   Mon, 16 May 2022 09:00:55 +0000
Message-ID: <CAKM2rXt0hkCM+4g9Mfvub-XtonrtZEVmyfjWcLTcyWZsg4q7zQ@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4994]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [woloumarceline[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jub47823[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
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
